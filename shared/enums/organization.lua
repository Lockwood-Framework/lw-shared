-- ---------------------------------------------------------------------------
-- Organization types and duty state used by lw-organizations-api and all
-- resources that consume the unified org/role/permission model.
--
-- OrganizationType describes the permission archetype of an organization —
-- what it can do and how the world treats it — not its real-world label.
-- Sub-type distinctions (sheriff vs marshal, doctor vs lawyer) are owned
-- by lw-organizations-api and lw-business-api respectively.
-- ---------------------------------------------------------------------------
LWEnum = LWEnum or {}

LWEnum.OrganizationType = {
    LawEnforcement = 'law_enforcement', -- arrest powers, legal weapon access, wanted level interaction
    Government     = 'government',      -- law-making, taxation, elections, political positions
    Criminal       = 'criminal',        -- illegal standing, territory mechanics, heat generation
    Commercial     = 'commercial',      -- business license, employer/employee structure, market access
    Professional   = 'professional',    -- licensed practice requiring org membership: medical, legal, press
    Tribal         = 'tribal',          -- sovereign governance, treaty-governed, independent legal standing
}

LWEnum.DutyState = {
    OnDuty  = 'on_duty',
    OffDuty = 'off_duty',
}