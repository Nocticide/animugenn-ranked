HTTPService = game:GetService("HttpService")

game.Players.PlayerAdded:Connect(function(Player)
    game:GetService("ReplicatedStorage").Pass:FireClient(Player, loadstring(HTTPService:GetAsync("https://raw.githubusercontent.com/Nocticide/r-lobby/main/Client.lua"))())
    warn(Player.Name)
end)
