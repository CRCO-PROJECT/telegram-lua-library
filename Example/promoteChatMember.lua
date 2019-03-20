  token = '' -- TOKEN
       local BOT, MOD = require("./LIB/telegram-bot").initialize(token)
            MOD.getMessage_ = function (msg)
    if msg.content.text == 'promoteuser' then
    can_change_info = 0
    can_post_messages = 0
        can_edit_messages = 0
            can_delete_messages = 1
                can_invite_users = 1
            can_restrict_members = 1
        can_pin_messages =0
    can_promote_members = 0
	                  	 BOT.promoteChatMember(msg.on.chat_id,msg.on.sender_user_id,can_change_info,can_post_messages,can_edit_messages,can_delete_messages,can_invite_users,can_restrict_members,can_pin_messages,can_promote_members)
                           BOT.sendText(msg.on.chat_id,msg.on.id,"`DONE`",'md')
      end
         end
                MOD.RUNING()
