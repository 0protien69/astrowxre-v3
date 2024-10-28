local SurfaceGui = Instance.new("SurfaceGui")
SurfaceGui.Parent = workspace -- Or any other appropriate parent

local Texture = Instance.new("Texture")
Texture.Parent = SurfaceGui
Texture.Texture = "path/to/your/gradient/image.png" -- Replace with the actual path

-- Adjust the SurfaceGui's size and position to fit your needs
SurfaceGui.Size = UDim2.new(0, 200, 0, 100)
SurfaceGui.Position = UDim2.new(0.5, -100, 0.5, -50)
