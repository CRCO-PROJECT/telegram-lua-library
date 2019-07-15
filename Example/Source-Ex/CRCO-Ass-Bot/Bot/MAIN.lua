-- Main  
require "U-T.utils" 
MsgTime = os.time() - 10
client = require("redis")
  redis = client.connect('127.0.0.1', 6379)
        ---MULTY, PRE -- 
          MOD.getMessage_ = function (msg)
          if msg.chat.type == "private" then
            if not redis:sismember("Users",msg.on.chat_id) then
            redis:sadd("Users",msg.on.chat_id)
            end
          end
            if msg.date < tonumber(MsgTime) then
                   print('OLD MESSAGE')
                       return false
                           end
             
if msg.content.text == 'stats'  and is_sudo(msg.on.sender_userid) then
  local Users = redis:scard("Users")
  BOT.sendText(msg.on.chat_id,msg.on.id,  Users,"md")
end
if msg.content.text == '/start'  and is_sudo(msg.on.sender_userid) and msg.chat.type == "private"  then
  key = {}
                               key.inline_keyboard = {
                     {
                 {text = 'NEXT', callback_data="NEXT"}
                 }
             }
             res,status = http.request("http://api.obutts.ru/noise/"..math.random(1,999).."/"..math.random(1,100))
 
  local data = decode_json.decode(res)[math.random(1,100)]
   if data then 
      file =  'http://media.obutts.ru/' .. data.preview
        BOT.sendPhotoURL(msg.on.chat_id,msg.on.id,file,'ID : *'..data.id..'*','true',key,'md')
  else 
   
    BOT.sendText(msg.on.chat_id,msg.on.id,'Error 404 ,  try again'  ,"md")
  end
end
if msg.content.text == 'ping' then
  key = {}
     key.inline_keyboard = {
      {
{text = 'PING', callback_data="pong_1"}
    }
      }
BOT.sendInline(msg.on.chat_id,msg.on.sender_firstname,key, msg.on.id, 'md')
end

                           if msg.content.text == 'lev' and is_sudo(msg.on.sender_userid)   then
                            BOT.leaveChat(msg.on.chat_id)
                           end    
     end
     MOD.get_callback_query = function (msg)
      if msg.content.text == 'pong_1' then
        old_text = msg.content.old_text or ''
          new_text = msg.on.sender_firstname
            if not old_text:match('(.*)'..new_text..'(.*)') then
              text_t = 'PONG > '..msg.on.sender_firstname
                  local text = '\n'
                    BOT.Alert(msg.id,text_t)
                      local key = {}
                        key.inline_keyboard = {
    {
          {text = 'PING', callback_data="pong_1"}
      }
      }
              text = text..old_text ..'\n'..new_text
                 BOT.editMessageText(msg.on.chat_id,msg.on.id,text,key,'md')

                  else
              end
                   xt = 'Only once'
         BOT.Alert(msg.id,xt,true)
          end
      if msg.content.text == 'NEXT' then

        res,status = http.request("http://api.obutts.ru/noise/"..math.random(1,999).."/"..math.random(1,100))
        
         local data = decode_json.decode(res)[math.random(1,50)]
       if data then
     file =  'http://media.obutts.ru/' .. data.preview
       Array =   {  -- Array of InputMediaPhoto
                     type = "photo",
                     media = file,
                     caption = 'ID : *'..data.id..'*',
                     parse_mode = "Markdown"                                                                                        --Type input                                                                                           
       }                                                                                                                   
       key = {}
       key.inline_keyboard = {
{
{text = 'NEXT', callback_data="NEXT"}
}
}
     BOT.editMessageMedia(msg.on.chat_id,msg.on.id,Array,key)
     else
       BOT.Alert(msg.id,'Error 404 ! try again')
     end
     end
       
                  end
                      
                  
MOD.RUNING()
