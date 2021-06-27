local Tween3D = {}
local TweenService = game:GetService("TweenService")
local Settings = require(script.Settings)

local Info = TweenInfo.new(Settings.Duration, Settings.EasingStyle, Settings.EasingDirection)
local Props = {Size = Settings.Size}

function Tween3D:PlayTween(obj)
	coroutine.wrap(function()
		xpcall(function()
			local CreateTween = TweenService:Create(obj, Info, Props)
			CreateTween:Play()
			if Enum.TweenStatus.Completed then
				local success = "%s was completed successfully!"
				print(string.format(success, obj.Name .. " Tween"))
			elseif Enum.TweenStatus.Canceled then
				local e = "%s failed to complete!"
				warn(string.format(e, obj.Name .. " Tween")) 
			end
		end, warn)
	end)()
end

return Tween3D
