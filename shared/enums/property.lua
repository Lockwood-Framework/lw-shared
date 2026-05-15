-- ---------------------------------------------------------------------------
-- Property type and status enums used by lw-property-api, lw-business-api,
-- lw-banking, lw-taxation, and all activity resources that require
-- land or building ownership.
--
-- PropertyType determines available operations, tax rates, and which
-- activity resources can interact with a given property.
-- PropertyStatus is referenced across enough systems (banking, taxation,
-- government) to warrant living in shared rather than lw-property-api.
-- ---------------------------------------------------------------------------
LWEnum = LWEnum or {}

LWEnum.PropertyType = {
    Land        = 'land',        -- undeveloped parcel, raw acreage
    Homestead   = 'homestead',   -- residential dwelling
    Ranch       = 'ranch',       -- cattle and horse operations
    Farm        = 'farm',        -- crop cultivation
    Timberland  = 'timberland',  -- logging rights and operations
    MiningClaim = 'mining_claim', -- mineral extraction rights
    Commercial  = 'commercial',  -- business premises: shops, saloons, offices
    Government  = 'government',  -- civic buildings: courthouse, sheriff office, jail
}

LWEnum.PropertyStatus = {
    Available  = 'available',  -- unclaimed, open for purchase or homestead claim
    Owned      = 'owned',      -- active owner, taxes applying
    Contested  = 'contested',  -- disputed ownership, under legal review
    Abandoned  = 'abandoned',  -- owner inactive, in grace period before reclaim
    Foreclosed = 'foreclosed', -- repossessed by bank or government for unpaid debts/taxes
}