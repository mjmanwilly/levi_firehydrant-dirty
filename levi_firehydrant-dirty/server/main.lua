local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qb-hydrants:server:exchangeWaterBottle', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    if Player.Functions.RemoveItem('empty_waterbottle', 1) then
        Player.Functions.AddItem('dirty_water', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["dirty_water"], 'add')
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["empty_waterbottle"], 'remove')
    else
        TriggerClientEvent('QBCore:Notify', src, "You need a empty water bottle!", "error")
    end
end)

