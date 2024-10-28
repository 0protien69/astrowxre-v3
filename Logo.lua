local SurfaceGui = Instance.new("SurfaceGui")
SurfaceGui.Parent = game.Workspace -- Adjust the parent as needed

local Texture = Instance.new("Texture")
Texture.Parent = SurfaceGui

-- Create the gradient texture (you'll need to create this image externally)
-- Use a graphics editor to create a 1x1 image with a horizontal gradient
-- of blue, purple, and gold.

-- Assuming you've saved the gradient image as "RobloxGradient.png" in your project:
Texture.Texture = "rbxassetid://1234567890" -- Replace with the asset ID of your gradient image

-- Adjust the SurfaceGui's size and position to fit your desired logo size
SurfaceGui.Size = UDim2.new(0, 200, 0, 100)
SurfaceGui.Position = UDim2.new(0.5, -100, 0.5, -50)
