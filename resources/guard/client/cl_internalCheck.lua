local function n()
    TriggerServerEventInternal(nil, '?', 1)
end

local i = function()
    local s, r = xpcall(function()
        n()
        return true
    end, function()
        return false
    end)
    return r
end

CreateThread(function()
    Wait(2000)

    if i() then TriggerServerEvent('core-guard:internalDetected') end

    local resourceList = {}
    for i = 0, GetNumResources(), 1 do
        local resource_name = GetResourceByFindIndex(i)
        if resource_name and GetResourceState(resource_name) == 'started' then resourceList[resource_name] = true end
    end
    for i = 1, 10 do
        Wait(0)
        CreateThread(function()
            while true do
                Wait(0)
                for i = 0, GetNumResources() - 1, 1 do
                    local res = GetResourceByFindIndex(i)
                    if resourceList[res] == nil then
                        if GetResourceState(res) == 'uninitialized' then
                            TriggerServerEvent('core-guard:internalDetected')
                        end
                    end
                end
            end
        end)
    end
end)
