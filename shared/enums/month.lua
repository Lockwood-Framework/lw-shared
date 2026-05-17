-- ---------------------------------------------------------------------------
-- Calendar month identifiers used by lw-time-api's event registration API
-- and any resource that schedules logic against specific calendar dates.
--
-- Integer values (1–12) are used instead of strings because months are
-- directly consumed as integers in all date arithmetic — day-of-year
-- calculations, leap year checks, season boundary comparisons, and DB
-- storage all operate on the numeric month. Using strings would require
-- a secondary lookup everywhere the value touches math.
-- ---------------------------------------------------------------------------
LWEnum = LWEnum or {}

LWEnum.Month = {
    January   = 1,
    February  = 2,
    March     = 3,
    April     = 4,
    May       = 5,
    June      = 6,
    July      = 7,
    August    = 8,
    September = 9,
    October   = 10,
    November  = 11,
    December  = 12,
}