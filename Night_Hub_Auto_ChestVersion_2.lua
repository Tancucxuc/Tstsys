-------//[Function Script]\\------------

_G.useconfig = true
PosY = 30
if _G.useconfig then
    if getgenv().config["Start Farm Chest"]["Enabled"] then
        AllowRunService = true
        _G.SetupTeam = true
    end
	if getgenv().config["Screen"]["White Screen"]["Enabled"] then
		game:GetService("RunService"):Set3dRenderingEnabled(false)
	end
	if getgenv().config["Screen"]["Boots FPS"]["Enabled"] then
        print("Ko có đou")
	end
	if getgenv().config["Chest Misc"]["Stop When Have God's Chaile or Dark Key"]["Enabled"] then
		_G.StopChest = true
	end
end

---------//[Ui Script Create By LMNGAMING]\\----------


-- Properties:

function EquipWeapon(ToolSe)
    if not _G.NotAutoEquip then
        if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
            Tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
            wait(.1)
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(Tool)
        end
    end
end

function Click()
    wait(.1)
    game:GetService'VirtualUser':CaptureController()
    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
end

function AutoHaki()
    if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
    end
end

function UnEquipWeapon(Weapon)
    if game.Players.LocalPlayer.Character:FindFirstChild(Weapon) then
        _G.NotAutoEquip = true
        wait(.5)
        game.Players.LocalPlayer.Character:FindFirstChild(Weapon).Parent = game.Players.LocalPlayer.Backpack
        wait(.1)
        _G.NotAutoEquip = false
    end
end

function GetDistance(target)
    return math.floor((target.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude)
end

function BTP(P)
	repeat wait(1)
		game.Players.LocalPlayer.Character.Humanoid:ChangeState(15)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P
		task.wait()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P
	until (P.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1500
end

function TelePPlayer(P)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P
end
    
    function TP(Pos)
    Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if Distance < 25 then
        Speed = 10000
    elseif Distance < 50 then
        Speed = 2000
    elseif Distance < 150 then
        Speed = 800
    elseif Distance < 250 then
        Speed = 600
    elseif Distance < 500 then
        Speed = 400
    elseif Distance < 750 then
        Speed = 250
    elseif Distance >= 1000 then
        Speed = 200
    end
    game:GetService("TweenService"):Create(
        game.Players.LocalPlayer.Character.HumanoidRootPart,
        TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
        {CFrame = Pos}
    ):Play()
end

    function TP1(Pos)
        Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if Distance < 25 then
            Speed = 5000
        elseif Distance < 50 then
            Speed = 2000
        elseif Distance < 150 then
            Speed = 800
        elseif Distance < 250 then
            Speed = 600
        elseif Distance < 500 then
            Speed = 300
        elseif Distance < 750 then
            Speed = 250
        elseif Distance >= 1000 then
            Speed = 200
        end
        game:GetService("TweenService"):Create(
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
            TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
            {CFrame = Pos}
        ):Play()
end

    function topos(Pos)
        Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if Distance < 25 then
            Speed = 5000
        elseif Distance < 50 then
            Speed = 2000
        elseif Distance < 150 then
            Speed = 800
        elseif Distance < 250 then
            Speed = 600
        elseif Distance < 500 then
            Speed = 300
        elseif Distance < 750 then
            Speed = 250
        elseif Distance >= 1000 then
            Speed = 200
        end
        game:GetService("TweenService"):Create(
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
            TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
            {CFrame = Pos}
        ):Play()
end

function TPB(CFgo)
	local tween_s = game:service"TweenService"
	local info = TweenInfo.new((game:GetService("Workspace").Boats.MarineBrigade.VehicleSeat.CFrame.Position - CFgo.Position).Magnitude/300, Enum.EasingStyle.Linear)
	tween = tween_s:Create(game:GetService("Workspace").Boats.MarineBrigade.VehicleSeat, info, {CFrame = CFgo})
	tween:Play()

	local tweenfunc = {}

	function tweenfunc:Stop()
		tween:Cancel()
	end

	return tweenfunc
end

function TPP(CFgo)
	if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health <= 0 or not game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid") then tween:Cancel() repeat wait() until game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid") and game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0 wait(7) return end
	local tween_s = game:service"TweenService"
	local info = TweenInfo.new((game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - CFgo.Position).Magnitude/325, Enum.EasingStyle.Linear)
	tween = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = CFgo})
	tween:Play()

	local tweenfunc = {}

	function tweenfunc:Stop()
		tween:Cancel()
	end

	return tweenfunc
end

