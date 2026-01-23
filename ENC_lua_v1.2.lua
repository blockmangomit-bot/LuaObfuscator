-- ========================
-- LUA ENCODER v1.2
-- Lua Ob v1.2
-- ========================

info = ("This Version of Lua Ob is Security & Slow")
version = ("Lua Encoder v1.2")
credits = ("Credits: Endermite17, Gemini 3")

print(version)
print(info)
print(credits)

local function fast_encode(text)
    local t = {}
    for i = 1, #text do t[#t+1] = string.format("\\%03d", string.byte(text, i)) end
    return table.concat(t)
end

--put your source code here
local source = [[ 



]]

-- convert 
local dec_logic = "return function(s) return (s:gsub('\\\\(%d%d%d)', function(d) return string.char(tonumber(d)) end)) end"
local payload = fast_encode(source)
local dec_hex = fast_encode(dec_logic)

-- final result
local final_result = "load(load('" .. dec_hex .. "')()('" .. payload .. "'))()"

-- 3. Print to consle (anti-crash)
print("--- RESULT ---")
local chunk_size = 1000
for i = 1, #final_result, chunk_size do
    -- print in chunks to avoid crash
    print(final_result:sub(i, i + chunk_size - 1))
end
print("Thanks for using Lua Ob v1.2")