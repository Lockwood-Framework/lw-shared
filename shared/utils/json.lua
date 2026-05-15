-- ---------------------------------------------------------------------------
-- Safe JSON encode/decode wrappers used across server and client scripts.
-- RedM exposes a global `json` library. These wrappers catch errors from
-- malformed input or non-serializable values rather than letting them
-- bubble up and crash the calling script.
-- ---------------------------------------------------------------------------
LWUtil = LWUtil or {}
LWUtil.JSON = {}

--- Safely encodes a Lua value to a JSON string.
--- Returns the encoded string on success, or nil and an error message on failure.
---@param  value  any
---@return        string|nil, string|nil
function LWUtil.JSON.Encode(value)
    local ok, result = pcall(json.encode, value)
    if not ok then
        print('[lw-shared] LWUtil.JSON.Encode failed: ' .. tostring(result))
        return nil, result
    end
    return result, nil
end

--- Safely decodes a JSON string to a Lua value.
--- Returns the decoded value on success, or nil and an error message on failure.
---@param  s  string
---@return    any|nil, string|nil
function LWUtil.JSON.Decode(s)
    if type(s) ~= 'string' or s == '' then
        print('[lw-shared] LWUtil.JSON.Decode: input must be a non-empty string')
        return nil, 'input must be a non-empty string'
    end
    local ok, result = pcall(json.decode, s)
    if not ok then
        print('[lw-shared] LWUtil.JSON.Decode failed: ' .. tostring(result))
        return nil, result
    end
    return result, nil
end