getgenv().ToTargets = function(p)
task.spawn(function()
    pcall(function()
        if game:GetService("Players").LocalPlayer:DistanceFromCharacter(p.Position) <= 250 then 
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = p
        elseif not game.Players.LocalPlayer.Character:FindFirstChild("Root")then 
            local K = Instance.new("Part",game.Players.LocalPlayer.Character)
            K.Size = Vector3.new(1,0.5,1)
            K.Name = "Root"
            K.Anchored = true
            K.Transparency = 1
            K.CanCollide = false
            K.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,20,0)
        end
        local U = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude
        local z = game:service("TweenService")
        local B = TweenInfo.new((p.Position-game.Players.LocalPlayer.Character.Root.Position).Magnitude/300,Enum.EasingStyle.Linear)
        local S,g = pcall(function()
        local q = z:Create(game.Players.LocalPlayer.Character.Root,B,{CFrame = p})
        q:Play()
    end)
    if not S then 
        return g
    end
    game.Players.LocalPlayer.Character.Root.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        if S and game.Players.LocalPlayer.Character:FindFirstChild("Root") then 
            pcall(function()
                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude >= 20 then 
                    spawn(function()
                        pcall(function()
                            if (game.Players.LocalPlayer.Character.Root.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 150 then 
                                game.Players.LocalPlayer.Character.Root.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                            else 
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=game.Players.LocalPlayer.Character.Root.CFrame
                            end
                        end)
                    end)
                elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude >= 10 and(game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude < 20 then 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p
                elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude < 10 then 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p
                end
            end)
        end
    end)
end)
end

Type = 1
spawn(function()
while wait(.1) do
    if Type == 1 then
        Pos = CFrame.new(0,PosY,0)
    elseif Type == 2 then
        Pos = CFrame.new(0,PosY,-30)
    elseif Type == 3 then
        Pos = CFrame.new(30,PosY,0)
    elseif Type == 4 then
        Pos = CFrame.new(0,PosY,30)	
    elseif Type == 5 then
        Pos = CFrame.new(-30,PosY,0)
    elseif Type == 6 then
        Pos = CFrame.new(0,35,0)
    end
    end
end)

spawn(function()
while wait(.1) do
    Type = 1
    wait(0.5)
    Type = 2
    wait(0.5)
    Type = 3
    wait(0.5)
    Type = 4
    wait(0.5)
    Type = 5
    wait(0.5)
end
end)

task.spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoFarmNearest and AutoFarmNearestMagnet or SelectMag and _G.BringMonster then
                for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if not string.find(v.Name,"Boss") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= _G.BringMode then
                        if InMyNetWork(v.HumanoidRootPart) then
                            v.HumanoidRootPart.CFrame = PosMon
                            v.Humanoid.JumpPower = 0
                            v.Humanoid.WalkSpeed = 0
                            v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                            v.HumanoidRootPart.Transparency = 1
                            v.HumanoidRootPart.CanCollide = false
                            v.Head.CanCollide = false
                            if v.Humanoid:FindFirstChild("Animator") then
                                v.Humanoid.Animator:Destroy()
                            end
                            v.Humanoid:ChangeState(11)
                            v.Humanoid:ChangeState(14)
                        end
                    end
                end
            end
        end)
    end
    end)

