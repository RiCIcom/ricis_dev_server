Framework = {}

Framework.Players = {}

Framework.AddPlayer = function(source)
    local identifier = GetPlayerIdentifier(source)
    Framework.Players[identifier] = {
        source = source,
        identifier = identifier,
        money = Config.StartingMoney,
        bank = Config.StartingBank,
        job = 'unemployed',
        coords = GetEntityCoords(GetPlayerPed(source))
    }
end

Framework.GetPlayer = function(identifier)
    return Framework.Players[identifier]
end

Framework.UpdatePlayer = function(source, data)
    local identifier = GetPlayerIdentifier(source)
    for k, v in pairs(data) do
        Framework.Players[identifier][k] = v
    end
end

RegisterNetEvent('framework:playerJoined')
AddEventHandler('framework:playerJoined', function()
    local _source = source
    local identifier = GetPlayerIdentifier(_source)
    
    MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {
        ['@identifier'] = identifier
    }, function(result)
        if result[1] then
            Framework.Players[identifier] = result[1]
            Framework.Players[identifier].source = _source
            print('Player loaded: ' .. identifier)
        else
            Framework.AddPlayer(_source)
            MySQL.Async.execute('INSERT INTO users (identifier, money, bank, job) VALUES (@identifier, @money, @bank, @job)', {
                ['@identifier'] = identifier,
                ['@money'] = Config.StartingMoney,
                ['@bank'] = Config.StartingBank,
                ['@job'] = 'unemployed'
            })
            print('Player registered: ' .. identifier)
        end
    end)
end)

AddEventHandler('playerDropped', function()
    local _source = source
    local identifier = GetPlayerIdentifier(_source)
    local player = Framework.Players[identifier]

    if player then
        MySQL.Async.execute('UPDATE users SET money = @money, bank = @bank, job = @job WHERE identifier = @identifier', {
            ['@money'] = player.money,
            ['@bank'] = player.bank,
            ['@job'] = player.job,
            ['@identifier'] = player.identifier
        })
        
        Framework.Players[identifier] = nil
        print('Player data saved and removed: ' .. identifier)
    end
end)
