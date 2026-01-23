--Credits: Endermite17
--Put to first line of your script to decode it

-- 1. This section is a decode function that has been encoded into an ASCII string.
local dec_func = "\102\117\110\099\116\105\111\110\040\115\041\032\114\101\116\117\114\110\032\040\115\058\103\115\117\098\040\034\092\092\040\037\100\037\100\037\100\041\034\044\032\102\117\110\099\116\105\111\110\040\100\041\032\114\101\116\117\114\110\032\115\116\114\105\110\103\046\099\104\097\114\040\116\111\110\117\109\098\101\114\040\100\041\041\032\101\110\100\041\041\032\101\110\100"

-- 2. This is your actual code (encrypted)
local my_secret_data = "\\112\\114\\105\\110\\116\\040\\034\\072\\101\\108\\108\\111\\034\\041 " --delete inside content and replace with your encrypted code

-- 3. Execution: Transform the string dec_func into a real function, then use it to decode the data.
load(load(dec_func)()(my_secret_data))()