
  token = '' -- TOKEN
     BOT, MOD = require("Telegram-Bot.LIB.telegram-bot").initialize(token)
        MOD.getMessage_ = function (msg)
          if msg.content.text == 'photo' then
            BOT.sendPhoto(msg.on.chat_id,msg.on.id,'./test.jpg','*test*','md')
           
    end
     if msg.content.text == 'edit photo' then
        Array =   {  -- Array of InputMediaPhoto
                     type = "photo",
                     media = 'http://s8.picofile.com/file/8312881426/photo_2017_09_19_11_51_39.jpg',
                     caption = 'test',
                     parse_mode = "Markdown"                                                                                        --Type input                                                                                           
       }     
     key = {}
                               key.inline_keyboard = {
                     {
                 {text = 'OK', callback_data="_"}
                 }
             }
     BOT.editMessageMedia(msg.on.chat_id,msg.on.reply_to_message_id,Array,key)
           
    end
end
      MOD.RUNING()
