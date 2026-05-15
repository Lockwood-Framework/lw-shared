-- ---------------------------------------------------------------------------
-- Player health states used by health, needs, medicine, and mortality.
-- These are Lockwood logic states, not RedM native health values.
-- ---------------------------------------------------------------------------
LWEnum = LWEnum or {}

LWEnum.HealthState = {
    Healthy           = 'healthy',
    Injured           = 'injured',
    CriticallyInjured = 'critically_injured',
    Unconscious       = 'unconscious',  -- blunt trauma/drugs, resolves with time
    Collapsed         = 'collapsed',    -- needs-driven (dehydration, starvation, hypothermia, heatstroke), resolved by lw-needs addressing the cause
    Downed            = 'downed',       -- trauma/combat, requires lw-medicine
    Dead              = 'dead',         -- hands off to lw-mortality
}