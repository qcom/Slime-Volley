# simple button class handles mousedown and click events
class Button extends Sprite
	constructor: (@x, @y, @width, @height, @img, @downImg, @scene) ->
		@down = false
		super(@x, @y, @width, @height, @img)

	handleMouseDown: (e) ->
		# check if event is inside bounding box
		@down = Helpers.inRect(e.x, e.y, @x, @y, @width, @height)

	handleMouseUp: (e) ->
		# check if event is inside bounding box
		@down = false

	handleMouseMove: (e) ->
		@down = Helpers.inRect(e.x, e.y, @x, @y, @width, @height) if @down

	handleClick: (e) ->
		@down = false
		if Helpers.inRect(e.x, e.y, @x, @y, @width, @height)
			@scene.buttonPressed(this) if @scene # pass event back to delegate
	
	draw: (ctx) ->
		ctx.drawImage (if @down then @downImg else @img), Helpers.round(@x), Helpers.round(@y)