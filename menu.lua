-----------------------------------------------------------------------------------------
--
-- menu.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local mui = require( "materialui.mui" )

local scene = composer.newScene()
local background = nil
local widget = require( "widget" )

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called
-- -----------------------------------------------------------------------------------------------------------------

-- Local forward references should go here

-- -------------------------------------------------------------------------------

-- "scene:create()"
function scene:create( event )

    local sceneGroup = self.view

    -- Initialize the scene here
    -- Example: add display objects to "sceneGroup", add touch listeners, etc.

    --Hide status bar from the beginning
    display.setStatusBar( display.HiddenStatusBar )

    display.setDefault("background", 1, 1, 1)

    -- print("display.contentWidth: "..display.contentWidth)
    -- print("display.actualContentWidth: "..display.actualContentWidth)

    background = display.newRect( 0, 0, display.contentWidth, display.contentHeight)
    background.anchorX = 0
    background.anchorY = 0
    background.x, background.y = 0, 0
    background:setFillColor( 1 )

    sceneGroup:insert( background )

    mui.init()

    -- dialog box example
    -- use mui.getWidgetBaseObject("dialog_demo") to get surface to add more content
    local showDialog = function()
        mui.newDialog({
            name = "dialog_demo",
            width = mui.getScaleVal(450),
            height = mui.getScaleVal(300),
            text = "Do you want to continue?",
            textX = 0,
            textY = 0,
            textColor = { 0, 0, 0, 1 },
            font = native.systemFont,
            fontSize = mui.getScaleVal(32),
            fillColor = { 1, 1, 1, 1 },
            gradientBorderShadowColor1 = { 1, 1, 1, 0.4 },
            gradientBorderShadowColor2 = { 0, 0, 0, 0.4 },
            easing = easing.inOutCubic, -- this is default if omitted
            buttons = {
                font = native.systemFont,
                okayButton = {
                    text = "Okay",
                    textColor = { 0, 0.46, 1 },
                    fillColor = { 1, 1, 1 },
                    width = mui.getScaleVal(100),
                    height = mui.getScaleVal(50),
                    callBackOkay = mui.actionForOkayDialog,
                    clickAnimation = {
                        fillColor = { 0.4, 0.4, 0.4, 0.4 },
                        time = 400
                    }
                },
                cancelButton = {
                    text = "Cancel",
                    textColor = { 0, 0.46, 1 },
                    fillColor = { 1, 1, 1 },
                    width = mui.getScaleVal(100),
                    height = mui.getScaleVal(50),
                    clickAnimation = {
                        fillColor = { 0.4, 0.4, 0.4, 0.4 },
                        time = 400
                    }
                }
            }
        })
    end

    mui.newRoundedRectButton({
        name = "newDialog",
        text = "Open Dialog",
        width = mui.getScaleVal(200),
        height = mui.getScaleVal(60),
        x = mui.getScaleVal(160),
        y = mui.getScaleVal(220),
        font = native.systemFont,
        gradientShadowColor1 = { 0.9, 0.9, 0.9, 255 },
        gradientShadowColor2 = { 0.9, 0.9, 0.9, 0 },
        gradientDirection = "up",
        textColor = { 1, 1, 1 },
        radius = 10,
        callBack = showDialog
    })

    mui.newRectButton({
        name = "scene2",
        text = "Switch Scene",
        width = mui.getScaleVal(200),
        height = mui.getScaleVal(60),
        x = mui.getScaleVal(160),
        y = mui.getScaleVal(120),
        font = native.systemFont,
        fillColor = { 0.25, 0.75, 1, 1 },
        textColor = { 1, 1, 1 },
        touchpoint = true,
        callBack = mui.actionSwitchScene,
        callBackData = { 
            sceneDestination = "fun",
            sceneTransitionColor = { 0, 0.73, 1 }
        } -- scene fun.lua
    })

    mui.newIconButton({
        name = "plus",
        text = "help",
        width = mui.getScaleVal(50),
        height = mui.getScaleVal(50),
        x = mui.getScaleVal(60),
        y = mui.getScaleVal(40),
        font = "MaterialIcons-Regular.ttf",
        textColor = { 0.25, 0.75, 1, 1 },
        textAlign = "center",
        callBack = mui.actionSwitchScene,
        callBackData = {
            sceneDestination = "onboard",
            sceneTransitionColor = { 0.08, 0.9, 0.31 }
        } -- scene fun.lua
        -- callBack = mui.actionForPlus
    })

    -- date picker example
    local showDatePicker = function(event)
        mui.newDatePicker({
            name = "datepicker-demo",
            font = native.systemFont,
            fontSize = mui.getScaleVal(26),
            width = mui.getScaleVal(500),
            height = mui.getScaleVal(300),
            fontSize = mui.getScaleVal(30),
            fontColor = { 0.7, 0.7, 0.7, 1 }, -- non-select items
            fontColorSelected = { 0, 0, 0, 1 }, -- selected items
            columnColor = { 1, 1, 1, 1 }, -- background color for columns
            strokeColor = { 0.25, 0.75, 1, 1 }, -- the border color around widget
            gradientBorderShadowColor1 = { 1, 1, 1, 0.2 },
            gradientBorderShadowColor2 = { 1, 1, 1, 1 },
            fromYear = 1969,
            toYear = 2020,
            startMonth = 11,
            startDay = 15,
            startYear = 2015,
            cancelButtonText = "Cancel",
            cancelButtonTextColor = { 1, 1, 1, 1 },
            cancelButtonFillColor = { 0.25, 0.75, 1, 1 },
            submitButtonText = "Set",
            submitButtonFillColor = { 0.25, 0.75, 1, 1 },
            submitButtonTextColor = { 1, 1, 1, 1 },
            callBack = mui.datePickerCallBack,
        })
    end
    mui.newCircleButton({
        name = "alice-button",
        text = "date_range",
        radius = mui.getScaleVal(46),
        x = mui.getScaleVal(500),
        y = mui.getScaleVal(120),
        font = "MaterialIcons-Regular.ttf",
        textColor = { 1, 1, 1, 1 },
        fillColor = { 0.25, 0.75, 1, 1 },
        fontColor = { 0.7, 0.7, 0.7, 1 }, -- non-select items
        fontColorSelected = { 0, 0, 0, 1 }, -- selected items
        columnColor = { 1, 1, 1, 1 }, -- background color for columns
        strokeColor = { 0.25, 0.75, 1, 1 }, -- the border color around widget
        callBack = showDatePicker -- do not like wheel picker on native device.
    })

    -- time picker example
    local showTimePicker = function(event)
        mui.newTimePicker({
            name = "timepicker-demo",
            font = native.systemFont,
            width = mui.getScaleVal(400),
            height = mui.getScaleVal(300),
            fontSize = mui.getScaleVal(30),
            fontColor = { 0.7, 0.7, 0.7, 1 }, -- non-select items
            fontColorSelected = { 0, 0, 0, 1 }, -- selected items
            columnColor = { 1, 1, 1, 1 }, -- background color for columns
            strokeColor = { 0.25, 0.75, 1, 1 }, -- the border color around widget
            gradientBorderShadowColor1 = { 1, 1, 1, 0.2 },
            gradientBorderShadowColor2 = { 1, 1, 1, 1 },
            startHour = 11,
            startMinute = 15,
            startAMPM = "am",
            cancelButtonText = "Cancel",
            cancelButtonTextColor = { 1, 1, 1, 1 },
            cancelButtonFillColor = { 0.25, 0.75, 1, 1 },
            submitButtonText = "Set",
            submitButtonFillColor = { 0.25, 0.75, 1, 1 },
            submitButtonTextColor = { 1, 1, 1, 1 },
            callBack = mui.timePickerCallBack,
        })
    end
    mui.newCircleButton({
        name = "bueler-button",
        text = "access_time",
        radius = mui.getScaleVal(46),
        x = mui.getScaleVal(500),
        y = mui.getScaleVal(220),
        font = "MaterialIcons-Regular.ttf",
        textColor = { 1, 1, 1, 1 },
        fillColor = { 0, 0.46, 1 },
        textAlign = "center",
        callBack = showTimePicker -- do not like wheel picker on native device.
    })

    -- slide panel example
    local showSlidePanel = function(event)
        mui.newSlidePanel({
            name = "slidepanel-demo",
            title = "MUI Demo", -- leave blank for no panel title text
            titleAlign = "center",
            font = native.systemFont,
            width = mui.getScaleVal(400),
            titleFontSize = mui.getScaleVal(30),
            titleFontColor = { 1, 1, 1, 1 },
            titleFont = native.systemFont,
            titleBackgroundColor = { 0.25, 0.75, 1, 1 },
            fontSize = mui.getScaleVal(20),
            fillColor = { 1, 1, 1, 1 }, -- background color
            buttonToAnimate = "slidepanel-button",
            callBack = mui.actionForSlidePanel,
            callBackData = {
                item = "cake"
            },
            labelColor = { 0.3, 0.3, 0.3, 1 }, -- active
            labelColorOff = { 0.5, 0.5, 0.5, 1 }, -- non-active
            buttonHeight = mui.getScaleVal(60),
            buttonHighlightColor = { 0.5, 0.5, 0.5 },
            buttonHighlightColorAlpha = 0.5,
            lineSeparatorHeight = mui.getScaleVal(1),
            list = {
                { key = "Home", value = "1", icon="home", labelText="Home", isActive = true },
                { key = "Newsroom", value = "2", icon="new_releases", labelText="News", isActive = false },
                { key = "Location", value = "3", icon="location_searching", labelText="Location Information", isActive = false },
                { key = "To-do", value = "4", icon="view_list", labelText="To-do", isActive = false },
                { key = "LineSeparator" },
                { key = "To-do 2", value = "To-do 2", icon="view_list", labelText="To-do 2", isActive = false },
                { key = "To-do 3", value = "To-do 3", icon="view_list", labelText="To-do 3", isActive = false },
                { key = "To-do 4", value = "To-do 4", icon="view_list", labelText="To-do 4", isActive = false },
                { key = "To-do 5", value = "To-do 5", icon="view_list", labelText="To-do 5", isActive = false },
                { key = "LineSeparator" },
                { key = "To-do 6", value = "To-do 6", icon="view_list", labelText="To-do 6", isActive = false },
                { key = "To-do 7", value = "To-do 7", icon="view_list", labelText="To-do 7", isActive = false },
                { key = "To-do 8", value = "To-do 8", icon="view_list", labelText="To-do 8", isActive = false },
                { key = "To-do 9", value = "To-do 9", icon="view_list", labelText="To-do 9", isActive = false },
                { key = "To-do 10", value = "To-do 10", icon="view_list", labelText="To-do 10", isActive = false },
                { key = "LineSeparator" },
                { key = "To-do 11", value = "To-do 11", icon="view_list", labelText="To-do 11", isActive = false },
                { key = "To-do 12", value = "To-do 12", icon="view_list", labelText="To-do 12", isActive = false },
            },
        })
        -- add some buttons to the menu!

    end
    mui.newCircleButton({
        name = "slidepanel-button",
        text = "menu",
        radius = mui.getScaleVal(46),
        x = mui.getScaleVal(500),
        y = mui.getScaleVal(320),
        font = "MaterialIcons-Regular.ttf",
        textColor = { 1, 1, 1, 1 },
        fillColor = { 0, 0.46, 1 },
        textAlign = "center",
        callBack = showSlidePanel -- do not like wheel picker on native device.
    })

    -- checkbox example
    mui.newCheckBox({
        name = "check",
        text = "check_box_outline_blank",
        width = mui.getScaleVal(50),
        height = mui.getScaleVal(50),
        x = mui.getScaleVal(360),
        y = mui.getScaleVal(120),
        font = "MaterialIcons-Regular.ttf",
        textColor = { 0.3, 0.3, 0.3 },
        textAlign = "center",
        value = 500,
        callBack = mui.actionForCheckbox
    })

    -- toggle switch example
    mui.newToggleSwitch({
        name = "switch_demo",
        size = mui.getScaleVal(55),
        x = mui.getScaleVal(360),
        y = mui.getScaleVal(220),
        textColorOff = { 0.57, 0.85, 1, 1 },
        textColor = { 0.25, 0.75, 1, 1 },
        backgroundColor = { 0.74, 0.88, 0.99, 1 },
        backgroundColorOff = { 0.82, 0.95, 0.98, 1 },
        isChecked = true,
        value = 100, -- if switch is in the on position it's 100 else nil
        callBack = mui.actionForSwitch
    })

    -- radio button group example
    mui.newRadioGroup({
        name = "radio_demo",
        width = mui.getScaleVal(30), --+ (getScaleVal(30)*1.2),
        height = mui.getScaleVal(30),
        x = mui.getScaleVal(120),
        y = mui.getScaleVal(40),
        layout = "horizontal",
        labelFont = native.systemFont,
        textColor = { 0, 0, 0 },
        labelColor = { 0, 0, 0 },
        callBack = mui.actionForRadioButton,
        list = {
            { key = "Cookie", value = "1", isChecked = false },
            { key = "Fruit Snack", value = "2", isChecked = false },
            { key = "Grape", value = "3", isChecked = true }
        }
    })

    ---[[--
    mui.newTableView({
        name = "tableview_demo",
        width = mui.getScaleVal(300),
        height = mui.getScaleVal(300),
        top = mui.getScaleVal(40),
        left = display.contentWidth - mui.getScaleVal(315),
        font = native.systemFont,
        textColor = { 0, 0, 0, 1 },
        lineColor = { 1, 1, 1, 1 },
        lineHeight = mui.getScaleVal(4),
        rowColor = { default={1,1,1}, over={1,0.5,0,0.2} },
        rowHeight = mui.getScaleVal(60),
        -- rowAnimation = false, -- turn on rowAnimation
        noLines = false,
        callBackTouch = mui.onRowTouchDemo,
        callBackRender = mui.onRowRenderDemo,
        scrollListener = mui.scrollListener,  -- needed if using buttons, etc within the row!
        list = { -- if 'key' use it for 'id' in the table row
            { key = "Row1", text = "Row 1", value = "1", isCategory = false },
            { key = "Row2", text = "Row 2", value = "2", isCategory = false },
            { key = "Row3", text = "Row 3", value = "3", isCategory = false },
            { key = "Row4", text = "Row 4", value = "4", isCategory = false },
            -- below are rows with different colors
            -- set "noLines" to true above to omit line border
            -- { key = "Row5", text = "Row 5", value = "5", isCategory = false, fillColor = { 0.67, 0.98, 0.65, 0.2 } },
            -- { key = "Row6", text = "Row 6", value = "6", isCategory = false, fillColor = { 1, 0, 0, 0.2 }  },
        },
        categoryColor = { default={0.8,0.8,0.8,0.8} },
        categoryLineColor = { 1, 1, 1, 0 },
        touchpointColor = { 0.4, 0.4, 0.4 },
    })
    --]]--

    mui.newTextField({
        name = "textfield_demo",
        labelText = "Subject",
        text = "Hello, world!",
        font = native.systemFont,
        width = mui.getScaleVal(400),
        height = mui.getScaleVal(46),
        x = mui.getScaleVal(240),
        y = mui.getScaleVal(400),
        activeColor = { 0, 0, 0, 1 },
        inactiveColor = { 0.5, 0.5, 0.5, 1 },
        callBack = mui.textfieldCallBack
    })

    -- create and animate the intial value (1% is always required due to scaling method)
    mui.newProgressBar({
        name = "progressbar_demo",
        width = mui.getScaleVal(290),
        height = mui.getScaleVal(8),
        x = mui.getScaleVal(650),
        y = mui.getScaleVal(400),
        foregroundColor = { 0, 0.78, 1, 1 },
        backgroundColor = { 0.82, 0.95, 0.98, 0.8 },
        startPercent = 20,
        barType = "determinate",
        iterations = 1,
        labelText = "Determinate progress",
        labelFont = native.systemFont,
        labelFontSize = mui.getScaleVal(24),
        labelColor = {  0.4, 0.4, 0.4, 1 },
        labelAlign = "left",
        callBack = mui.postProgressCallBack,
        --repeatCallBack = <your method here>,
        hideBackdropWhenDone = false
    })

    -- show how to increase progress bar by percent using a timer or method after the above creation
    local function increaseMyProgressBar()
        print("increaseMyProgressBar")
        mui.increaseProgressBar( "progressbar_demo", 80 )
    end
    timer.performWithDelay(3000, increaseMyProgressBar, 1)
    -- increaseMyProgressBar() -- will be queued if already processing an increase

    -- on bottom and stay on top of other widgets.
    local buttonHeight = mui.getScaleVal(70)
    mui.newToolbar({
        name = "toolbar_demo",
        --width = mui.getScaleVal(500), -- defaults to display.contentWidth
        height = mui.getScaleVal(70),
        buttonHeight = buttonHeight,
        x = 0,
        y = (display.contentHeight - (buttonHeight * 0.5)),
        layout = "horizontal",
        labelFont = native.systemFont,
        color = { 0, 0.46, 1 },
        fillColor = { 0, 0.46, 1 },
        labelColor = { 1, 1, 1 },
        labelColorOff = { 0.41, 0.03, 0.49 },
        callBack = mui.actionForToolbarDemo,
        sliderColor = { 1, 1, 1 },
        list = {
            { key = "Home", value = "1", icon="home", labelText="Home", isActive = true },
            { key = "Newsroom", value = "2", icon="new_releases", labelText="News", isActive = false },
            { key = "Location", value = "3", icon="location_searching", labelText="Location", isActive = false },
            { key = "To-do", value = "4", icon="view_list", labelText="To-do", isActive = false },
            -- { key = "Viewer", value = "4", labelText="View", isActive = false } -- uncomment to see View as text
        }
    })

end

-- "scene:show()"
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen)
    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen
        -- Insert code here to make the scene come alive
        -- Example: start timers, begin animation, play audio, etc.

    end
end


-- "scene:hide()"
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen)
        -- Insert code here to "pause" the scene
        -- Example: stop timers, stop animation, stop audio, etc.

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen
    end
end


-- "scene:destroy()"
function scene:destroy( event )

    local sceneGroup = self.view

    -- Called prior to the removal of scene's view
    -- Insert code here to clean up the scene
    -- Example: remove display objects, save state, etc.
    mui.destroy()
    if background ~= nil then
        background:removeSelf()
        background = nil
    end
    sceneGroup:removeSelf()
    sceneGroup = nil

end

-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -------------------------------------------------------------------------------

return scene
