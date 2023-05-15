Framework = {}

function Framework.ESX()
    return GetResourceState("vd_core") ~= "missing"
end

function Framework.QBCore()
    return GetResourceState("qb-core") ~= "missing"
end
