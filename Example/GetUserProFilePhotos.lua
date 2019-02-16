    token = '' -- TOKEN
      MsgTime = os.time() - 5
            local BOT, MOD = require("./LIB/LIB-LUA").initialize(token)
                    MOD.getMessage_ = function (msg)
                if msg.content.text == 'me' then
    BOT.GetUserProFilePhotos(3,msg.from.id,msg.chat.id,msg.message_id,'`Name` : *'..msg.on.sender_firstname..'*','Markdown') 
end
        end
            MOD.RUNING()
