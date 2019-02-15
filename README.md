# Telegram-Bot
 Lua Library for the Telegram-API 

#installing

Install luarocks and : `git`, `lua5.2`, , `liblua` , `serpent` , `dkjson` , `lua-requests` , `lunajson` , `luasocket` , `ltn12` , `luasec` ,  `redis-lua`.


##Using : 
- Import `LUA-LIB.lua` into the bot.
- Call the functions.

See example script below.


```lua
 token = '' -- TOKEN
  MsgTime = os.time() - 5
   local BOT, MOD = require("./LIB/LIB-LUA").initialize(token)
     MOD.getMessage_ = function (msg)
       BOT.vardump(msg)
if tonumber(msg.date) < tonumber(MsgTime)    then
  print('OLD MESSAGE')
   return false
end
   text= msg.content.text
if text and text:match('^[/#!]') then
  text= text:gsub('^[/#!]','')
end
if msg.chat.type == "supergroup"  then ---BasedIF
    if text == "del" then
     BOT.deleteMessage(msg.on.chat_id, msg.on.reply_to_message_id)
      BOT.deleteMessage(msg.on.chat_id, msg.on.id)
  end 
  if text == 'ping' then
     local key = {}
       key.inline_keyboard = {
      {
   {text = 'PING', callback_data="pong"}
     }
       }
        BOT.sendInline(msg.on.chat_id, 'PONG',key, msg.on.id, 'md')
end
if text == 'id' then
     BOT.GetUserProFilePhotos(3,msg.from.id,msg.chat.id,msg.message_id,'`Name` : *'..msg.on.sender_firstname..'*','Markdown') 
       end
         end
           end
         MOD.get_callback_query = function (msg)
    if msg.content.text == 'pong' then
       text = 'PONG > '..msg.on.sender_firstname
        print(text)
         BOT.Alert(msg.id,text)
   BOT.editMessageText(msg.on.chat_id,msg.on.id,'ONLINE > '..msg.on.sender_firstname,nil,'md')
     end
        end
     MOD.get_inline_query = function (msg)
 if msg.content.text == 'crco' then
   keyboard = {}
     url = 'http://s8.picofile.com/file/8312881426/photo_2017_09_19_11_51_39.jpg'
       getupdate = {{}}
         getupdate[1].id = '0'
           getupdate[1].type = 'article'
             getupdate[1].description = 'This is test'
               getupdate[1].title = 'SEND IN GROUP'
            getupdate[1].message_text =  'Join To channel'
         getupdate[1].parse_mode = 'Markdown'
      getupdate[1].reply_markup = keyboard
   getupdate[1].thumb_url = url
  keyboard.inline_keyboard = {
    { 
    { 
      text = 'Channel', url = 't.me/crcochannel'
      }
  }
 }
     BOT.answerInlineQuery(msg.id,getupdate)
   end
 end
MOD.RUNING()
```





##CRCO - Amir Bagheri
