HTTPService = game:GetService("HttpService")

print("Server grabbed external code.")

PlayersLoaded = {}
PlayerAdded = function(Player)
	local Success, Error = pcall(function()
		print(Player.Name.." successfully loaded the external code.")
        table.insert(PlayersLoaded, Player.Name)
        game.ReplicatedStorage.Pass:FireClient(Player, HTTPService:GetAsync("https://raw.githubusercontent.com/Nocticide/r-lobby/main/Client.lua"))
	end)
	if Error then
		print(Player.Name.." failed to load the external code.")
	end
end

game.Players.PlayerAdded:Connect(PlayerAdded)
repeat task.wait() until game.Players:FindFirstChildOfClass("Player")
PlayerAdded(game.Players:FindFirstChildOfClass("Player"))

game.Players.PlayerRemoving:Connect(function(Player)
    table.remove(PlayersLoaded, table.find(Player.Name))
end)