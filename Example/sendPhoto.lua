
  token = '' -- TOKEN
     BOT, MOD = require("Telegram-Bot.LIB.telegram-bot").initialize(token)
        MOD.getMessage_ = function (msg)
          if msg.content.text == 'photo' then
            BOT.sendPhoto(msg.on.chat_id,msg.on.id,'./test.jpg','*test*','md')
    end
end
      MOD.RUNING()
