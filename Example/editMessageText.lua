token = '  ' -- TOKEN
 BOT, MOD = require("./LIB/telegram-bot").initialize(token)
  MOD.get_callback_query = function (msg)
      if msg.content.text == 'pong' then
          old_text = msg.content.old_text 
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
                end
                    
                    end 
                    
                    
MOD.RUNING()
