  token = ' ' -- TOKEN
     BOT, MOD = require("Telegram-Bot.LIB.telegram-bot").initialize(token)
        MOD.getMessage_ = function (msg)
          if msg.content.text == 'newlink' then
            if BOT.exportChatInviteLink(msg.on.chat_id) then
                link = BOT.exportChatInviteLink(msg.on.chat_id).result  
                    text = 'New Link created\n '..link
                      else
              text = 'Bot Can't create or revoke link'
        end
  BOT.sendText(msg.on.chat_id,msg.on.id,text,'HTML')
      end
  MOD.RUNING()
