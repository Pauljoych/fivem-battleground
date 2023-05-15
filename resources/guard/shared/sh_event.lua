Citizen.CreateThread(function()
    local eventsList = {"vidigg:kasihlooting:diredzone", "vidigg:kasihlooting:diluarredzone"}

    for _, clientEvents in pairs(eventsList) do
        AddEventHandler(clientEvents, function()
            local getResource = GetInvokingResource()
            if not getResource then
                return
            end
            TriggerServerEvent("core-events:proceedData", getResource, clientEvents)
        end)
    end
end)
