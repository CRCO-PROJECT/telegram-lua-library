 token = '' -- TOKEN
 BOT, MOD = require("./LIB/telegram-bot").initialize(token)
 MOD.get_callback_query = function (msg)
     if msg.content.text == 'pong' then
         BOT.Alert(msg.id,'pong')
           key = {}
                 key.inline_keyboard = {
     {
           {text = 'PING', callback_data="pong"}
       }
       }
         BOT.editInlineQuery(msg.on.id, 'PONG', key,'md')

               end                       
                   end 
                   MOD.RUNING()
