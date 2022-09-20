local TweenService = game:GetService("TweenService")
TweenService = game:GetService("TweenService")

local Player = game.Players.LocalPlayer
local PlayerGui = Player.PlayerGui

warn(Player.Name .. " ranked GUI instantiated.")

local RankedScreen = Instance.new("ScreenGui", PlayerGui)
RankedScreen.Name = "RankedScreen"
RankedScreen.IgnoreGuiInset = true
RankedScreen.ResetOnSpawn = false
RankedScreen.DisplayOrder = 50
RankedScreen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local MasterGroup = Instance.new("CanvasGroup", RankedScreen)
MasterGroup.Name = "MasterFrame"
MasterGroup.Size = UDim2.new(1, 0, 1, 0)
MasterGroup.BackgroundColor3 = Color3.fromRGB(255, 0, 0)

task.wait(8) -- set loading time
TweenService:Create(
	MasterGroup,
	(TweenInfo.new(30, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)),
	{ BackgroundColor3 = Color3.fromRGB(0, 0) }
):Play() -- BG Fade
