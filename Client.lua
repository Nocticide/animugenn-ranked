local Player = game.Players.LocalPlayer
PlayerGui = Player.PlayerGui

warn(Player.Name.." ranked GUI instantiated.")

local RankedScreen = Instance.new("ScreenGui", PlayerGui)
RankedScreen.Name = "RankedScreen"
RankedScreen.IgnoreGuiInset = true
RankedScreen.ResetOnSpawn = false
RankedScreen.DisplayOrder = 50
local MasterGroup = Instance.new("CanvasGroup", RankedScreen)
MasterGroup.Name = "MasterFrame"
MasterGroup.Size = UDim2.new(1,0,1,0)