fx_version 'cerulean'
game 'gta5'

description 'Fire Hydrant Water Collection for Survival - QBCore'
author 'YourName'
version '1.0.0'

shared_script '@qb-core/shared/locale.lua'

client_scripts {
    'client/main.lua'
}

server_scripts {
    'server/main.lua'
}

dependency 'qb-core'
dependency 'qb-target'

description 'Hydrant water collection with item check, emote, and target integration.'

lua54 'yes'