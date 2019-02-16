  token = '' -- TOKEN
     BOT, MOD = require("./LIB/telegram-bot").initialize(token)
        MOD.getMessage_ = function (msg)
          if msg.content.text == 'file' then
            BOT.sendDocumentPath(msg.on.chat_id,msg.on.id,'test.txt','*test*','md')
    end
end
      MOD.RUNING()
