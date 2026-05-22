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
    'shared/enums/zones.lua',
    'shared/enums/*.lua',
    'shared/math/*.lua',
    'shared/utils/*.lua',
}

client_scripts {
    'client/config.lua',
    'client/utils/cooldown.lua',
    'client/utils/zones.lua',
    'client/main.lua',
}

server_scripts {
    'server/config.lua',
    'server/utils/cooldown.lua',
    'server/main.lua',
}