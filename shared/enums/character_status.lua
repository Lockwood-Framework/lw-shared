-- ---------------------------------------------------------------------------
-- Character status enum used by lw-characters-api, lw-character-selection,
-- lw-mortality, lw-health, lw-needs, and lw-prison.
--
-- Status represents the character's current lifecycle state. It is not a
-- health or combat state — those are owned by lw-health (HealthState).
--
-- Deceased characters persist in the database for 7 days as NPC ragdolls
-- managed by lw-mortality. They do not count against a player's slot
-- allowance during this window. After 7 days lw-mortality triggers a hard
-- delete, at which point the tombstone record becomes the only persistent
-- reference to the character.
-- ---------------------------------------------------------------------------
LWEnum = LWEnum or {}

LWEnum.CharacterStatus = {
    Active   = 'active',   -- normal playable character
    Deceased = 'deceased', -- permadeath chosen, 7-day NPC ragdoll state in progress
}