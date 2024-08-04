Framework = {}

Framework.GetPlayerData = function(cb)
    ESX.TriggerServerCallback('framework:getPlayerData', function(data)
        cb(data)
    end)
end

RegisterNetEvent('framework:playerLoaded')
AddEventHandler('framework:playerLoaded', function()
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
    end
end)
