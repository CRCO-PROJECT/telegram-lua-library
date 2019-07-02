  token = '' -- TOKEN
       local BOT, MOD = require("Telegram-Bot.LIB.telegram-bot").initialize(token)
            MOD.getMessage_ = function (msg)
    if msg.content.text == 'photo' then
    BOT.sendPhotoURL(msg.on.chat_id,msg.on.id,'http://s8.picofile.com/file/8312881426/photo_2017_09_19_11_51_39.jpg','*test*','md')

end
         end
                MOD.RUNING()
