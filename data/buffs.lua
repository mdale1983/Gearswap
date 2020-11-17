windower.register_event('chat message', function(message,sender,mode,gm)
 
    --Ignore it if it's not party chat or a tell
    if mode ~= 3 and mode ~= 4 then return end
     
    local play = windower.ffxi.get_player().name
     
    message = message:lower()
--[[ White Mage stuff ]]
    if sender == 'Enuri' and message:contains('erase') then
        windower.send_command('input /ma Erase ' .. sender)
    end
	if sender == 'Enuri' and message:contains('fire') then
        windower.send_command('input /ma Barfira <me>')
    end
	if sender == 'Enuri' and message:contains('earth') then
        windower.send_command('input /ma Barstonra <me>')
    end
	if sender == 'Enuri' and message:contains('wind') then
        windower.send_command('input /ma Baraera <me>')
    end
	if sender == 'Enuri' and message:contains('thunder') then
        windower.send_command('input /ma Barthundra <me>')
    end
	if sender == 'Enuri' and message:contains('water') then
        windower.send_command('input /ma Barwatera <me>')
    end
	if sender == 'Enuri' and message:contains('haste') then
        windower.send_command('input /ma Haste ' .. sender)
    end
	if sender == 'Marlinfist' and message:contains('haste') then
        windower.send_command('input /ma Haste ' .. sender)
    end
	if sender == 'Nandoo' and message:contains('haste') then
        windower.send_command('input /ma Haste ' .. sender)
    end
	if sender == 'Enuri' and message:contains('para') then
        windower.send_command('input /ma Paralyna ' .. sender)
    end
	if sender == 'Enuri' and message:contains('stona') then
        windower.send_command('input /ma Stona ' .. sender)
    end
	if sender == 'Enuri' and message:contains('pro') then
        windower.send_command('input /ma Protect V ' .. sender)
    end
	if sender == 'Enuri' and message:contains('shell') then
        windower.send_command('input /ma Shell V ' .. sender)
    end
	if sender == 'Marlinfist' and message:contains('pro') then
        windower.send_command('input /ma Protect V ' .. sender)
    end
	if sender == 'Marlinfist' and message:contains('shell') then
        windower.send_command('input /ma Shell V ' .. sender)
    end
	if sender == 'Nandoo' and message:contains('pro') then
        windower.send_command('input /ma Protect V ' .. sender)
    end
	if sender == 'Marlinfist' and message:contains('cure') then
        windower.send_command('input /ma Cure ' .. sender)
    end
	if sender == 'Nandoo' and message:contains('shell') then
        windower.send_command('input /ma Shell V ' .. sender)
    end
	if message:contains('curse') then
        windower.send_command('input /ma Cursna ' .. sender)
    end
	if sender == 'Enuri' and message:contains('sacro') then
         windower.send_command('input /ja Sacrosanctity <me> ')
    end
	if sender == 'Enuri' and message:contains('amnes') then
         windower.send_command('input /ja Baramnesra <me> ')
    end
	if sender == 'Enuri' and message:contains('blindna') then
        windower.send_command('input /ma Blinda ' .. sender)
    end
	if sender == 'Enuri' and message:contains('regen') then
         windower.send_command('input /ja Light Arts <me>')
		 windower.send_command('wait 2; input /ja Accession <me>')
		 windower.send_command('wait 4; input /ja Perpetuance <me>')
		 windower.send_command('wait 6; input /ja Regen V ' .. sender)
    end
end)