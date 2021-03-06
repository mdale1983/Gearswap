windower.register_event('chat message', function(message,sender,mode,gm)

	--Ignore it if it's not party chat or a tell
    if mode ~= 3 and mode ~= 4 then return end
     
    local play = windower.ffxi.get_player().name
     
    message = message:lower()
	
	if sender == 'Enuri' and message:contains('mountfollow') then
        windower.send_command('input /mount "Raptor" <me>')
		windower.send_command('wait 1; input //ffo ' .. sender)
		windower.send_command('wait 2; input //ffo min 1')
    end
	if sender == 'Enuri' and message:contains('follow') then
		windower.send_command('wait 1; input /p ffo Enuri')
		windower.send_command('wait 2; input //ffo min 1')
    end
	if sender == 'Enuri' and message:contains('folbat') then
        windower.send_command('input //ffo min 2')
    end
	if sender == 'Enuri' and message:contains('foloff') then
        windower.send_command('input /console ffo stop')
    end
	if sender == 'Enuri' and message:contains('dismount') then
        windower.send_command('input /dismount')
    end
end)