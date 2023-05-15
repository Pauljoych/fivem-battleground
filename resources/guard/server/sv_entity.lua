local spawnedEntityOwnerId = {}
local spawnedEntityOwnerList = {}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5 * 1000)
        spawnedEntityOwnerId = {}
        spawnedEntityOwnerList = {}
    end
end)

AddEventHandler("entityCreating", function(entity)
    local entityOwner = NetworkGetEntityOwner(entity)

    if not spawnedEntityOwnerId[tostring(entityOwner)] or not spawnedEntityOwnerList[tostring(entityOwner)] then
        spawnedEntityOwnerId[tostring(entityOwner)] = 1
        spawnedEntityOwnerList[tostring(entityOwner)] = {}
        table.insert(spawnedEntityOwnerList[tostring(entityOwner)], entity)
    else
        spawnedEntityOwnerId[tostring(entityOwner)] = spawnedEntityOwnerId[tostring(entityOwner)] + 1
        table.insert(spawnedEntityOwnerList[tostring(entityOwner)], entity)
    end

    if spawnedEntityOwnerId[tostring(entityOwner)] >= 50 then
        print(entityOwner .. " -> Creating " .. spawnedEntityOwnerId[tostring(entityOwner)] .. " entiry within 2 sec")
        -- DropPlayer(entityOwner, "Creating "..spawnedEntityOwnerId[tostring(entityOwner)].." entiry within 2 sec")

        for i, entity in pairs(spawnedEntityOwnerList[tostring(entityOwner)]) do
            DeleteEntity(tonumber(entity))
        end
        spawnedEntityOwnerList[tostring(entityOwner)] = {}
    end
end)
