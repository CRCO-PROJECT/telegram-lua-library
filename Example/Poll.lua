 token = '' -- TOKEN
   local BOT, MOD = require("Telegram-Bot.LIB.telegram-bot").initialize(token)
     MOD.getMessage_ = function (msg)
  if msg.content.text == 'send poll'  then       
         options = {
    "TEST 1",
    "TEST 2" ,
  
      }
BOT.sendPoll(msg.on.chat_id,'CRCO Project',encode_json.encode(options),'true',msg.on.id)
end
 if msg.content.text == 'stop poll' then
              local text = '\n Answers : \n'
							for i,_ in pairs(msg.reply_to_message.poll.options) do
								 text = text..''..i..' > '..msg.reply_to_message.poll.options[i].text ..' Vote : '..msg.reply_to_message.poll.options[i].voter_count..'\n'
							  end
							   BOT.sendText(msg.on.chat_id,msg.on.id,'poll is cloesd :! \nstats : \npoll Question : '..msg.poll_question..''..text ,"md")
					  BOT.stopPoll(msg.on.chat_id,msg.on.reply_to_message_id,nil)
								  end
         end
MOD.RUNING()
