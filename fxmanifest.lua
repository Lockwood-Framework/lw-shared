fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

name        'lw-shared'
description 'Shared utilities, constants, enums, and math helpers for Lockwood RP'
version     '1.0.0'

-- Shared: loaded in both client and server environments, in order.
-- Enums first — utils may reference them. Math before utils in case utils ever
-- needs a math helper internally. Assembly happens in client/server main.lua.
shared_scripts {
    'shared/enums/gender.lua',
    'shared/enums/season.lua',
    'shared/enums/weather.lua',
    'shared/enums/health.lua',
    'shared/enums/needs.lua',
    'shared/enums/skills.lua',
    'shared/enums/item.lua',
    'shared/enums/organization.lua',
    'shared/enums/crime.lua',
    'shared/enums/clothing.lua',
    'shared/enums/property.lua',
    'shared/enums/object.lua',
    'shared/enums/ui.lua',
    'shared/math/numeric.lua',
    'shared/math/vector.lua',
    'shared/math/random.lua',
    'shared/utils/table.lua',
    'shared/utils/string.lua',
    'shared/utils/json.lua',
}

client_scripts {
    'client/config.lua',
    'client/utils/cooldown.lua',
    'client/main.lua',
}

server_scripts {
    'server/config.lua',
    'server/utils/cooldown.lua',
    'server/main.lua',
}