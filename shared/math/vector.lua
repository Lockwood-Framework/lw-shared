-- ---------------------------------------------------------------------------
-- Vector math helpers used across server and client scripts.
-- All functions accept RedM native vector3 types.
-- ---------------------------------------------------------------------------
LWMath = LWMath or {}

--- Returns the 3D distance between two vector3 points.
--- Used by proximity checks across nearly every gameplay resource.
---@param a  vector3
---@param b  vector3
---@return   number
function LWMath.Vec3Distance(a, b)
    return #(a - b)
end

--- Returns the 2D distance between two vector3 points, ignoring Z axis.
--- Used for zone checks and territory detection where vertical distance is irrelevant.
---@param a  vector3
---@param b  vector3
---@return   number
function LWMath.Vec2Distance(a, b)
    return #(vector3(a.x, a.y, 0.0) - vector3(b.x, b.y, 0.0))
end

--- Returns true if point is within radius of center in 3D space (sphere check).
--- Used by crime detection, explosion radius, sound propagation.
---@param point   vector3
---@param center  vector3
---@param radius  number
---@return        boolean
function LWMath.IsPointInRadius(point, center, radius)
    return LWMath.Vec3Distance(point, center) <= radius
end

--- Returns true if point is within radius of center ignoring Z axis (cylinder check).
--- Used by territory markers, zone detection, NPC interaction areas.
---@param point   vector3
---@param center  vector3
---@param radius  number
---@return        boolean
function LWMath.IsPointInRadius2D(point, center, radius)
    return LWMath.Vec2Distance(point, center) <= radius
end

--- Converts a RedM heading (degrees, 0 = North, clockwise) to a normalized direction vector3.
--- Used for NPC/horse facing, patrol route generation, spawn direction.
---@param heading  number  Heading in degrees (0.0 – 360.0)
---@return         vector3 Normalized direction vector (Z = 0.0)
function LWMath.HeadingToVector(heading)
    local rad = math.rad(heading)
    return vector3(-math.sin(rad), math.cos(rad), 0.0)
end

--- Converts a direction vector3 to a RedM heading in degrees.
--- Used for facing calculations, NPC orientation, and compass bearing.
---@param vec  vector3
---@return     number  Heading in degrees (0.0 – 360.0)
function LWMath.VectorToHeading(vec)
    return math.deg(math.atan(-vec.x, vec.y)) % 360.0
end