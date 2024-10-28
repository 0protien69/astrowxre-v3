local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextBox = Instance.new("TextBox")
local TextLabel = Instance.new("TextLabel")
local ExecuteButton = Instance.new("TextButton")
local SaveButton = Instance.new("TextButton")
local OpenButton = Instance.new("TextButton")
local HelpButton = Instance.new("TextButton")

-- Properties
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 2
Frame.BorderColor3 = Color3.fromRGB(0, 0, 255)
Frame.Position = UDim2.new(0.1, 0, 0.1, 0)
Frame.Size = UDim2.new(0, 300, 0, 200)

TextBox.Parent = Frame
TextBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Position = UDim2.new(0.05, 0, 0.1, 0)
TextBox.Size = UDim2.new(0, 280, 0, 100)

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 255)
TextLabel.Text = "Astrowxre v3"
TextLabel.TextSize = 22
TextLabel.Position = UDim2.new(0.05, 0, 0.02, 0)

ExecuteButton.Parent = Frame
ExecuteButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
ExecuteButton.TextColor3 = Color3.fromRGB(0, 0, 0)
ExecuteButton.Text = "Execute"
ExecuteButton.Position = UDim2.new(0.05, 0, 0.6, 0)
ExecuteButton.Size = UDim2.new(0, 100, 0, 25)

SaveButton.Parent = Frame
SaveButton.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
SaveButton.TextColor3 = Color3.fromRGB(0, 0, 0)
SaveButton.Text = "Save"
SaveButton.Position = UDim2.new(0.35, 0, 0.6, 0)
SaveButton.Size = UDim2.new(0, 100, 0, 25)

OpenButton.Parent = Frame
OpenButton.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
OpenButton.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenButton.Text = "Open"
OpenButton.Position = UDim2.new(0.65, 0, 0.6, 0)
OpenButton.Size = UDim2.new(0, 100, 0, 25)

HelpButton.Parent = Frame
HelpButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
HelpButton.TextColor3 = Color3.fromRGB(255, 255, 255)
HelpButton.Text = "Help"
HelpButton.Position = UDim2.new(0.05, 0, 0.85, 0)
HelpButton.Size = UDim2.new(0, 100, 0, 25)

-- Dragging functionality
local isDragging = false
local dragStart = Vector2.new(0, 0)
local frameStart = Frame.Position

Frame.MouseButton1Down:Connect(function()
    isDragging = true
    dragStart = Vector2.new(game.Players.LocalPlayer:GetMouse().X, game.Players.LocalPlayer:GetMouse().Y)
    frameStart = Frame.Position
end)

Frame.MouseButton1Up:Connect(function()
    isDragging = false
end)

game:GetService("UserInputService").InputChanged:Connect(function(input, gameProcessedEvent)
    if input.UserInputType == Enum.UserInputType.MouseMovement and isDragging then
        local delta = Vector2.new(input.Position.X, input.Position.Y) - dragStart
        Frame.Position = UDim2.new(frameStart.X.Scale + delta.X / game.Workspace.CurrentCamera.ViewportSize.X, frameStart.X.Offset, frameStart.Y.Scale + delta.Y / game.Workspace.CurrentCamera.ViewportSize.Y, frameStart.Y.Offset)
    end
end)

-- Button Functionalities (Placeholder)
ExecuteButton.MouseButton1Click:Connect(function()
    -- Add your execution code here
    print("Executing...")
end)

SaveButton.MouseButton1Click:Connect(function()
    -- Add your saving code here
    print("Saving...")
end)

OpenButton.MouseButton1Click:Connect(function()
    -- Add your opening code here
    print("Opening...")
end)

HelpButton.MouseButton1Click:Connect(function()
    -- Add your help functionality here, e.g., opening a help document or displaying a message
    print("Help!")
end)

-- Keybind Functionality
local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if input.KeyCode == Enum.KeyCode.LeftControl and input.KeyCode == Enum.KeyCode.P then
        if ScreenGui.Parent then
            ScreenGui.Parent = nil
        else
            ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
        end
    end
end) 

local function checkVersionAndShowUI()
    local currentVersion = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
    if currentVersion.VersionId == 25925860 then
        -- Show the UI
        ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    end
end

game:GetService("RunService").Heartbeat:Connect(checkVersionAndShowUI)
