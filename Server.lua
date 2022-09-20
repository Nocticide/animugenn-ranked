HTTPService = game:GetService("HttpService")

commit = HTTPService:GetAsync("https://raw.githubusercontent.com/Nocticide/r-lobby/main/Server.lua")
newCommit = nil

print("Server grabbed external code.")

PlayersLoaded = {}
PlayerAdded = function(Player, Terminate)
	if Terminate then
    if table.find(PlayersLoaded, Player.Name) then return end
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
    table.remove(PlayersLoaded, table.find(PlayersLoaded, Player.Name))
end)

while task.wait(300) do
	newCommit = HTTPService:GetAsync("https://raw.githubusercontent.com/Nocticide/r-lobby/main/Server.lua")
	if newCommit ~= commit then
		commit = newCommit
		newCommit = nil
		for i,v in pairs(game:GetDescendants()) do
			if v:GetAttribute("externallyCreated") then
				v:Destroy()
			end
		end
		game.ReplicatedStorage.Pass:FireAllClients(nil, "Terminate")
	end
end