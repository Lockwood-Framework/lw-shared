-- ---------------------------------------------------------------------------
-- Assembles all shared modules into the LWUtils object, deep freezes the
-- entire structure to prevent mutation, then registers the server export.
--
-- Load order (defined in fxmanifest.lua):
--   shared:  enums → math → utils  (LWEnum, LWMath, LWUtil populated)
--   server:  config → cooldown → main.lua  (LWPlayerCooldown populated, then assembled here)
--
-- Note: PlayerCooldown instances created after assembly are NOT frozen —
-- only the class definition is. Instance player tables must remain mutable.
-- ---------------------------------------------------------------------------

--- Recursively freezes a table and all nested tables against mutation.
--- Applied after full assembly so nothing is frozen mid-construction.
--- Tracks visited tables to prevent stack overflow on circular references
--- such as LWPlayerCooldown.__index = LWPlayerCooldown.
---@param  t        table
---@param  visited  table|nil
---@return          table
local function DeepFreeze(t, visited)
    visited = visited or {}
    if visited[t] then return t end
    visited[t] = true

    for _, v in pairs(t) do
        if type(v) == 'table' then
            DeepFreeze(v, visited)
        end
    end
    setmetatable(t, {
        __newindex = function(_, k)
            error(('[lw-shared] Attempt to modify read-only LWUtils at key: "%s"'):format(tostring(k)), 2)
        end,
        __metatable = false, -- blocks getmetatable and further setmetatable calls
    })
    return t
end

-- ---------------------------------------------------------------------------
-- Assembly
-- ---------------------------------------------------------------------------

LWUtils = DeepFreeze({
    Enums          = LWEnum,
    Math           = LWMath,
    Utils          = LWUtil,
    PlayerCooldown = LWPlayerCooldown,
})

-- ---------------------------------------------------------------------------
-- Export
-- ---------------------------------------------------------------------------

exports('GetUtils', function()
    return LWUtils
end)

if LW_CONFIG.debug then
    print('[lw-shared] server ready — LWUtils assembled, frozen, and exported')
end