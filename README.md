A lightweight FiveM QBCore script that lets players collect dirty water from fire hydrants using the qb-target system.

Features:
Requires empty_waterbottle item **ItemS in README**
Uses third-eye targeting (qb-target)
Plays mechanic animation while collecting
3-minute cooldown between uses **can be adjusted**
Adds dirty_water item to inventory on success **can change to clean water, see below**

**HOW TO CHANGE FROM DIRTY WATER TO CLEAN WATER** 

In client/main.lua change line 52 
FROM TriggerServerEvent('qb-hydrants:server:exchangeWaterBottleClean')
TO TriggerServerEvent('qb-hydrants:server:exchangeWaterBottle')

In client/main.lua change line 53
FROM QBCore.Functions.Notify("You filled the bottle with clean water.", "success")
TO QBCore.Functions.Notify("You collected dirty water.", "success")

In server/main.lua change line 2 
FROM RegisterNetEvent('qb-hydrants:server:exchangeWaterBottleClean', function()
TO RegisterNetEvent('qb-hydrants:server:exchangeWaterBottle', function()

In server/main.lua change line 7
FROM Player.Functions.AddItem('water_bottle', 1)
TO Player.Functions.AddItem('dirty_water', 1)

In server/main.lua change line 8
FROM TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["water_bottle"], 'add') 
TO TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["dirty_water"], 'add')

**ITEMS** 
['dirty_water'] = {['name'] = 'dirty_water', ['label'] = 'Dirty Water', ['weight'] = 500, ['type'] = 'item', ['image'] = 'dirtywater.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'contaminated water, some sort of tablet will do the trick!'},
['empty_waterbottle'] = {['name'] = 'empty_waterbottle', ['label'] = 'Empty Water Bottle', ['weight'] = 500, ['type'] = 'item', ['image'] = 'emptywaterbottle.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'fill it up with water or use it as a portable toilet!'},

