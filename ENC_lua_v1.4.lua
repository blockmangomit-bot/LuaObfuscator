-- ========================
-- LUA ENCODER v1.4
-- Lua Ob v1.4
-- ========================

info = ("       WHAT'S NEW          \n    + use fast encode \n    + auto copy to clipboard")
version = ("Lua Encoder v1.4")
credits = ("Credits: Endermite17\n")

print(version)
print(credits)
print(info)

local function fast_encode(text)
    local t = {}
    for i = 1, #text do t[#t+1] = string.format("\\%03d", string.byte(text, i)) end
    return table.concat(t)
end

--put your source code here
local source = [[
print("hello,world")
]]

-- convert 
local dec_logic = "return function(s) return (s:gsub('\\\\(%d%d%d)', function(d) return string.char(tonumber(d)) end)) end"
local payload = fast_encode(source)
local dec_hex = fast_encode(dec_logic)

-- final result
local final_result = "load(load('" .. dec_hex .. "')()('" .. payload .. "'))()"

--print final result to consle
print("==========RESULT==========")
print(final_result)

--copy to clipboard (windows 10 and up)
function CopyToClipboard()
    local cmd = "echo | set /p=\"" .. final_result .. "\" | clip"
    local status = os.execute(cmd)
    print("Successfuly copy to clipboard")
end


--copy to clipboard (Android)
function CopyToClipboard2()
    setclipboard(final_result)
    toclipboard(final_result)
    notifyMessage("Copy Succcessfuly")
end

print("Thanks for using Lua Ob v1.4")

CopyToClipboard() -- windows
CopyToClipboard2() -- android