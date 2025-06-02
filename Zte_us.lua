
local a=loadstring(game:HttpGet"https://sirius.menu/rayfield")()


local b=game:GetService"ReplicatedStorage"
local c=game:GetService"StarterGui"
local d=game:GetService"Players"local e=

d.LocalPlayer


local f=b:WaitForChild"Events"
local g=f:WaitForChild"PlayerAttacked"
local h=f:WaitForChild"Death"


local i=false
local j=false


local function sendNotification(k,l,m)
c:SetCore("SendNotification",{
Title=k or"",
Text=l or"",
Duration=m or 5,
Button1="OK",
})
end

local function extractPlayerName(k)
local l=tostring(k)local
m, n, o=string.find(l,"^Players%.(.+)$")
return(o or l)
end


local k=a:CreateWindow{
Name="Zte us",
LoadingTitle="Loading GUI...",
LoadingSubtitle="Please wait",
ConfigurationSaving={
Enabled=true,
FolderName=nil,
FileName="Zte_Us"
},
KeySystem=false,
}

local l=k:CreateTab("Main",4483345998)

l:CreateToggle{
Name="Notify if imposter kill someone",
CurrentValue=false,
Callback=function(n)
i=n
end,
}

l:CreateToggle{
Name="Notify player die or join or left",
CurrentValue=false,
Callback=function(n)
j=n
end,
}


g.OnClientEvent:Connect(function(...)
if not i then return end
local n={...}
local o=n[1]
local p=extractPlayerName(o)
sendNotification(
"🚨 Player kill someone",
string.format("%s was kill someone!",p),
5
)
end)

h.OnClientEvent:Connect(function(...)
if not j then return end
local n={...}
local o=n[1]or"Unknown"
local p=extractPlayerName(o)
local q=n[2]
local r=n[3]
local s=n[4]
local t=(typeof(q)=="number"and typeof(r)=="number"and typeof(s)=="number")
and string.format("(%.1f, %.1f, %.1f)",q,r,s)
or"Unknow"
sendNotification(
"💀 Player Death (or join or left)",
string.format("%s has died at %s",p,t),
5
)
end)


sendNotification("Zte us","loaded!",5)
