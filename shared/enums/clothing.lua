-- ---------------------------------------------------------------------------
-- Clothing condition enums used by lw-clothing-api, lw-needs (warmth),
-- and lw-crafting-trades (repair).
--
-- Damage and dirt are independent axes. A garment can be Pristine but
-- Filthy (new coat, fell in mud) or Ruined but Clean (torn but washed).
--
-- Warmth rating is a numeric value defined per clothing item in
-- lw-clothing-api — not an enum — as it is a continuous spectrum used
-- by lw-needs to calculate temperature modifier.
-- ---------------------------------------------------------------------------
LWEnum = LWEnum or {}

LWEnum.ClothingDamageState = {
    Pristine = 'pristine', -- new, no signs of wear
    Worn     = 'worn',     -- light use, minor wear visible
    Damaged  = 'damaged',  -- visibly damaged, warmth rating reduced, repair needed
    Ruined   = 'ruined',   -- beyond repair, significant warmth penalty
}

LWEnum.ClothingDirtState = {
    Clean  = 'clean',  -- freshly laundered
    Dusty  = 'dusty',  -- light trail dust, easy to brush off
    Dirty  = 'dirty',  -- moderate soiling, needs washing
    Filthy = 'filthy', -- heavily soiled, affects reputation and NPC reactions
}