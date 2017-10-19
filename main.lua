-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
local tapCount = 0

local background = display.newImageRect( "background.png", 360, 570 )
background.x = display.contentCenterX
background.y = display.contentCenterY

local tapText = display.newText( tapCount, display.contentCenterX+90, 20 , native.systemFont, 40 )
tapText:setFillColor(0, 0, 0)

local credito = display.newText( "Created by Ariane Brandão", 80, 0, native.systemFont, 10 )
credito:setFillColor( 1, 0, 0 )
credito.alpha = 0.8

local plataforma = display.newImageRect( "platform.png", 300, 50 )
plataforma.x = display.contentCenterX
plataforma.y = display.contentHeight-25

local balao = display.newImageRect( "balloon.png", 112, 112 )
balao.x = display.contentCenterX
balao.y = display.contentCenterY
balao.alpha = 0.8

local physics = require("physics")
physics.start()

physics.addBody( plataforma, "static" )
physics.addBody( balao, "dynamic", { radius = 50, bounce = 0.3 } )

local function pushBalloon()
	balao:applyLinearImpulse( 0, -0.75, balao.x, balao.y )
	tapCount = tapCount +1
	tapText.text = tapCount
end

balao:addEventListener( "tap", pushBalloon )
