repeat task.wait() until game:IsLoaded()
local library = {}
local ToggleUI = false
library.currentTab = nil
library.flags = {}

local services = setmetatable({}, {
  __index = function(t, k)
    return game.GetService(game, k)
      end)

local mouse = services.Players.LocalPlayer:GetMouse()

function Tween(obj, t, data)
	services.TweenService:Create(obj, TweenInfo.new(t[1], Enum.EasingStyle[t[2]], Enum.EasingDirection[t[3]]), data):Play()
	return true
end

function Ripple(obj)
	spawn(function()
		if obj.ClipsDescendants ~= true then
			obj.ClipsDescendants = true
		end
		local Ripple = Instance.new("ImageLabel")
		Ripple.Name = "Ripple"
		Ripple.Parent = obj
		Ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Ripple.BackgroundTransparency = 1.000
		Ripple.ZIndex = 8
		Ripple.Image = "rbxassetid://2708891598"
		Ripple.ImageTransparency = 0.800
		Ripple.ScaleType = Enum.ScaleType.Fit
		Ripple.ImageColor3 = Color3.fromRGB(255, 255, 255)
		Ripple.Position = UDim2.new((mouse.X - Ripple.AbsolutePosition.X) / obj.AbsoluteSize.X, 0, (mouse.Y - Ripple.AbsolutePosition.Y) / obj.AbsoluteSize.Y, 0)
		Tween(Ripple, {.3, 'Linear', 'InOut'}, {Position = UDim2.new(-5.5, 0, -5.5, 0), Size = UDim2.new(12, 0, 12, 0)})
		wait(0.15)
		Tween(Ripple, {.3, 'Linear', 'InOut'}, {ImageTransparency = 1})
		wait(.3)
		Ripple:Destroy()
	end)
end

local toggled = false

-- # Switch Tabs # --
local switchingTabs = false
function switchTab(new)
  if switchingTabs then return end
  local old = library.currentTab
  if old == nil then
    new[2].Visible = true
    library.currentTab = new
    services.TweenService:Create(new[1], TweenInfo.new(0.1), {ImageTransparency = 0}):Play()
    services.TweenService:Create(new[1].TabText, TweenInfo.new(0.1), {TextTransparency = 0}):Play()
    return
  end
  
  if old[1] == new[1] then return end
  switchingTabs = true
  library.currentTab = new

  services.TweenService:Create(old[1], TweenInfo.new(0.1), {ImageTransparency = 0.2}):Play()
  services.TweenService:Create(new[1], TweenInfo.new(0.1), {ImageTransparency = 0}):Play()
  services.TweenService:Create(old[1].TabText, TweenInfo.new(0.1), {TextTransparency = 0.2}):Play()
  services.TweenService:Create(new[1].TabText, TweenInfo.new(0.1), {TextTransparency = 0}):Play()

  old[2].Visible = false
  new[2].Visible = true
  
  task.wait(0.1)

  switchingTabs = false
end

-- # Drag, Stolen from Kiriot or Wally # --
function drag(frame, hold)
	if not hold then
		hold = frame
	end
	local dragging
	local dragInput
	local dragStart
	local startPos

	local function update(input)
		local delta = input.Position - dragStart
		frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end

	hold.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			dragStart = input.Position
			startPos = frame.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			dragInput = input
		end
	end)

	services.UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end

function library.new(library, name,theme)
    for _, v in next, services.CoreGui:GetChildren() do
        if v.Name == "frosty" then
          v:Destroy()
        end
      end
if theme == 'dark' then
    MainColor = Color3.fromRGB(25, 25, 25)
    Background = Color3.fromRGB(25, 25, 25)
    zyColor= Color3.fromRGB(25, 25, 25)
    beijingColor = Color3.fromRGB(25, 25, 25)
    else
    MainColor = Color3.fromRGB(25, 25, 25)
    Background = Color3.fromRGB(25, 25, 25)
    zyColor= Color3.fromRGB(30, 30, 30)
    beijingColor = Color3.fromRGB(255, 255, 255)
