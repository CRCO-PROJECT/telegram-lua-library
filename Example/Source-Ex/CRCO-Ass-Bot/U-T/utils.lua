--U-T
    local config = require "U-T.config" 
             BOT, MOD  = require("Telegram-Bot.LIB.telegram-bot").initialize(config.info.token)

                 function replace(value, del, find)
        del = del:gsub(
             "[%(%)%.%+%-%*%?%[%]%^%$%%]",
                    "%%%1"
 ) 
           find = find:gsub(
               "[%%]", 
                   "%%%%"
   ) 
    return string.gsub(
         value,
          del,
           find
    )
end
    function ec_name(names) 
        name = names
    if name then
        if name:match('_') then
            name = name:gsub('_','')
    end
             if name:match('*') then
            name = name:gsub('*','')
    end
        if name:match(']') then
            name = name:gsub(']','')
    end
                if name:match('[[(]]') then
        name = name:gsub('(','')
    end
        if name:match('[[)]]') then
            name = name:gsub(')','')
    end
        if name:match(']') then
        name = name:gsub(']','')
    end
                if name:match('`') then
            name = name:gsub('`','')
    end
                     return name
    end
end
  function is_sudo(user_id)
         local var = false
                for v,user in pairs(config.info.sudo_id) do
                     if user == user_id then
                         var = true
     end
         end
             return var
  end
    searchDirectory = function(directory)
            i = 0 
                list = {}
                    pop = io.popen
                 for files in pop('ls -a "'..directory..'"'):lines() do
             i = i + 1;
             list[i] = files
    end
         return list
      end
      
  local color = {
    black = {30, 40},
        red = {31, 41},
             green = {32, 42},
                  yellow = {33, 43},
                     blue = {34, 44},
                          magenta = {35, 45},
                             cyan = {36, 46},
                              white = {37, 47}
} 
 function ChangeToPersian(num)    
        local NUM = {
             ["0"] = "۰", ["1"] = "۱", ["2"] = "۲",
                ["3"] = "۳",
                    ["4"] = "۴",
                        ["5"] = "۵",
                            ["6"] = "۶",
                                ["7"] = "۷",
                                    ["8"] = "۸",
                                            ["9"] = "۹"
}
         return string.gsub (num, "%d",
                function(str) 
                    return NUM[str] or str end)    
    end  
    

function is_Banned(chat_id,user_id)
    local ui =  redis:sismember(config.info.botGET_..'BanUser:'..chat_id,user_id)
        if ui then
            return true
                else
                    return false
                        end
                end
                function is_GlobalyBanned(user_id)
                    local index =  redis:sismember(config.info.botGET_..'GlobalyBanned:',user_id)
                        if index then
                                return true
                            else
                                return false
        end
            end
            function is_Owner(chat_id,user_id)
                local WT = redis:sismember(config.info.botGET_..'Owner:Group'..chat_id,user_id)
                     if WT or is_sudo(user_id) then
                         return true
                              else
                                 return false
                             end
                         end
                function is_Mod(chat_id,user_id) 
                     local WW = redis:sismember(config.info.botGET_..'ModList:Group:'..chat_id,user_id)
                            if WW or is_sudo(user_id) or is_Owner(chat_id,user_id) then
                                return true
                             else
                      return false
       end
     end
    function VIP_USER(msg) 
            local MN = redis:sismember (botid..'Vip:Group'..msg.chat_id,msg.sender_user_id)
                 if MN or is_sudo(user_id) or is_Owner(chat_id,user_id) or is_Mod(chat_id,user_id) then
                     return true
                         else
                              return false
      end
    end