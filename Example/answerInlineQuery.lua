  token = '' -- TOKEN
   BOT, MOD = require("./LIB/telegram-bot").initialize(token)
    MOD.get_inline_query = function (msg)
     if msg.content.text == 'pong' then
      keyboard = {}
          url = 'http://s8.picofile.com/file/8312881426/photo_2017_09_19_11_51_39.jpg'
            getupdate = {{}}
            getupdate[1].id = '0'
              getupdate[1].type = 'article'
                getupdate[1].description = 'This is test'
                  getupdate[1].title = 'SEND'
                      getupdate[1].message_text =  msg.from.first_name
                          getupdate[1].parse_mode = 'Markdown'
                            getupdate[1].reply_markup = keyboard
                      getupdate[1].thumb_url = url
                keyboard.inline_keyboard = {
            { 
          {
    text = 'PING', callback_data="pong"}

      }
    }
    BOT.answerInlineQuery(msg.id,getupdate)

      end
    end

    MOD.RUNING()
