-- ---------------------------------------------------------------------------
-- Table utility helpers used across server and client scripts.
-- Note: intermediate global is LWUtil (not LWUtils) to avoid collision
-- with the final assembled and exported LWUtils object in main.lua.
-- ---------------------------------------------------------------------------
LWUtil = LWUtil or {}
LWUtil.Table = {}

--- Returns a deep copy of a table, recursively copying all nested tables.
--- Prevents shared state bugs when passing tables between systems.
---@param  original  table
---@return           table
function LWUtil.Table.DeepCopy(original)
    local copy = {}
    for k, v in pairs(original) do
        if type(v) == 'table' then
            copy[k] = LWUtil.Table.DeepCopy(v)
        else
            copy[k] = v
        end
    end
    return copy
end

--- Merges one or more source tables into a target table.
--- Later sources overwrite earlier keys. Target is mutated and returned.
---@param  target   table
---@param  ...      table  One or more source tables
---@return          table
function LWUtil.Table.Merge(target, ...)
    for _, source in ipairs({ ... }) do
        for k, v in pairs(source) do
            target[k] = v
        end
    end
    return target
end

--- Returns true if a table contains a given value.
--- Searches by value, not key. Use for array-style tables.
---@param  t      table
---@param  value  any
---@return        boolean
function LWUtil.Table.Contains(t, value)
    for _, v in ipairs(t) do
        if v == value then return true end
    end
    return false
end

--- Returns a new table containing only elements that pass the predicate.
---@param  t          table
---@param  predicate  function  Receives (value, index), returns boolean
---@return            table
function LWUtil.Table.Filter(t, predicate)
    local result = {}
    for i, v in ipairs(t) do
        if predicate(v, i) then
            result[#result + 1] = v
        end
    end
    return result
end

--- Returns a new table with each element transformed by the mapper function.
---@param  t       table
---@param  mapper  function  Receives (value, index), returns transformed value
---@return         table
function LWUtil.Table.Map(t, mapper)
    local result = {}
    for i, v in ipairs(t) do
        result[i] = mapper(v, i)
    end
    return result
end

--- Returns the number of entries in a table.
--- Unlike #t, works correctly on non-sequential and mixed tables.
---@param  t  table
---@return    integer
function LWUtil.Table.Count(t)
    local count = 0
    for _ in pairs(t) do
        count = count + 1
    end
    return count
end