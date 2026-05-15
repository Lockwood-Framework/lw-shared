# lw-shared

Foundation library for Lockwood RP. Provides shared enums, math helpers, string and table utilities, JSON wrappers, and cooldown management consumed by every other resource in the stack.

No dependencies. No UI. Must start before any resource that depends on it.

---

## Usage

Consuming resources retrieve the utility object via export at the top of each script.

```lua
local LWUtils = exports['lw-shared']:GetUtils()
```

The returned object is deep-frozen. Any attempt to mutate it will throw an error.

---

## API

### Enums

All enums are accessed via `LWUtils.Enums`.

| Enum | Key |
|---|---|
| `ClothingDamageState` | Pristine, Worn, Damaged, Ruined |
| `ClothingDirtState` | Clean, Dusty, Dirty, Filthy |
| `CrimeSeverity` | Infraction, Misdemeanor, Felony, Capital |
| `DutyState` | OnDuty, OffDuty |
| `Gender` | Male `(0)`, Female `(1)` |
| `HealthState` | Healthy, Injured, CriticallyInjured, Unconscious, Collapsed, Downed, Dead |
| `ItemCategory` | Weapon, Ammo, Food, Drink, Herb, Material, Component, Tool, HorseGear, Clothing, Document, Medical, Seed, Valuable, Contraband, TradeGood |
| `NeedType` | Hunger, Thirst, Fatigue, Temperature |
| `NotificationPriority` | Low, Normal, High, Critical |
| `NotificationType` | Success, Error, Warning, Info |
| `ObjectState` | Active, Damaged, Decayed, Destroyed, Respawning |
| `OrganizationType` | LawEnforcement, Government, Criminal, Commercial, Professional, Tribal |
| `PropertyStatus` | Available, Owned, Contested, Abandoned, Foreclosed |
| `PropertyType` | Land, Homestead, Ranch, Farm, Timberland, MiningClaim, Commercial, Government |
| `Season` | Spring, Summer, Autumn, Winter |
| `SkillType` | See `shared/enums/skills.lua` for full list |
| `WantedLevel` | None, Suspected, Wanted, Notorious, Outlaw |
| `Weather` | See `shared/enums/weather.lua` for full list |

```lua
local state = LWUtils.Enums.HealthState.Downed
local season = LWUtils.Enums.Season.Winter
```

---

### Math

#### `LWUtils.Math.Clamp(val, min, max)`
Clamps a value between min and max inclusive.

#### `LWUtils.Math.Lerp(a, b, t)`
Linearly interpolates between two values. `t` is clamped to 0–1 internally.

#### `LWUtils.Math.Normalize(val, min, max)`
Maps a value from an arbitrary range to 0.0–1.0.

#### `LWUtils.Math.RoundTo(val, places)`
Rounds a number to a given number of decimal places.

#### `LWUtils.Math.PercentOf(val, total)`
Returns what percentage `val` is of `total` (0.0–100.0).

#### `LWUtils.Math.Vec3Distance(a, b)`
3D distance between two `vector3` points.

#### `LWUtils.Math.Vec2Distance(a, b)`
2D distance between two `vector3` points, ignoring Z.

#### `LWUtils.Math.IsPointInRadius(point, center, radius)`
Sphere check — true if point is within radius of center in 3D space.

#### `LWUtils.Math.IsPointInRadius2D(point, center, radius)`
Cylinder check — true if point is within radius ignoring Z. Use for zone and territory checks.

#### `LWUtils.Math.HeadingToVector(heading)`
Converts a RedM heading (degrees) to a normalized `vector3` direction.

#### `LWUtils.Math.VectorToHeading(vec)`
Converts a direction `vector3` to a RedM heading in degrees.

#### `LWUtils.Math.RandomInt(min, max)`
Random integer between min and max inclusive.

#### `LWUtils.Math.RandomFloat(min, max)`
Random float between min and max.

#### `LWUtils.Math.WeightedRandom(entries)`
Picks a random item from a weighted table. Each entry requires `item` and `weight` fields.

```lua
local pelt = LWUtils.Math.WeightedRandom({
    { item = 'common_pelt',  weight = 60 },
    { item = 'rare_pelt',    weight = 30 },
    { item = 'perfect_pelt', weight = 10 },
})
```

---

### Utils

#### Table — `LWUtils.Utils.Table`

| Function | Description |
|---|---|
| `DeepCopy(t)` | Returns a deep copy of a table |
| `Merge(target, ...)` | Merges one or more source tables into target |
| `Contains(t, value)` | Returns true if table contains value |
| `Filter(t, predicate)` | Returns filtered array via predicate function |
| `Map(t, mapper)` | Returns transformed array via mapper function |
| `Count(t)` | Returns entry count, safe for non-sequential tables |

#### String — `LWUtils.Utils.String`

| Function | Description |
|---|---|
| `Trim(s)` | Removes leading and trailing whitespace |
| `Split(s, delimiter)` | Splits string into array by delimiter |
| `StartsWith(s, prefix)` | Returns true if string starts with prefix |
| `EndsWith(s, suffix)` | Returns true if string ends with suffix |
| `Truncate(s, maxLength, ellipsis?)` | Truncates with ellipsis, defaults to `...` |
| `Capitalize(s)` | Capitalizes first letter |
| `SnakeToTitle(s)` | Converts `on_duty` → `On Duty` |

#### JSON — `LWUtils.Utils.JSON`

Both functions return `result, error` — check the second value on failure.

```lua
local encoded, err = LWUtils.Utils.JSON.Encode(someTable)
local decoded, err = LWUtils.Utils.JSON.Decode(someString)
```

---

### Cooldown

#### Client — `LWUtils.Cooldown`

```lua
local cd = LWUtils.Cooldown.New(5000)

if cd:Check() then
    -- allowed, timer reset
end

cd:Reset()           -- force reset
cd:Remaining()       -- ms remaining
cd:IsActive()        -- read-only check, does not reset
```

#### Server — `LWUtils.PlayerCooldown`

```lua
local robberyCD = LWUtils.PlayerCooldown.New(30000)

RegisterNetEvent('lw-robbery:attempt', function()
    local source = source
    if not robberyCD:Check(source) then return end
    -- handle robbery
end)
```

Player cleanup on disconnect is automatic. No `playerDropped` handler needed in consuming resources.

---

## Configuration

| File | Purpose |
|---|---|
| `config/client/config.lua` | Client debug toggle and log categories |
| `config/server/config.lua` | Server debug toggle and log categories |

Set `LW_CONFIG.debug = true` locally to enable console output. Never commit with debug enabled.

---

## Structure

```
lw-shared/
  fxmanifest.lua
  config/
    client/config.lua
    server/config.lua
  shared/
    enums/          — 13 enum files
    math/           — numeric.lua, vector.lua, random.lua
    utils/          — table.lua, string.lua, json.lua
  client/
    utils/cooldown.lua
    main.lua
  server/
    utils/cooldown.lua
    main.lua
```

---

## License

Copyright © 2026 Morgrhim. All rights reserved. See `LICENSE` for terms.