end
      local dogent = Instance.new("ScreenGui")
      local Main = Instance.new("Frame")
      local TabMain = Instance.new("Frame")
      local MainC = Instance.new("UICorner")
      local SB = Instance.new("Frame")
      local SBC = Instance.new("UICorner")
      local Side = Instance.new("Frame")
      local SideG = Instance.new("UIGradient")
      local TabBtns = Instance.new("ScrollingFrame")
      local TabBtnsL = Instance.new("UIListLayout")
      local ScriptTitle = Instance.new("TextLabel")
      local SBG = Instance.new("UIGradient") 
      local ImageButton = Instance.new("ImageButton")
      local UIG=Instance.new("UIGradient")
      local DropShadowHolder = Instance.new("Frame")
      local DropShadow = Instance.new("ImageLabel")
      local UICornerMain = Instance.new("UICorner")
      local UIGradient=Instance.new("UIGradient")
      local UIGradientTitle=Instance.new("UIGradient")
      
      if syn and syn.protect_gui then syn.protect_gui(dogent) end
    
      dogent.Name = "frosty"
      dogent.Parent = services.CoreGui
      
      function UiDestroy()
          dogent:Destroy()
      end
      
          function ToggleUILib()
            if not ToggleUI then
                dogent.Enabled = false
                ToggleUI = true
                else
                ToggleUI = false
                dogent.Enabled = true
            end
        end
      
      Main.Name = "Main"
      Main.Parent = dogent
      Main.AnchorPoint = Vector2.new(0.5, 0.5)
      Main.BackgroundColor3 = Background
      Main.BorderColor3 = MainColor
      Main.Position = UDim2.new(0.5, 0, 0.5, 0)
      Main.Size = UDim2.new(0, 572, 0, 353)
      Main.ZIndex = 1
      Main.Active = true
      Main.Draggable = true
      services.UserInputService.InputEnded:Connect(function(input)
      if input.KeyCode == Enum.KeyCode.LeftControl then
      if Main.Visible == true then
      Main.Visible = false else
      Main.Visible = true
      end
      end
      end)
      drag(Main)
      
      UICornerMain.Parent = Main
      UICornerMain.CornerRadius = UDim.new(0,3)
      
      DropShadowHolder.Name = "DropShadowHolder"
      DropShadowHolder.Parent = Main
      DropShadowHolder.BackgroundTransparency = 1.000
      DropShadowHolder.BorderSizePixel = 0
      DropShadowHolder.Size = UDim2.new(1, 0, 1, 0)
      DropShadowHolder.BorderColor3 = Color3.fromRGB(255,255,255)
      DropShadowHolder.ZIndex = 0

      DropShadow.Name = "DropShadow"
      DropShadow.Parent = DropShadowHolder
      DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
      DropShadow.BackgroundTransparency = 1.000
      DropShadow.BorderSizePixel = 0
      DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
      DropShadow.Size = UDim2.new(1, 43, 1, 43)
      DropShadow.ZIndex = 0
      DropShadow.Image = "rbxassetid://6015897843"
      DropShadow.ImageColor3 = Color3.fromRGB(255,255,255)
      DropShadow.ImageTransparency = 0.500
      DropShadow.ScaleType = Enum.ScaleType.Slice
      DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)


      UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(0.10, Color3.fromRGB(255, 127, 0)), ColorSequenceKeypoint.new(0.20, Color3.fromRGB(255, 255, 0)), ColorSequenceKeypoint.new(0.30, Color3.fromRGB(0, 255, 0)), ColorSequenceKeypoint.new(0.40, Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(0.60, Color3.fromRGB(139, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(0.80, Color3.fromRGB(255, 127, 0)), ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 255, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 255, 0))}
      UIGradient.Parent = DropShadow

      local TweenService = game:GetService("TweenService")
      local tweeninfo = TweenInfo.new(7, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
      local tween = TweenService:Create(UIGradient, tweeninfo, {Rotation = 360})
      tween:Play()

          function toggleui()
            toggled = not toggled
            spawn(function()
                if toggled then wait(0.3) end
            end)
            Tween(Main, {0.3, 'Sine', 'InOut'}, {
                Size = UDim2.new(0, 609, 0, (toggled and 505 or 0))
            })
        end
      
      TabMain.Name = "TabMain"
      TabMain.Parent = Main
      TabMain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      TabMain.BackgroundTransparency = 1.000
      TabMain.Position = UDim2.new(0.217000037, 0, 0, 3)
      TabMain.Size = UDim2.new(0, 448, 0, 353)
      
      MainC.CornerRadius = UDim.new(0, 5.5)
      MainC.Name = "MainC"
      MainC.Parent = Frame
      
      SB.Name = "SB"
      SB.Parent = Main
      SB.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      SB.BorderColor3 = MainColor
      SB.Size = UDim2.new(0, 8, 0, 353)
      
      SBC.CornerRadius = UDim.new(0, 6)
      SBC.Name = "SBC"
      SBC.Parent = SB
      
      Side.Name = "Side"
      Side.Parent = SB
      Side.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      Side.BorderColor3 = Color3.fromRGB(255, 255, 255)
      Side.BorderSizePixel = 0
      Side.ClipsDescendants = true
      Side.Position = UDim2.new(1, 0, 0, 0)
      Side.Size = UDim2.new(0, 110, 0, 353)
      
      SideG.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, zyColor), ColorSequenceKeypoint.new(1.00, zyColor)}
      SideG.Rotation = 90
      SideG.Name = "SideG"
      SideG.Parent = Side
      
      TabBtns.Name = "TabBtns"
      TabBtns.Parent = Side
      TabBtns.Active = true
      TabBtns.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      TabBtns.BackgroundTransparency = 1.000
      TabBtns.BorderSizePixel = 0
      TabBtns.Position = UDim2.new(0, 0, 0.0973535776, 0)
      TabBtns.Size = UDim2.new(0, 110, 0, 318)
      TabBtns.CanvasSize = UDim2.new(0, 0, 1, 0)
      TabBtns.ScrollBarThickness = 0
      
      TabBtnsL.Name = "TabBtnsL"
      TabBtnsL.Parent = TabBtns
      TabBtnsL.SortOrder = Enum.SortOrder.LayoutOrder
      TabBtnsL.Padding = UDim.new(0, 12)
      
      ScriptTitle.Name = "ScriptTitle"
      ScriptTitle.Parent = Side
      ScriptTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      ScriptTitle.BackgroundTransparency = 1.000
      ScriptTitle.Position = UDim2.new(0, 0, 0.00953488424, 0)
      ScriptTitle.Size = UDim2.new(0, 102, 0, 20)
      ScriptTitle.Font = Enum.Font.GothamSemibold
      ScriptTitle.Text = name
      ScriptTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
      ScriptTitle.TextSize = 14.000
      ScriptTitle.TextScaled = true
      ScriptTitle.TextXAlignment = Enum.TextXAlignment.Left
      
      UIGradientTitle.Parent = ScriptTitle
     
      local function NPLHKB_fake_script() 
        local script = Instance.new('LocalScript', ScriptTitle)
     
        local button = script.Parent
        local gradient = button.UIGradient
        local ts = game:GetService("TweenService")
        local ti = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
        local offset = {Offset = Vector2.new(1, 0)}
        local create = ts:Create(gradient, ti, offset)
        local startingPos = Vector2.new(-1, 0)
        local list = {} 
        local s, kpt = ColorSequence.new, ColorSequenceKeypoint.new
        local counter = 0
        local status = "down" 
        gradient.Offset = startingPos
        local function rainbowColors()
            local sat, val = 255, 255 
            for i = 1, 10 do 
                local hue = i * 17 
                table.insert(list, Color3.fromHSV(hue / 255, sat / 255, val / 255))
            end
        end
        rainbowColors()
        gradient.Color = s({
            kpt(0, list[#list]),
            kpt(0.5, list[#list - 1]),
            kpt(1, list[#list - 2])
        })
        counter = #list
        local function animate()
            create:Play()
            create.Completed:Wait() 
            gradient.Offset = startingPos 
            gradient.Rotation = 180
            if counter == #list - 1 and status == "down" then
                gradient.Color = s({
                    kpt(0, gradient.Color.Keypoints[1].Value),
                    kpt(0.5, list[#list]), 
                    kpt(1, list[1]) 
                })
                counter = 1
                status = "up" 
            elseif counter == #list and status == "down" then 
                gradient.Color = s({
                    kpt(0, gradient.Color.Keypoints[1].Value),
                    kpt(0.5, list[1]),
                    kpt(1, list[2])
                })
                counter = 2
                status = "up"
            elseif counter <= #list - 2 and status == "down" then 
                gradient.Color = s({
                    kpt(0, gradient.Color.Keypoints[1].Value),
                    kpt(0.5, list[counter + 1]), 
                    kpt(1, list[counter + 2])
                })
                counter = counter + 2
                status = "up"
            end
            create:Play()
            create.Completed:Wait()
            gradient.Offset = startingPos
            gradient.Rotation = 0 
            if counter == #list - 1 and status == "up" then
                gradient.Color = s({ 
     
                    kpt(0, list[1]), 
                    kpt(0.5, list[#list]), 
                    kpt(1, gradient.Color.Keypoints[3].Value)
                })
                counter = 1
                status = "down"
            elseif counter == #list and status == "up" then
                gradient.Color = s({
                    kpt(0, list[2]),
                    kpt(0.5, list[1]), 
                    kpt(1, gradient.Color.Keypoints[3].Value)
                })
                counter = 2
                status = "down"
            elseif counter <= #list - 2 and status == "up" then
                gradient.Color = s({
                    kpt(0, list[counter + 2]), 
                    kpt(0.5, list[counter + 1]), 
                    kpt(1, gradient.Color.Keypoints[3].Value) 	
                })
                counter = counter + 2
                status = "down"
            end
            animate()
        end
        animate()
     
    end
    coroutine.wrap(NPLHKB_fake_script)()
      
      SBG.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, zyColor), ColorSequenceKeypoint.new(1.00, zyColor)}
      SBG.Rotation = 90
      SBG.Name = "SBG"
      SBG.Parent = SB
    
      TabBtnsL:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        TabBtns.CanvasSize = UDim2.new(0, 0, 0, TabBtnsL.AbsoluteContentSize.Y + 18)
      end)
      ImageButton.Parent = dogent
      ImageButton.BackgroundColor3 = Color3.new(1, 1, 1)
      ImageButton.BorderSizePixel = 0
      ImageButton.Position = UDim2.new(0.00829315186, 0, 0.31107837, 0)
      ImageButton.Size = UDim2.new(0, 32, 0, 32)
      ImageButton.Image = "rbxassetid://14654173453"
      ImageButton.Draggable = true
      ImageButton.MouseButton1Down:connect(function()
      Main.Visible = not Main.Visible
      end)
      UIG.Parent = ImageButton
      local window = {}
      function window.Tab(window, name, icon)
        local Tab = Instance.new("ScrollingFrame")
        local TabIco = Instance.new("ImageLabel")
        local TabText = Instance.new("TextLabel")
        local TabBtn = Instance.new("TextButton")
        local TabL = Instance.new("UIListLayout")
    
        Tab.Name = "Tab"
        Tab.Parent = TabMain
        Tab.Active = true
        Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Tab.BackgroundTransparency = 1.000
        Tab.Size = UDim2.new(1, 0, 1, 0)
        Tab.ScrollBarThickness = 2
        Tab.Visible = false
        
        TabIco.Name = "TabIco"
        TabIco.Parent = TabBtns
        TabIco.BackgroundTransparency = 1.000
        TabIco.BorderSizePixel = 0
        TabIco.Size = UDim2.new(0, 24, 0, 24)
        TabIco.Image = ("rbxassetid://%s"):format((icon or 4370341699))
        TabIco.ImageTransparency = 0.2
        
        TabText.Name = "TabText"
        TabText.Parent = TabIco
        TabText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabText.BackgroundTransparency = 1.000
        TabText.Position = UDim2.new(1.41666663, 0, 0, 0)
        TabText.Size = UDim2.new(0, 76, 0, 24)
        TabText.Font = Enum.Font.GothamSemibold
        TabText.Text = name
        TabText.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabText.TextSize = 14.000
        TabText.TextXAlignment = Enum.TextXAlignment.Left
        TabText.TextTransparency = 0.2
        
        TabBtn.Name = "TabBtn"
        TabBtn.Parent = TabIco
        TabBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabBtn.BackgroundTransparency = 1.000
        TabBtn.BorderSizePixel = 0
        TabBtn.Size = UDim2.new(0, 110, 0, 24)
        TabBtn.AutoButtonColor = false
        TabBtn.Font = Enum.Font.SourceSans
        TabBtn.Text = ""
        TabBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
        TabBtn.TextSize = 14.000
        
        TabL.Name = "TabL"
        TabL.Parent = Tab
        TabL.SortOrder = Enum.SortOrder.LayoutOrder
        TabL.Padding = UDim.new(0, 4)  
    
        TabBtn.MouseButton1Click:Connect(function()
            spawn(function()
                Ripple(TabBtn)
            end)
          switchTab({TabIco, Tab})
        end)
    
        if library.currentTab == nil then switchTab({TabIco, Tab}) end
    
        TabL:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
          Tab.CanvasSize = UDim2.new(0, 0, 0, TabL.AbsoluteContentSize.Y + 8)
        end)
    
        local tab = {}
        function tab.section(tab, name, TabVal)
          local Section = Instance.new("Frame")
          local SectionC = Instance.new("UICorner")
          local SectionText = Instance.new("TextLabel")
          local SectionOpen = Instance.new("ImageLabel")
          local SectionOpened = Instance.new("ImageLabel")
          local SectionToggle = Instance.new("ImageButton")
          local Objs = Instance.new("Frame")
          local ObjsL = Instance.new("UIListLayout")
    
          Section.Name = "Section"
          Section.Parent = Tab
          Section.BackgroundColor3 = zyColor
          Section.BackgroundTransparency = 1.000
          Section.BorderSizePixel = 0
          Section.ClipsDescendants = true
          Section.Size = UDim2.new(0.981000006, 0, 0, 36)
          
          SectionC.CornerRadius = UDim.new(0, 6)
          SectionC.Name = "SectionC"
          SectionC.Parent = Section
          
          SectionText.Name = "SectionText"
          SectionText.Parent = Section
          SectionText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
          SectionText.BackgroundTransparency = 1.000
          SectionText.Position = UDim2.new(0.0887396261, 0, 0, 0)
          SectionText.Size = UDim2.new(0, 401, 0, 36)
          SectionText.Font = Enum.Font.GothamSemibold
          SectionText.Text = name
          SectionText.TextColor3 = Color3.fromRGB(255, 255, 255)
          SectionText.TextSize = 16.000
          SectionText.TextXAlignment = Enum.TextXAlignment.Left
          
          SectionOpen.Name = "SectionOpen"
          SectionOpen.Parent = SectionText
          SectionOpen.BackgroundTransparency = 1
          SectionOpen.BorderSizePixel = 0
          SectionOpen.Position = UDim2.new(0, -33, 0, 5)
          SectionOpen.Size = UDim2.new(0, 26, 0, 26)
          SectionOpen.Image = "http://www.roblox.com/asset/?id=6031302934"
          
          SectionOpened.Name = "SectionOpened"
          SectionOpened.Parent = SectionOpen
          SectionOpened.BackgroundTransparency = 1.000
          SectionOpened.BorderSizePixel = 0
          SectionOpened.Size = UDim2.new(0, 26, 0, 26)
          SectionOpened.Image = "http://www.roblox.com/asset/?id=6031302932"
          SectionOpened.ImageTransparency = 1.000
    
          SectionToggle.Name = "SectionToggle"
          SectionToggle.Parent = SectionOpen
          SectionToggle.BackgroundTransparency = 1
          SectionToggle.BorderSizePixel = 0
          SectionToggle.Size = UDim2.new(0, 26, 0, 26)
          
          Objs.Name = "Objs"
          Objs.Parent = Section
          Objs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
          Objs.BackgroundTransparency = 1
          Objs.BorderSizePixel = 0
          Objs.Position = UDim2.new(0, 6, 0, 36)
          Objs.Size = UDim2.new(0.986347735, 0, 0, 0)
    
          ObjsL.Name = "ObjsL"
          ObjsL.Parent = Objs
          ObjsL.SortOrder = Enum.SortOrder.LayoutOrder
          ObjsL.Padding = UDim.new(0, 8) 
          
          local open = TabVal
          if TabVal ~= false then
            Section.Size = UDim2.new(0.981000006, 0, 0, open and 36 + ObjsL.AbsoluteContentSize.Y + 8 or 36)
            SectionOpened.ImageTransparency = (open and 0 or 1)
            SectionOpen.ImageTransparency = (open and 1 or 0)
          end
          
          SectionToggle.MouseButton1Click:Connect(function()
            open = not open
            Section.Size = UDim2.new(0.981000006, 0, 0, open and 36 + ObjsL.AbsoluteContentSize.Y + 8 or 36)
            SectionOpened.ImageTransparency = (open and 0 or 1)
            SectionOpen.ImageTransparency = (open and 1 or 0)
          end)
    
          ObjsL:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            if not open then return end
            Section.Size = UDim2.new(0.981000006, 0, 0, 36 + ObjsL.AbsoluteContentSize.Y + 8)
          end)
    
          local section = {}
          function section.Button(section, text, callback)
            local callback = callback or function() end
    
            local BtnModule = Instance.new("Frame")
            local Btn = Instance.new("TextButton")
            local BtnC = Instance.new("UICorner")    
            
            BtnModule.Name = "BtnModule"
            BtnModule.Parent = Objs
            BtnModule.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            BtnModule.BackgroundTransparency = 1.000
            BtnModule.BorderSizePixel = 0
            BtnModule.Position = UDim2.new(0, 0, 0, 0)
            BtnModule.Size = UDim2.new(0, 428, 0, 38)
            
            Btn.Name = "Btn"
            Btn.Parent = BtnModule
            Btn.BackgroundColor3 = zyColor
            Btn.BorderSizePixel = 0
            Btn.Size = UDim2.new(0, 428, 0, 38)
            Btn.AutoButtonColor = false
            Btn.Font = Enum.Font.GothamSemibold
            Btn.Text = "   " .. text
            Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
            Btn.TextSize = 16.000
            Btn.TextXAlignment = Enum.TextXAlignment.Left
            
            BtnC.CornerRadius = UDim.new(0, 6)
            BtnC.Name = "BtnC"
            BtnC.Parent = Btn
    
            Btn.MouseButton1Click:Connect(function()
                spawn(function()
                    Ripple(Btn)
                end)
                    spawn(callback)
                end)
            end
    
        function section:Label(text)
          local LabelModule = Instance.new("Frame")
          local TextLabel = Instance.new("TextLabel")
          local LabelC = Instance.new("UICorner")
          
          LabelModule.Name = "LabelModule"
          LabelModule.Parent = Objs
          LabelModule.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
          LabelModule.BackgroundTransparency = 1.000
          LabelModule.BorderSizePixel = 0
          LabelModule.Position = UDim2.new(0, 0, NAN, 0)
          LabelModule.Size = UDim2.new(0, 428, 0, 19)
    
          TextLabel.Parent = LabelModule
          TextLabel.BackgroundColor3 = zyColor
          TextLabel.Size = UDim2.new(0, 428, 0, 22)
          TextLabel.Font = Enum.Font.GothamSemibold
          TextLabel.Text = text
          TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
          TextLabel.TextSize = 14.000
    
          LabelC.CornerRadius = UDim.new(0, 6)
          LabelC.Name = "LabelC"
          LabelC.Parent = TextLabel
          return TextLabel
        end
    
          function section.Toggle(section, text, flag, enabled, callback)
            local callback = callback or function() end
            local enabled = enabled or false
            assert(text, "No text provided")
            assert(flag, "No flag provided")
    
            library.flags[flag] = enabled
    
            local ToggleModule = Instance.new("Frame")
            local ToggleBtn = Instance.new("TextButton")
            local ToggleBtnC = Instance.new("UICorner")
            local ToggleDisable = Instance.new("Frame")
            local ToggleSwitch = Instance.new("Frame")
            local ToggleSwitchC = Instance.new("UICorner")
            local ToggleDisableC = Instance.new("UICorner")
            
            ToggleModule.Name = "ToggleModule"
            ToggleModule.Parent = Objs
            ToggleModule.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleModule.BackgroundTransparency = 1.000
            ToggleModule.BorderSizePixel = 0
            ToggleModule.Position = UDim2.new(0, 0, 0, 0)
            ToggleModule.Size = UDim2.new(0, 428, 0, 38)
            
            ToggleBtn.Name = "ToggleBtn"
            ToggleBtn.Parent = ToggleModule
            ToggleBtn.BackgroundColor3 = zyColor
            ToggleBtn.BorderSizePixel = 0
            ToggleBtn.Size = UDim2.new(0, 428, 0, 38)
            ToggleBtn.AutoButtonColor = false
            ToggleBtn.Font = Enum.Font.GothamSemibold
            ToggleBtn.Text = "   " .. text
            ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            ToggleBtn.TextSize = 16.000
            ToggleBtn.TextXAlignment = Enum.TextXAlignment.Left
            
            ToggleBtnC.CornerRadius = UDim.new(0, 6)
            ToggleBtnC.Name = "ToggleBtnC"
            ToggleBtnC.Parent = ToggleBtn
            
            ToggleDisable.Name = "ToggleDisable"
            ToggleDisable.Parent = ToggleBtn
            ToggleDisable.BackgroundColor3 = Background
            ToggleDisable.BorderSizePixel = 0
            ToggleDisable.Position = UDim2.new(0.901869178, 0, 0.208881587, 0)
            ToggleDisable.Size = UDim2.new(0, 36, 0, 22)
            
            ToggleSwitch.Name = "ToggleSwitch"
            ToggleSwitch.Parent = ToggleDisable
            ToggleSwitch.BackgroundColor3 = beijingColor
            ToggleSwitch.Size = UDim2.new(0, 24, 0, 22)
            
            ToggleSwitchC.CornerRadius = UDim.new(0, 6)
            ToggleSwitchC.Name = "ToggleSwitchC"
            ToggleSwitchC.Parent = ToggleSwitch
            
            ToggleDisableC.CornerRadius = UDim.new(0, 6)
            ToggleDisableC.Name = "ToggleDisableC"
            ToggleDisableC.Parent = ToggleDisable        
    
            local funcs = {
              SetState = function(self, state)
                if state == nil then state = not library.flags[flag] end
                if library.flags[flag] == state then return end
                services.TweenService:Create(ToggleSwitch, TweenInfo.new(0.2), {Position = UDim2.new(0, (state and ToggleSwitch.Size.X.Offset / 2 or 0), 0, 0), BackgroundColor3 = (state and Color3.fromRGB(255, 255, 255) or beijingColor)}):Play()
                library.flags[flag] = state
                callback(state)
              end,
              Module = ToggleModule
            }
            
            if enabled ~= false then
                funcs:SetState(flag,true)
            end
    
            ToggleBtn.MouseButton1Click:Connect(function()
              funcs:SetState()
            end)
            return funcs
          end
    
          function section.Keybind(section, text, i, callback)
            local callback = callback or function() end
            assert(text, "No text provided")
            assert(i, "No i key provided")
    
            local i = (typeof(i) == "string" and Enum.KeyCode[i] or i)
            local banned = {
              Return = true;
              Space = true;
              Tab = true;
              Backquote = true;
              CapsLock = true;
              Escape = true;
              Unknown = true;
            }
            local shortNames = {
              RightControl = 'Right Ctrl',
              LeftControl = 'Left Ctrl',
              LeftShift = 'Left Shift',
              RightShift = 'Right Shift',
              Semicolon = ";",
              Quote = '"',
              LeftBracket = '[',
              RightBracket = ']',
              Equals = '=',
              Minus = '-',
              RightAlt = 'Right Alt',
              LeftAlt = 'Left Alt'
            }
    
            local bindKey = i
            local keyTxt = (i and (shortNames[i.Name] or i.Name) or "None")
    
            local KeybindModule = Instance.new("Frame")
            local KeybindBtn = Instance.new("TextButton")
            local KeybindBtnC = Instance.new("UICorner")
            local KeybindValue = Instance.new("TextButton")
            local KeybindValueC = Instance.new("UICorner")
            local KeybindL = Instance.new("UIListLayout")
            local UIPadding = Instance.new("UIPadding")
    
            KeybindModule.Name = "KeybindModule"
            KeybindModule.Parent = Objs
            KeybindModule.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            KeybindModule.BackgroundTransparency = 1.000
            KeybindModule.BorderSizePixel = 0
            KeybindModule.Position = UDim2.new(0, 0, 0, 0)
            KeybindModule.Size = UDim2.new(0, 428, 0, 38)
            
            KeybindBtn.Name = "KeybindBtn"
            KeybindBtn.Parent = KeybindModule
            KeybindBtn.BackgroundColor3 = zyColor
            KeybindBtn.BorderSizePixel = 0
            KeybindBtn.Size = UDim2.new(0, 428, 0, 38)
            KeybindBtn.AutoButtonColor = false
            KeybindBtn.Font = Enum.Font.GothamSemibold
            KeybindBtn.Text = "   " .. text
            KeybindBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            KeybindBtn.TextSize = 16.000
            KeybindBtn.TextXAlignment = Enum.TextXAlignment.Left
            
            KeybindBtnC.CornerRadius = UDim.new(0, 6)
            KeybindBtnC.Name = "KeybindBtnC"
            KeybindBtnC.Parent = KeybindBtn
            
            KeybindValue.Name = "KeybindValue"
            KeybindValue.Parent = KeybindBtn
            KeybindValue.BackgroundColor3 = Background
            KeybindValue.BorderSizePixel = 0
            KeybindValue.Position = UDim2.new(0.763033211, 0, 0.289473683, 0)
            KeybindValue.Size = UDim2.new(0, 100, 0, 28)
            KeybindValue.AutoButtonColor = false
            KeybindValue.Font = Enum.Font.Gotham
            KeybindValue.Text = keyTxt
            KeybindValue.TextColor3 = Color3.fromRGB(255, 255, 255)
            KeybindValue.TextSize = 14.000
            
            KeybindValueC.CornerRadius = UDim.new(0, 6)
            KeybindValueC.Name = "KeybindValueC"
            KeybindValueC.Parent = KeybindValue
            
            KeybindL.Name = "KeybindL"
            KeybindL.Parent = KeybindBtn
            KeybindL.HorizontalAlignment = Enum.HorizontalAlignment.Right
            KeybindL.SortOrder = Enum.SortOrder.LayoutOrder
            KeybindL.VerticalAlignment = Enum.VerticalAlignment.Center
            
            UIPadding.Parent = KeybindBtn
            UIPadding.PaddingRight = UDim.new(0, 6)   
            
            services.UserInputService.InputBegan:Connect(function(inp, gpe)
              if gpe then return end
              if inp.UserInputType ~= Enum.UserInputType.Keyboard then return end
              if inp.KeyCode ~= bindKey then return end
              callback(bindKey.Name)
            end)
            
            KeybindValue.MouseButton1Click:Connect(function()
              KeybindValue.Text = "..."
              wait()
              local key, uwu = services.UserInputService.InputEnded:Wait()
              local keyName = tostring(key.KeyCode.Name)
              if key.UserInputType ~= Enum.UserInputType.Keyboard then
                KeybindValue.Text = keyTxt
                return
              end
              if banned[keyName] then
                KeybindValue.Text = keyTxt
                return
              end
              wait()
              bindKey = Enum.KeyCode[keyName]
              KeybindValue.Text = shortNames[keyName] or keyName
            end)
    
            KeybindValue:GetPropertyChangedSignal("TextBounds"):Connect(function()
              KeybindValue.Size = UDim2.new(0, KeybindValue.TextBounds.X + 30, 0, 28)
            end)
            KeybindValue.Size = UDim2.new(0, KeybindValue.TextBounds.X + 30, 0, 28)
          end
    
          function section.Textbox(section, text, flag, i, callback)
            local callback = callback or function() end
            assert(text, "No text provided")
            assert(flag, "No flag provided")
            assert(i, "No i text provided")
    
            library.flags[flag] = i
    
            local TextboxModule = Instance.new("Frame")
            local TextboxBack = Instance.new("TextButton")
            local TextboxBackC = Instance.new("UICorner")
            local BoxBG = Instance.new("TextButton")
            local BoxBGC = Instance.new("UICorner")
            local TextBox = Instance.new("TextBox")
            local TextboxBackL = Instance.new("UIListLayout")
            local TextboxBackP = Instance.new("UIPadding")  
    
            TextboxModule.Name = "TextboxModule"
            TextboxModule.Parent = Objs
            TextboxModule.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextboxModule.BackgroundTransparency = 1.000
            TextboxModule.BorderSizePixel = 0
            TextboxModule.Position = UDim2.new(0, 0, 0, 0)
            TextboxModule.Size = UDim2.new(0, 428, 0, 38)
            
            TextboxBack.Name = "TextboxBack"
            TextboxBack.Parent = TextboxModule
            TextboxBack.BackgroundColor3 = zyColor
            TextboxBack.BorderSizePixel = 0
            TextboxBack.Size = UDim2.new(0, 428, 0, 38)
            TextboxBack.AutoButtonColor = false
            TextboxBack.Font = Enum.Font.GothamSemibold
            TextboxBack.Text = "   " .. text
            TextboxBack.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextboxBack.TextSize = 16.000
            TextboxBack.TextXAlignment = Enum.TextXAlignment.Left
            
            TextboxBackC.CornerRadius = UDim.new(0, 6)
            TextboxBackC.Name = "TextboxBackC"
            TextboxBackC.Parent = TextboxBack
            
            BoxBG.Name = "BoxBG"
            BoxBG.Parent = TextboxBack
            BoxBG.BackgroundColor3 = Background
            BoxBG.BorderSizePixel = 0
            BoxBG.Position = UDim2.new(0.763033211, 0, 0.289473683, 0)
            BoxBG.Size = UDim2.new(0, 100, 0, 28)
            BoxBG.AutoButtonColor = false
            BoxBG.Font = Enum.Font.Gotham
            BoxBG.Text = ""
            BoxBG.TextColor3 = Color3.fromRGB(255, 255, 255)
            BoxBG.TextSize = 14.000
            
            BoxBGC.CornerRadius = UDim.new(0, 6)
            BoxBGC.Name = "BoxBGC"
            BoxBGC.Parent = BoxBG
            
            TextBox.Parent = BoxBG
            TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextBox.BackgroundTransparency = 1.000
            TextBox.BorderSizePixel = 0
            TextBox.Size = UDim2.new(1, 0, 1, 0)
            TextBox.Font = Enum.Font.Gotham
            TextBox.Text = i
            TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextBox.TextSize = 14.000
            
            TextboxBackL.Name = "TextboxBackL"
            TextboxBackL.Parent = TextboxBack
            TextboxBackL.HorizontalAlignment = Enum.HorizontalAlignment.Right
            TextboxBackL.SortOrder = Enum.SortOrder.LayoutOrder
            TextboxBackL.VerticalAlignment = Enum.VerticalAlignment.Center
            
            TextboxBackP.Name = "TextboxBackP"
            TextboxBackP.Parent = TextboxBack
            TextboxBackP.PaddingRight = UDim.new(0, 6)
    
            TextBox.FocusLost:Connect(function()
              if TextBox.Text == "" then
                TextBox.Text = i
              end
              library.flags[flag] = TextBox.Text
              callback(TextBox.Text)
            end)
    
            TextBox:GetPropertyChangedSignal("TextBounds"):Connect(function()
              BoxBG.Size = UDim2.new(0, TextBox.TextBounds.X + 30, 0, 28)
            end)
            BoxBG.Size = UDim2.new(0, TextBox.TextBounds.X + 30, 0, 28)
          end
    
          function section.Slider(section, text, flag, i, min, max, precise, callback)
            local callback = callback or function() end
            local min = min or 1
            local max = max or 10
            local i = i or min
            local precise = precise or false
    
            library.flags[flag] = i
    
            assert(text, "No text provided")
            assert(flag, "No flag provided")
            assert(i, "No i value provided")
            
            local SliderModule = Instance.new("Frame")
            local SliderBack = Instance.new("TextButton")
            local SliderBackC = Instance.new("UICorner")
            local SliderBar = Instance.new("Frame")
            local SliderBarC = Instance.new("UICorner")
            local SliderPart = Instance.new("Frame")
            local SliderPartC = Instance.new("UICorner")
            local SliderValBG = Instance.new("TextButton")
            local SliderValBGC = Instance.new("UICorner")
            local SliderValue = Instance.new("TextBox")
            local MinSlider = Instance.new("TextButton")
            local AddSlider = Instance.new("TextButton")   
            
            SliderModule.Name = "SliderModule"
            SliderModule.Parent = Objs
            SliderModule.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SliderModule.BackgroundTransparency = 1.000
            SliderModule.BorderSizePixel = 0
            SliderModule.Position = UDim2.new(0, 0, 0, 0)
            SliderModule.Size = UDim2.new(0, 428, 0, 38)
            
            SliderBack.Name = "SliderBack"
            SliderBack.Parent = SliderModule
            SliderBack.BackgroundColor3 = zyColor
            SliderBack.BorderSizePixel = 0
            SliderBack.Size = UDim2.new(0, 428, 0, 38)
            SliderBack.AutoButtonColor = false
            SliderBack.Font = Enum.Font.GothamSemibold
            SliderBack.Text = "   " .. text
            SliderBack.TextColor3 = Color3.fromRGB(255, 255, 255)
            SliderBack.TextSize = 16.000
            SliderBack.TextXAlignment = Enum.TextXAlignment.Left
            
            SliderBackC.CornerRadius = UDim.new(0, 6)
            SliderBackC.Name = "SliderBackC"
            SliderBackC.Parent = SliderBack
            
            SliderBar.Name = "SliderBar"
            SliderBar.Parent = SliderBack
            SliderBar.AnchorPoint = Vector2.new(0, 0.5)
            SliderBar.BackgroundColor3 = Background
            SliderBar.BorderSizePixel = 0
            SliderBar.Position = UDim2.new(0.369000018, 40, 0.5, 0)
            SliderBar.Size = UDim2.new(0, 140, 0, 12)
            
            SliderBarC.CornerRadius = UDim.new(0, 4)
            SliderBarC.Name = "SliderBarC"
            SliderBarC.Parent = SliderBar
            
            SliderPart.Name = "SliderPart"
            SliderPart.Parent = SliderBar
            SliderPart.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SliderPart.BorderSizePixel = 0
            SliderPart.Size = UDim2.new(0, 54, 0, 13)
            
            SliderPartC.CornerRadius = UDim.new(0, 4)
            SliderPartC.Name = "SliderPartC"
            SliderPartC.Parent = SliderPart
            
            SliderValBG.Name = "SliderValBG"
            SliderValBG.Parent = SliderBack
            SliderValBG.BackgroundColor3 = Background
            SliderValBG.BorderSizePixel = 0
            SliderValBG.Position = UDim2.new(0.883177578, 0, 0.131578952, 0)
            SliderValBG.Size = UDim2.new(0, 44, 0, 28)
            SliderValBG.AutoButtonColor = false
            SliderValBG.Font = Enum.Font.Gotham
            SliderValBG.Text = ""
            SliderValBG.TextColor3 = Color3.fromRGB(255, 255, 255)
            SliderValBG.TextSize = 14.000
            
            SliderValBGC.CornerRadius = UDim.new(0, 6)
            SliderValBGC.Name = "SliderValBGC"
            SliderValBGC.Parent = SliderValBG
            
            SliderValue.Name = "SliderValue"
            SliderValue.Parent = SliderValBG
            SliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SliderValue.BackgroundTransparency = 1.000
            SliderValue.BorderSizePixel = 0
            SliderValue.Size = UDim2.new(1, 0, 1, 0)
            SliderValue.Font = Enum.Font.Gotham
            SliderValue.Text = "1000"
            SliderValue.TextColor3 = Color3.fromRGB(255, 255, 255)
            SliderValue.TextSize = 14.000
            
            MinSlider.Name = "MinSlider"
            MinSlider.Parent = SliderModule
            MinSlider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            MinSlider.BackgroundTransparency = 1.000
            MinSlider.BorderSizePixel = 0
            MinSlider.Position = UDim2.new(0.296728969, 40, 0.236842096, 0)
            MinSlider.Size = UDim2.new(0, 20, 0, 20)
            MinSlider.Font = Enum.Font.Gotham
            MinSlider.Text = "-"
            MinSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
            MinSlider.TextSize = 24.000
            MinSlider.TextWrapped = true
            
            AddSlider.Name = "AddSlider"
            AddSlider.Parent = SliderModule
            AddSlider.AnchorPoint = Vector2.new(0, 0.5)
            AddSlider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            AddSlider.BackgroundTransparency = 1.000
            AddSlider.BorderSizePixel = 0
            AddSlider.Position = UDim2.new(0.810906529, 0, 0.5, 0)
            AddSlider.Size = UDim2.new(0, 20, 0, 20)
            AddSlider.Font = Enum.Font.Gotham
            AddSlider.Text = "+"
            AddSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
            AddSlider.TextSize = 24.000
            AddSlider.TextWrapped = true
            
            local funcs = {
              SetValue = function(self, value)
                local percent = (mouse.X - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X
                if value then
                  percent = (value - min) / (max - min)
                end
                percent = math.clamp(percent, 0, 1)
                if precise then
                  value = value or tonumber(string.format("%.1f", tostring(min + (max - min) * percent)))
                else
                  value = value or math.floor(min + (max - min) * percent)
                end
                library.flags[flag] = tonumber(value)
                SliderValue.Text = tostring(value)
                SliderPart.Size = UDim2.new(percent, 0, 1, 0)
                callback(tonumber(value))
              end
            }
    
            MinSlider.MouseButton1Click:Connect(function()
              local currentValue = library.flags[flag]
              currentValue = math.clamp(currentValue - 1, min, max)
              funcs:SetValue(currentValue)
            end)
    
            AddSlider.MouseButton1Click:Connect(function()
              local currentValue = library.flags[flag]
              currentValue = math.clamp(currentValue + 1, min, max)
              funcs:SetValue(currentValue)
            end)
            
            funcs:SetValue(i)
    
            local dragging, boxFocused, allowed = false, false, {
              [""] = true,
              ["-"] = true
            }
    
            SliderBar.InputBegan:Connect(function(input)
              if input.UserInputType == Enum.UserInputType.MouseButton1 then
                funcs:SetValue()
                dragging = true
              end
            end)
    
            services.UserInputService.InputEnded:Connect(function(input)
              if dragging and input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = false
              end
            end)
    
            services.UserInputService.InputChanged:Connect(function(input)
              if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                funcs:SetValue()
              end
            end)

            SliderBar.InputBegan:Connect(function(input)
              if input.UserInputType == Enum.UserInputType.Touch then
                funcs:SetValue()
                dragging = true
              end
            end)
    
            services.UserInputService.InputEnded:Connect(function(input)
              if dragging and input.UserInputType == Enum.UserInputType.Touch then
                dragging = false
              end
            end)
    
            services.UserInputService.InputChanged:Connect(function(input)
              if dragging and input.UserInputType == Enum.UserInputType.Touch then
                funcs:SetValue()
              end
            end)
    
            SliderValue.Focused:Connect(function()
              boxFocused = true
            end)
    
            SliderValue.FocusLost:Connect(function()
              boxFocused = false
              if SliderValue.Text == "" then
                funcs:SetValue(i)
              end
            end)
    
            SliderValue:GetPropertyChangedSignal("Text"):Connect(function()
              if not boxFocused then return end
              SliderValue.Text = SliderValue.Text:gsub("%D+", "")
              
              local text = SliderValue.Text
              
              if not tonumber(text) then
                SliderValue.Text = SliderValue.Text:gsub('%D+', '')
              elseif not allowed[text] then
                if tonumber(text) > max then
                  text = max
                  SliderValue.Text = tostring(max)
                end
                funcs:SetValue(tonumber(text))
              end
            end)
    
            return funcs
          end
          function section.Dropdown(section, text, flag, options, callback)
            local callback = callback or function() end
            local options = options or {}
            assert(text, "No text provided")
            assert(flag, "No flag provided")
    
            library.flags[flag] = nil
            
            local DropdownModule = Instance.new("Frame")
            local DropdownTop = Instance.new("TextButton")
            local DropdownTopC = Instance.new("UICorner")
            local DropdownOpen = Instance.new("TextButton")
            local DropdownText = Instance.new("TextBox")
            local DropdownModuleL = Instance.new("UIListLayout")
            local Option = Instance.new("TextButton")
            local OptionC = Instance.new("UICorner")        
    
            DropdownModule.Name = "DropdownModule"
            DropdownModule.Parent = Objs
            DropdownModule.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropdownModule.BackgroundTransparency = 1.000
            DropdownModule.BorderSizePixel = 0
            DropdownModule.ClipsDescendants = true
            DropdownModule.Position = UDim2.new(0, 0, 0, 0)
            DropdownModule.Size = UDim2.new(0, 428, 0, 38)
            
            DropdownTop.Name = "DropdownTop"
            DropdownTop.Parent = DropdownModule
            DropdownTop.BackgroundColor3 = zyColor
            DropdownTop.BorderSizePixel = 0
            DropdownTop.Size = UDim2.new(0, 428, 0, 38)
            DropdownTop.AutoButtonColor = false
            DropdownTop.Font = Enum.Font.GothamSemibold
            DropdownTop.Text = ""
            DropdownTop.TextColor3 = Color3.fromRGB(255, 255, 255)
            DropdownTop.TextSize = 16.000
            DropdownTop.TextXAlignment = Enum.TextXAlignment.Left
            
            DropdownTopC.CornerRadius = UDim.new(0, 6)
            DropdownTopC.Name = "DropdownTopC"
            DropdownTopC.Parent = DropdownTop
            
            DropdownOpen.Name = "DropdownOpen"
            DropdownOpen.Parent = DropdownTop
            DropdownOpen.AnchorPoint = Vector2.new(0, 0.5)
            DropdownOpen.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropdownOpen.BackgroundTransparency = 1.000
            DropdownOpen.BorderSizePixel = 0
            DropdownOpen.Position = UDim2.new(0.918383181, 0, 0.5, 0)
            DropdownOpen.Size = UDim2.new(0, 20, 0, 20)
            DropdownOpen.Font = Enum.Font.Gotham
            DropdownOpen.Text = "+"
            DropdownOpen.TextColor3 = Color3.fromRGB(255, 255, 255)
            DropdownOpen.TextSize = 24.000
            DropdownOpen.TextWrapped = true
            
            DropdownText.Name = "DropdownText"
            DropdownText.Parent = DropdownTop
            DropdownText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropdownText.BackgroundTransparency = 1.000
            DropdownText.BorderSizePixel = 0
            DropdownText.Position = UDim2.new(0.0373831764, 0, 0, 0)
            DropdownText.Size = UDim2.new(0, 184, 0, 38)
            DropdownText.Font = Enum.Font.GothamSemibold
            DropdownText.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
            DropdownText.PlaceholderText = text
            DropdownText.Text = ""
            DropdownText.TextColor3 = Color3.fromRGB(255, 255, 255)
            DropdownText.TextSize = 16.000
            DropdownText.TextXAlignment = Enum.TextXAlignment.Left
            
            DropdownModuleL.Name = "DropdownModuleL"
            DropdownModuleL.Parent = DropdownModule
            DropdownModuleL.SortOrder = Enum.SortOrder.LayoutOrder
            DropdownModuleL.Padding = UDim.new(0, 4)
    
            local setAllVisible = function()
              local options = DropdownModule:GetChildren() 
              for i=1, #options do
                local option = options[i]
                if option:IsA("TextButton") and option.Name:match("Option_") then
                  option.Visible = true
                end
              end
            end
    
            local searchDropdown = function(text)
              local options = DropdownModule:GetChildren()
              for i=1, #options do
                local option = options[i]
                if text == "" then
                  setAllVisible()
                else
                  if option:IsA("TextButton") and option.Name:match("Option_") then
                    if option.Text:lower():match(text:lower()) then
                      option.Visible = true
                    else
                      option.Visible = false
                    end
                  end
                end
              end
            end
    
            local open = false
            local ToggleDropVis = function()
              open = not open
              if open then setAllVisible() end
              DropdownOpen.Text = (open and "-" or "+")
              DropdownModule.Size = UDim2.new(0, 428, 0, (open and DropdownModuleL.AbsoluteContentSize.Y + 4 or 38))
            end
    
            DropdownOpen.MouseButton1Click:Connect(ToggleDropVis)
            DropdownText.Focused:Connect(function()
              if open then return end
              ToggleDropVis()
            end)
    
            DropdownText:GetPropertyChangedSignal("Text"):Connect(function()
              if not open then return end
              searchDropdown(DropdownText.Text)
            end)
    
            DropdownModuleL:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
              if not open then return end
              DropdownModule.Size = UDim2.new(0, 428, 0, (DropdownModuleL.AbsoluteContentSize.Y + 4))
            end)
            
            local funcs = {}
            funcs.AddOption = function(self, option)
              local Option = Instance.new("TextButton")
              local OptionC = Instance.new("UICorner")     
    
              Option.Name = "Option_" .. option
              Option.Parent = DropdownModule
              Option.BackgroundColor3 = zyColor
              Option.BorderSizePixel = 0
              Option.Position = UDim2.new(0, 0, 0.328125, 0)
              Option.Size = UDim2.new(0, 428, 0, 26)
              Option.AutoButtonColor = false
              Option.Font = Enum.Font.Gotham
              Option.Text = option
              Option.TextColor3 = Color3.fromRGB(255, 255, 255)
              Option.TextSize = 14.000
              
              OptionC.CornerRadius = UDim.new(0, 6)
              OptionC.Name = "OptionC"
              OptionC.Parent = Option
    
              Option.MouseButton1Click:Connect(function()
                ToggleDropVis()
                callback(Option.Text)
                DropdownText.Text = Option.Text
                library.flags[flag] = Option.Text
              end)
            end
    
            funcs.RemoveOption = function(self, option)
              local option = DropdownModule:FindFirstChild("Option_" .. option)
              if option then option:Destroy() end
            end
    
            funcs.SetOptions = function(self, options)
              for _, v in next, DropdownModule:GetChildren() do
                if v.Name:match("Option_") then
                  v:Destroy()
                end
              end
              for _,v in next, options do
                funcs:AddOption(v)
              end
            end
    
            funcs:SetOptions(options)
    
            return funcs
          end
          return section
        end
        return tab
      end
      return window
    end
    
local window = library:new("苗脚本（其它UI界面）")

local creds = window:Tab("信息",'6035145364')

local bin = creds:section("信息",true)

    bin:Label("你的用户名："..game.Players.LocalPlayer.Character.Humanoid.Name)
    bin:Label("你的注入器:"..identifyexecutor())

local creds = window:Tab("主要",'6035145364')

local bin = creds:section("信息",true)

    bin:Label（"空白的光荣事迹2:群主拉屎呢，不回我消息，我真的生气了"）
    bin:Label（"空白的光荣事迹1:快点给我录，不然操死你@忍脚本作者"）
    bin:Label("牛魔的")
    bin:Label("作者淼")
    bin:Label("帮助者:核作者，忍作者，叶作者，空白，旭，实际上只有前两个帮助了我😅（划掉）👍")
    bin:Label("你的用户名:"..game.Players.LocalPlayer.Character.Humanoid.Name)
    bin:Label("你的注入器:"..identifyexecutor())

local credits = creds:section("UI设置",true)

    credits:Button("关闭UI",function()
        game:GetService("CoreGui")["frosty"]:Destroy()
    end)

    credits:Toggle("彩虹UI", "", false, function(state)
        if state then
        game:GetService("CoreGui")["frosty"].Main.Style = "DropShadow"
        else
            game:GetService("CoreGui")["frosty"].Main.Style = "Custom"
        end
    end)
    
        local creds = window:Tab("通用",'6035145364')

local tool = creds:section("通用",true)

    credits:Button("工具包😨😨😨",function()
        loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/BTools.txt"))()
end)

    credits:Button("飞车🚗",function()
        loadstring(game:HttpGet("https://pastebin.com/raw/MHE1cbWF"))()
end)

    credits:Button("无限跳😨",function()
        loadstring(game:HttpGet("https://pastebin.com/raw/V5PQy3y0", true))()
end)

    credits:Button("1×1×1x1",function()
        loadstring(game:HttpGet("https://pastebin.com/raw/XR4sGcgJ"))()
end)

    credits:Button("失败得慢",function()
        loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()
end)

    credits:Button("防挂机",function()
        wait(0.5)local ba=Instance.new("ScreenGui")
local ca=Instance.new("TextLabel")local da=Instance.new("Frame")
local _b=Instance.new("TextLabel")local ab=Instance.new("TextLabel")ba.Parent=game.CoreGui
ba.ZIndexBehavior=Enum.ZIndexBehavior.Sibling;ca.Parent=ba;ca.Active=true
ca.BackgroundColor3=Color3.new(0.176471,0.176471,0.176471)ca.Draggable=true
ca.Position=UDim2.new(0.698610067,0,0.098096624,0)ca.Size=UDim2.new(0,304,0,52)
ca.Font=Enum.Font.SourceSansSemibold;ca.Text="防挂机被踢"ca.TextColor3=Color3.new(0,1,1)
ca.TextSize=22;da.Parent=ca
da.BackgroundColor3=Color3.new(0.196078,0.196078,0.196078)da.Position=UDim2.new(0,0,1.0192306,0)
da.Size=UDim2.new(0,304,0,107)_b.Parent=da
_b.BackgroundColor3=Color3.new(0.176471,0.176471,0.176471)_b.Position=UDim2.new(0,0,0.800455689,0)
_b.Size=UDim2.new(0,304,0,21)_b.Font=Enum.Font.Arial;_b.Text="防挂机被踢"
_b.TextColor3=Color3.new(1,1,1)_b.TextSize=20;ab.Parent=da
ab.BackgroundColor3=Color3.new(0.176471,0.176471,0.176471)ab.Position=UDim2.new(0,0,0.158377379,0)
ab.Size=UDim2.new(0,304,0,44)ab.Font=Enum.Font.ArialBold;ab.Text="状态：开始"
ab.TextColor3=Color3.new(1,1,1)ab.TextSize=20;local bb=game:service'VirtualUser'
game:service'Players'.LocalPlayer.Idled:connect(function()
bb:CaptureController()bb:ClickButton2(Vector2.new())
ab.Text="你闲置了😨，ROBLOX 试图踢你，但我们超了它😋😋😋（fw官方😋😋😋）"wait(2)ab.Text="脚本重新启用"end)
    end)
    credits:Button("重进服", function()
	    game:GetService("TeleportService"):Teleport(13822889)
    print("btn3");
    end)
    
    credits:Button("飞行",function()
        loadstring(game:HttpGet("https://pastebin.com/raw/U27yQRxS"))()
    end)
        
    credits:Toggle("穿墙只能开", "", false, function(Value)
        local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local Clipon = true

Stepped = game:GetService("RunService").Stepped:Connect(function()
	if not Clipon == false then
		for a, b in pairs(Workspace:GetChildren()) do
        if b.Name == Players.LocalPlayer.Name then
        for i, v in pairs(Workspace[Players.LocalPlayer.Name]:GetChildren()) do
        if v:IsA("BasePart") then
        v.CanCollide = false
        end end end end
	else
		Stepped:Disconnect()
	end
end)
    end)
        
    credits:Button("键盘",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
    end)
        
    credits:Button("IY指令挂",function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
    end)

    credits:Button("透视",function()
         loadstring(game:HttpGet('https://pastebin.com/raw/MA8jhPWT'))()
    end)
    
        credits:Button("光影V4（不建议在刀刃球上使用",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()
    end)
    
        credits:Button("吸取全部玩家",function()
    loadstring(game:HttpGet('https://pastebin.com/raw/hQSBGsw2'))()
    end)
    
        credits:Button("人物无敌",function()
    loadstring(game:HttpGet('https://pastebin.com/raw/H3RLCWWZ'))()
    end)
    
        credits:Button("隐身(E)",function()
    loadstring(game:HttpGet('https://pastebin.com/raw/nwGEvkez'))()
    end)
    
        credits:Button("电脑键盘",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
    end)
    
        credits:Button("跟踪玩家",function()
    loadstring(game:HttpGet("https://pastebin.com/raw/F9PNLcXk"))()
    end)
    
        credits:Button("伪名说话",function()
    loadstring(game:HttpGet(('https://pastefy.ga/zCFEwaYq/raw'),true))()
    end)
    
        credits:Button("踏空行走",function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()
    end)
    
        credits:Button("转",function()
    loadstring(game:HttpGet('https://pastebin.com/raw/r97d7dS0', true))()
    end)
    
        credits:Button("动作",function()
    loadstring(game:HttpGet("https://pastebin.com/raw/Zj4NnKs6"))()
    end)
    
        credits:Button("无限跳",function()
    loadstring(game:HttpGet("https://pastebin.com/raw/V5PQy3y0", true))()
    end)
    
        credits:Button("甩飞",function()
    loadstring(game:HttpGet("https://pastebin.com/raw/GnvPVBEi"))()
    end)
    
    credits:Toggle("夜视", "", false, function(Value)
    		if Value then
		    game.Lighting.Ambient = Color3.new(1, 1, 1)
		else
		    game.Lighting.Ambient = Color3.new(0, 0, 0)
		end
	end
	
        local credits = creds:section("造船寻宝")
    
    credits:Button("衰钱",function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/urmomjklol69/GoldFarmBabft/main/GoldFarm.lua'),true))()
    end)
    
        credits:Button("脚本111（卡密Pearl_876tsdfhba67sdbhyaggv2）",function()
    loadstring(game:HttpGet('https://ppearl.vercel.app'))()
    end)
    
        credits:Button("2",function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/XRoLLu/UWU/main/BUILD%20A%20BOAT%20FOR%20TREASURE.lua'))()
    end)
    
    local credits = creds:section("巴掌")
    
    credits:Button("脚本1",function()
        loadstring(game:HttpGet(("https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/Slap%20Battles")))()
    end)
    
    credits:Button("2",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RandomScriptr3/gggggggg/main/lolez.txt", true))()
    end)
    
    credits:Button("脚本3",function()
    loadstring(game:HttpGet("https://scriptblox.com/raw/UPDATE-Slap-Battles-OP-RC-HUB-9830"))()
    end)
    
    credits:Button("4",function()
    loadstring(game:HttpGet("https://scriptblox.com/raw/Slap-Battles-Scriptmaster-Hub-10755"))()
    end)
    
    local credits = creds:section("能力（没找到好多脚本就，只找到了这一个）")
    
    credits:Button("汉化的",function()
        loadstring(game:HttpGet("https://pastebin.com/raw/tDN0uMkk"))()
    end)
    
    local credits = creds:section("伐木2（一点）")
    
    credits:Button("step版可复制基地",function()
        loadstring(Game:HttpGet("https://bit.ly/Stepshop"))("StepLT2")
    end)
    
    credits:Button("开源的部分不能用",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/frencaliber/LuaWareLoader.lw/main/luawareloader.wtf",true))()
    end)
    
    local credits = creds:section("动感星期五")
    
    credits:Button("自动玩（占屏（没占屏的暂时没找到））",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ShowerHead-FluxTeam/scripts/main/funky-friday-autoplay"))()
    end)
    
    local credits = creds:section("起床")
    
    credits:Button("伪v",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()
    end)
    
    local credits = creds:section("废物餐厅")
    
    credits:Button("英文",function()
        loadstring(game:HttpGet(('https://gitfront.io/r/ReQiuYTPL/wFUydaK74uGx/hub/raw/ReQiuYTPLHub.lua'),true))()
    end)
    
    local credits = creds:section("收养你妈")
    
    credits:Button("可以复制宠物",function()
        loadstring(game:HttpGet("https://pastebin.com/raw/uBpUr2vU"))()
    end)
    
    local credits = creds:section("歪怪儿州")
    
    credits:Button("汉化功能弱",function()
        loadstring(game:HttpGet("https://pastebin.com/raw/hXm9KBPC"))()
    end)
    
    local credits = creds:section("警长打死杀手2")
    
    credits:Button("英文要卡密",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/Duels214/main/Sheriffs1"))()
    end)
    
    local credits = creds:section("evade")
    
    credits:Button("手机可",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Darkrai-X/main/Games/Evade"))()
    end)
    
    local credits = creds:section("Apeirophobia")
    
    credits:Button("手机可",function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/E240-h/apgui/main/n'),true))()
    end)
    
    local credits = creds:section("Olympia")
    
    credits:Button("英文分分钟人上人",function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Prosium00/Prosium00/main/Olympia'))()
    end)
    
    local credits = creds:section("blox fruit")
    
    credits:Button("1英文",function()
        loadstring(game:HttpGet("https://github.com/LeVanNhatIT/ChuRoblox/raw/main/ChuRobloxPre.lua"))()
    end)
    
    credits:Button("要卡密",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Hirimii/Hubv2/main/Hirimiv2.lua"))()
    end)
    
    credits:Button("不要卡密",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Minhtriettt/Free-Script/main/MTriet-Hub.lua"))()
    end)
        
    local credits = creds:section("门")
    
    credits:Button("1英文",function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/ExolutionProject/Scripts/main/ExolutionPremiumHub.lua'))() 
    end)
    
    credits:Button("有大厅动作",function()
        loadstring(game:HttpGet(('https://pastebin.com/raw/R8QMbhzv')))()
    end)
    
    credits:Button("普通",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Darkrai-X/main/Games/Doors"))()
    end)
    
    local credits = creds:section("the rake")
    
    credits:Button("esp类",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ScriptsLynX/LynX/main/KeySystem/Loader.lua"))()
    end)
    
    credits:Button("打击光环",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Pixeluted/RakeEvolved/Stable/Source.lua"))()
    end)
    
    local credits = creds:section("铲雪摸拟器")
    
    credits:Button("自动挖自动卖",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/itsnoctural/Utilities/main/Closed/Snow%20Shoveling.lua",true))()
    end)
    
    local credits = creds:section("自然灾害")
    
    credits:Button("汉化",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiao122231/xiao122231/main/%E8%87%AA%E7%84%B6%E7%81%BE%E5%AE%B3"))()
    end)
    
    local credits = creds:section("da hood")
    
    credits:Button("1英文",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Zinzs/luascripting/main/canyoutellitsadahoodscriptornot.lua"))()
    end)
    
    local credits = creds:section("兵工场")
    
    credits:Button("1英文",function()
        loadstring(game:HttpGet(("https://raw.githubusercontent.com/Maikderninja/Maikderninja/main/PWNERHUB.lua"), true))()
    end)
    
    local credits = creds:section("辛运方块")
    
    credits:Button("汉化2",function()
        loadstring(game:HttpGet("https://pastebin.com/raw/h8J9X3em"))()
    end)
    
    local credits = creds:section("监狱人生")
    
    credits:Button("1英文",function()
        loadstring(game:HttpGet('https://paste.website/p/96d68817-3f1e-4fef-a8b8-9aafdc810329.txt'))()
    end)
    
    local credits = creds:section("战争大亨")
    
    credits:Button("1英文",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptware2/scriptware/main/obfa?token=GHSAT0AAAAAACFO4LM4EHUR5USK6UFUCGBCZGAOONQ"))()
    end)
    
    local credits = creds:section("龙卷风摸拟器")
    
    credits:Button("1英文",function()
        loadstring(game:HttpGet("https://www.obscurity.cf/Loader.lua"))()
    end)
    
    local credits = creds:section("火箭发射摸拟器")
    
    credits:Button("1英文",function()
        loadstring(game:HttpGet("https://scriptblox.com/raw/3-2-1-Blast-Off-Simulator-Easter-FuelBots-Script-for-1913"))()
    end)
    
    local credits = creds:section("比特币矿工")
    credits:Button("汉化3",function()
        loadstring(game:HttpGet("https://pastebin.com/raw/WBjdYtFK"))()
    end)
    
    local credits = creds:section("鲨口求生2")
    credits:Button("很强但是英文",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/JerrymiahPM/SharkRipper/main/main.lua"))()
    end)
    
    local credits = creds:section("口香糖工场")
    
    credits:Button("自动按配上键盘按h停再按h启动",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/kinhey/scripts/main/gumball_autofarm.lua"))()
    end)
    
    local credits = creds:section("核蛋摸拟器")
    
    credits:Button("要卡密",function()
        loadstring(game:HttpGet("https://jumblescripts.com/JumbleHub.lua"))()
    end)
    
    local credits = creds:section("一路向西")

    credits:Button("防摔",function()
    loadstring(game:GetObjects("rbxassetid://10040712770")[1].Source)()
    end)

    credits:Button("防套",function()
    loadstring(game:GetObjects("rbxassetid://10040719318")[1].Source)()
    end)

    credits:Button("范围",function()
    loadstring(game:GetObjects("rbxassetid://10040722920")[1].Source)()
    end)
    
    credits:Button("无后座，无限，超级",function()
    loadstring(game:GetObjects("rbxassetid://10040701935")[1].Source)()
    end)
    
    credits:Button("云v1.0.4",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/UWU/main/XiaoYunbarkV1.0.4.lua"))()
    end)
    
    credits:Button("云v1.0.6",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/UWU/main/XiaoYun_currentedition_beta.lua"))()
    end)
    
    credits:Button("云2",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/UWU/main/Xiao______________________________________________________________Yun__________________________________________________________________________betaV2.0.lua"))()
    end)
    
    credits:Button("微山白",function()
    loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\75\113\117\97\68\70\53\120\34\41\41\40\41\10")()
    end)
    
    local credits = creds:section("忍者")

    credits:Button("北约",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/USA868/USA--/main/%E5%BF%8D%E8%80%85%E5%8C%97%E7%BA%A6%E6%B1%89%E5%8C%96.txt.bak?token=GHSAT0AAAAAACB6LLQWNTHNEXWB573LYAQCZCMX6RA"))()
    end)
    
        local credits = creds:section("忍者脚本2")

    credits:Button "传送到出生点",function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(25.665502548217773, 3.4228405952453613, 29.919952392578125)
   end)
 
    credits:Button "传送到附魔岛",function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(51.17238235473633, 766.1807861328125, -138.44842529296875)
   end)
 
    credits:Button "传送到星界岛",function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(207.2932891845703, 2013.88037109375, 237.36672973632812)
   end)
 
    credits:Button "传送到神秘岛",function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(171.97178649902344, 4047.380859375, 42.0699577331543)
   end)
 
    credits:Button "传送到太空岛",function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(148.83824157714844, 5657.18505859375, 73.5014877319336)
   end)
 
    credits:Button "传送到冻土岛",function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(139.28330993652344, 9285.18359375, 77.36406707763672)
   end)
 
    credits:Button "传送到永恒岛",function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(149.34817504882812, 13680.037109375, 73.3861312866211)
   end)
 
    credits:Button "传送到沙暴岛",function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(133.37144470214844, 17686.328125, 72.00334167480469)
   end)
 
    credits:Button "传送到雷暴岛",function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(143.19349670410156, 24070.021484375, 78.05432891845703)
   end)
 
    credits:Button "传送到远古炼狱岛",function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(141.27163696289062, 28256.294921875, 69.3790283203125)
   end)
 
    credits:Button "传送到午夜暗影岛",function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(132.74267578125, 33206.98046875, 57.495574951171875)
   end)
 
    credits:Button "传送到神秘灵魂岛",function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(137.76148986816406, 39317.5703125, 61.06639862060547)
   end)
 
    credits:Button "传送到冬季奇迹岛",function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(137.2720184326172, 46010.5546875, 55.941951751708984)
   end)
 
    credits:Button "传送到黄金大师岛",function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(128.32339477539062, 52607.765625, 56.69411849975586)
   end)
 
    credits:Button "传送到龙传奇岛",function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(146.35226440429688, 59594.6796875, 77.53300476074219)
   end)
 
    credits:Button "传送到赛博传奇岛",function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(137.3321075439453, 66669.1640625, 72.21722412109375)
   end)
 
    credits:Button "传送到天岚超能岛",function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(135.48077392578125, 70271.15625, 57.02311325073242)
   end)
 
    credits:Button "传送到混沌传奇岛",function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(148.58590698242188, 74442.8515625, 69.3177719116211)
   end)
 
    credits:Button "传送到灵魂融合岛",function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(136.9700927734375, 79746.984375, 58.54051971435547)
   end)
 
    credits:Button "传送到黑暗元素岛",function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(141.697265625, 83198.984375, 72.73107147216797)
   end)
 
    credits:Button "传送到内心和平岛",function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(135.3157501220703, 87051.0625, 66.78429412841797)
   end)
 
    credits:Button "传送到炽烈漩涡岛",function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(135.08216857910156, 91246.0703125, 69.56692504882812)
   end)
 
    credits:Button "传送到35倍金币区域",function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(86.2938232421875, 91245.765625, 120.54232788085938)
   end)
 
    credits:Button "传送到死亡宠物",function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4593.21337890625, 130.87181091308594, 1430.2239990234375)
   end)
   
      local credits = creds:section("刀儿似")

    credits:Button "门",function()
