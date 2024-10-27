local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextBox = Instance.new("TextBox")
local TextLabel = Instance.new("TextLabel")

-- Properties
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 2
Frame.BorderColor3 = Color3.fromRGB(0, 0, 255)
Frame.Position = UDim2.new(0.1, 0, 0.1, 0)
Frame.Size = UDim2.new(0, 200, 0, 150)

TextBox.Parent = Frame
TextBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Position = UDim2.new(0.05, 0, 0.1, 0)
TextBox.Size = UDim2.new(0, 190, 0, 30)

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 255)
TextLabel.Text = "Astrowxre v3"
TextLabel.TextSize = 19
TextLabel.Position = UDim2.new(0.05, 0, 0.02, 0)

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
end)local function checkVersionAndShowUI()
    local currentVersion = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
    if currentVersion.VersionId == 25925860 then
        -- Show the UI
        ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    end
end

game:GetService("RunService").Heartbeat:Connect(checkVersionAndShowUI)
