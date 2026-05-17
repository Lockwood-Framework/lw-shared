-- ---------------------------------------------------------------------------
-- Day-of-week identifiers used by lw-time-api and any resource that gates
-- logic on the current weekday — business hours, court schedules, church
-- services, market days, government sessions, and similar period-appropriate
-- weekly rhythms.
--
-- Integer values (1–7, Sunday-anchored) are used instead of strings for the
-- same reason as Month: day-of-week is computed arithmetically from a known
-- anchor date (Jan 1 1890 = Wednesday = 4) using modular arithmetic, and the
-- result is compared directly against these values. String values would add
-- a lookup step with no benefit.
--
-- Anchor: January 1, 1890 was a Wednesday (4).
-- Formula: ((days_since_epoch) % 7 + anchor - 1) % 7 + 1
-- ---------------------------------------------------------------------------
LWEnum = LWEnum or {}

LWEnum.DayOfWeek = {
    Sunday    = 1,
    Monday    = 2,
    Tuesday   = 3,
    Wednesday = 4,
    Thursday  = 5,
    Friday    = 6,
    Saturday  = 7,
}