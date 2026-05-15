-- ---------------------------------------------------------------------------
-- Weather types used by weather-api, needs (warmth), and clothing.
-- Values match RedM native weather type strings passed to
-- _SET_WEATHER_TYPE_TRANSITION and related natives.
-- ---------------------------------------------------------------------------
LWEnum = LWEnum or {}

LWEnum.Weather = {
    Blizzard       = 'BLIZZARD',
    Clouds         = 'CLOUDS',
    Drizzle        = 'DRIZZLE',
    Fog            = 'FOG',
    GroundBlizzard = 'GROUNDBLIZZARD',
    Hail           = 'HAIL',
    HighPressure   = 'HIGHPRESSURE',
    Hurricane      = 'HURRICANE',
    Misty          = 'MISTY',
    Overcast       = 'OVERCAST',
    OvercastDark   = 'OVERCASTDARK',
    Rain           = 'RAIN',
    Sandstorm      = 'SANDSTORM',
    Shower         = 'SHOWER',
    Sleet          = 'SLEET',
    Snow           = 'SNOW',
    SnowLight      = 'SNOWLIGHT',
    Sunny          = 'SUNNY',
    Thunder        = 'THUNDER',
    Thunderstorm   = 'THUNDERSTORM',
    Whiteout       = 'WHITEOUT',

    -- Singleplayer only — included for completeness, do not use in multiplayer logic.
    SnowClearing   = 'SNOWCLEARING',
}