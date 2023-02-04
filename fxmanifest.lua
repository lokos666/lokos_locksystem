fx_version 'adamant'
game 'gta5'

author 'Lokos'
description 'lokos_locksystem'

lua54 'yes'

dependencies {
    'ox_lib',
    'ox_inventory'
}

shared_script '@ox_lib/init.lua'

client_scripts {
    'client/*.lua'
}

server_scripts {
    'server/*.lua'
}

exports {
    'useKeys',
    'flashVehLights'
}