
 require("Telegram-Bot.LIB.LIB-LUA")   
local RUNING = function(update_id,limit, timeout)
    while true do 
        timeout = timeout or 0
            limit = limit or 1 
                update_id = update_id or 0
                    updates = MAIN.getUpdate(update_id,limit,timeout)
                        if updates and updates.result then
                            for i=1, #updates.result do
                                    update = updates.result[i]
                                        update_id = update.update_id + 1

                                            MOD.checkUpdate(update)
                                    end
                        end
                end
        end

    MOD.RUNING = RUNING
        return CRCO
 
