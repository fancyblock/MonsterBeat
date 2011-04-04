module(..., package.seeall)

local ui			= require( utils.uipath('component/ui') )
local slide			= require( utils.uipath('component/slide') )
local list			= require( utils.uipath('component/list') )
local controller	= require( utils.uipath('controller') )
local gameModel		= require( utils.modelpath('game') )
local gameManager	= require( utils.gamepath('gameManager') )

-- local gameManager = require('gameManager')


-- logo
function logo()
	return display.newImage( res.getArt('ui','logo/logo.png') )
end

-- main menu
function mainmenu_play()
	local btn = ui.newButton{
		default = res.getArt('ui',"mainmenu/play.png"),
		over = res.getArt('ui',"mainmenu/play.png"),
		--onPress = controller.mainmenu_play,
		onRelease = controller.mainmenu_play.onRelease,
		--text = "Button 1 Label",
		--emboss = true
	}
	return btn
end

-- start
function start_slide()
	local imgs = {
		res.getArt('ui','start/feena1.JPG'),
		res.getArt('ui','start/feena2.JPG'),
		res.getArt('ui','start/feena3.JPG'),
		res.getArt('ui','start/feena4.JPG'),
		res.getArt('ui','start/feena5.JPG'),
		res.getArt('ui','start/feena6.JPG'),
		res.getArt('ui','start/feena7.JPG'),
		res.getArt('ui','start/feena8.JPG'),
	}
	local g = slide.new{ 
		imageSet = imgs,
		onSelect = controller.start_slide.onSelect
		--background = 'start/background.png',
		--tJPGop =,
		--bottom =,
	}
	return g
end


-- ready
function ready_chooser()
	-- setup some data
	local data = {}
	for i=1, 4 do
		data[i] = "List item ".. i
	end
	
	local topBoundary = display.screenOriginY + 40
	local bottomBoundary = display.screenOriginY + 0
	
	-- create the list
	local list = list.newList{
		data			= data,
		default			= res.getArt('ui',"ready/listItemBg.png"),
		over			= res.getArt('ui',"ready/listItemBg_over.png"),
		onRelease		= controller.ready_chooser.onSelect,
		top				= topBoundary,
		bottom			= bottomBoundary,
		backgroundColor	= { 255, 255, 255 },
		callback=function(row) 
				local t = display.newText(row, 0, 0, native.systemFontBold, 16)
				t:setTextColor(0, 0, 0)
				t.x = math.floor(t.width/2) + 12
				t.y = 46 
				return t
			end
	}
	return list
end

function ready_back()
	local btn = ui.newButton{
		default = res.getArt('ui',"ready/back.png"),
		over = res.getArt('ui',"ready/back.png"),
		--onPress = controller.mainmenu_play,
		onRelease = controller.ready_back.onRelease,
		--text = "Button 1 Label",
		--emboss = true
	}
	return btn
end

-- game 
function game_main()
	local canvas = gameManager.loadGame( gameModel.initParam )
	return canvas
	
	-- local btn = ui.newButton{
		-- default = res.getArt('ui',"game/main.jpg"),
		-- over = res.getArt('ui',"game/main.jpg"),
		-- onRelease = controller.game_main.onRelease,
	-- }
	-- return btn
end

function game_pause()
	local btn = ui.newButton{
		default = res.getArt('ui',"game/pause.jpg"),
		over = res.getArt('ui',"game/pause.jpg"),
		--onPress = controller.mainmenu_play,
		onRelease = controller.game_pause.onRelease,
		--text = "Button 1 Label",
		--emboss = true
	}
	return btn
end

-- pause
function pause_background()
	local bg = display.newImage( res.getArt('ui',"pause/background.PNG") )
	return bg
end

function pause_back()
	local btn = ui.newButton{
		default = res.getArt('ui',"pause/back.png"),
		over = res.getArt('ui',"pause/back.png"),
		--onPress = controller.mainmenu_play,
		onRelease = controller.pause_back.onRelease,
		--text = "Button 1 Label",
		--emboss = true
	}
	return btn
end

-- win
function win_background()
	local bg = display.newImage( res.getArt('ui',"win/background.jpg") )
	return bg
end

function win_score()
	local txt = display.newText( 'default', 0,0, native.systemFont, 12 )
	txt.text = tostring( 0 )
	return txt
end

function win_back()
	local btn = ui.newButton{
		default = res.getArt('ui',"win/back.png"),
		over = res.getArt('ui',"win/back.png"),
		--onPress = controller.mainmenu_play,
		onRelease = controller.win_back.onRelease,
		--text = "Button 1 Label",
		--emboss = true
	}
	return btn
end

-- lose
function lose_background()
	local bg = display.newImage( res.getArt('ui',"lose/background.jpg") )
	return bg
end

function lose_score()
	local txt = display.newText( 'default', 0,0, native.systemFont, 12 )
	txt.text = tostring( 0 )
	return txt
end

function lose_back()
	local btn = ui.newButton{
		default = res.getArt('ui',"lose/back.png"),
		over = res.getArt('ui',"lose/back.png"),
		--onPress = controller.mainmenu_play,
		onRelease = controller.lose_back.onRelease,
		--text = "Button 1 Label",
		--emboss = true
	}
	return btn
end