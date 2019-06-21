--Function For CRCO API
--MPORTING 
  require("LIB.methods_")      
------------------------------------
---------RUN function-----------
  checkUpdate = function(result)
    if result then
  MOD.getupdatebot(result)
  end
 
   if result.message then
                 msg = result.message
  msg.content = {}
    msg.content.text = msg.text
  
        msg.content.caption = msg.caption
            msg.on = {}
                msg.on.chat_id = msg.chat.id
                    msg.on.sender_user_id = msg.from.id
                        msg.on.sender_user_name = msg.from.username
                            msg.on.sender_firstname = msg.from.first_name
                              msg.on.id = msg.message_id
          if msg.reply_to_message then
          msg.on.reply_to_message_id = msg.reply_to_message.message_id
              msg.on.chat_id = msg.reply_to_message.chat.id
                  msg.on.title = msg.reply_to_message.chat.title
                      msg.on.type = msg.reply_to_message.chat.type
                          msg.on.sender_user_id = msg.reply_to_message.from.id
                            msg.on.sender_user_name = msg.reply_to_message.from.username
                                msg.on.sender_firstname = msg.reply_to_message.from.first_name
                                    msg.on.sender_lastname = msg.reply_to_message.from.last_name or ''
          end
      msg.on.time = os.clock()
          MOD.getMessage_(msg)
          MAIN.vardump(msg)

        elseif result.edited_message then
          msg = result.edited_message
          msg.content = {}
          msg.content.text = msg.text
    msg.on = {}
    msg.on.id = msg.message_id
    msg.on.chat_id = msg.chat.id
    msg.on.title = msg.chat.title
        msg.on.type = msg.chat.type
            msg.on.sender_user_id = msg.from.id
              msg.on.sender_user_name = msg.from.username
                  msg.on.sender_firstname = msg.from.first_name
                      msg.on.sender_lastname = msg.from.last_name or ''
          MOD.getMessage_(msg)
        
        elseif result.callback_query then
        data = result.callback_query

         data.content = {}
           data.content.text = data.data
               data.on = {}
                       if data.message and data.message.reply_to_message then
                       data.on.id = data.message.message_id

                       data.content.old_text = data.message.text
                             data.reply_on_id = data.message.reply_to_message.message_id
                                    data.on.reply_sender_firstname = data.message.reply_to_message.from.first_name 
                         data.on.reply_sender_username = data.message.reply_to_message.from.username
                                data.on.reply_sender_lastname = data.message.reply_to_message.from.last_name or ''
                                  data.on.reply_sender_user_id = data.message.reply_to_message.from.id
                                     data.on.reply_chat_id = data.message.reply_to_message.chat.id
                                        data.on.reply_chat_title = data.message.reply_to_message.chat.title
                                          data.on.reply_chat_type = data.message.reply_to_message.chat.type                    
                                          data.on.reply_user_type = data.message.reply_to_message.from.is_bot or 'Typeuser'
                                              data.on.user_code = data.message.reply_to_message.from.language_code


                       end
              data.on.sender_firstname = data.from.first_name
                  data.on.sender_username = data.from.username
                        data.on.sender_lastname = data.from.last_name or ''
                        data.on.sender_user_id = data.from.id
                 if data.message then
                 data.on.chat_id = data.message.chat.id
                      data.on.chat_title = data.message.chat.title
                      data.on.user_code = data.message.from.language_code
                      data.on.chat_type = data.message.chat.type                    
    end  
                   MOD.get_callback_query(data)
                                    MAIN.vardump(data)

         elseif result.inline_query then
           rr = result.inline_query
              rr.content = {}
                 rr.content.text = rr.query
                       MOD.get_inline_query(rr)
                         MAIN.vardump(rr)
                                  else
                                      MOD.unget_message_(result)
                                  end
                    end
              print(encode_json.encode(parameter, { indent = false }))
--AmirBagheri --CRCO