spawn(function()
game:GetService("RunService").Heartbeat:Connect(function()
    if _G.AutoVampire or AutoFarmChest or _G.AutoAdvanceDungeon or _G.AutoDoughtBoss or _G.Auto_DungeonMobAura or _G.AutoFarmChest or _G.AutoFactory or _G.AutoFarmBossHallow or _G.AutoFarmSwanGlasses or _G.AutoLongSword or _G.AutoBlackSpikeycoat or _G.AutoElectricClaw or _G.AutoFarmGunMastery or _G.AutoHolyTorch or _G.AutoLawRaid or _G.AutoFarmBoss or _G.AutoTwinHooks or _G.AutoOpenSwanDoor or _G.AutoDragon_Trident or _G.AutoSaber or _G.NOCLIP or _G.AutoFarmFruitMastery or _G.AutoFarmGunMastery or _G.TeleportIsland or _G.Auto_EvoRace or _G.AutoFarmAllMsBypassType or _G.AutoObservationv2 or _G.AutoMusketeerHat or _G.AutoEctoplasm or _G.AutoRengoku or _G.Auto_Rainbow_Haki or _G.AutoObservation or _G.AutoDarkDagger or _G.Safe_Mode or _G.MasteryFruit or _G.AutoBudySword or _G.AutoOderSword or _G.AutoBounty or _G.AutoAllBoss or _G.Auto_Bounty or _G.AutoSharkman or _G.Auto_Mastery_Fruit or _G.Auto_Mastery_Gun or _G.Auto_Dungeon or _G.Auto_Cavender or _G.Auto_Pole or _G.Auto_Kill_Ply or _G.Auto_Factory or _G.AutoSecondSea or _G.TeleportPly or _G.AutoBartilo or _G.Auto_DarkBoss or _G.GrabChest or _G.AutoFarmBounty or _G.Holy_Torch or _G.AutoFarm or _G.Clip or _G.AutoElitehunter or _G.AutoThirdSea or _G.Auto_Bone or _G.Autoheart or _G.Autodoughking or _G.AutoFarmMaterial or _G.AutoNevaSoulGuitar or _G.Auto_Dragon_Trident or _G.Autotushita or _G.d or _G.Autowaden or _G.Autogay or _G.Autopole or _G.Autosaw or _G.AutoObservationHakiV2 or _G.AutoFarmNearest or AutoFarmChest or _G.AutoCarvender or _G.AutoTwinHook or AutoMobAura or _G.Tweenfruit or _G.AutoKai or _G.TeleportNPC or _G.Leather or _G.Auto_Wing or _G.Umm or _G.Makori_gay or Radioactive or Fish or Gunpowder or Dragon_Scale or Cocoafarm or Scrap or MiniHee or _G.AutoFarmSeabaest or Auto_Cursed_Dual_Katana or _G.AutoFarmMob or _G.AutoMysticIsland or _G.AutoFarmDungeon or _G.AutoRaidPirate or _G.AutoQuestRace or _G.TweenMGear or getgenv().AutoFarm or _G.AutoPlayerHunter or _G.AutoFactory or Grab_Chest or _G.Namfon or _G.AutoSwordMastery or _G.AutoSeaBest or _G.AutoKillTial or _G.Auto_Saber or _G.Position_Spawn or _G.Farmfast or _G.AutoRace or _G.RaidPirate then
        if not game:GetService("Workspace"):FindFirstChild("LOL") then
            local LOL = Instance.new("Part")
            LOL.Name = "LOL"
            LOL.Parent = game.Workspace
            LOL.Anchored = true
            LOL.Transparency = 1
            LOL.Size = Vector3.new(30,-0.5,30)
        elseif game:GetService("Workspace"):FindFirstChild("LOL") then
            game.Workspace["LOL"].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -3.6, 0)
        end
    else
        if game:GetService("Workspace"):FindFirstChild("LOL") then
            game:GetService("Workspace"):FindFirstChild("LOL"):Destroy()
        end
    end
end)
end)

spawn(function()
    pcall(function()
        while wait() do
            if _G.AutoVampire or AutoFarmChest or _G.AutoAdvanceDungeon or _G.AutoDoughtBoss or _G.Auto_DungeonMobAura or _G.AutoFarmChest or _G.AutoFactory or _G.AutoFarmBossHallow or _G.AutoFarmSwanGlasses or _G.AutoLongSword or _G.AutoBlackSpikeycoat or _G.AutoElectricClaw or _G.AutoFarmGunMastery or _G.AutoHolyTorch or _G.AutoLawRaid or _G.AutoFarmBoss or _G.AutoTwinHooks or _G.AutoOpenSwanDoor or _G.AutoDragon_Trident or _G.AutoSaber or _G.AutoFarmFruitMastery or _G.AutoFarmGunMastery or _G.TeleportIsland or _G.Auto_EvoRace or _G.AutoFarmAllMsBypassType or _G.AutoObservationv2 or _G.AutoMusketeerHat or _G.AutoEctoplasm or _G.AutoRengoku or _G.Auto_Rainbow_Haki or _G.AutoObservation or _G.AutoDarkDagger or _G.Safe_Mode or _G.MasteryFruit or _G.AutoBudySword or _G.AutoOderSword or _G.AutoBounty or _G.AutoAllBoss or _G.Auto_Bounty or _G.AutoSharkman or _G.Auto_Mastery_Fruit or _G.Auto_Mastery_Gun or _G.Auto_Dungeon or _G.Auto_Cavender or _G.Auto_Pole or _G.Auto_Kill_Ply or _G.Auto_Factory or _G.AutoSecondSea or _G.TeleportPly or _G.AutoBartilo or _G.Auto_DarkBoss or _G.GrabChest or _G.AutoFarmBounty or _G.Holy_Torch or _G.AutoFarm or _G.Clip or FarmBoss or _G.AutoElitehunter or _G.AutoThirdSea or _G.Auto_Bone or _G.Autoheart or _G.Autodoughking or _G.AutoFarmMaterial or _G.AutoNevaSoulGuitar or _G.Auto_Dragon_Trident or _G.Autotushita or _G.d or _G.Autowaden or _G.Autogay or _G.Autopole or _G.Autosaw or _G.AutoObservationHakiV2 or _G.AutoFarmNearest or AutoFarmChest or _G.AutoCarvender or _G.AutoTwinHook or AutoMobAura or _G.Tweenfruit or _G.TeleportNPC or _G.Leather or _G.Auto_Wing or _G.Umm or _G.Makori_gay or Radioactive or Fish or Gunpowder or Dragon_Scale or Cocoafarm or Scrap or MiniHee or _G.AutoFarmSeabaest or Auto_Cursed_Dual_Katana or _G.AutoFarmMob or _G.AutoMysticIsland or _G.AutoFarmDungeon or _G.AutoRaidPirate or _G.AutoQuestRace or _G.TweenMGear or getgenv().AutoFarm or _G.AutoPlayerHunter or _G.AutoFactory or Grab_Chest or _G.Namfon or _G.AutoSwordMastery or _G.Auto_Seabest or _G.AutoSeaBest or _G.AutoKillTial or _G.Auto_Saber or _G.Position_Spawn or _G.Farmfast or _G.AutoRace or _G.RaidPirate == true then
                if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    local Noclip = Instance.new("BodyVelocity")
                    Noclip.Name = "BodyClip"
                    Noclip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                    Noclip.MaxForce = Vector3.new(100000,100000,100000)
                    Noclip.Velocity = Vector3.new(0,0,0)
                end
            end
        end
    end)
end)

spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if _G.AutoVampire or AutoFarmChest or _G.AutoAdvanceDungeon or _G.AutoDoughtBoss or _G.Auto_DungeonMobAura or _G.AutoFarmChest or _G.AutoFactory or _G.AutoFarmBossHallow or _G.AutoFarmSwanGlasses or _G.AutoLongSword or _G.AutoBlackSpikeycoat or _G.AutoElectricClaw or _G.AutoFarmGunMastery or _G.AutoHolyTorch or _G.AutoLawRaid or _G.AutoFarmBoss or _G.AutoTwinHooks or _G.AutoOpenSwanDoor or _G.AutoDragon_Trident or _G.AutoSaber or _G.NOCLIP or _G.AutoFarmFruitMastery or _G.AutoFarmGunMastery or _G.TeleportIsland or _G.Auto_EvoRace or _G.AutoFarmAllMsBypassType or _G.AutoObservationv2 or _G.AutoMusketeerHat or _G.AutoEctoplasm or _G.AutoRengoku or _G.Auto_Rainbow_Haki or _G.AutoObservation or _G.AutoDarkDagger or _G.Safe_Mode or _G.MasteryFruit or _G.AutoBudySword or _G.AutoOderSword or _G.AutoBounty or _G.AutoAllBoss or _G.Auto_Bounty or _G.AutoSharkman or _G.Auto_Mastery_Fruit or _G.Auto_Mastery_Gun or _G.Auto_Dungeon or _G.Auto_Cavender or _G.Auto_Pole or _G.Auto_Kill_Ply or _G.Auto_Factory or _G.AutoSecondSea or _G.TeleportPly or _G.AutoBartilo or _G.Auto_DarkBoss or _G.GrabChest or _G.AutoFarmBounty or _G.Holy_Torch or _G.AutoFarm or _G.Clip or _G.AutoElitehunter or _G.AutoThirdSea or _G.Auto_Bone or _G.Autoheart or _G.Autodoughking or _G.AutoFarmMaterial or _G.AutoNevaSoulGuitar or _G.Auto_Dragon_Trident or _G.Autotushita or _G.Autowaden or _G.Autogay or _G.Autopole or _G.Autosaw or _G.AutoObservationHakiV2 or _G.AutoFarmNearest or _G.AutoCarvender or _G.AutoTwinHook or AutoMobAura or _G.Tweenfruit or _G.TeleportNPC or _G.AutoKai or _G.Leather or _G.Auto_Wing or _G.Umm or _G.Makori_gay or Radioactive or Fish or Gunpowder or Dragon_Scale or Cocoafarm or Scrap or MiniHee or _G.AutoFarmSeabaest or Auto_Cursed_Dual_Katana or _G.AutoFarmMob or _G.AutoMysticIsland or _G.AutoFarmDungeon or _G.AutoRaidPirate or _G.AutoQuestRace or _G.TweenMGear or getgenv().AutoFarm or _G.AutoPlayerHunter or _G.AutoFactory or _G.Namfon or _G.AutoSwordMastery or _G.Auto_Seabest or _G.AutoSeaBest or _G.AutoKillTial or _G.Auto_Saber or _G.Position_Spawn or _G.TPB or _G.Farmfast or _G.AutoRace or _G.RaidPirate == true then
                for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false    
                    end
                end
            end
        end)
    end)
end)

function InstancePos(pos)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
end

function TP3(pos)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
end

