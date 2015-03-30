local _, cfg = ... --import config
local addon, ns = ... --get addon namespace

local MediaPath = "Interface\\AddOns\\BobUI\\media\\" --Set the media path

cfg.statusbar_texture = MediaPath.."statusbar" --Set the Bar Texture
cfg.backdrop = "Interface\\Buttons\\WHITE8x8" --backdrop image
cfg.font = "Fonts\\ARIALN.ttf" --BobUI's base font
cfg.style = "THINOUTLINE" 	--OUTLINE, MONOCHROME, or nil

--Backdrop colors
cfg.bColor = { .0, .0, .0, 0.5 }--Set  backround color r,b,g,alpha

--Border config
cfg.pixelbordersize = 2 --only shows if !Beautycase is disabled
cfg.border = {
	size = 12, --border sizes
	texture = "default", --default, white
	color = { 1, 1, 1 }, --Colors work best with the white layout
}