loadstring(game:HttpGet("https://github.com/DocYogurt/free/raw/main/long"))()
end)

    credits:Button "自动完成",function()
	loadstring(game:HttpGet('https://reddyhub.xyz/loader.html'))()
end)

    credits:Button "不坤到什么名字",function()
loadstring(game:HttpGet(("https://raw.githubusercontent.com/mstudio45/poopdoors_edited/main/poopdoors_edited.lua"),true))()
end)

    credits:Button "穿墙(无拉回)",function()
loadstring(game:HttpGet("https://github.com/DXuwu/OK/raw/main/clip"))()
end)

    credits:Button "变身(阿巴怪提供)",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ChronoAccelerator/Public-Scripts/main/Morphing/MorphScript.lua"))();
end)

    credits:Button "微山2.3.2(依旧是阿巴怪提供)",function()
--微山doors 2.3.2(愚人节快乐)
loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\117\72\72\112\56\102\122\83"))()
end)

    local credits = creds:section("蜂群")

    credits:Button "蜂",function()	
	loadstring(game:HttpGet("https://roblox.servegame.com/roblox_bss/chocmoc.lua"))()
	end)

    local credits = creds:section("奇怪的东西")

    credits:Button "脚本搜索",function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/ScriptSearcher"))()
	end)

    credits:Button "幸运战场",function()
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/zeuise0002/SSSWWW222/main/README.md'),true))()
	end)

    credits:Button "DX",function()
	loadstring(game:HttpGet("https://github.com/DocYogurt/lolololololololololololololollolololololololololololololollolololololololololololololollolololololol/raw/main/lolololololololololololololollolololololololololololololollolololololololololololololollolololololololololololololollolololololololololololololollolololololololololololololollolololololololololololololollolololololololololololololollolololololololololololololollolololololololololololololollolololololololololololololol.lua"))()
	end)

    credits:Button "饥饿的艺术家",function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/SuperRegex/RobloxScripts/main/DrawingScript.lua"))()
	end)

    credits:Button "监狱人生",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Denverrz/scripts/master/PRISONWARE_v1.3.txt"))();
	end)

    credits:Button "脚本F",function()
    loadstring(game:HttpGet('loadstring(game:HttpGet("https://raw.githubusercontent.com/Wangzhehaoh/fly-away/main/how%20didb%20mOD"))()'))()
	end)

    credits:Button "胭脂模拟器",function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/USA868/USA--/main/%E5%8C%97%E7%BA%A6%E8%84%82%E8%82%AA?token=GHSAT0AAAAAACB6LLQXW62E3GRGCTS3O4RCZCMUN2Q"))()
		end)

    credits:Button "脚本中心1.5",function()		loadstring(game:HttpGet('\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\103\101\109\120\72\119\65\49"))()'))()
	end)

    credits:Button "隐身（按E）",function()
		loadstring(game:HttpGet('http://pan.rlyun.asia/api/v3/file/get/15096/%E9%9A%90%E8%BA%AB?sign=e_W9VovlrlZFy_OwwmQSLn6POQ6FwtWXFvrb2lBaJq8%3D%3A0'))()
	end)

    credits:Button "BOL",function()
	loadstring(game:HttpGet("https://github.com/ScriptKiddyQuinn/Blox-Hub-Version-1.3/blob/main/Blox%20Hub%20Version%201.3", true))()
	end)

    credits:Button "音乐",function()		
