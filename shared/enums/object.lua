-- ---------------------------------------------------------------------------
-- World object states used by lw-world-objects and all resources that
-- place persistent entities: crafting, hunting, fishing, mining, logging,
-- farming, ranching, businesses, smuggling, contraband, and gangs.
--
-- Damaged and Decayed are intentionally distinct — they have different
-- resolution paths. Damaged is repaired with materials. Decayed is resolved
-- by tending, refilling, or maintaining the object (farming plots, traps,
-- equipment). The cause is tracked as metadata in lw-world-objects.
-- ---------------------------------------------------------------------------
LWEnum = LWEnum or {}

LWEnum.ObjectState = {
    Active     = 'active',     -- placed, fully functional
    Damaged    = 'damaged',    -- partially functional, repair with materials required
    Decayed    = 'decayed',    -- neglected over time, requires tending or maintenance
    Destroyed  = 'destroyed',  -- non-functional, pending respawn timer or removal
    Respawning = 'respawning', -- queued for respawn after server restart, temporarily unavailable
}