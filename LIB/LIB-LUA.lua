--Function For CRCO API
--MPORTING 
color = {
black = {30, 40},
red = {31, 41},
green = {32, 42},
yellow = {33, 43},
blue = {34, 44},
magenta = {35, 45},
cyan = {36, 46},
white = {37, 47}
}
      https = require("ssl.https")
          http = require("socket.http")
              ltn12 = require("ltn12")
                  bot_url = 'https://api.telegram.org/bot'
URL = require("socket.url")
                encode_json = require("dkjson")
                      decode_json  = require("lunajson")
            serpent = require('serpent')
                  requests = require('requests')

    MAIN = {}
      MOD = {}
            UTI = {}
          local CRCO = {}
      function vardump(value)
        print("\027[00m\027[" ..color.green[1].. "m"..serpent.block(value,{comment=false}).."\027[00m")
      end
        MAIN.vardump = vardump
      local initialize = function(token)
      if token == "" then
      token = nil
        end
            RUNQ = true

       MAIN.token = assert(token, "No token specified!")
             local bot_info = MAIN.getMe()
           if (bot_info) then
         MAIN.id = bot_info.result.id
                 MAIN.username = bot_info.result.username
              MAIN.first_name = bot_info.result.first_name
  end
  return MAIN, MOD
end
            parameter = {'CRCO Starting'}
                local REQ=function(url)
                    local dat, res = requests.get{url}
        local tab = decode_json.decode(dat.text)
          if tab.description then
            vardump(tab.description)
                  end
            return tab 

            end
 
    
 getUpdate = function(offset,limit, timeout)
       local url = bot_url..MAIN.token..'/getUpdates?timeout='..timeout
      if offset then
      url = url..'&offset='..offset..'&limit='..limit
    end
   return REQ(url)
        end
            getChat = function(chat_id)
                local url = bot_url..MAIN.token..'/getChat?chat_id='.. chat_id
    return REQ(url)			
    end
getMe = function()
    return REQ(bot_url..MAIN.token..'/getMe')
  end
            sendText = function(chat_id,reply_to_message_id,text, markdown)
                     local url = bot_url..MAIN.token..'/sendMessage?chat_id='..chat_id..'&text='..URL.escape(text)
                    if reply_to_message_id then
                        url = url..'&reply_to_message_id='..reply_to_message_id
                                 end
                           if markdown == 'md' or markdown == 'markdown' then
                                  url = url..'&parse_mode=Markdown'
                                   elseif markdown == 'html' then
                                        url = url..'&parse_mode=HTML'
                                              end
                                                    return REQ(url)

                  end
                        GetUserProFilePhoto = function(user_id, offset,limit)
  
      local url = bot_url..MAIN.token..'/getUserProfilePhotos?user_id='..user_id..'&offset='..offset..'&limit='..limit
      return REQ(url)		
    
    end
  sendMedia =function(chat_id,media,msg_id)
    local url= bot_url..MAIN.token..'/sendMediaGroup?chat_id='..chat_id..'&media='..media..'&reply_to_message_id='..msg_id
    return REQ(url)
  
    end
    GetUserProFilePhotos = function(number,user_id,chat_id,msg_id,capion_t,Markdown)
               local pro = GetUserProFilePhoto(user_id,0,number)
               GetArryPhotos = pro.result.photos
               profilephotos ={}
       if pro.result.total_count == 0 then
       sendText(chat_id,msg_id,"You don't have profile photo \n"..capion_t,'md')
           end
             if tonumber(number) > 3 then
        sendText(chat_id,msg_id,"photos must include 1–3 items \nBy CRCO\n"..capion_t,'md')
        end
        if tonumber(number) == 3 then
             for k,v in pairs(GetArryPhotos) do
        profilephotos[k] = {type = "photo",media = GetArryPhotos[k][number].file_id,caption = capion_t,parse_mode = Markdown}
            end
          elseif  tonumber(pro.result.total_count) == 2 or tonumber(number) == 2 then
        for k,v in pairs(GetArryPhotos) do
        profilephotos[k] = {type = "photo",media = GetArryPhotos[k][2].file_id,caption = capion_t,parse_mode = Markdown}
        end
      elseif  tonumber(pro.result.total_count) == 1 or tonumber(number) == 1 then
      for k,v in pairs(GetArryPhotos) do
      profilephotos[k] = {type = "photo",media = GetArryPhotos[k][1].file_id,caption = capion_t,parse_mode = Markdown}
            
          end
              end
        sendMedia(chat_id,encode_json.encode(profilephotos),msg_id)

  end


