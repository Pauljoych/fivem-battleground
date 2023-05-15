AddEventHandler('onClientMapStart', function()
  Citizen.CreateThread(function()
    local display = true

    TriggerEvent('cover:display', true)
  end)
end)

--==============================================
-- Copyright By EliteNetwork - 2021
--==============================================
