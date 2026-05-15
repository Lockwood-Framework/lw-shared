-- ---------------------------------------------------------------------------
-- Item categories used by lw-inventory-api and all resources that produce,
-- consume, or trade items. Categories describe what an item fundamentally
-- is, not its legal status. Stolen goods are tracked via provenance in
-- lw-inventory-api. Contraband is reserved for items that are inherently
-- illegal regardless of origin (e.g. opium, moonshine, stolen bonds).
-- ---------------------------------------------------------------------------
LWEnum = LWEnum or {}

LWEnum.ItemCategory = {
    Weapon     = 'weapon',      -- firearms, bows, blades, melee weapons
    Ammo       = 'ammo',        -- bullets, shells, arrows, throwing knives
    Food       = 'food',        -- cooked meals, raw meat, fish, crops, foraged foods
    Drink      = 'drink',       -- water, alcohol, tonics, brewed beverages
    Herb       = 'herb',        -- raw foraged plants, mushrooms, medicinal flora
    Material   = 'material',    -- raw resources: ore, timber, hides, bones, feathers
    Component  = 'component',   -- processed materials: ingots, planks, tanned leather
    Tool       = 'tool',        -- handheld and deployable equipment: rods, picks, traps, lockpicks
    HorseGear  = 'horse_gear',  -- saddles, saddlebags, horseshoes, horse care items
    Clothing   = 'clothing',    -- wearable apparel items
    Document   = 'document',    -- deeds, bounty papers, legal writs, wills, newspapers, photos, maps
    Medical    = 'medical',     -- bandages, medicines, surgical supplies
    Seed       = 'seed',        -- farming seeds and cuttings
    Valuable   = 'valuable',    -- gems, gold nuggets, jewelry, collectibles
    Contraband = 'contraband',  -- inherently illegal goods regardless of origin
    TradeGood  = 'trade_good',  -- bulk goods intended for freight and market routes
}