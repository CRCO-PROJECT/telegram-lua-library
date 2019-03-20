  token = '' -- TOKEN
       local BOT, MOD = require("./LIB/telegram-bot").initialize(token)
            MOD.getMessage_ = function (msg)
    if msg.content.text == 'mute user' then
      TIME = 1*60*60 -- TIME MUTEUSER -- HOUR
          send_message = 0
            send_media_messages = 0
                send_other_messages = 0
                  send_LINK  = 0
	                  	 BOT.restrictChatMember(msg.on.chat_id,msg.on.sender_user_id,send_message,send_media_messages,send_other_messages,send_LINK,tonumber(msg.date+TIME))
                           BOT.sendText(msg.on.chat_id,msg.on.id,"`DONE`",'md')
      end
         end
                MOD.RUNING()
