windower.register_event('chat message', function(message,sender,mode,gm)
 
    --Ignore it if it's not party chat or a tell
    if mode ~= 3 and mode ~= 4 then return end
     
    local play = windower.ffxi.get_player().name
     
    message = message:lower()
--[[ Singer stuff ]]
    if message:contains('jarng') then
        windower.send_command('input //sing aetude 1 ' .. sender)
		windower.send_command('wait 1; input //sing prelude 1 ' .. sender)
    end
	if message:contains('ranged') then
		windower.send_command('input //lua r singer')
		windower.send_command('wait 1; input //sing minuet 0')
		windower.send_command('wait 2; input //sing march 0')
        windower.send_command('wait 3; input //sing aetude 2')
		windower.send_command('wait 4; input //sing prelude 2 ')
		windower.send_command('wait 5; input //sing on')
		--windower.send_command('wait 5; input /p buffs are swapped for rangers')
    end
	if message:contains('w3') then
		--windower.chat.input('/p buffs are swapped')
		windower.send_command('input //lua r singer')
		windower.send_command('wait 1; input //sing aetude 0')
		windower.send_command('wait 2; input //sing prelude 0 ')
		windower.send_command('wait 3; input //sing madrigal 2')
		windower.send_command('wait 5; input //sing on')
		--windower.send_command('wait 5; input /p buffs are swapped to melee')
    end
	if sender == 'Enuri' and message:contains('songs') then
        windower.send_command('input //lua r singer')
		windower.send_command('wait 2; input //sing')
    end
	if sender == 'Ironhound' and message:contains('songs') then
        windower.send_command('input //lua r singer')
		windower.send_command('wait 2; input //sing')
    end
	if sender == 'Faythie' and message:contains('songs') then
        windower.send_command('input //lua r singer')
		windower.send_command('wait 2; input //sing')
    end
	if sender == 'Enuri' and message:contains('songs') then
        windower.send_command('input //lua r singer')
		windower.send_command('wait 2; input //sing')
    end
	if sender == 'Ironhound' and message:contains('songs') then
        windower.send_command('input //lua r singer')
		windower.send_command('wait 2; input //sing')
    end
	if sender == 'Enuri' and message:contains('mountfollow') then
        windower.send_command('input /mount "Raptor" <me>')
		windower.send_command('wait 1; input //ffo ' .. sender)
		windower.send_command('wait 2; input //ffo min 1')
    end
	if sender == 'Enuri' and message:contains('follow') then
		windower.send_command('wait 1; input //ffo ' .. sender)
		windower.send_command('wait 2; input //ffo min 1')
    end
	if sender == 'Enuri' and message:contains('folbat') then
        windower.send_command('input //ffo min 2')
    end
	if sender == 'Enuri' and message:contains('foloff') then
        windower.send_command('input //ffo stop')
    end
	if sender == 'Enuri' and message:contains('dismount') then
        windower.send_command('input /dismount')
    end
end)