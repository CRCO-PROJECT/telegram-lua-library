    token = '' -- TOKEN
                local BOT, MOD = require("./LIB/telegram-bot").initialize(token)
                        MOD.getMessage_ = function (msg)
if msg.content.text == "ping"  then
        BOT.sendText(msg.on.chat_id,msg.on.reply_to_message_id,'`PONG`','md')
            end
end

        MOD.RUNING()
