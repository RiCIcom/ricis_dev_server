RegisterNetEvent('framework:savePlayer')
AddEventHandler('framework:savePlayer', function()
    local _source = source
    local identifier = GetPlayerIdentifier(_source)
    local xPlayer = Framework.Players[identifier]
    
    if xPlayer then
        MySQL.Async.execute('UPDATE users SET money = @money, bank = @bank, job = @job WHERE identifier = @identifier', {
            ['@money'] = xPlayer.money,
            ['@bank'] = xPlayer.bank,
            ['@job'] = xPlayer.job,
            ['@identifier'] = xPlayer.identifier
        })
        
        print('Player data saved: ' .. xPlayer.identifier)
    end
end)

AddEventHandler('playerDropped', function()
    local _source = source
    TriggerEvent('framework:savePlayer', _source)
    local identifier = GetPlayerIdentifier(_source)
    Framework.Players[identifier] = nil
    print('Player dropped: ' .. identifier)
end)