sendDocument = function(chat_id,name)
	local send = bot_url..MAIN.token..'/sendDocument'
	local curl_command = 'curl -s "'..send..'" -F "chat_id='..chat_id..'" -F "document=@'..name..'"'
	return io.popen(curl_command):read('*all')
end
exportChatInviteLink = function(chat_id)
   url = bot_url..MAIN.token..'/exportChatInviteLink?chat_id='..chat_id
  return REQ(url)
  end
  kickChatMember = function(chat_id,user_user)
    local url = bot_url..MAIN.token..'/kickChatMember?chat_id='..chat_id..'&user_id='..user_id
 return REQ(url)
  end 
  editInlineQuery =  function( message_id, text, keyboard,markdown)
    local Rep =  bot_url..MAIN.token.. '/editMessageText?&inline_message_id='..message_id..'&text=' .. URL.escape(text)
    if markdown == 'md' or markdown == 'markdown' then
    Rep = Rep..'&parse_mode=Markdown'
      elseif markdown == 'html' then
      Rep = Rep..'&parse_mode=HTML'
      end
    if keyboard then
    Rep=Rep..'&reply_markup='..URL.escape(encode_json.encode(keyboard))
     end
    return REQ(Rep)
     end
     
     editMessageText=  function(chat_id, message_id, text, keyboard, markdown)
            local url = bot_url..MAIN.token..'/editMessageText?chat_id='..chat_id ..'&message_id='..message_id..'&text='..URL.escape(text)
        if markdown then
               url = url.. '&parse_mode=Markdown'
                   end
                          url = url.. '&disable_web_page_preview=true'
                  if keyboard then
            url = url..'&reply_markup='..encode_json.encode(keyboard)
                  end
                      return REQ(url)
         end
unbanChatMember = function(chat_id,user_id)
                local url = bot_url..MAIN.token..'/unbanChatMember?chat_id='.. chat_id ..'&user_id='.. user_id
                    return REQ(url)		
                        end
                              function kickUser(chat_id,user_id)
                                     sec = kickChatMember(chat_id,user_id) 
                                      if sec then 
                                  unbanChatMember(chat_id, user_id)
                              return res
                                  end
                                      end
                              banUser = function(chat_id,user_id)
                              res = kickChatMember(chat_id,user_id)
                       return res
end
                       deleteMessage = function(chat_id, message_id)
                     local url = bot_url..MAIN.token..'/deletemessage?chat_id='..chat_id..'&message_id='..message_id
               return REQ(url)	
   end
                 restrictChatMember = function(
      chat_id,
        user_id,
    can_send_messages,
        can_sendmedia_messages,
       can_send_other_messages,
        can_add_webpagepreviews,
      untildate
  )
  url = bot_url..MAIN.token..'/restrictChatMember?chat_id='..chat_id..'&user_id='..user_id..'&can_send_messages='..can_send_messages..'&can_send_media_messages='..can_send_media_messages..'&can_send_other_messages='..can_send_other_messages..'&can_add_web_page_previews='..can_add_webpagepreviews..'&until_date='..untildate                                         
  return REQ(url)
  end
  promoteChatMember = function(chat_id,
      user_id,
        can_changeinfo,
          can_postmessages,
     can_editmessages,
        can_deletemessages,
        can_inviteusers,
          can_restrictmembers,
    can_pinmessages,
      can_promotemembers
  )
  url = bot_url..MAIN.token..'/promoteChatMember?chat_id='..chat_id..'&user_id='..user_id..'&can_change_info='..can_changeinfo..'&can_post_messages='..can_postmessages..'&can_edit_messages='..can_editmessages..'&can_delete_messages='..can_deletemessages..'&can_invite_users='..can_inviteusers..'&can_restrict_members='..can_restrictmembers..'&can_pin_messages='..can_pinmessages..'&can_promote_members='..can_promotemembers
  return REQ(url)
  end
round = function(num, numDecimalPlaces)
local mult = 10^(numDecimalPlaces or 0)
return math.floor(num * mult + 0.5) / mult
end
  conv_splitnumber = function(numberDecimal)
    if numberDecimal > 1000000 then
        numberDecimal = math.floor(numberDecimal) / 1000000
      numberDecimal = round(numberDecimal,1).."M"
    elseif numberDecimal > 1000 then
    numberDecimal = math.floor(numberDecimal) / 1000
    numberDecimal = round(numberDecimal,1).."K"
          else
      numberDecimal = numberDecimal
    end
  return numberDecimal
  end
