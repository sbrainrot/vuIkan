--// Steal a Brainrot Experiment Loading UI (1 Minute + Draggable + Smooth Progress + 80/90 Messages)
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Remove old UI if exists
local existing = playerGui:FindFirstChild("BrainrotLoading")
if existing then existing:Destroy() end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BrainrotLoading"
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = playerGui

-- Draggable
local function MakeDraggable(frame)
	local dragging, dragInput, dragStart, startPos
	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then dragging = false end
			end)
		end
	end)
	frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			local delta = input.Position - dragStart
			frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end
	end)
end

-- Main Panel
local Main = Instance.new("Frame")
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.Position = UDim2.new(0.5, 0, 0.5, 0)
Main.Size = UDim2.new(0.4225, 0, 0.4225, 0)
Main.BackgroundColor3 = Color3.fromRGB(10,10,15)
Main.BackgroundTransparency = 0.05
Main.BorderSizePixel = 0
Main.Parent = ScreenGui
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 16)
local mainStroke = Instance.new("UIStroke", Main)
mainStroke.Transparency = 0.85
mainStroke.Thickness = 1

MakeDraggable(Main)

-- Title
local Title = Instance.new("TextLabel")
Title.AnchorPoint = Vector2.new(0.5, 0)
Title.Position = UDim2.new(0.5, 0, 0.06, 0)
Title.Size = UDim2.new(0.9, 0, 0.14, 0)
Title.BackgroundTransparency = 1
Title.Text = "STEAL A BRAINROT EXPERIMENT"
Title.Font = Enum.Font.GothamBlack
Title.TextSize = 28
Title.TextColor3 = Color3.fromRGB(170,120,255)
Title.TextWrapped = true
Title.Parent = Main

-- Mid text (center message)
local MidText = Instance.new("TextLabel")
MidText.AnchorPoint = Vector2.new(0.5, 0)
MidText.Position = UDim2.new(0.5, 0, 0.26, 0)
MidText.Size = UDim2.new(0.86, 0, 0.15, 0)
MidText.BackgroundTransparency = 1
MidText.Text = "Initializing"
MidText.Font = Enum.Font.GothamSemibold
MidText.TextSize = 20
MidText.TextColor3 = Color3.fromRGB(230,230,240)
MidText.TextWrapped = true
MidText.TextScaled = false
MidText.TextYAlignment = Enum.TextYAlignment.Center
MidText.Parent = Main

-- Bar Background
local BarBG = Instance.new("Frame")
BarBG.AnchorPoint = Vector2.new(0.5, 0)
BarBG.Position = UDim2.new(0.5, 0, 0.40, 0)
BarBG.Size = UDim2.new(0.82, 0, 0.08, 0)
BarBG.BackgroundColor3 = Color3.fromRGB(35,35,50)
BarBG.BorderSizePixel = 0
BarBG.Parent = Main
Instance.new("UICorner", BarBG).CornerRadius = UDim.new(1,0)

-- Bar Fill
local BarFill = Instance.new("Frame")
BarFill.Size = UDim2.new(0,0,1,0)
BarFill.BackgroundColor3 = Color3.fromRGB(100,80,255)
BarFill.BorderSizePixel = 0
BarFill.Parent = BarBG
Instance.new("UICorner", BarFill).CornerRadius = UDim.new(1,0)

-- Percent label
local Percent = Instance.new("TextLabel")
Percent.AnchorPoint = Vector2.new(0.5, 0)
Percent.Position = UDim2.new(0.5, 0, 0.54, 0)
Percent.Size = UDim2.new(0.4, 0, 0.12, 0)
Percent.BackgroundTransparency = 1
Percent.Text = "0%"
Percent.Font = Enum.Font.GothamBlack
Percent.TextSize = 18
Percent.TextColor3 = Color3.fromRGB(100,170,255)
Percent.Parent = Main

-- Support text
local Support = Instance.new("TextLabel")
Support.AnchorPoint = Vector2.new(0.5, 0)
Support.Position = UDim2.new(0.5, 0, 0.72, 0)
Support.Size = UDim2.new(0.9, 0, 0.06, 0)
Support.BackgroundTransparency = 1
Support.Text = "Support discord.gg/59xEReEx"
Support.Font = Enum.Font.Gotham
Support.TextSize = 14
Support.TextColor3 = Color3.fromRGB(160,160,170)
Support.TextWrapped = true
Support.Parent = Main

-- Badges
local BadgesFrame = Instance.new("Frame")
BadgesFrame.AnchorPoint = Vector2.new(0.5, 0)
BadgesFrame.Position = UDim2.new(0.5, 0, 0.86, 0)
BadgesFrame.Size = UDim2.new(0.9, 0, 0.12, 0)
BadgesFrame.BackgroundTransparency = 1
BadgesFrame.Parent = Main

local badgeNames = {"🔒 Secure","⚡ Fast","✨ Latest"}
for i, name in ipairs(badgeNames) do
	local b = Instance.new("TextLabel")
	b.Size = UDim2.new(1/3 - 0.02, 0, 0.7, 0)
	b.Position = UDim2.new((i-1)*(1/3) + 0.01, 0, 0.1, 0)
	b.BackgroundColor3 = Color3.fromRGB(28,28,36)
	b.BorderSizePixel = 0
	b.Font = Enum.Font.GothamSemibold
	b.TextSize = 14
	b.Text = name
	b.TextColor3 = Color3.fromRGB(220,220,230)
	b.Parent = BadgesFrame
	local c = Instance.new