spawn(function()
    while wait() do
        if _G.AutoDoughtBoss or _G.Auto_DungeonMobAura or _G.AutoFarmChest or _G.AutoFarmBossHallow or _G.AutoFactory or _G.AutoFarmSwanGlasses or _G.AutoLongSword or _G.AutoBlackSpikeycoat or _G.AutoElectricClaw or _G.AutoFarmGunMastery or _G.AutoHolyTorch or _G.AutoLawRaid or _G.AutoFarmBoss or _G.AutoTwinHooks or _G.AutoOpenSwanDoor or _G.AutoDragon_Trident or _G.AutoSaber or _G.NOCLIP or _G.AutoFarmFruitMastery or _G.AutoFarmGunMastery or _G.TeleportIsland or _G.Auto_EvoRace or _G.AutoFarmAllMsBypassType or _G.AutoObservationv2 or _G.AutoMusketeerHat or _G.AutoEctoplasm or _G.AutoRengoku or _G.Auto_Rainbow_Haki or _G.AutoObservation or _G.AutoDarkDagger or _G.Safe_Mode or _G.MasteryFruit or _G.AutoBudySword or _G.AutoOderSword or _G.AutoAllBoss or _G.Auto_Bounty or _G.AutoSharkman or _G.Auto_Mastery_Fruit or _G.Auto_Mastery_Gun or _G.Auto_Dungeon or _G.Auto_Cavender or _G.Auto_Pole or _G.Auto_Kill_Ply or _G.Auto_Factory or _G.AutoSecondSea or _G.TeleportPly or _G.AutoBartilo or _G.Auto_DarkBoss or _G.AutoFarm or _G.Clip or _G.AutoElitehunter or _G.AutoThirdSea or _G.Auto_Bone or _G.Autoheart or _G.Autodoughking or _G.d or _G.Autowaden or _G.Autogay or _G.AutoObservationHakiV2 or _G.AutoFarmMaterial or _G.AutoFarmNearest or _G.AutoCarvender or _G.AutoTwinHook or AutoMobAura or _G.Leather or _G.Auto_Wing or _G.Umm or _G.Makori_gay or Radioactive or Fish or Gunpowder or Dragon_Scale or Cocoafarm or Scrap or MiniHee or _G.AutoFarmSeabaest or Auto_Cursed_Dual_Katana or _G.AutoFarmMob or _G.AutoRaidPirate or getgenv().AutoFarm or _G.AutoPlayerHunter or _G.AutoFactory or _G.AttackDummy or _G.AutoSwordMastery or _G.Auto_Seabest or _G.AutoSeaBest or _G.AutoKillTial or _G.Auto_Saber or _G.Farmfast or _G.RaidPirate == true then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken",true)
            end)
        end    
    end
end)

spawn(function()
game:GetService("RunService").RenderStepped:Connect(function()
    if _G.AutoClick or Fastattack then
         pcall(function()
            game:GetService'VirtualUser':CaptureController()
            game:GetService'VirtualUser':Button1Down(Vector2.new(0,1,0,1))
        end)
    end
end)
end)

function StopTween(target)
    if not target then
        _G.StopTween = true
        wait()
        topos(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        wait()
        if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
        end
        _G.StopTween = false
        _G.Clip = false
    end
end

spawn(function()
    pcall(function()
        while wait() do
            for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do  
                if v:IsA("Tool") then
                    if v:FindFirstChild("RemoteFunctionShoot") then 
                        SelectWeaponGun = v.Name
                    end
                end
            end
        end
    end)
end)

game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)


--------Djtconme----------
-- Generated using RoadToGlory's Converter v1.1 (RoadToGlory#9879)

-- Instances:

local Converted = {
	["_ScreenGui"] = Instance.new("ScreenGui");
	["_Frame"] = Instance.new("Frame");
	["_Frame1"] = Instance.new("Frame");
	["_UICorner"] = Instance.new("UICorner");
	["_NightLogo"] = Instance.new("ImageLabel");
	["_UICorner1"] = Instance.new("UICorner");
	["_Frame2"] = Instance.new("Frame");
	["_UICorner2"] = Instance.new("UICorner");
	["_Time"] = Instance.new("TextLabel");
	["_TextLabel"] = Instance.new("TextLabel");
	["_Frame3"] = Instance.new("Frame");
	["_UICorner3"] = Instance.new("UICorner");
	["_Frame4"] = Instance.new("Frame");
	["_UICorner4"] = Instance.new("UICorner");
	["_Stop"] = Instance.new("TextButton");
	["_UICorner5"] = Instance.new("UICorner");
	["_Frame5"] = Instance.new("Frame");
	["_UICorner6"] = Instance.new("UICorner");
	["_Start"] = Instance.new("TextButton");
	["_UICorner7"] = Instance.new("UICorner");
	["_UICorner8"] = Instance.new("UICorner");
	["_Frame6"] = Instance.new("Frame");
	["_UICorner9"] = Instance.new("UICorner");
	["_TextLabel1"] = Instance.new("TextLabel");
	["_UICorner10"] = Instance.new("UICorner");
	["_Frame7"] = Instance.new("Frame");
	["_UICorner11"] = Instance.new("UICorner");
	["_NightLogo1"] = Instance.new("ImageLabel");
	["_UICorner12"] = Instance.new("UICorner");
	["_TextLabel2"] = Instance.new("TextLabel");
	["_UICorner13"] = Instance.new("UICorner");
}

