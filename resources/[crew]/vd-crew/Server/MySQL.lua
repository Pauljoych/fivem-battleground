---------------- MYSQL
function _createranktable()
	MySQL.Async.execute('CREATE TABLE IF NOT EXISTS ranking_crew(id int AUTO_INCREMENT, name varchar(100), created TIMESTAMP DEFAULT CURRENT_TIMESTAMP, members int DEFAULT 1, kills int, PRIMARY KEY(id))')
end

function _createcrewtable(cb)    
	MySQL.Async.execute('CREATE TABLE IF NOT EXISTS crew(id int AUTO_INCREMENT, name varchar(100), identifier varchar(100), name_player varchar(32), grade varchar(50), PRIMARY KEY(id))',{},
	function()
		cb()
	end)
end

function _selectcrewtable(cb)
	MySQL.Async.fetchAll('SELECT * FROM crew', {},
	function(result)
		cb(result)
	end)
end

function _insertcrew(crewName, identifier, name_player, grade)
	MySQL.Async.execute('INSERT INTO crew (name, identifier, name_player, grade) VALUES (@name, @identifier, @name_player, @grade)',{
		['@name'] = crewName,
		['@identifier'] = identifier,
		['@name_player'] = name_player,
		['@grade'] = grade
	}, function() end)
end

function _updatecrew(identifier, grade)
	MySQL.Async.execute('UPDATE crew SET grade = @grade WHERE identifier =  @identifier ',{
		['@identifier'] = identifier,
		['@grade'] = grade
	}, function() end)
end

function _leftcrew(identifier)
	MySQL.Async.execute('DELETE FROM crew WHERE identifier = @identifier',{
		['@identifier'] = identifier
	}, function() end)
end

function _deletecrew(crewName)
	MySQL.Async.execute('DELETE FROM crew WHERE name = @name',{
		['@name'] = crewName
	}, function() end)
end

function _insertranking(crewName)    
	MySQL.Async.execute('INSERT INTO ranking_crew (name, kills) VALUES (@name, @kills)',{
		['@name'] = crewName,
		['@kills'] = 0,
	}, function() end)
end

function _selectranktable(cb)    
	MySQL.Async.fetchAll('SELECT *, DATE_FORMAT(created, "'.. date_format .. '") AS createdat FROM ranking_crew ORDER BY kills DESC', {},
	function(result)
		cb(result)
	end)
end

function _updateranking(name, sizePlayers)
	MySQL.Async.execute('UPDATE ranking_crew SET members = @members, kills = (kills + 1) WHERE name = @name',{
		['@name'] = name,
		['@members'] = sizePlayers
	})
end

function _deleteranking(crewName)
	MySQL.Async.execute('DELETE FROM ranking_crew WHERE name = @name',{
		['@name'] = crewName
	}, function() end)
end