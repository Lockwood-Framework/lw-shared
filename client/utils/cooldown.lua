-- ---------------------------------------------------------------------------
-- Client-side cooldown utility. Single-player context — no source keying.
-- Uses GetGameTimer() for millisecond precision tied to game time.
--
-- Usage:
--   local cd = LWCooldown.New(5000)
--   if cd:Check() then
--       -- action allowed, timer has reset
--   end
-- ---------------------------------------------------------------------------
LWCooldown = {}
LWCooldown.__index = LWCooldown

--- Creates a new cooldown instance with the given duration in milliseconds.
---@param  duration  integer  Cooldown window in ms
---@return           table    Cooldown instance
function LWCooldown.New(duration)
    if LW_CONFIG.debug and LW_CONFIG.log.cooldown then
        print(('[lw-shared] Cooldown.New: created with duration %dms'):format(duration))
    end
    return setmetatable({
        duration  = duration,
        lastCheck = 0,
    }, LWCooldown)
end

--- Returns true if the cooldown has expired and resets the timer.
--- Returns false if the cooldown is still active.
---@return  boolean
function LWCooldown:Check()
    local now = GetGameTimer()
    if now - self.lastCheck >= self.duration then
        self.lastCheck = now
        if LW_CONFIG.debug and LW_CONFIG.log.cooldown then
            print('[lw-shared] Cooldown:Check: allowed')
        end
        return true
    end
    if LW_CONFIG.debug and LW_CONFIG.log.cooldown then
        print(('[lw-shared] Cooldown:Check: blocked, %dms remaining'):format(self:Remaining()))
    end
    return false
end

--- Manually resets the cooldown, allowing the next Check() to return true immediately.
function LWCooldown:Reset()
    self.lastCheck = 0
    if LW_CONFIG.debug and LW_CONFIG.log.cooldown then
        print('[lw-shared] Cooldown:Reset: manually reset')
    end
end

--- Returns the number of milliseconds remaining on the cooldown.
--- Returns 0 if the cooldown has already expired.
---@return  integer
function LWCooldown:Remaining()
    local remaining = self.duration - (GetGameTimer() - self.lastCheck)
    return remaining > 0 and remaining or 0
end

--- Returns true if the cooldown is currently active without resetting it.
---@return  boolean
function LWCooldown:IsActive()
    return (GetGameTimer() - self.lastCheck) < self.duration
end