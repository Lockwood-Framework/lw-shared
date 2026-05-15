-- ---------------------------------------------------------------------------
-- Need types tracked by lw-needs, referenced by hud, health, and time-system.
--
-- Temperature is a single bidirectional scale — danger zones exist at both
-- ends. Too cold drives hypothermia, too hot drives heatstroke. Weather,
-- season, clothing, and environment all push this value up or down.
-- Severity staging for each need lives in lw-needs, not here.
-- ---------------------------------------------------------------------------
LWEnum = LWEnum or {}

LWEnum.NeedType = {
    Hunger      = 'hunger',
    Thirst      = 'thirst',
    Fatigue     = 'fatigue',
    Temperature = 'temperature',
}