loadstring(game:HttpGet("https://raw.githubusercontent.com/boyscp/beta/main/music.lua"))()
    end)
    
    credits:Button "轰炸（封号风险）",function()		
loadstring(game:HttpGet("https://raw.githubusercontent.com/boyscp/scriscriptsc/main/%E8%BD%B0%E7%82%B8.lua"))()
    end)
    
    credits:Button "回答或死亡（要卡密）",function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/jaeelin/S-Ware/main/S-WARE'))()
	end)
	
    credits:Button "挂工厂",function()
		loadstring(game:HttpGet('http://pan.rlyun.asia/api/v3/file/get/15369/%E4%B9%92%E5%B7%A5%E5%8E%82?sign=pDWgMBQ_m8pjcTS9-o8N1zvCmYmc6LsQVjeDaypp0bw%3D%3A0'))()
	end)
	
    credits:Button "鲨口求生",function()		
	loadstring(game:HttpGet("https://pastebin.com/raw/YYVLbzVg", true))()
	end)
	
    credits:Button "变大变小",function()	
	loadstring(game:HttpGet("http://pan.rlyun.asia/api/v3/file/get/18187/%E5%8F%98%E5%A4%A7%E5%8F%98%E5%B0%8F?sign=nR9TjQacuB58vmwKApyTIaWJykPqbr3KNPusu_MqNbg%3D%3A0"))()
	end)
	
    credits:Button "bf神龙",function()		
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Kaizenofficiall/ZenHub/main/Loader", true))()
    end)
    
    credits:Button "技能大战2卡密：lMXJsryGVIajsQrMJmaVde3MIUoHCa",function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/VxleLUA/Dynamic-Offical/main/System/GameChecker.lua"))()
	end)
	
    credits:Button "军事大亨 查找干扰器",function()
	loadstring(game:HttpGet("https://oopshub.vercel.app/scripts/MT_event_Hacker.lua"))()
	end)
	
    credits:Button "帝国中心（荐）",function()	
	loadstring(game:HttpGet("https://raw.githubusercontent.com/aerocontentdeliverynetwork/3456465f7453x447r76h86856233423645756354b/master/loader.lua"))()
	end)
	
    credits:Button "eyabe新版",function()	
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Wangzhehaoh/fly-away/main/---EF---fluxus%20debtsesgh%20%E6%AC%A2%E8%BF%8E%E6%9D%A5%E5%88%B0%E8%84%9A%E6%9C%ACEF%20%E6%B5%8B%E8%AF%95%E7%89%88"))()
	end)
		
    credits:Button "派系防御大亨",function()
	game:GetService("ReplicatedStorage").PlayerMoneyUpdate[game:GetService("Players").LocalPlayer.Name]:FireServer(999999999)
	end)
	
    credits:Button "军事大亨",function()
	loadstring(game:HttpGet("https://pastebin.com/raw/q94czk7E",true))()
	end)
	
    credits:Button "通用ESP",function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/UESP'))()
	end)
	
    credits:Button "导弹模拟器",function()	
	loadstring(game:HttpGet('https://raw.githubusercontent.com/KodaLINEN/NukeSim/main/Main'))()
	end)	
	
    credits:Button "备用战场（自动闪避）",function()	
