-- ---------------------------------------------------------------------------
-- Recurrence patterns for calendar events registered via lw-time-api.
-- Used by any resource that schedules recurring world events — seasonal
-- festivals, cattle roundups, government sessions, census cycles, etc.
--
-- Common intervals are named explicitly for readability at the call site.
-- When none of the named values fit, use Custom and pair it with an
-- interval table: { n = integer, unit = EventRecurrenceUnit }
--
--   exports['lw-time-api']:RegisterEvent('lw-government', 'Census', {
--       recurrence = LWUtils.Enums.EventRecurrence.Custom,
--       interval   = { n = 10, unit = LWUtils.Enums.EventRecurrenceUnit.Years },
--   })
--
-- SemiAnnual fires twice per year. If a second explicit date is provided
-- via secondMonth + secondDay on the event definition, those dates are used.
-- If not, the second occurrence is calculated as exactly six months after
-- the first.
-- ---------------------------------------------------------------------------
LWEnum = LWEnum or {}

LWEnum.EventRecurrence = {
    Once         = 'once',
    Daily        = 'daily',
    Weekly       = 'weekly',
    Biweekly     = 'biweekly',
    Monthly      = 'monthly',
    Bimonthly    = 'bimonthly',
    Quarterly    = 'quarterly',
    SemiAnnual   = 'semi_annual',
    Annual       = 'annual',
    Biennial     = 'biennial',
    Triennial    = 'triennial',
    Quadrennial  = 'quadrennial',
    Quinquennial = 'quinquennial',
    Decennial    = 'decennial',
    Custom       = 'custom',
}