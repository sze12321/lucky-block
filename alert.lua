local Players = game:GetService("Players")
speaker = Players.LocalPlayer
char = speaker.Character 
bag = speaker.Backpack
RunService = game:GetService("RunService")


Workspace = game:GetService("Workspace")

Player = game.Players.LocalPlayer
User = Player.Name
local StarterGui = game:GetService("StarterGui")
local function iterPageItems(pages)
	return coroutine.wrap(function()
		local pagenum = 1
		while true do
			for _, item in ipairs(pages:GetCurrentPage()) do
				coroutine.yield(item, pagenum)
			end
			if pages.IsFinished then
				break
			end
			pages:AdvanceToNextPageAsync()
			pagenum = pagenum + 1
		end
	end)
end

function contain(table, element)
  for _, value in ipairs(table) do
    if value == element then
      return true
    end
  end
  return false
end

userId = Players:GetUserIdFromNameAsync(User)
friendPages = Players:GetFriendsAsync(userId)
frd = {}
for item, pageNo in iterPageItems(friendPages) do
	table.insert(frd, item.Username)
end

table.insert(frd,User)
local Library = loadstring(game:HttpGet("https://pastebin.com/raw/vff1bQ9F"))()
local Window = Library.CreateLib("Lucky block made by sze", "DarkTheme")
local item = Window:NewTab("Item checking")
local item1 = item:NewSection("check item")
playerlist = {}
itemlist = {}
local show = item1:NewLabel("abc")


choose = item1:NewDropdown("target", "DropdownInf",{"update"}, function(currentOption)
    print(currentOption)
    if currentOption == "update" then 
    local playerss = game.Players:GetPlayers()

	for i , v in ipairs(playerss) do 
	playerlist[i] = v.name 
	count9 = i 
	end
	playerlist[count9+1] = "update"
	choose:Refresh(playerlist)  
    else 
    target = currentOption
    show:UpdateLabel(target)
    end 
end)



local showitemlist = item1:NewDropdown("itemlist", "",{1,2,3,}, function(c)
	

end )


local showitems = item1:NewButton("show items", "ButtonInfo", function()
	print(target)
    local rtarget = game:GetService("Players"):FindFirstChild(target)
    print(rtarget)
    local backpack = rtarget.Backpack:GetChildren()
    for i , v in ipairs(backpack) do 
	itemlist[i] = v.name 
	end
	
	showitemlist:Refresh(itemlist)
	
    
end)
killon = false

local alert = Window:NewTab("alert")
local alert1 = alert:NewSection("alert")
local targeting = alert1:NewLabel("")
local toggle = alert1:NewToggle("On/Off", "ToggleInfo", function(state)
    if state then
        
        on = true 
        targeting:UpdateLabel("On")

    else
        
        on = false 
        targeting:UpdateLabel("Off")
        
    end
end)
LabelText = " "
td = {}

local dangeritemlist = {"clear","All","BoneSword", "TriLaserGun","RainbowPeriastron","LaserGun","TigerSkin"
,"NinjaStickyBomb","BigRocketLauncher","RocketJumper","DragonsheadCannon","OrinthianMace","CrescendoTheSoulStealer",
"CrimsonPeriastron","Pickaxe","RomanCatapult","TelamonsterTheChaosEdge","SpiderSword","EnergySword",
"Bear Arm","WormholeTunneler","TrololoCapeOfInvisibility","GhostInvisibilityElixir","WingedWarrior'sSword"}
for i , v in ipairs(dangeritemlist) do 
		table.insert(td,dangeritemlist[i])
end

local kila = alert1:NewLabel("kill: false")
local kil = alert1:NewToggle("Kill/ not" , "", function(tog) 
		if tog then 
		
		killon = true
		kila:UpdateLabel("kill: true")
		
		else killon = false 
		kila:UpdateLabel("kill: false")
		end
end)
local dangeritemchoosen = alert1:NewLabel("all")
local tdanger = alert1:NewDropdown("choose", "DropdownInf", dangeritemlist, function(co)
    if co == "clear" then 
    dangeritemchoosen:UpdateLabel("")
    td = {}
    LabelText = ""
    else 
    
    	if co == "All" then 
    
    	td = dangeritemlist
    	   else
     	LabelText = LabelText .. co .. " "
    	dangeritemchoosen:UpdateLabel(LabelText)
    	table.insert(td, co)
    	end
    		print(co)
    		for i , v in ipairs(td) do 
    		print(td[i])
    		end
    end
end)

local frdelabel = alert1:NewLabel("not killing friends") 
fe = false 
local frdtoggle = alert1:NewToggle("enable friend kill?", "",function(n)
			 if n then
			 	frdelabel:UpdateLabel("killing friends")
			 	fe = true
			 else 
			 	frdelabel:UpdateLabel("not killing friends") 
			 	fe = false
			 end
end)
el = alert1:NewLabel("exclude: ")
etarget = "excludes: "
epl = {}
exclude = alert1:NewDropdown("exclude", "DropdownInf",{"update","clear"}, function(aon)
    print(aon)
    if aon == "update" then 
    local playerss = game.Players:GetPlayers()

		for i , v in ipairs(playerss) do 
		playerlist[i] = v.name 
		count9 = i 
		end
		playerlist[count9+1] = "update"
		playerlist[count9+2] = "clear"
		exclude:Refresh(playerlist)  
    else 
    	if aon == "clear" then 
    		etarget = "excludes: "
    	el:UpdateLabel(etarget)
    	epl = {}
    	else
    	etarget = etarget ..aon
    	table.insert(epl, aon)
    	el:UpdateLabel(etarget)
    	for i , v in ipairs(epl) do 
    	print(epl[i])
    	end
    	end
    end 
end)



