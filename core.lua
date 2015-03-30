local _, cfg = ... --import config

--[[
Cause I wanted to do it!
 --10leej
]]

local function Borderize(frame) -- style our frame
    if frame then
        frame:CreateBeautyBorder(12)
    end
end

--Make frames more resizable (RaidFrameResizer)
local n,w,h="CompactUnitFrameProfilesGeneralOptionsFrame" h,w=
_G[n.."HeightSlider"],
_G[n.."WidthSlider"] 
h:SetMinMaxValues(1,150) --height
w:SetMinMaxValues(1,150) --width

--This is how you skin the default raid frames
f = CreateFrame("Frame")
f:SetScript("OnEvent", function(self, event, ...)
	if event == "GROUP_ROSTER_UPDATE" then
		for i = 1, 5 do -- Party Frames
			Borderize(_G["CompactPartyFrameMember" .. i])
		end
		for i = 1, 80 do -- Raid Frames
			Borderize(_G["CompactRaidFrame" .. i])
		end
		for i = 1, 5 do -- Raid Frames Group 1
			Borderize(_G["CompactRaidGroup1Member" .. i])
		end
		for i = 1, 5 do -- Raid Frames Group 2
			Borderize(_G["CompactRaidGroup2Member" .. i])
		end
		for i = 1, 5 do -- Raid Frames Group 3
			Borderize(_G["CompactRaidGroup3Member" .. i])
		end
		for i = 1, 5 do -- Raid Frames Group 5
			Borderize(_G["CompactRaidGroup4Member" .. i])
		end
		for i = 1, 5 do -- Raid Frames Group 6
			Borderize(_G["CompactRaidGroup5Member" .. i])
		end
	elseif event == "PLAYER_ENTERING_WORLD" then
		--Set the default raid frame options to how we want them
		SetCVar("useCompactPartyFrames", 1)
		SetCVar("raidOptionShowBorders", 0)
		SetCVar("raidFramesDisplayPowerBars", 1)
		SetCVar("raidFramesDisplayClassColor", 1)
	end
end)
f:RegisterEvent("PLAYER_LOGIN")
f:RegisterEvent("GROUP_ROSTER_UPDATE")
f:RegisterEvent("ADDON_LOADED")