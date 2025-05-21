local md = game.Workspace.Model
local pt = script.Parent

local reached = false
local cm = 0
local sp = 4

repeat
	cm += 1
	local target = md:GetChildren()[cm]
	local tim = (target.Position - pt.Position).Magnitude / sp
	game:GetService("TweenService"):Create(pt,TweenInfo.new(tim,Enum.EasingStyle.Linear),{CFrame = target.CFrame}):Play()
	task.wait(tim)
	if cm >= #md:GetChildren() then
		reached = true
	end
until reached
