local plr = game.Players.LocalPlayer.Character
local LobbySettnigs =
   {
       ["Difficulty"] = "Hard",
       ["PartyOnly"] = true,
       ["Hardcore"] = true,
       ["Location"] = "Underworld"
   }
game:GetService('RunService').Stepped:connect(function()
   game.Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid"):ChangeState(11)
end)
while wait() do
   if game.workspace:FindFirstChild("Lobby") then
       local _1 = "CreateLobby"
       local vent = game:GetService("ReplicatedStorage").Modules.Network.RemoteFunction
       vent:InvokeServer(_1, LobbySettnigs)
       wait(0.3)
       local A1 = "StartDungeon"
       local Even = game:GetService("ReplicatedStorage").Modules.Network.RemoteEvent
       Even:FireServer(A1)
   end
   for i,v in next, plr:GetChildren() do
       if v:IsA("Model") then
           for i2, v2 in next, game.workspace.Enemies:GetChildren() do
               if v2:FindFirstChild("Humanoid") and v2:FindFirstChild("HumanoidRootPart") then
                   repeat
                       plr.HumanoidRootPart.CFrame = v2.HumanoidRootPart.CFrame*CFrame.new(0,-10,0)
                       local A_1 = "WeaponDamage"
                       local A_2 = ""..v.Name..""
                       local A_3 = v2.Humanoid
                       local Event = game:GetService("ReplicatedStorage").Modules.Network.RemoteEvent
                       Event:FireServer(A_1, A_2, A_3)
                       wait()
                   until v2.Humanoid.Health == 0
               end
           end
       end
   end
end
