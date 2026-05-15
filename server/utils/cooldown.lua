-- ---------------------------------------------------------------------------
-- Server-side player cooldown utility. Keyed by source so one instance
-- manages all players for a given action type.
--
-- A module-local registry tracks every PlayerCooldown instance ever created.
-- A single playerDropped handler iterates the registry and evicts the
-- dropped source from all instances automatically — no per-resource cleanup.
--
-- Usage:
--   local robberyCD = LWPlayerCooldown.New(30000)
--
--   RegisterNetEvent('lw-robbery:attempt', function()
--       local source = source
--       if not robberyCD:Check(source) then
--           -- notify player they are on cooldown
--           return
--       end
--       -- handle robbery
--   end)
-- ---------------------------------------------------------------------------
local _registry = {}

LWPlayerCooldown = {}
LWPlayerCooldown.__index = LWPlayerCooldown

--- Creates a new PlayerCooldown manager for one action type.
--- Automatically registers the instance for playerDropped cleanup.
---@param  duration  integer  Cooldown window in ms
---@return           table    PlayerCooldown instance
function LWPlayerCooldown.New(duration)
    local instance = setmetatable({
        duration = duration,
        players  = {},
    }, LWPlayerCooldown)

    _registry[#_registry + 1] = instance

    if LW_CONFIG.debug and LW_CONFIG.log.cooldown then
        print(('[lw-shared] PlayerCooldown.New: created with duration %dms, registry size now %d'):format(duration, #_registry))
    end

    return instance
end

--- Returns true if the cooldown has expired for this source and resets their timer.
--- Returns false if the source is still within the cooldown window.
--- First call for an unseen source always returns true.
---@param  source  integer
---@return         boolean
function LWPlayerCooldown:Check(source)
    local now  = GetGameTimer()
    local last = self.players[source] or 0

    if now - last >= self.duration then
        self.players[source] = now
        if LW_CONFIG.debug and LW_CONFIG.log.cooldown then
            print(('[lw-shared] PlayerCooldown:Check: source %d allowed'):format(source))
        end
        return true
    end

    if LW_CONFIG.debug and LW_CONFIG.log.cooldown then
        print(('[lw-shared] PlayerCooldown:Check: source %d blocked, %dms remaining'):format(source, self:Remaining(source)))
    end
    return false
end

--- Manually resets the cooldown for a source, allowing the next Check() to return true immediately.
---@param  source  integer
function LWPlayerCooldown:Reset(source)
    self.players[source] = 0
    if LW_CONFIG.debug and LW_CONFIG.log.cooldown then
        print(('[lw-shared] PlayerCooldown:Reset: source %d manually reset'):format(source))
    end
end

--- Returns the number of milliseconds remaining on the cooldown for a source.
--- Returns 0 if the cooldown has expired or the source has no entry.
---@param  source  integer
---@return         integer
function LWPlayerCooldown:Remaining(source)
    local last      = self.players[source] or 0
    local remaining = self.duration - (GetGameTimer() - last)
    return remaining > 0 and remaining or 0
end

--- Returns true if the cooldown is currently active for a source without resetting it.
---@param  source  integer
---@return         boolean
function LWPlayerCooldown:IsActive(source)
    local last = self.players[source] or 0
    return (GetGameTimer() - last) < self.duration
end

--- Removes a source from this instance's player table.
--- Called automatically by the playerDropped registry handler.
---@param  source  integer
function LWPlayerCooldown:Cleanup(source)
    self.players[source] = nil
end

-- ---------------------------------------------------------------------------
-- Auto-cleanup: evict any dropped player from every registered instance.
-- Resources that use PlayerCooldown do not need their own playerDropped hook.
-- ---------------------------------------------------------------------------
AddEventHandler('playerDropped', function()
    local source = source
    for _, instance in ipairs(_registry) do
        instance:Cleanup(source)
    end
    if LW_CONFIG.debug and LW_CONFIG.log.cooldown then
        print(('[lw-shared] PlayerCooldown: auto-cleanup ran for source %d across %d instances'):format(source, #_registry))
    end
end)