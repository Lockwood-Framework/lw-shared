-- ---------------------------------------------------------------------------
-- String utility helpers used across server and client scripts.
-- ---------------------------------------------------------------------------
LWUtil = LWUtil or {}
LWUtil.String = {}

--- Removes leading and trailing whitespace from a string.
---@param  s  string
---@return    string
function LWUtil.String.Trim(s)
    return s:match('^%s*(.-)%s*$')
end

--- Splits a string by a delimiter and returns an array of substrings.
--- Delimiter is treated as a plain pattern character, not a regex.
---@param  s          string
---@param  delimiter  string
---@return            table
function LWUtil.String.Split(s, delimiter)
    local result = {}
    local pattern = '([^' .. delimiter .. ']+)'
    for match in s:gmatch(pattern) do
        result[#result + 1] = match
    end
    return result
end

--- Returns true if a string starts with the given prefix.
---@param  s       string
---@param  prefix  string
---@return         boolean
function LWUtil.String.StartsWith(s, prefix)
    return s:sub(1, #prefix) == prefix
end

--- Returns true if a string ends with the given suffix.
---@param  s       string
---@param  suffix  string
---@return         boolean
function LWUtil.String.EndsWith(s, suffix)
    return suffix == '' or s:sub(-#suffix) == suffix
end

--- Truncates a string to a maximum length, appending an ellipsis if cut.
--- Used by UI labels, notification messages, and name displays.
---@param  s          string
---@param  maxLength  integer
---@param  ellipsis   string|nil  Defaults to '...'
---@return            string
function LWUtil.String.Truncate(s, maxLength, ellipsis)
    ellipsis = ellipsis or '...'
    if #s <= maxLength then return s end
    return s:sub(1, maxLength - #ellipsis) .. ellipsis
end

--- Capitalizes the first letter of a string.
--- Used for display formatting of enum values and player names.
---@param  s  string
---@return    string
function LWUtil.String.Capitalize(s)
    return s:sub(1, 1):upper() .. s:sub(2):lower()
end

--- Converts a snake_case string to a human-readable Title Case string.
--- Used to display enum values and identifiers in UI without separate label tables.
---@param  s  string  e.g. 'on_duty' or 'bounty_hunting'
---@return    string  e.g. 'On Duty' or 'Bounty Hunting'
function LWUtil.String.SnakeToTitle(s)
    return (s:gsub('_(%a)', function(c)
        return ' ' .. c:upper()
    end):gsub('^%a', string.upper))
end

--- Wraps a string into lines at word boundaries, never splitting mid-word.
--- Used by lw-mortality and any memorial display resource to format epitaphs
--- for fixed-width in-world surfaces.
---@param  text        string
---@param  lineLength  integer     Maximum characters per line
---@param  maxLines    integer     Maximum number of lines to return
---@return             string[]    Array of wrapped lines
function LWUtil.String.WrapText(text, lineLength, maxLines)
    if not text or text == '' then return {} end

    local lines   = {}
    local current = ''

    for word in text:gmatch('%S+') do
        if #lines >= maxLines then break end

        if current == '' then
            current = word
        elseif #current + 1 + #word <= lineLength then
            current = current .. ' ' .. word
        else
            lines[#lines + 1] = current
            current = word
        end
    end

    if current ~= '' and #lines < maxLines then
        lines[#lines + 1] = current
    end

    return lines
end