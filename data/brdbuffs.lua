windower.register_event('chat message', function(message,sender,mode,gm)
 
    --Ignore it if it's not party chat or a tell
    if mode ~= 3 and mode ~= 4 then return end
     
    local play = windower.ffxi.get_player().name
     
    message = message:lower()
--[[ Singer stuff ]]
    if sender == 'Enuri' and message:contains('jarng') then
        windower.send_command('input //sing aetude 1 ' .. sender)
		windower.send_command('wait 1; input //sing prelude 1 ' .. sender)
    end
	if sender == 'Faythie' and message:contains('songs') then
        windower.send_command('input //lua r singer')
		windower.send_command('wait 2; input //sing')
    end
	if sender == 'Enuri' and message:contains('songs') then
        windower.send_command('input //lua r singer')
		windower.send_command('wait 2; input //sing')
    end
end)