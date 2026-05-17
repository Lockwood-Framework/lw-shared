-- ---------------------------------------------------------------------------
-- Unit component of a Custom recurrence interval for lw-time-api events.
-- Only meaningful when EventRecurrence.Custom is used — ignored otherwise.
--
-- Pairs with the interval's n value to express arbitrary recurrence periods
-- that the named EventRecurrence values do not cover:
--
--   interval = { n = 7, unit = LWUtils.Enums.EventRecurrenceUnit.Years }
--
-- lw-time-api resolves Custom intervals against in-game calendar time, not
-- real time. n must be a positive integer. Fractional intervals are not
-- supported — use the closest named EventRecurrence value instead.
-- ---------------------------------------------------------------------------
LWEnum = LWEnum or {}

LWEnum.EventRecurrenceUnit = {
    Days   = 'days',
    Weeks  = 'weeks',
    Months = 'months',
    Years  = 'years',
}