local StarterGui = game:GetService("StarterGui") 
ran = alert1:NewLabel("")


coroutine.wrap(function()
print("started")
task.wait(5)
	while true do 
    	if on then
    	print("on")
    	
     		for _ , b in ipairs(game.Players:GetPlayers()) do 
  				if  ((not contain(frd, b.Name)) or (fe == true)) and (not contain(epl, b.Name)) then 
  				
  				 				
  				tp3 = b.Backpack
  		
  				sb = tp3:GetChildren()
  				
  					for _ , v in ipairs (sb) do 
  					
  					tool5 = v.Name
  					
   						if contain(td , tool5) then
   						print("danger")
   							if killon == false then 
   							
   							
   							print(tool5)
   						 	StarterGui:SetCore("SendNotification", {
							Title = b.Name;
							Text = v.Name
							}) 
							
							else 
							print("notification")
   								print(tool5)
   						 		StarterGui:SetCore("SendNotification", {
								Title = b.Name;
								Text = v.Name
								}) 
							local RS = RunService.RenderStepped
							local Tool = speaker.Character.FindFirstChildWhichIsA(speaker.Character, "Tool")
							local Handle = Tool and Tool.FindFirstChild(Tool, "Handle")
							
								if  Tool or  Handle then
									
									local z = game:GetService("Workspace"):FindFirstChild(b.Name)
									print(z)
										task.spawn(function()
											while Tool and speaker.Character and z and Tool.Parent == speaker.Character do
											local Human = z.FindFirstChildWhichIsA(z, "Humanoid")
										
												for _, v1 in ipairs(z.GetChildren(z)) do
												v1 = ((v1.IsA(v1, "BasePart") and firetouchinterest(Handle, v1, 1, (RS.Wait(RS) and nil) or firetouchinterest(Handle, v1, 0)) and nil) or v1) or v1
												end
											end
										
										end)
									
								
								end
								
   							end
   						
   						end
   					
   					end 
   				else 
	 			end 
        		
       	 	end
        
        end 
        
        task.wait(3)
   end
        
end)()
		
  
  
  
 
 


local lb = Window:NewTab("Lucky blocks")
local lb1 = lb:NewSection("Lucky blocks")
local speed = lb1:NewSlider("get block speed", "SliderInfo", 500, 1, function(s) -- 500 (MaxValue) | 0 (MinValue)
    lt = s/100
end)
local getall = lb1:NewButton("get all blocks","",function()

			for i = 1,200 do
        game.ReplicatedStorage.SpawnGalaxyBlock:FireServer()
        task.wait(lt)
        game.ReplicatedStorage.SpawnRainbowBlock:FireServer()
        task.wait(lt)
        game.ReplicatedStorage.SpawnDiamondBlock:FireServer()
        task.wait(lt)
        game.ReplicatedStorage.SpawnSuperBlock:FireServer()
        task.wait(lt)
        game.ReplicatedStorage.SpawnLuckyBlock:FireServer()
        task.wait(lt)
    end
end)
chooseditem  = {}
myitems = {"update","clear"}
local lbl = lb1:NewDropdown("Chosen", "" , {} ,function()

end) 
label3 = ""
selectgear2 = lb1:NewDropdown("choose", "DropdownInf", myitems , function(choice) 
		if choice == "clear" then
		
    	lbl:Refresh({})
    	chooseditem  = {}
    	myitems = {"update","clear"}
    	selectgear2:Refresh(myitems)
		elseif choice == "update" then 
		myitems = {"update","clear"}
			for _ , v in ipairs(bag:GetChildren()) do 
				
				table.insert(myitems, v.Name)
				
			end
			selectgear2:Refresh(myitems)
		else 
			table.insert(chooseditem, choice ) 
			
			lbl:Refresh(chooseditem)
		
		end
end)

UpdateTool = lb1:NewButton("Update with equiped", "" , function() 


for _ , v in ipairs(char:GetChildren()) do 
	if v:IsA("Tool") then 
	table.insert(chooseditem, v.Name ) 
	lbl:Refresh(chooseditem)
	end 
end

end)


equip = lb1:NewButton("equip", "" , function()  
	for _ , v in ipairs(bag:GetChildren()) do 
		if contain(chooseditem , v.Name) then 
		v.Parent = char
		
	
		end
	end

end)

throwequip = lb1:NewButton("throw equiped", "" , function() 
for _ , v in ipairs(char:GetChildren()) do 
	if v:IsA("Tool") then 
	v.Parent = game.Workspace
	end 
end

end)
Getthrowequip = lb1:NewButton("Get throw equiped", "" , function() 
for _ , v in ipairs(Workspace:GetChildren()) do 
	if v:IsA("Tool") then 
	v.Parent = char
	end 
end

end)
GetClones = lb1:NewButton("Get Clone weapons", "" , function() 
clone = {}
for _,v in ipairs(Workspace:GetChildren()) do 
	if v.Name == player.Name.."'s Clone" then 
	
	table.insert(clone, v)
	end
end
	for i , v in ipairs(clone) do 
	print(clone[i])

	end

for _ , v in ipairs(clone) do 
	for _, i in ipairs(v:GetChildren()) do
		if i:IsA("Tool") then 
		i.Parent = char
		end
	end
end

end)

speaker.CharacterAdded:Connect(function(character)
			char = speaker.Character 
			bag = speaker.Backpack
end)
