RegisterCommand('emotemenuuu', function(source, args, raw) 
    if not LocalPlayer.state.lagiSibuk then
        OpenEmoteMenu() 
    end
end)
RegisterCommand('walk', function(source, args, raw) WalkCommandStart(source, args, raw) end)
RegisterCommand('walks', function(source, args, raw) WalksOnCommand() end)

function pairsByKeys (t, f)
    local a = {}
    for n in pairs(t) do
        table.insert(a, n)
    end
    table.sort(a, f)
    local i = 0      -- iterator variable
    local iter = function ()   -- iterator function
        i = i + 1
        if a[i] == nil then
            return nil
        else
            return a[i], t[a[i]]
        end
    end
    return iter
end

