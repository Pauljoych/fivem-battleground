local resourceList = {}
local allResources = GetNumResources()

for i = 0, allResources, 1 do
    local resourceName = GetResourceByFindIndex(i)
    if resourceName and GetResourceState(resourceName) == "started" then
        resourceList[tostring(resourceName)] = true
    end
end

RegisterNetEvent("core-events:proceedData")
AddEventHandler("core-events:proceedData", function(invokingResource, eventName)
    local src = source
    if not invokingResource then
        return
    end
    print("Resource: " .. invokingResource .. " ClientEvent: " .. eventName)
    if not resourceList[tostring(invokingResource)] then
        print("Lua Executor detected | Resource: " .. invokingResource .. " ClientEvent: " .. eventName)
        DropPlayer(src, "Lua Executor detected | Resource: " .. invokingResource .. " ClientEvent: " .. eventName)
    end
end)