markdown = function(caption)
      if string.find(caption,'#') then
         caption = string.gsub(caption,'#','')
    end
        if string.find(caption,'_') then
         caption = string.gsub(caption,'_','')
       end
          if string.find(caption,'*') then
        caption = string.gsub(caption,'*','')
    end
      if string.find(caption,'`') then
      caption = string.gsub(caption,'`','')
         end
          if string.find(caption,'&') then
           caption = string.gsub(caption,'&','')
    end
     if string.find(caption,'!') then
     caption = string.gsub(caption,'!','')
end
    local returncaption = caption
    return returncaption

end


  sendPhoto = function(chat_id, photo, caption)
  	local send = bot_url..MAIN.token..'/sendPhoto'
  	local curl_command = 'curl -s "'..send..'" -F "chat_id='..chat_id..'" -F "photo=@'..photo..'" -F "caption='..caption..'"'
  	return io.popen(curl_command):read('*all')
  end

answerInlineQuery = function (inline_query_id,getup)
vardump(getup)
Rep= bot_url..MAIN.token.. '/answerInlineQuery?inline_query_id=' .. inline_query_id ..'&results=' .. URL.escape(encode_json.encode(getup))..'&cache_time=' .. 1
return REQ(Rep)
      end
    
  Alert=function(msgidss, text, show_alert)
      local Rep = bot_url..MAIN.token..'/answerCallbackQuery?callback_query_id='..msgidss..'&text='..URL.escape(text)
         if show_alert then
           Rep = Rep..'&show_alert=true'
               end
             return REQ(Rep)
    end
  sendPhotoURL = function(chat_id, photo, caption)
        	local send = bot_url..MAIN.token..'/sendPhoto'
	local curl_command = 'curl -s "'..send..'" -F "chat_id='..chat_id..'" -F "photo='..photo..'" -F "caption='..caption..'"'
	return io.popen(curl_command):read('*all')
end
    sendVideo=function(chat_id,video,caption,supports_streaming)
	local send = bot_url..MAIN.token..'/sendVideo'
	local curl_command = 'curl -s "'..send..'" -F "chat_id='..chat_id..'" -F "video='..video..'" -F "caption='..caption..'" -F "supports_streaming='..supports_streaming..'"'
	return io.popen(curl_command):read('*all')
end
sendAudio=function(chat_id,audio,caption)
	local send = bot_url..MAIN.token..'/sendAudio'
	local curl_command = 'curl -s "'..send..'" -F "chat_id='..chat_id..'" -F "audio='..audio..'" -F "caption='..caption..'"'
	return io.popen(curl_command):read('*all')
end
    DownloadFile=function(url, file_name)
    print("Downloading To : "..url)
      local respbody = {}
  local options = {
url = url,
  sink = ltn12.sink.table(respbody),
      redirect = true
    }
  local response = nil
  if url:match('^https') then
  options.redirect = false
    response = {https.request(options)}
  else
    response = {http.request(options)}
  end
    local code = response[2]
    local headers = response[3]
      local status = response[4]
        if code ~= 200 then return nil end
    file_name = file_name or get_http_file_name(url, headers)
     local file_path = "./"..file_name
   print("Saved to: "..file_path)
      file = io.open(file_path, "w+")
      file:write(table.concat(respbody))
       file:close()
    return file_path
  end
      sendChatAction=function(chat_id, action)
  local url = bot_url..MAIN.token..'/sendChatAction?chat_id='..chat_id ..'&action='.. action
  return REQ(url)			
  end
getFile=function(file_id)
    local url = bot_url..MAIN.token..'/getFile?file_id='..file_id
    return REQ(url)			
