local _, cfg = ... --import config
if not CompactRaidFrameManager then LoadAddOn("Blizzard_CompactRaidFrames") end --hacky method because break things

--[[
Cause I wanted to do it!
 --10leej
]]

local function CreateBackdrop(frame)
	frame:SetBackdrop({bgFile = cfg.backdrop, edgeFile = "Interface\\Buttons\\WHITE8x8", edgeSize = cfg.pixelbordersize, 
		insets = {top = 2, left = 2, bottom = 2, right = 2}})
	frame:SetBackdropColor(unpack(cfg.bColor))
	frame:SetBackdropBorderColor(unpack(cfg.bColor))
	if isBeautiful then
		frame:CreateBeautyBorder(cfg.border.size.large)
		frame:SetBeautyBorderTexture(cfg.border.texture)
		frame:SetBeautyBorderColor(unpack(cfg.border.color))
	end
end

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

--Skin the RaidManager

--hide stuff
local buttons = {
	CompactRaidFrameManagerDisplayFrameFilterOptionsFilterRoleTank,
	CompactRaidFrameManagerDisplayFrameFilterOptionsFilterRoleHealer,
	CompactRaidFrameManagerDisplayFrameFilterOptionsFilterRoleDamager,
	CompactRaidFrameManagerDisplayFrameFilterOptionsFilterGroup1,
	CompactRaidFrameManagerDisplayFrameFilterOptionsFilterGroup2,
	CompactRaidFrameManagerDisplayFrameFilterOptionsFilterGroup3,
	CompactRaidFrameManagerDisplayFrameFilterOptionsFilterGroup4,
	CompactRaidFrameManagerDisplayFrameFilterOptionsFilterGroup5,
	CompactRaidFrameManagerDisplayFrameFilterOptionsFilterGroup6,
	CompactRaidFrameManagerDisplayFrameFilterOptionsFilterGroup7,
	CompactRaidFrameManagerDisplayFrameFilterOptionsFilterGroup8,
	CompactRaidFrameManagerDisplayFrameLeaderOptionsInitiateRolePoll,
	CompactRaidFrameManagerDisplayFrameLeaderOptionsInitiateReadyCheck,
	CompactRaidFrameManagerDisplayFrameLeaderOptionsRaidWorldMarkerButton,
	CompactRaidFrameManagerDisplayFrameLockedModeToggle,
	CompactRaidFrameManagerDisplayFrameHiddenModeToggle,
	CompactRaidFrameManagerDisplayFrameConvertToRaid
}
CompactRaidFrameManagerDisplayFrameLeaderOptionsRaidWorldMarkerButton.SetNormalTexture = function() end
for _, button in pairs(buttons) do
	for i = 1, 3 do
		select(i, button:GetRegions()):SetAlpha(0)
	end
end

for i = 1, 8 do
	select(i, CompactRaidFrameManager:GetRegions()):Hide()
end
select(1, CompactRaidFrameManagerDisplayFrameFilterOptions:GetRegions()):Hide()
select(1, CompactRaidFrameManagerDisplayFrame:GetRegions()):Hide()
select(4, CompactRaidFrameManagerDisplayFrame:GetRegions()):Hide()

local bd = CreateFrame("Frame", nil, CompactRaidFrameManager)
bd:SetPoint("TOPLEFT", CompactRaidFrameManager, "TOPLEFT")
bd:SetPoint("BOTTOMRIGHT", CompactRaidFrameManager, "BOTTOMRIGHT", -9, 9)

--now we skin it and yes it's really this simple :)
CreateBackdrop(CompactRaidFrameManagerDisplayFrameFilterOptionsFilterRoleTank)
CreateBackdrop(CompactRaidFrameManagerDisplayFrameFilterOptionsFilterRoleHealer)
CreateBackdrop(CompactRaidFrameManagerDisplayFrameFilterOptionsFilterRoleDamager)
CreateBackdrop(CompactRaidFrameManagerDisplayFrameFilterOptionsFilterGroup1)
CreateBackdrop(CompactRaidFrameManagerDisplayFrameFilterOptionsFilterGroup2)
CreateBackdrop(CompactRaidFrameManagerDisplayFrameFilterOptionsFilterGroup3)
CreateBackdrop(CompactRaidFrameManagerDisplayFrameFilterOptionsFilterGroup4)
CreateBackdrop(CompactRaidFrameManagerDisplayFrameFilterOptionsFilterGroup5)
CreateBackdrop(CompactRaidFrameManagerDisplayFrameFilterOptionsFilterGroup6)
CreateBackdrop(CompactRaidFrameManagerDisplayFrameFilterOptionsFilterGroup7)
CreateBackdrop(CompactRaidFrameManagerDisplayFrameFilterOptionsFilterGroup8)
CreateBackdrop(CompactRaidFrameManagerDisplayFrameLeaderOptionsInitiateRolePoll)
CreateBackdrop(CompactRaidFrameManagerDisplayFrameLeaderOptionsInitiateReadyCheck)
CreateBackdrop(CompactRaidFrameManagerDisplayFrameLeaderOptionsRaidWorldMarkerButton)
CreateBackdrop(CompactRaidFrameManagerDisplayFrameLockedModeToggle)
CreateBackdrop(CompactRaidFrameManagerDisplayFrameHiddenModeToggle)
CreateBackdrop(CompactRaidFrameManagerDisplayFrameConvertToRaid)
CreateBackdrop(CompactRaidFrameManager)
CompactRaidFrameManagerToggleButton:SetNormalTexture("Interface\\AddOns\\BobUI\\media\\buttons\\RaidPanel-Toggle")

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