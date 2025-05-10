local QBCore = exports['qb-core']:GetCoreObject()

local hydrantModels = { -- Add any prop here :) 
    `prop_fire_hydrant_1`, `prop_fire_hydrant_2`, `prop_fire_hydrant_4`, `prop_fire_hydrant`
}

local lastUsed = 0
local cooldown = 180 -- Cooldown period can be adjusted 

CreateThread(function()
    for _, model in pairs(hydrantModels) do
        exports['qb-target']:AddTargetModel(model, {
            options = {
                {
                    icon = 'fas fa-tint',
                    label = 'Collect Water',
                    action = function(entity)
                        TriggerEvent('qb-hydrants:client:collectWater')
                    end
                }
            },
            distance = 2.0
        })
    end
end)

RegisterNetEvent('qb-hydrants:client:collectWater', function()
    if (GetGameTimer() - lastUsed) < (cooldown * 1000) then
        local remaining = math.ceil((cooldown * 1000 - (GetGameTimer() - lastUsed)) / 1000)
        QBCore.Functions.Notify("You need to wait " .. remaining .. " seconds before collecting again.", "error")
        return
    end

    local hasItem = QBCore.Functions.HasItem('empty_waterbottle')
    if not hasItem then
        QBCore.Functions.Notify("You need an empty water bottle!", "error")
        return
    end

    RequestAnimDict("mini@repair")
    while not HasAnimDictLoaded("mini@repair") do Wait(10) end
    TaskPlayAnim(PlayerPedId(), "mini@repair", "fixing_a_ped", 8.0, -8.0, -1, 1, 0, false, false, false)

    QBCore.Functions.Progressbar("fill_bottle", "Filling Water Bottle...", 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        lastUsed = GetGameTimer()
        ClearPedTasks(PlayerPedId())
        TriggerServerEvent('qb-hydrants:server:exchangeWaterBottle')
        QBCore.Functions.Notify("You filled the bottle with dirty water.", "success")
    end, function()
        ClearPedTasks(PlayerPedId())
        QBCore.Functions.Notify("Canceled", "error")
    end)
end)

