
--[[
-- =================================
-- LUA OBFUSCATOR & DECODER
-- =================================
Lua Ob Version 1.1
Credits: Gemini, Endemite17
*run in lua 5.1+
]]

info = ("This Version of Lua Ob is Security & Slow")
version = ("Lua Encoder v1.1")
credits = ("Credits: Endermite17, Gemini 3")

print(version)
print(credits)

local tool = {}

-- 1. Encode
function tool.encode(text)
    local output = ""
    for i = 1, #text do
        output = output .. "\\" .. string.format("%03d", string.byte(text, i))
    end
    -- Encode step 2
    local step1 = output
    local loader = "local _L = _G['\\108\\111\\097\\100']; _L(\"" .. step1 .. "\")()"
    
    -- Encode final layer
    local final = ""
    for i = 1, #loader do
        final = final .. "\\" .. string.format("%03d", string.byte(loader, i))
    end
    return "_G['\\108\\111\\097\\100'](\"" .. final .. "\")()"
end


--[[
    -- 2. Decode
    -- this function will decode product of obfuscation
    function tool.decode(obfuscated_str)
        -- Find the string
        local content = obfuscated_str:match('"(.-)"')
        if not content then return "Khong tim thay chuoi ma hoa!" end
        
        -- Convert ASCII return to characters
        local decoded = content:gsub("\\(%d%d%d)", function(d)
            return string.char(tonumber(d))
        end)
        return decoded
    end

    -- ==========================================
    -- write your code here to <my_code>
    -- ==========================================

    local my_code = [[
    print("Hello, World!")
    print("This is a test of the Lua obfuscator.")
    ]]
--[[
    print("--- [1] RESULT ENCODE ---")
    local code = tool.encode(my_code)
    print(code)

    x = ("First Layer Decoded\n")
    c = ("Second Layer Decoded\n")

    print("\n--- [2] FIRST CODE ---")
    local layer = tool.decode(code) -- Decode first layer
    print(x)
    print(layer)
    local source = tool.decode(layer) -- Decrypt inside layer
    print(c)
    print(source)
]]