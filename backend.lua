-- Created by xvverr!
-- Inspired by Rouxhaver's "Hacker chat" script. Credits to him for the GUI.
-- Fucking skid, this is a private licensed script. If I discover you leaking it, you will suffer consequences.

a = "づトづ"
b = "゠タび"
c = "ぴぷび"
d = "ふくを"
e = "らタぴ"
f = "ユげタ"
g = "〜くせ"
h = "げくぴ"
i = "ゆゑせ"
j = "ぱッゑ"
k = "ガせゎ"
l = "やゑゎ"
m = "ほゑせ"
n = "くぴづ"
o = "ゑゎせ"
p = "アゝづ"
q = "しうゑ"
r = "くぴげ"
s = "ヿゟガ"
t = "エりゟ"
u = "タぴく"
v = "タふく"
w = "トゟガ"
x = "れゟト"
y = "をりぷ"
z = "げタく"

local whitelist = {
    "Pablo_YesaPI",
    "MissTheRage25",
    "amicoolenough331",
    "crossDaHeck",
}

function isUserWhitelisted()
    local playerName = game.Players.LocalPlayer.Name
    for _, username in ipairs(whitelist) do
        if username == playerName then
            return true
        end
    end
    return false
end

if not isUserWhitelisted() then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "HashChat"; Text = "Failed to load HashChat. You are not authorized."; Duration = 5;
    })
    return
end

function convert(str)
    str = str:lower()
    return str:gsub("a",a):gsub("b",b):gsub("c",c):gsub("d",d):gsub("e",e):gsub("f",f):gsub("g",g):gsub("h",h):gsub("i",i):gsub("j",j):gsub("k",k):gsub("l",l):gsub("m",m):gsub("n",n):gsub("o",o):gsub("p",p):gsub("q",q):gsub("r",r):gsub("s",s):gsub("t",t):gsub("u",u):gsub("v",v):gsub("w",w):gsub("x",x):gsub("y",y):gsub("z",z)
end

function unconvert(str)
    str = str:lower()
    return str:gsub(a,"a"):gsub(b,"b"):gsub(c,"c"):gsub(d,"d"):gsub(e,"e"):gsub(f,"f"):gsub(g,"g"):gsub(h,"h"):gsub(i,"i"):gsub(j,"j"):gsub(k,"k"):gsub(l,"l"):gsub(m,"m"):gsub(n,"n"):gsub(o,"o"):gsub(p,"p"):gsub(q,"q"):gsub(r,"r"):gsub(s,"s"):gsub(t,"t"):gsub(u,"u"):gsub(v,"v"):gsub(w,"w"):gsub(x,"x"):gsub(y,"y"):gsub(z,"z")
end

function chat(str)
    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(str,"All")
end

local player = game:GetService("Players").LocalPlayer

if not isUserWhitelisted() then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "HashChat"; Text = "Failed to load HashChat. You are not authorized."; Duration = 5;
    })
    return
end

local SG = Instance.new("ScreenGui", player.PlayerGui)
local frame = Instance.new("Frame", SG)
frame.Size = UDim2.new(0.2, 0, 0.2, 0)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.Position = UDim2.new(0.5, 0, 0.8, 0)
frame.Active = true
frame.Draggable = true
frame.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5) -- Grey background color

local textbox = Instance.new("TextBox", frame)
textbox.AnchorPoint = Vector2.new(0.5, 0.5)
textbox.Size = UDim2.new(0.95, 0, 0.65, 0)
textbox.Position = UDim2.new(0.5, 0, 0.6, 0)
textbox.TextScaled = true
textbox.BackgroundColor3 = Color3.new(1, 1, 1)
textbox.Text = "Text"
textbox.TextColor3 = Color3.new(0, 0, 0)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(0.3, 0, 0.3, 0)
title.TextScaled = true
title.Text = "HashChat V1 FE"
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1, 1, 1)

local closebutton = Instance.new("TextButton", frame)
closebutton.Size = UDim2.new(0.15, 0, 0.25, 0)
closebutton.AnchorPoint = Vector2.new(1, 0)
closebutton.TextScaled = true
closebutton.BackgroundColor3 = Color3.new(1, 0, 0.0156863)
closebutton.Text = "X"
closebutton.Position = UDim2.new(1, 0, 0, 0)
closebutton.TextColor3 = Color3.new(1, 1, 1)

local ui = Instance.new("UIAspectRatioConstraint", frame)
ui.AspectRatio = 4

closebutton.MouseButton1Up:Connect(function()
    SG:Destroy()
end)

textbox.FocusLost:Connect(function()
    if isUserWhitelisted() then
        chat("三" .. convert(textbox.Text))
    else
        warn("You are not authorized to send messages.")
    end
end)

player.PlayerGui.Chat.Frame.ChatChannelParentFrame.Frame_MessageLogDisplay.Scroller.ChildAdded:Connect(function(msg)
    wait(1)
    local message = msg.TextLabel.Text
    if message:match("三") then
        msg.TextLabel.TextColor3 = isUserWhitelisted() and Color3.new(0.5, 0.5, 0.5) or Color3.new(1, 1, 1)
        message = unconvert(message:gsub("三", ""))
        msg.TextLabel.Text = message
    end
end)

local Coregui = game:GetService("CoreGui")
if Coregui:FindFirstChild("BubbleChat") then
    Coregui.BubbleChat.DescendantAdded:Connect(function(bubble)
        wait(1)
        if bubble:IsA("TextLabel") then
            if bubble.Text:match("三") then
                bubble.Parent.BackgroundColor3 = isUserWhitelisted() and Color3.new(0.5, 0.5, 0.5) or Color3.new(1, 1, 1)
                bubble.Text = unconvert(bubble.Text:gsub("三", ""))
            end
        end
    end)
end

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "HashChat"; Text = "HashChat loaded successfully, enjoy!"; Duration = 5;
})