-- Properties:

Converted["_ScreenGui"].Parent = game:GetService("CoreGui")

Converted["_Frame"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Frame"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Frame"].BorderSizePixel = 0
Converted["_Frame"].Position = UDim2.new(0.228360951, 0, 0.333333343, 0)
Converted["_Frame"].Size = UDim2.new(0, 362, 0, 173)
Converted["_Frame"].Parent = Converted["_ScreenGui"]
Converted["_Frame"].Active = true
Converted["_Frame"].Draggable = true
Converted["_Frame"].Visible = true

Converted["_Frame1"].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Frame1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Frame1"].BorderSizePixel = 0
Converted["_Frame1"].Position = UDim2.new(0.00821917783, 0, 0.0159820374, 0)
Converted["_Frame1"].Size = UDim2.new(0, 356, 0, 167)
Converted["_Frame1"].Parent = Converted["_Frame"]

Converted["_UICorner"].Parent = Converted["_Frame1"]

Converted["_NightLogo"].Image = "rbxassetid://15033356012"
Converted["_NightLogo"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_NightLogo"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_NightLogo"].BorderSizePixel = 0
Converted["_NightLogo"].Position = UDim2.new(0.0337078646, 0, 0.107784428, 0)
Converted["_NightLogo"].Size = UDim2.new(0, 90, 0, 90)
Converted["_NightLogo"].Name = "NightLogo"
Converted["_NightLogo"].Parent = Converted["_Frame1"]

Converted["_UICorner1"].Parent = Converted["_NightLogo"]

Converted["_Frame2"].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Frame2"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Frame2"].BorderSizePixel = 0
Converted["_Frame2"].Position = UDim2.new(0.351123601, 0, 0.0479041934, 0)
Converted["_Frame2"].Size = UDim2.new(0, 222, 0, 110)
Converted["_Frame2"].Parent = Converted["_Frame1"]

Converted["_UICorner2"].Parent = Converted["_Frame2"]

Converted["_Time"].Font = Enum.Font.SourceSansBold
Converted["_Time"].Text = "Time :"
Converted["_Time"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Time"].TextSize = 14
Converted["_Time"].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Time"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Time"].BorderSizePixel = 0
Converted["_Time"].Position = UDim2.new(0.103603601, 0, 0.145454541, 0)
Converted["_Time"].Size = UDim2.new(0, 175, 0, 40)
Converted["_Time"].Name = "Time"
Converted["_Time"].Parent = Converted["_Frame2"]
function UpdateTime()
    local GameTime = math.floor(workspace.DistributedGameTime+0.5)
    local Hour = math.floor(GameTime/(60^2))%24
    local Minute = math.floor(GameTime/(60^1))%60
    local Second = math.floor(GameTime/(60^0))%60
    Converted["_Time"].Text = "Hours : "..Hour.." Minute : "..Minute.." Second : "..Second
    end
    spawn(function()
    while task.wait() do
    pcall(function()
    UpdateTime()
    end)
    end
    end)

Converted["_TextLabel"].Font = Enum.Font.SourceSansBold
Converted["_TextLabel"].Text = "Earned :"
Converted["_TextLabel"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel"].TextSize = 14
Converted["_TextLabel"].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextLabel"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextLabel"].BorderSizePixel = 0
Converted["_TextLabel"].Position = UDim2.new(0.103603601, 0, 0.472727269, 0)
Converted["_TextLabel"].Size = UDim2.new(0, 175, 0, 40)
Converted["_TextLabel"].Parent = Converted["_Frame2"]


Converted["_Frame3"].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Frame3"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Frame3"].BorderSizePixel = 0
Converted["_Frame3"].Position = UDim2.new(0.0337078646, 0, 0.688622773, 0)
Converted["_Frame3"].Size = UDim2.new(0, 340, 0, 52)
Converted["_Frame3"].Parent = Converted["_Frame1"]

Converted["_UICorner3"].Parent = Converted["_Frame3"]

Converted["_Frame4"].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Frame4"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Frame4"].BorderSizePixel = 0
Converted["_Frame4"].Position = UDim2.new(0.0617647059, 0, 0.0769230798, 0)
Converted["_Frame4"].Size = UDim2.new(0, 120, 0, 43)
Converted["_Frame4"].Parent = Converted["_Frame3"]

Converted["_UICorner4"].Parent = Converted["_Frame4"]

