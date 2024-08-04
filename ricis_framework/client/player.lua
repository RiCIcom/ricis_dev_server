RegisterNetEvent('framework:playerJoined')
AddEventHandler('framework:playerJoined', function()
    TriggerServerEvent('framework:playerJoined')
end)

AddEventHandler('playerSpawned', function()
    TriggerServerEvent('framework:playerJoined')
    TriggerEvent('framework:playerLoaded')
end)

AddEventHandler('onClientResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        TriggerEvent('framework:playerJoined')
    end
end)
