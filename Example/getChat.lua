         token = '' -- TOKEN
             local BOT, MOD = require("Telegram-Bot.LIB.telegram-bot").initialize(token)
                MOD.getMessage_ = function (msg)
     if msg.content.text == 'get chat' then
          BOT.getChat(msg.on.chat_id)
         
    end
         end
    MOD.RUNING()
--[[ result
 
{
  ok = true,
  result = {
    description = "CRCO",
    id = -1001418960037,
    photo = {
      big_file_id = "AQADBAATxYYpGwAESjbcmqW5Q6FmcwMAAQI",
      small_file_id = "AQADBAATxYYpGwAEPnb4YwHoUBlkcwMAAQI"
    },
    pinned_message = {
      chat = {
        id = -1001418960037,
        title = "CRCO",
        type = "supergroup"
      },
      date = 1553101848,
      from = {
        first_name = "Parzival",
        id = 603841307,
        is_bot = false,
        language_code = "fa",
        username = "ZendegiSefareshi"
      },
      message_id = 33,
      text = "CRCO PROJECT"
    },
    title = "CRCO",
    type = "supergroup"
  }
}

]]--
