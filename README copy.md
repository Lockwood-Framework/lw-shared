# lw-db

oxmysql wrapper with forward-only migration support for Lockwood RP.

## Dependencies

- [oxmysql](https://github.com/overextended/oxmysql)

## Installation

1. Place `lw-db` in your resources directory.
2. Add `ensure lw-db` to your `server.cfg` **before** any resource that depends on it.
3. `lw-db` must start after `oxmysql`.

## Database Operations

`@oxmysql/lib/MySQL.lua` is loaded automatically. All methods are available via the global `DB` table in any server script that loads after `lw-db`.

Each operation has a synchronous variant (must be called inside a `Citizen.CreateThread`) and a callback-based async variant.

| Sync | Async | Returns |
|---|---|---|
| `DB.query(query, params)` | `DB.queryAsync(query, params, cb)` | Array of row tables |
| `DB.single(query, params)` | `DB.singleAsync(query, params, cb)` | First row table or `nil` |
| `DB.scalar(query, params)` | `DB.scalarAsync(query, params, cb)` | First column of first row |
| `DB.insert(query, params)` | `DB.insertAsync(query, params, cb)` | Auto-increment ID |
| `DB.update(query, params)` | `DB.updateAsync(query, params, cb)` | Affected row count |
| `DB.prepare(query, params)` | `DB.prepareAsync(query, params, cb)` | Varies (see below) |
| `DB.transaction(queries, params)` | `DB.transactionAsync(queries, params, cb)` | `true` on commit |
| `DB.rawExecute(query, params)` | `DB.rawExecuteAsync(query, params, cb)` | Driver result |

`params` is always optional and defaults to `{}`.

### Examples

```lua
-- Sync
local row = DB.single('SELECT * FROM `players` WHERE `id` = ?', { playerId })

-- Async
DB.queryAsync('SELECT * FROM `players`', {}, function(rows)
    for _, row in ipairs(rows) do
        print(row.name)
    end
end)
```

### DB.prepare

Accepts a flat param array for single execution, or an array of arrays for batch:

```lua
-- Single
local rows = DB.prepare('SELECT * FROM `players` WHERE `id` = ?', { 1 })

-- Batch
DB.prepare('INSERT INTO `players` (`name`) VALUES (?)', { { 'alice' }, { 'bob' } })
```

### DB.transaction

Accepts either shared params (applied to every query) or per-query param tables:

```lua
-- Shared params
DB.transaction({ 'INSERT INTO `a` VALUES (?)', 'INSERT INTO `b` VALUES (?)' }, { value })

-- Per-query
DB.transaction({
    { query = 'INSERT INTO `a` VALUES (?)', values = { value1 } },
    { query = 'INSERT INTO `b` VALUES (?)', values = { value2 } },
})
```

## Migrations

Other resources can register forward-only SQL migrations via the `RegisterMigration` export. `lw-db` tracks executed migrations in the `lw_migrations` table and skips any that have already run.

```lua
exports['lw-db']:RegisterMigration(
    'my-resource',
    '001_create_players',
    [[
        CREATE TABLE IF NOT EXISTS `players` (
            `id`   INT UNSIGNED  NOT NULL AUTO_INCREMENT,
            `name` VARCHAR(255)  NOT NULL,
            PRIMARY KEY (`id`)
        )
    ]]
)
```

**Arguments:**

| Argument | Type | Description |
|---|---|---|
| `resource` | `string` | Your resource name. Pass this explicitly — it is not inferred. |
| `name` | `string` | Unique migration identifier within your resource. Use a sortable prefix like `001_`, `002_` to control execution order. |
| `sql` | `string` | Raw SQL string to execute. |

Migrations registered before `lw-db` finishes initialising are queued and drained automatically once the database is ready. Migrations registered after init (e.g. on resource restart) run immediately in a new thread.

## Ready Event

`lw-db` emits a server event when the database connection is confirmed and all migrations have run:

```lua
AddEventHandler('lw-db:ready', function()
    -- safe to do DB work here
end)
```

## License

Copyright © 2026 Morgrhim. All rights reserved. See [LICENSE](LICENSE).