end
sendInline=function(chat_id, text, keyboard,reply_to_message_id, markdown)
      local url = bot_url..MAIN.token.. '/sendMessage?chat_id=' .. chat_id
        if reply_to_message_id then
     url = url .. '&reply_to_message_id=' .. reply_to_message_id
      end
     if markdown == 'md' or markdown == 'markdown' then
      url = url..'&parse_mode=Markdown'
        elseif markdown == 'html' then
       url = url..'&parse_mode=HTML'
        end
   url = url..'&text='..URL.escape(text)
   url = url..'&disable_web_page_preview=true'
    url = url..'&reply_markup='..URL.escape(encode_json.encode(keyboard))
    return REQ(url)			
     end
      sendContact=function(chat_id, phone_number, first_name, last_name, reply_to_message_id, reply_markup, disable_notification)
    local url = bot_url..MAIN.token..'/sendContact?chat_id='.. chat_id ..'&phone_number='.. phone_number..'&first_name='.. first_name
  if last_name then
  url = url ..'&last_name='.. last_name
  end
    if reply_to_message_id then
    url = url..'&reply_to_message_id='.. reply_to_message_id
    end
    if disable_notification then
  url = url ..'&disable_notification=true'
    end
    if reply_markup then
    url = url..'&reply_markup='..URL.escape(encode_json.encode(reply_markup))
      end
  return REQ(url)			
      end
    sendLocation=function(chat_id, latitude, longitude, reply_to_message_id, reply_markup, disable_notification)
                                          local url = bot_url..MAIN.token ..'/sendLocation?chat_id='..chat_id..'&latitude='..latitude..'&longitude='..longitude
                          if reply_to_message_id then
                        url = url ..'&reply_to_message_id='..reply_to_message_id
  end
                      if disable_notification then
                          url = url..'&disable_notification=false'
                                                  end
                                            if reply_markup then
                                            url = url..'&reply_markup='..URL.escape(encode_json.encode(reply_markup))
                                  end
                      return REQ(url)			
                                   end
        ---updates 
                                   getupdatebot = function(result)
                                end
                  getMessage_= function(message)
                                    end
                        MOD.getMessage_ = getMessage_
                        get_callback_query = function(result)
                                  end
                                  get_inline_query = function(result)
                                end
                unget_message_ = function(message)
                    print("\027[00m\027[" ..color.red[1].. "mUnSupported Message\027[00m")

                   end
                   MAIN.sendAudio = sendAudio
                        MAIN.sendChatAction = sendChatAction
                          MAIN.sendContact = sendContact
                             MAIN.sendDocument = sendDocument
                              MAIN.sendInline = sendInline
                                MAIN.sendLocation = sendLocation
                                  MAIN.sendPhotoURL = sendPhotoURL
                                    MAIN.sendPhoto = sendPhoto
UTI.markdown = markdown
                  UTI.DownloadFile = DownloadFile
                   MAIN.answerInlineQuery = answerInlineQuery
                    UTI.conv_splitnumber = conv_splitnumber
                                CRCO.initialize = initialize
                         MAIN.getChat = getChat
                     MAIN.promoteChatMember = promoteChatMember
                    MAIN.restrictChatMember = restrictChatMember
                              MAIN.getMe = getMe
                           MAIN.deleteMessage = deleteMessage
                             MAIN.cleanchatlist = cleanchatlist
                       MAIN.Restrict = Restrict
                    MAIN.GetUserProFilePhotos = GetUserProFilePhotos
             MAIN.GetUserProFilePhoto = GetUserProFilePhoto
                   MAIN.Alert = Alert
   MAIN.getUpdate = getUpdate
  MAIN.editMessageText = editMessageText 
      MAIN.editInlineQuery = editInlineQuery
    MAIN.sendMedia = sendMedia
     MOD.getupdatebot = getupdatebot
        MAIN.sendText = sendText
                   MOD.get_callback_query = get_callback_query
                   MOD.get_inline_query = get_inline_query
                    MAIN.keyboardadd = keyboardadd
            MOD.unget_message_ = unget_message_
------------------------------------
---------RUN function-----------
  checkUpdate = function(result)
  --vardump(result)
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
        
--vardump(msg)
        elseif result.callback_query then
        data = result.callback_query

         data.content = {}
           data.content.text = data.data
               data.on = {}
                   data.on.id = data.message.message_id
                       if data.message.reply_to_message then
                     data.reply_on_id = data.message.reply_to_message.message_id
                     data.onreply_sender_firstname = data.message.reply_to_message.from.first_name 
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
                                    vardump(data)

  elseif result.inline_query then
  rr = result.inline_query
  rr.content = {}
           rr.content.text = rr.query
  MOD.get_inline_query(rr)
                  vardump(rr)


                                  else
                                      MOD.unget_message_(result)
    end
end
      local RUNING = function(update_id,limit, timeout)
      while RUNQ do
    timeout = timeout or 0
      limit = limit or 1 
    update_id = update_id or 0
    updates = MAIN.getUpdate(update_id,limit,timeout)
    if updates and updates.result then
      for val, update in pairs(updates.result) do
      checkUpdate(update)
    update_id = update.update_id + 1
                 end
             end
         end
    end
-----------------------------
      MOD.RUNING = RUNING
          local output = encode_json.encode(parameter, { indent = false })
            print(output)
return CRCO
---AmirBagheri --CRCO
