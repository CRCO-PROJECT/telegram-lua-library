# Telegram-Bot - Beta
 Lua Library for the Telegram-API 

# installing

Install luarocks and : `git`, `lua5.2`, , `liblua` , `serpent` , `dkjson` , `lua-requests` , `lunajson` , `luasocket` , `ltn12` , `luasec` ,  `redis-lua`.


## Using : 
- Import `LUA-LIB.lua` into the bot.
- Call the functions.

See example script below.


```lua
 token = '' -- TOKEN
   local BOT, MOD = require("./LIB/LIB-LUA").initialize(token)
     MOD.getMessage_ = function (msg)
  if msg.content.text == 'ping' then
     key = {}
       key.inline_keyboard = {
      {
   {text = 'PING', callback_data="pong"}
     }
       }
        BOT.sendInline(msg.on.chat_id, 'PONG',key, msg.on.id, 'md')
end
         end
MOD.RUNING()
```





## CRCO - Amir Bagheri