getgenv().AutoExecute = true 

getgenv().Keybind = "V"
getgenv().Distance = 35

getgenv().Aura = true 
getgenv().Sounds = true

getgenv().LookAtNearestPlayer = false
getgenv().LookAtDistance  = 25
getgenv().LookAtKeybind = "V" 

loadstring(game:HttpGet("https://raw.githubusercontent.com/Lvl9999/AB/main/Ui"))();
	end)
	
    credits:Button "矿车",function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Holdmyhacks/scripts/main/scripts", true))()
	end)
	
    credits:Button "通用脚本",function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/raw-scriptpastebin/raw/main/B_Genesis'))()
	end)
	
    credits:Button "宠物模拟器（要卡）",function()
getgenv().key = "projectWBIsAwesomeG8J7GJ678PY"
loadstring(game:HttpGet("https://raw.githubusercontent.com/Muhammad6196/Project-WD/main/Main.lua"))()
    end)

    credits:Button "伐木大亨2（翻译）",function()
		loadstring(game:HttpGet('http://pan.rlyun.asia/api/v3/file/get/15754/%E4%BC%90%E6%9C%A8?sign=cLaJaGOk-K27o0mPP7U3iELEvkgLCTCbTO90pUdHlBk%3D%3A0'))()
	end)

    credits:Button "我的世界",function()	
	loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe2/ToraIsMe2/main/0craftblox", true))()
		end)

    local bin = creds:section("信息",true)
    bin:Label("群:无")
    bin:Label("作者淼")
    bin:Label("😡😋👍")
    bin:Label("永久免费")
    bin:Label("作者Roblox名:shushenmiao1")
end)

