local TweenService = game:GetService("TweenService")
TweenService = game:GetService("TweenService")

Player = game.Players.LocalPlayer
PlayerGui = Player.PlayerGui

warn(Player.Name.." ranked GUI instantiated.")

RankedScreen = Instance.new("ScreenGui", PlayerGui)
RankedScreen.Name = "RankedScreen"
RankedScreen.IgnoreGuiInset = true
RankedScreen.ResetOnSpawn = false
RankedScreen.DisplayOrder = 50
RankedScreen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MasterGroup = Instance.new("CanvasGroup", RankedScreen)
MasterGroup.Name = "MasterFrame"
MasterGroup.Size = UDim2.new(1,0,1,0)
MasterGroup.BackgroundColor3 = Color3.fromRGB(148, 3, 3)

TweenService:Create(MasterGroup, (TweenInfo.new(60, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)), {BackgroundColor3 = Color3.fromRGB(0,0)}):Play() -- BG Fade