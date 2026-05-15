-- ---------------------------------------------------------------------------
-- Random number helpers used across server and client scripts.
-- Used by loot tables, market fluctuation, spawn variance, and activity rolls.
-- ---------------------------------------------------------------------------
LWMath = LWMath or {}

--- Returns a random integer between min and max inclusive.
---@param min  integer
---@param max  integer
---@return     integer
function LWMath.RandomInt(min, max)
    return math.random(min, max)
end

--- Returns a random float between min and max.
---@param min  number
---@param max  number
---@return     number
function LWMath.RandomFloat(min, max)
    return min + math.random() * (max - min)
end

--- Picks a random item from a weighted table.
--- Each entry must have an `item` and a `weight` field.
--- Higher weight = higher probability of selection.
---
--- Example:
---   LWMath.WeightedRandom({
---       { item = 'common_pelt',  weight = 60 },
---       { item = 'rare_pelt',    weight = 30 },
---       { item = 'perfect_pelt', weight = 10 },
---   })
---
---@param  entries  table  Array of { item: any, weight: number }
---@return          any    The selected item value, or nil if table is empty
function LWMath.WeightedRandom(entries)
    if not entries or #entries == 0 then
        print('[lw-shared] LWMath.WeightedRandom: entries table is empty or nil')
        return nil
    end

    local total = 0
    for _, entry in ipairs(entries) do
        total = total + entry.weight
    end

    if total <= 0 then
        print('[lw-shared] LWMath.WeightedRandom: total weight is zero or negative')
        return nil
    end

    local roll = LWMath.RandomFloat(0, total)
    local cumulative = 0

    for _, entry in ipairs(entries) do
        cumulative = cumulative + entry.weight
        if roll <= cumulative then
            return entry.item
        end
    end

    -- Fallback: floating point edge case, return last entry
    return entries[#entries].item
end