Converted["_Stop"].Font = Enum.Font.SourceSansBold
Converted["_Stop"].Text = "Stop"
Converted["_Stop"].TextColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Stop"].TextSize = 14
Converted["_Stop"].BackgroundColor3 = Color3.fromRGB(220.00001728534698, 220.00001728534698, 220.00001728534698)
Converted["_Stop"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Stop"].BorderSizePixel = 0
Converted["_Stop"].Position = UDim2.new(-0.0166666675, 0, 0.0930232555, 0)
Converted["_Stop"].Size = UDim2.new(0, 122, 0, 34)
Converted["_Stop"].Name = "Stop"
Converted["_Stop"].Parent = Converted["_Frame4"]
Converted["_Stop"].MouseButton1Down:Connect(function()
    AllowRunService = false
    _G.SetupTeam = false
end)

Converted["_UICorner5"].Parent = Converted["_Stop"]

Converted["_Frame5"].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Frame5"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Frame5"].BorderSizePixel = 0
Converted["_Frame5"].Position = UDim2.new(0.579411745, 0, 0.0769230798, 0)
Converted["_Frame5"].Size = UDim2.new(0, 120, 0, 43)
Converted["_Frame5"].Parent = Converted["_Frame3"]

Converted["_UICorner6"].Parent = Converted["_Frame5"]

Converted["_Start"].Font = Enum.Font.SourceSansBold
Converted["_Start"].Text = "Start"
Converted["_Start"].TextColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Start"].TextSize = 14
Converted["_Start"].BackgroundColor3 = Color3.fromRGB(220.00001728534698, 220.00001728534698, 220.00001728534698)
Converted["_Start"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Start"].BorderSizePixel = 0
Converted["_Start"].Position = UDim2.new(-0.0166666675, 0, 0.0930232555, 0)
Converted["_Start"].Size = UDim2.new(0, 122, 0, 34)
Converted["_Start"].Name = "Start"
Converted["_Start"].Parent = Converted["_Frame5"]
Converted["_Start"].MouseButton1Down:Connect(function()
    AllowRunService = true
    _G.SetupTeam = true
end)

Converted["_UICorner7"].Parent = Converted["_Start"]

Converted["_UICorner8"].Parent = Converted["_Frame"]

Converted["_Frame6"].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Frame6"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Frame6"].BorderSizePixel = 0
Converted["_Frame6"].Position = UDim2.new(0.0432780832, 0, 0.102409638, 0)
Converted["_Frame6"].Size = UDim2.new(0, 363, 0, 40)
Converted["_Frame6"].Parent = Converted["_ScreenGui"]
Converted["_Frame6"].Visible = true
Converted["_Frame6"].Active = true
Converted["_Frame6"].Draggable = true

Converted["_UICorner9"].Parent = Converted["_Frame6"]

Converted["_TextLabel1"].Font = Enum.Font.SourceSansBold
Converted["_TextLabel1"].Text = "Your Beli : | Chest in server :"
Converted["_TextLabel1"].TextColor3 = Color3.fromRGB(0, 85.0000025331974, 255)
Converted["_TextLabel1"].TextSize = 14
Converted["_TextLabel1"].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextLabel1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextLabel1"].BorderSizePixel = 0
Converted["_TextLabel1"].Position = UDim2.new(0.0163043477, 0, 0.100000001, 0)
Converted["_TextLabel1"].Size = UDim2.new(0, 353, 0, 32)
Converted["_TextLabel1"].Parent = Converted["_Frame6"]
spawn(function()
    while wait() do
        pcall(function()
            local count10 = 0
            local count = 0
            for i,v in pairs(game.workspace:GetChildren()) do
                if string.find(v.Name,"Chest") and v:IsA("Part") then
                    count10 = count10 + 1
                end
            end
            Converted["_TextLabel1"].Text = "Your Beli :".." "..game:GetService("Players").LocalPlayer.Data.Beli.Value.." | ".." Chest in server :".." "..count10
        end)
    end
end)

Converted["_UICorner10"].Parent = Converted["_TextLabel1"]

