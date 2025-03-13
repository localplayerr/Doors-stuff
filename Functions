local functions = {}


function functions.LightRecolor(tim,color0,color1)
	local tweenservice = game:GetService("TweenService")
	local info = TweenInfo.new(tim,Enum.EasingStyle.Linear)
	for _ , light in pairs(game.Workspace.CurrentRooms:GetDescendants()) do
		if light:IsA("Light") or light:IsA("SurfaceLight") or light:IsA("SpotLight") then
			local target = {Color = color1}
			local anim = tweenservice:Create(light,info,target)
			anim:Play()
		end
		if light:IsA("MeshPart") and light.Material == Enum.Material.Neon  and light.Name ~= "Skybox" then
			local target1 = {Color = color0}
			local anim2 = tweenservice:Create(light,info,target1)
			anim2:Play()
		end
	end
end

function functions.TitleLocation(text,duration)
    local intro = game.Players.LocalPlayer.PlayerGui.MainUI.MainFrame.IntroText:Clone()
    intro.Parent = game.Players.LocalPlayer.PlayerGui.MainUI
    intro.Visible = true
    intro.Text = text
    intro.TextTransparency = 1
    game.TweenService:Create(intro.Underline, TweenInfo.new(2), {Size = UDim2.new(0.9, 0, 0.015, 6)}):Play()
    game.TweenService:Create(intro, TweenInfo.new(2), {TextTransparency = 0}):Play()
    if duration ~= nil then task.wait(duration) else task.wait(6) end
    game.TweenService:Create(intro.Underline, TweenInfo.new(3,Enum.EasingStyle.Sine,Enum.EasingDirection.Out), {Size = UDim2.new(0.5, 0, 0.015, 6)}):Play()
    game.TweenService:Create(intro.Underline, TweenInfo.new(3), {ImageTransparency = 1}):Play()
    game.TweenService:Create(intro, TweenInfo.new(3), {TextTransparency = 1}):Play()
    wait(4)
    intro:Destroy()
end

local function functions.GetAllNodes(reversed)
	local Nodes = {}
	if reversed ~= true then
		for i = 1 , game.Workspace.CurrentRooms:GetChildren() , 1 do
			local room = game.Workspace.CurrentRooms:GetChildren()[i]
			local path = room:FindFirstChild("PathfindNodes")
			if path then
				for _ , nod in path:GetChildren() do
					Nodes[#Nodes + 1] = nod.CFrame + Vector3.new(0,4,0)
				end
			end
			if room:FindFirstChild("RoomExit") then
				Nodes[#Nodes + 1] = room.RoomExit.CFrame
			end
		end
	else
		for i = game.Workspace.CurrentRooms:GetChildren() , 1 , -1 do
			local room = game.Workspace.CurrentRooms:GetChildren()[i]
			local path = room:FindFirstChild("PathfindNodes")
			if room:FindFirstChild("RoomEntrance") then
				Nodes[#Nodes + 1] = room.RoomEntrance.CFrame
			end
			if path then
				local helper = {}
				for _ , nod in path:GetChildren() do
					if nod:tonumber() ~= nil then
						helper[#helper + 1] = nod.CFrame + Vector3.new(0,4,0)
					end
				end
				table.sort(helper, function(a, b) return tonumber(a.Name) > tonumber(b.Name) end)
				for _ , v in helper do Nodes[#Nodes + 1] = v end
			end
		end
	end
	return Nodes
end

return functions
