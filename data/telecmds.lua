windower.register_event('chat message', function(message,sender,mode,gm)
	 --Ignore it if it's not party chat or a tell
    if mode ~= 3 and mode ~= 4 then return end
     
    local play = windower.ffxi.get_player().name
     
    message = message:lower()
--[[ Bastok ]]
	if sender == 'Enuri' and message:contains('pb2') then
        windower.send_command('input //gs c pb2')
    end
	if sender == 'Enuri' and message:contains('bm1') then
        windower.send_command('input //gs c bm1')
    end
	if sender == 'Enuri' and message:contains('bmine1') then
        windower.send_command('input //gs c bmine1')
    end
	if sender == 'Enuri' and message:contains('mw1') then
        windower.send_command('input //gs c mw1')
    end
--[[ Sand'oria ]]
	if sender == 'Enuri' and message:contains('ss2') then
        windower.send_command('input //gs c ss2')
    end
	if sender == 'Enuri' and message:contains('ns1') then
        windower.send_command('input //gs c ns1')
    end
	if sender == 'Enuri' and message:contains('ps1') then
        windower.send_command('input //gs c ps1')
    end
--[[ Windurst ]]
	if sender == 'Enuri' and message:contains('woods2') then
        windower.send_command('input //gs c woods2')
    end
	if sender == 'Enuri' and message:contains('ww1') then
        windower.send_command('input //gs c ww1')
    end
	if sender == 'Enuri' and message:contains('ww2') then
        windower.send_command('input //gs c ww2')
    end
	if sender == 'Enuri' and message:contains('ww3') then
        windower.send_command('input //gs c ww3')
    end
	if sender == 'Enuri' and message:contains('waters2') then
        windower.send_command('input //gs c waters2')
    end
	if sender == 'Enuri' and message:contains('waters3') then
        windower.send_command('input //gs c waters3')
    end
--[[ Jeuno ]]	
	if sender == 'Enuri' and message:contains('pj1') then
        windower.send_command('input //gs c pj1')
    end
	if sender == 'Enuri' and message:contains('ru2') then
        windower.send_command('input //gs c ru2')
    end
	if sender == 'Enuri' and message:contains('lj1') then
        windower.send_command('input //gs c lj1')
    end
	if sender == 'Enuri' and message:contains('uj1') then
        windower.send_command('input //gs c uj1')
    end
--[[ Western Adoulin ]]
	if sender == 'Enuri' and message:contains('wado1') then
        windower.send_command('input //gs c wado1')
    end
	if sender == 'Enuri' and message:contains('wado2') then
        windower.send_command('input //gs c wado2')
    end
--[[ Eastern Adoulin ]]
	if sender == 'Enuri' and message:contains('eado1') then
        windower.send_command('input //gs c eado1')
    end
	if sender == 'Enuri' and message:contains('eado2') then
        windower.send_command('input //gs c eado2')
    end
--[[ FeiYin ]]
	if sender == 'Enuri' and message:contains('fei2') then
        windower.send_command('input //gs c fei2')
    end
--[[ Leafallia ]]
	if sender == 'Enuri' and message:contains('leaf') then
        windower.send_command('input //gs c leaf')
    end
--[[ Misareaux Coast]]
	if sender == 'Enuri' and message:contains('miser') then
        windower.send_command('input //gs c miser')
    end
--[[ Norg ]]
	if sender == 'Enuri' and message:contains('norg') then
        windower.send_command('input //gs c norg')
    end
--[[ Mhaura ]]
	if sender == 'Enuri' and message:contains('mhaura') then
        windower.send_command('input //gs c mhaura')
    end
--[[ Rabao ]]
	if sender == 'Enuri' and message:contains('rabao') then
        windower.send_command('input //gs c rabao')
    end
--[[ Selbina ]]
	if sender == 'Enuri' and message:contains('selbina') then
        windower.send_command('input //gs c selbina')
    end
--[[ Kazham ]]
	if sender == 'Enuri' and message:contains('kazham') then
        windower.send_command('input //gs c kazham')
    end
--[[ Shiva ]]
	if sender == 'Enuri' and message:contains('shiva') then
        windower.send_command('input //gs c shiva')
    end
--[[ Ramuh ]]
	if sender == 'Enuri' and message:contains('ramuh') then
        windower.send_command('input //gs c ramuh')
    end
--[[ Titan ]]
	if sender == 'Enuri' and message:contains('titan') then
        windower.send_command('input //gs c titan')
    end
--[[ Levithan ]]
	if sender == 'Enuri' and message:contains('levi') then
        windower.send_command('input //gs c levi')
    end
--[[ Ifrit ]]
	if sender == 'Enuri' and message:contains('ifrit') then
        windower.send_command('input //gs c ifrit')
    end
--[[ Garuda ]]
	if sender == 'Enuri' and message:contains('garuda') then
        windower.send_command('input //gs c garuda')
    end
--[[ Sky ]]
	if sender == 'Enuri' and message:contains('sky') then
        windower.send_command('input //gs c sky')
    end
--[[ Upper Delkfutt ]]
	if sender == 'Enuri' and message:contains('ud1') then
        windower.send_command('input //gs c ud1')
    end
--[[ Castle Zvahl Keep ]]
	if sender == 'Enuri' and message:contains('czk') then
        windower.send_command('input //gs c czk')
    end
--[[ The Shrine of Ru'Avitau ]]
	if sender == 'Enuri' and message:contains('avitau') then
        windower.send_command('input //gs c avitau')
    end
--[[ Tavnazian Safehold ]]
	if sender == 'Enuri' and message:contains('tav') then
        windower.send_command('input //gs c tav')
    end
--[[ Attohwa Chasm ]]
	if sender == 'Enuri' and message:contains('attohwa') then
        windower.send_command('input //gs c attohwa')
    end
--[[ The Garden of Ru'Hmet ]]
	if sender == 'Enuri' and message:contains('hmet') then
        windower.send_command('input //gs c hmet')
    end
--[[ Bhaflau Thickets ]]
	if sender == 'Enuri' and message:contains('thickets') then
        windower.send_command('input //gs c thickets')
    end
--[[ Caedarva Mire ]]	
	if sender == 'Enuri' and message:contains('mire') then
        windower.send_command('input //gs c mire')
    end	
--[[ Fenrir and Carbuncle ]]	
	if sender == 'Enuri' and message:contains('canal') then
        windower.send_command('input //gs c canal')
    end		
--[[ Diablos ]]	
	if sender == 'Enuri' and message:contains('pso') then
        windower.send_command('input //gs c pso')
    end		
--[[ Riverne - Site #B01 ]]	
	if sender == 'Enuri' and message:contains('b01') then
        windower.send_command('input //gs c b01')
    end		
--[[ Riverne - Site #A01 ]]	
	if sender == 'Enuri' and message:contains('a01') then
        windower.send_command('input //gs c a01')
    end		
--[[ New town Movalpolos ]]	
	if sender == 'Enuri' and message:contains('new town') then
        windower.send_command('input //gs c new town')
    end		
--[[ Aht Urhgan ]]	
	if sender == 'Enuri' and message:contains('whitegate') then
        windower.send_command('input //gs c whitegate')
    end		
--[[ Qufim Island ]]	
	if sender == 'Enuri' and message:contains('qufim') then
        windower.send_command('input //gs c qufim')
    end		
--[[ WayPoint warps ]]
		if sender == 'Enuri' and message:contains('wadowp') then
			windower.send_command('input //gs c wadowp')
		end	
	--[[ Yahse Hunting ]]
		if sender == 'Enuri' and message:contains('yashfs') then
			windower.send_command('input //gs c yashfs')
		end		
	--[[ Ceizak Battlegrounds ]]	
		if sender == 'Enuri' and message:contains('ceifs') then
			windower.send_command('input //gs c ceifs')
		end		
	--[[ Foret de Hennetiel ]]	
		if sender == 'Enuri' and message:contains('forfs') then
			windower.send_command('input //gs c forfs')
		end	
		if sender == 'Enuri' and message:contains('forwp4') then
			windower.send_command('input //gs c forwp4')
		end		
	--[[ Yorcia Weald ]]	
		if sender == 'Enuri' and message:contains('yorfs') then
			windower.send_command('input //gs c yorfs')
		end	
	--[[ Morimar Basalt ]]	
		if sender == 'Enuri' and message:contains('morifs') then
			windower.send_command('input //gs c morifs')
		end		
		if sender == 'Enuri' and message:contains('moriwp5') then
			windower.send_command('input //gs c moriwp5')
		end	
	--[[ Marjami Ravine ]]	
		if sender == 'Enuri' and message:contains('marjfs') then
			windower.send_command('input //gs c marjfs')
		end		
		if sender == 'Enuri' and message:contains('marjwp4') then
			windower.send_command('input //gs c marjwp4')
		end		
	--[[ Kamihr Drifts ]]	
		if sender == 'Enuri' and message:contains('kamfs') then
			windower.send_command('input //gs c kamfs')
		end		
	--[[ Outter Raz ]]	
		if sender == 'Enuri' and message:contains('outtwp') then
			windower.send_command('input //gs c outtwp')
		end		
--[[ Escha Zone WP warps ]]	
	if sender == 'Enuri' and message:contains('enter') then
        windower.send_command('input //gs c enter')
    end		
	--[[ Escha warp portals ]]
	if sender == 'Enuri' and message:contains('ew1a') then
        windower.send_command('input //gs c ew1')
    end		
	if sender == 'Enuri' and message:contains('ew2') then
        windower.send_command('input //gs c ew2')
    end		
	if sender == 'Enuri' and message:contains('ew3') then
        windower.send_command('input //gs c ew3')
    end		
	if sender == 'Enuri' and message:contains('ew4') then
        windower.send_command('input //gs c ew4')
    end		
	if sender == 'Enuri' and message:contains('ew5') then
        windower.send_command('input //gs c ew5')
    end		
	if sender == 'Enuri' and message:contains('ew6') then
        windower.send_command('input //gs c ew6')
    end		
	if sender == 'Enuri' and message:contains('ew7') then
        windower.send_command('input //gs c ew7')
    end		
	if sender == 'Enuri' and message:contains('ew8') then
        windower.send_command('input //gs c ew8')
    end		
	if sender == 'Enuri' and message:contains('ew9') then
        windower.send_command('input //gs c ew9')
    end		
	if sender == 'Enuri' and message:contains('ew10') then
        windower.send_command('input //gs c ew10')
    end		
	if sender == 'Enuri' and message:contains('ew11') then
        windower.send_command('input //gs c ew11')
    end		
	if sender == 'Enuri' and message:contains('ew12') then
        windower.send_command('input //gs c ew12')
    end		
	if sender == 'Enuri' and message:contains('ew13') then
        windower.send_command('input //gs c ew13')
    end		
	if sender == 'Enuri' and message:contains('ew14') then
        windower.send_command('input //gs c ew14')
    end		
	if sender == 'Enuri' and message:contains('ew15') then
        windower.send_command('input //gs c ew15')
    end	
--[[ Status Effects ]]	
	if sender == 'Enuri' and message:contains('doom') then
        windower.send_command('input //gs c doom')
    end		
	if sender == 'Enuri' and message:contains('terror') then
        windower.send_command('input //gs c terror')
    end		
	if sender == 'Enuri' and message:contains('poisonb') then
        windower.send_command('input //gs c poisonb')
    end		
	if sender == 'Enuri' and message:contains('tolba') then
        windower.send_command('input //gs c tolba')
    end		
	if sender == 'Enuri' and message:contains('charm') then
        windower.send_command('input //gs c charm')
    end		
	if sender == 'Enuri' and message:contains('rad') then
        windower.send_command('input //gs c rad')
    end		
	if sender == 'Enuri' and message:contains('poison') then
        windower.send_command('input //gs c poison')
    end		
--[[ Ring rules ]]
	if sender == 'Enuri' and message:contains('homepoint') then
        windower.send_command('input //gs c warp')
    end		
	if sender == 'Enuri' and message:contains('holla') then
        windower.send_command('input //gs c hol3')
    end		
	if sender == 'Enuri' and message:contains('dem') then
        windower.send_command('input //gs c dem3')
    end		
	if sender == 'Enuri' and message:contains('mea') then
        windower.send_command('input //gs c mea3')
    end		
end)