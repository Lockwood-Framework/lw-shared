-- ---------------------------------------------------------------------------
-- Debug logging controls for the server environment.
-- LW_CONFIG is checked by print wrappers throughout lw-shared server scripts.
-- Flip to true locally when troubleshooting; leave false in production.
-- ---------------------------------------------------------------------------

LW_CONFIG = {
    -- Master debug toggle. When false, all debug prints are suppressed.
    debug = false,

    -- Granular log levels. Only meaningful when debug = true.
    -- Set to false to silence a specific category without disabling all debug output.
    log = {
        cooldown = true,   -- PlayerCooldown creation, check results, auto-cleanup on drop
    },
}