spawn(function()
	while task.wait() do
	if _G.SetupTeam then
			local ohString1 = "SetTeam"
			local ohString2 = "Pirates"
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(ohString1, ohString2)
    end
	end
	end)
    
    function thisCode()
        repeat task.wait() until game:IsLoaded()
        local PlaceID = game.PlaceId
        local AllIDs = {}
        local foundAnything = ""
        local actualHour = os.date("!*t").hour
        local Deleted = false
        local File = pcall(function()
            AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
        end)
        if not File then
            table.insert(AllIDs, actualHour)
            writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
        end
        function TPReturner()
            local Site;
            if foundAnything == "" then
                Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
            else
                Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
            end
            local ID = ""
            if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
                foundAnything = Site.nextPageCursor
            end
            local num = 0;
            for i,v in pairs(Site.data) do
                local Possible = true
                ID = tostring(v.id)
                if tonumber(v.maxPlayers) > tonumber(v.playing) then
                    for _,Existing in pairs(AllIDs) do
                        if num ~= 0 then
                            if ID == tostring(Existing) then
                                Possible = false
                            end
                        else
                            if tonumber(actualHour) ~= tonumber(Existing) then
                                local delFile = pcall(function()
                                    delfile("NotSameServers.json")
                                    AllIDs = {}
                                    table.insert(AllIDs, actualHour)
                                end)
                            end
                        end
                        num = num + 1
                    end
                    if Possible == true then
                        table.insert(AllIDs, ID)
                        wait()
                        pcall(function()
                            writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                            wait()
                            game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                        end)
                        wait(4)
                    end
                end
            end
        end
        function Teleport()
            while wait() do
                pcall(function()
                    TPReturner()
                    if foundAnything ~= "" then
                        TPReturner()
                    end
                end)
            end
        end
        local veryImportantWaitTime = 0.5
        task.spawn(function()
            while task.wait(veryImportantWaitTime) do
                pcall(function()
                    for i,v in pairs(game.CoreGui:GetDescendants()) do
                        pcall(function()
                            if string.find(v.Name,"ErrorMessage") then
                                if string.find(v.Text,"Security kick") then
                                    veryImportantWaitTime = 1e9
                                    Teleport()
                                end
                            end
                        end)
                    end
                end)
            end
        end)
        local AllowRunServiceBind = Instance.new("BindableFunction")
        function AllowRunServiceBind.OnInvoke(args)
            if args == "Enable" then
                AllowRunService = true
            elseif args == "Disable" then
                AllowRunService = false
            end
            local CoreGui = game:GetService("StarterGui")
            CoreGui:SetCore("SendNotification", {
                Title = "Night Hub",
                Text = "Night Hub Auto Chest Version 2 is best Script!!!",
                Duration = math.huge,
                Callback = AllowRunServiceBind,
            })
        end
    
        local CoreGui = game:GetService("StarterGui")
        CoreGui:SetCore("SendNotification", {
            Title = "Night Hub",
            Text = "Night Hub Auto Chest Version 2 is best Script!!!",
            Duration = math.huge,
            Callback = AllowRunServiceBind,
        })
        
        task.spawn(function()
            while true do
                if AllowRunService == true then
                    local hasChar = game.Players.LocalPlayer:FindFirstChild("Character")
                    if not game.Players.LocalPlayer.Character then
            
                    else
                        local hasCrewTag = game.Players.LocalPlayer.Character:FindFirstChild("CrewBBG",true)
                        if hasCrewTag then hasCrewTag:Destroy() end
                        local hasHumanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
                        if hasHumanoid then
                            local Chest = game.Workspace:FindFirstChild("Chest4") or game.Workspace:FindFirstChild("Chest3") or game.Workspace:FindFirstChild("Chest2") or game.Workspace:FindFirstChild("Chest1") or game.Workspace:FindFirstChild("Chest")
                            
                            if Chest then
                                game.Players.LocalPlayer.Character:PivotTo(Chest:GetPivot())
                                firesignal(Chest.Touched,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            else
                                Teleport()
                                break
                            end
                        end 
                    end
                end
                task.wait()
            end
        end)
    end

    spawn(function()
        while wait() do
        for i,v in pairs(game.Players:GetPlayers()) do
            if v.Name == "red_game43" or v.Name == "rip_indra" or v.Name == "Axiore" or v.Name == "Polkster" or v.Name == "wenlocktoad" or v.Name == "Daigrock" or v.Name == "toilamvidamme" or v.Name == "oofficialnoobie" or v.Name == "Uzoth" or v.Name == "Azarth" or v.Name == "arlthmetic" or v.Name == "Death_King" or v.Name == "Lunoven" or v.Name == "TheGreateAced" or v.Name == "rip_fud" or v.Name == "drip_mama" or v.Name == "layandikit12" or v.Name == "Hingoi" then
                Hop()
                end
            end
        end
    end)

    spawn(function()
        while wait() do
        if _G.StopChest then
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") or game.Players.LocalPlayer.Character:FindFirstChild("Fist of Darkness") or game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice") then
                AllowRunService = false
                _G.SetupTeam = false
                end
            end
        end
    end)

    thisCode()

    join = game.Players.localPlayer.Neutral == false
    if _G.Team == nil then
        _G.Team = "Pirates"
    end
    _G.Team = "Marines"
    if (_G.Team == "Pirates" or _G.Team == "Marines") and not join then
        repeat wait()
            pcall(function()
                join = game.Players.localPlayer.Neutral == false
                if _G.Team == "Pirates" then
                    for i,v in pairs({"MouseButton1Click", "MouseButton1Down", "Activated"}) do
                        for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton[v])) do
                            v.Function()
                        end
                    end
                elseif _G.Team == "Marines" then
                    for i,v in pairs({"MouseButton1Click", "MouseButton1Down", "Activated"}) do
                        for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton[v])) do
                            v.Function()
                        end
                    end
                else
                    for i,v in pairs({"MouseButton1Click", "MouseButton1Down", "Activated"}) do
                        for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton[v])) do
                            v.Function()
                        end
                    end
                end
            end)
        until join == true
        game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Visible = true
    end