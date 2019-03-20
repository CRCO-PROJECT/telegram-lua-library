# Telegram-Bot - 1.0.0.9
 Lua Library for the Telegram-API 

# installing

Install luarocks and : `git`, `lua5.2`, , `liblua` , `serpent` , `dkjson` , `lua-requests` , `lunajson` , `luasocket` , `ltn12` , `luasec` ,  `redis-lua`., `md5` , `xml`


## Using : 
- Import `telegram-bot.lua` into the bot.
- Call the functions.

See example script below.


```lua
 token = '' -- TOKEN
   local BOT, MOD = require("./LIB/telegram-bot").initialize(token)
     MOD.getMessage_ = function (msg)
  if msg.content.text == 'ping' then
  
        BOT.sendText(msg.on.chat_id,msg.on.id,"`PONG`",'md')
end
         end
MOD.RUNING()
```





## CRCO - Amir Bagheri
