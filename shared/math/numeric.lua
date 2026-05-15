-- ---------------------------------------------------------------------------
-- Numeric math helpers used across server and client scripts.
-- ---------------------------------------------------------------------------
LWMath = LWMath or {}

--- Clamps a value between a minimum and maximum.
--- Used by needs decay, skill XP caps, market prices, health values.
---@param val    number  Value to clamp
---@param min    number  Lower bound (inclusive)
---@param max    number  Upper bound (inclusive)
---@return       number
function LWMath.Clamp(val, min, max)
    if val < min then return min end
    if val > max then return max end
    return val
end

--- Linearly interpolates between two values by factor t.
--- Used by weather transitions, time scaling, need drain smoothing.
---@param a  number  Start value
---@param b  number  End value
---@param t  number  Interpolation factor (0.0 – 1.0)
---@return   number
function LWMath.Lerp(a, b, t)
    return a + (b - a) * LWMath.Clamp(t, 0.0, 1.0)
end

--- Normalizes a value from an arbitrary range into a 0.0 – 1.0 range.
--- Used by HUD need indicators and skill XP progress bars.
---@param val  number  Current value
---@param min  number  Range minimum
---@param max  number  Range maximum
---@return     number
function LWMath.Normalize(val, min, max)
    if max == min then
        print('[lw-shared] LWMath.Normalize: min and max are equal, returning 0')
        return 0
    end
    return LWMath.Clamp((val - min) / (max - min), 0.0, 1.0)
end

--- Rounds a number to a given number of decimal places.
--- Used by currency display and market price formatting.
---@param val     number   Value to round
---@param places  number   Decimal places (0 for integer rounding)
---@return        number
function LWMath.RoundTo(val, places)
    local factor = 10 ^ (places or 0)
    return math.floor(val * factor + 0.5) / factor
end

--- Returns what percentage val is of total.
--- Used by skill XP progress, health bars, need indicators.
---@param val    number  Part value
---@param total  number  Whole value
---@return       number  Percentage (0.0 – 100.0)
function LWMath.PercentOf(val, total)
    if total == 0 then
        print('[lw-shared] LWMath.PercentOf: total is zero, returning 0')
        return 0
    end
    return LWMath.Clamp((val / total) * 100.0, 0.0, 100.0)
end