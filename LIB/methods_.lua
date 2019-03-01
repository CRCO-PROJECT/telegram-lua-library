        https = require("ssl.https")
            http = require("socket.http")
    ltn12 = require("ltn12")
        bot_url = 'https://api.telegram.org/bot'
            URL = require("socket.url")
      encode_json = require("dkjson")
            decode_json  = require("lunajson")
  serpent = require('serpent')
  
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
         
        MAIN = {}
    MOD = {}
  UTI = {}
     CRCO = {}
     printRed = function(text)
        return "\027[00m\027[" ..color.red[1].. "m"..text.."\027[00m"
     end
        function vardump_2(value)
      
            print("\027[00m\027[" ..color.red[1].. "m"..serpent.block(value,{comment=false}).."\027[00m")
        end
        function vardump(value)

            print("\027[00m\027[" ..color.green[1].. "m"..serpent.block(value,{comment=false}).."\027[00m")
    
                end
                    MAIN.vardump = vardump
            local initialize = function(token)
            if token == "" then
                token = nil
            end


            MAIN.token = assert(token, printRed("No token specified!"))
              local bot_info = MAIN.getMe()
            if bot_info then
                    MAIN.id = bot_info.result.id
       MAIN.username = bot_info.result.username
    MAIN.first_name = bot_info.result.first_name
            end
            return MAIN, MOD
            end
  parameter = {'CRCO Starting'}
      local REQ=function(url)
          local data =  https.request(url)
            local tab = decode_json.decode(data)
            if tab.description then
        vardump_2(tab.description)
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
  assert(chat_id, printRed"Missing required variable chat_id")
  assert(reply_to_message_id, printRed"Missing required variable reply_to_message_id")
  assert(text, printRed"Missing required variable text")


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
              assert(user_id, printRed"Missing required variable user_id")
              assert(limit, printRed"Missing required variable limit")
              assert(offset, printRed"Missing required variable offset")

local url = bot_url..MAIN.token..'/getUserProfilePhotos?user_id='..user_id..'&offset='..offset..'&limit='..limit
return REQ(url)		

end
sendMedia =function(chat_id,media,msg_id)
assert(chat_id, printRed"Missing required variable chat_id")
assert(media, printRed"Missing required variable limit")
assert(msg_id, printRed"Missing required variable msg_id")
local url= bot_url..MAIN.token..'/sendMediaGroup?chat_id='..chat_id..'&media='..media..'&reply_to_message_id='..msg_id
return REQ(url)

end
GetUserProFilePhotos = function(number,user_id,chat_id,msg_id,capion_t,Markdown)
assert(chat_id, printRed"Missing required variable chat_id")
assert(number, printRed"Missing required variable number")
assert(user_id, printRed"Missing required variable user_id")


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
vardump(profilephotos)
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


sendDocumentPath = function(chat_id,ii,name,cap,markdown)
if markdown == 'md' or markdown == 'markdown' then
ps = 'Markdown'
elseif markdown == 'html' then
pss = 'HTML'
end
local send = bot_url..MAIN.token..'/sendDocument'
local curl_command = 'curl -s "'..send..'" -F "chat_id='..chat_id..'" -F "reply_to_message_id='..ii..'" -F "caption='..cap..'" -F "parse_mode='..ps..'" -F "document=@'..name..'"'
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
assert(chat_id, printRed"Missing required variable chat_id")
assert(message_id, printRed"Missing required variable message_id")
assert(text, printRed"Missing required variable text")
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
                                                file_name = file_name or 'CRCO'
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
                                MAIN.sendDocumentPath = sendDocumentPath
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
