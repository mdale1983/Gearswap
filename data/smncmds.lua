windower.register_event('chat message', function(message,sender,mode,gm)
 
    --Ignore it if it's not party chat or a tell
    if mode ~= 3 and mode ~= 4 then return end
     
    local play = windower.ffxi.get_player().name
     
    message = message:lower()
--[[ White Mage stuff ]]
    if sender == 'enuri' and message:contains('ipact') then
        windower.send_command('input /pet "Flaming Crush" <bt>')
    end
end)