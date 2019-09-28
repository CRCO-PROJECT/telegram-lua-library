--Function For CRCO API
--MPORTING 
  require("telegram-lua-library.LIB.methods_")      
------------------------------------
---------RUN function-----------
  MOD.checkUpdate = function(result)  --
    if result then

 
   if result.message then --
                 msg = result.message
  msg.content = {}
    msg.content.text = msg.text
    if msg.poll then
      msg.poll_id = msg.poll.id 
          msg.poll_closed = msg.poll.is_closed
                  msg.poll_question = msg.poll.question
      end
      if msg.new_chat_members or msg.left_chat_member or msg.new_chat_title or msg.new_chat_photo or msg.delete_chat_photo or msg.group_chat_created or msg.supergroup_chat_created or msg.channel_chat_created then
          msg.service = true
           else
            msg.service = false
        end
        if msg.left_chat_member then
msg.left_chat = {}
  msg.left_chat.userid = msg.left_chat_member.id
    msg.left_chat.username = msg.left_chat_member.username
          msg.left_chat.firstname = msg.left_chat_member.first_name
                msg.left_chat.lastname =  (msg.left_chat_member.last_name  or '' )
          end
          if msg.new_chat_member then 
            msg.new_user = {}
               msg.new_user.id = msg.new_chat_member.id
                 msg.new_user.username = msg.new_chat_member.username
                   msg.new_user.firstname = msg.new_chat_member.first_name
              msg.new_user.lastname =  (msg.new_chat_member.last_name  or '' )
         end 
        
        msg.content.caption = msg.caption
            msg.on = {}
            
                msg.on.chat_id = msg.chat.id
                if msg.from then
                    msg.on.sender_userid = msg.from.id
                        msg.on.sender_username = msg.from.username
                            msg.on.sender_firstname = msg.from.first_name
                            msg.on.sender_lastname = (msg.from.last_name or '' )

                end
                              msg.on.id = msg.message_id
                                if msg.forward_from then
                                  msg.forwarded_from = {}
                                   msg.forwarded_from.firstname = msg.forward_from.first_name
                                      msg.forwarded_from.userid = msg.forward_from.id
                                          msg.forwarded_from.lastname = (msg.forward_from.last_name or '' )
                                      
                                      end
                                      if msg.forward_from_chat and msg.forward_from_chat.type == 'channel' then
                                            msg.forwarded_from_channel = {}
                                                msg.forwarded_from_channel.id = msg.forward_from_chat.id
                                                 msg.forwarded_from_channel.msg_id = msg.forward_from_message_id
                                                   msg.forwarded_from_channel.signature = (msg.forward_signature or '' )
                                                       msg.forwarded_from_channel.title = msg.forward_from_chat.title
                                                       msg.forwarded_from_channel.username = msg.forward_from_chat.username
                                        end
                                        
          if msg.reply_to_message   then
          msg.on.reply_to_message_id = msg.reply_to_message.message_id
              msg.on.chat_id = msg.reply_to_message.chat.id
                  msg.on.title = msg.reply_to_message.chat.title
                      msg.on.type = msg.reply_to_message.chat.type
                      if  msg.reply_to_message.forward_from then
                         msg.forwarded_from = {}
                           msg.forwarded_from.id = msg.reply_to_message.forward_from.id
                                 msg.forwarded_from.firstname = msg.reply_to_message.forward_from.first_name
                                    msg.forwarded_from.lastname = (msg.reply_to_message.forward_from.last_name or '' )
                      end
                      
                          msg.on.reply_sender_userid = msg.reply_to_message.from.id
                            msg.on.reply_sender_username = msg.reply_to_message.from.username
                                msg.on.reply_sender_firstname = msg.reply_to_message.from.first_name
                                if msg.reply_to_message.poll then
                                msg.poll_id = msg.reply_to_message.poll.id 
                                msg.poll_closed = msg.reply_to_message.poll.is_closed
                                        msg.poll_question = msg.reply_to_message.poll.question
                                end
                                        msg.on.reply_sender_lastname = (msg.reply_to_message.from.last_name  or '' )
          
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
            msg.on.sender_userid = msg.from.id
              msg.on.sender_username = msg.from.username
                  msg.on.sender_firstname = msg.from.first_name
                      msg.on.sender_lastname = (msg.from.last_name or '' )
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
                                data.on.reply_sender_lastname = (data.message.reply_to_message.from.last_name or '' )
                                  data.on.reply_sender_userid = data.message.reply_to_message.from.id
                                     data.on.reply_chat_id = data.message.reply_to_message.chat.id
                                        data.on.reply_chatt_itle = data.message.reply_to_message.chat.title
                                          data.on.reply_chat_type = data.message.reply_to_message.chat.type                    
                                          data.on.reply_user_type = data.message.reply_to_message.from.is_bot or 'Typeuser'
                                              data.on.user_code = data.message.reply_to_message.from.language_code


                       end
              data.on.sender_firstname = data.from.first_name
                  data.on.sender_username = data.from.username
                        data.on.sender_lastname = (data.from.last_name  or '' )
                        data.on.sender_userid = data.from.id
                 if data.message then
                 data.on.chat_id = data.message.chat.id
                      data.on.chat_title = data.message.chat.title
                      data.on.user_code = data.message.from.language_code
                      data.on.chat_type = data.message.chat.type                    
    end  
    MAIN.vardump(data)

                   MOD.get_callback_query(data)

         elseif result.inline_query then
           QI = result.inline_query
              QI.content = {}
                 QI.content.text = rr.query
                       MOD.get_inline_query(QI)
                         MAIN.vardump(QI)
                                  else
                                      MOD.unget_message_(result)
                                  end
                    end
              print(encode_json.encode(parameter, { indent = false }))
--AmirBagheri --CRCO
