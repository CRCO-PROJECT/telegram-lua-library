    token = '' -- TOKEN
            local BOT, MOD = require("Telegram-Bot.LIB.telegram-bot").initialize(token)
                    MOD.getMessage_ = function (msg)
                    Array =   {  -- Array of InputMediaPhoto
                        {                                                                                                                   
                          caption = "`Name` : *Amir*",  -- Caption                                                                              
                          media = "AgADBAADxKcxG-DkFCl5Tkr2_ZKWkIJFoBoABErtTEpRwi7Ms1sHAAEC",   -- File id or url                                       
                          parse_mode = "Markdown",        --MarkDown                                                                                   
                          type = "photo"      --Type input                                                                                           
                        }                                                                                                                   
                      }    

    -- InputMediaVideo  > https://core.telegram.org/bots/api#inputmediavideo

    BOT.sendMedia(msg.on.chat_id,Array,msg.on.id)
end
end
    
            MOD.RUNING()
