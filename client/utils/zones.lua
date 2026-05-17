LWUtil = LWUtil or {}
LWUtil.Zones = LWUtil.Zones or {}

-- Client-only. Do not call from server scripts.

---@param  x          number
---@param  y          number
---@param  z          number
---@param  zoneTypeId integer  One of LWUtils.Enums.ZoneType
---@return             integer|nil  Zone hash, or nil if no zone of this type exists at coords
local function GetZoneAtCoords(x, y, z, zoneTypeId)
    local result = Citizen.InvokeNative(0x43AD8FC02B429D33, x, y, z, zoneTypeId)
    if not result then return nil end
    return result
end

LWUtil.Zones.GetZoneAtCoords = GetZoneAtCoords