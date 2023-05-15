local masukLog = {
    {jenis = 'brankas', nama = 'Brankas Polisi', job = 'police', log = ''},
    {jenis = 'brankas', nama = 'Brankas EMS', job = 'ambulance', log = ''},
    {jenis = 'bagasi', nama = 'Bagasi', log = ''},
}
RegisterServerEvent('fivemid:masukLog')
AddEventHandler('fivemid:masukLog', function(jenis,job, label, count, namaic, desk, darimana)
    for k,v in ipairs(masukLog) do
        if v.jenis == 'brankas' and v.jenis == jenis then
            if job == 'society_'..v.job then
                local connect = {
                    {
                        ["color"] = "255",
                        ["title"] = v.nama,
                        ["description"] = namaic..' baru saja '..desk..' '..count..'x '..label..' '..darimana..' '..v.nama,
                        ["footer"] = {
                            ["text"] = "Made by vxd | ",
                        },
                        ['timestamp'] = os.date('!%Y-%m-%dT%H:%M:%SZ')
                    }
                }
                PerformHttpRequest(v.log, function(err, text, headers) end, 'POST', json.encode({username = "Log Brankas Inventory",embeds = connect}), { ['Content-Type'] = 'application/json' })
            end
        elseif v.jenis == 'bagasi' and v.jenis == jenis then
            -- print(v.job)
            -- if job == 'Plate-'..v.job then
                local connect = {
                    {
                        ["color"] = "255",
                        ["title"] = v.nama,
                        ["description"] = namaic..' baru saja '..desk..' '..count..'x '..label..' '..darimana..' '..v.nama..' - '..job,
                        ["footer"] = {
                            ["text"] = "Made by TheIrham#0001 | ",
                        },
                        ['timestamp'] = os.date('!%Y-%m-%dT%H:%M:%SZ')
                    }
                }
                PerformHttpRequest(v.log, function(err, text, headers) end, 'POST', json.encode({username = "Log Brankas Bagasi - "..job,embeds = connect}), { ['Content-Type'] = 'application/json' })
            -- end
        end
    end

end)

