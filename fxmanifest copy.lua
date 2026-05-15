fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

name 'Lockwood Database'
description 'oxmysql wrapper with forward-only migration support'
version '1.0.0'
author 'Morgrhim'

dependencies {
    'oxmysql'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/db.lua',
    'server/migrations.lua',
    'server/main.lua'
}
