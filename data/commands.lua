function user_job_self_command(commandArgs, eventArgs) 
--[[ Mea Ring ]]
			if commandArgs:get(1) == 'mea3' then
                send_command('input //gs c mea1; wait 10; input //gs c mea2; wait 10; input //gs c mea1')
				send_command('input /equip Ring1 "Dim. Ring (Mea)"')
                add_to_chat(158,'Warp to Mea')
--[[ Dem Ring ]]
			elseif commandArgs:get(1) == 'dem3' then
                send_command('input //gs c dem1; wait 10; input //gs c dem2; wait 10; input //gs c dem1')
				send_command('input /equip Ring1 "Dim. Ring (Dem)"')
                add_to_chat(158,'Warp to Dem')
--[[ Holla Ring ]]
			elseif commandArgs:get(1) == 'hol3' then
                send_command('input //gs c hol1; wait 10; input //gs c hol2; wait 10; input //gs c hol1')
				send_command('input /equip Ring1 "Dim. Ring (Holla)"')
                add_to_chat(158,'Warp to Holla')
--[[ Warp Ring ]]
			elseif commandArgs:get(1) == 'warp' then
                send_command('input //gs c w1; wait 10; input //gs c w2; wait 10; input //gs c w1')
				send_command('input /equip Ring1 "Warp Ring"')
                add_to_chat(158,'Preparing Warp Ring')				
			elseif commandArgs:get(1) == 'rad' then
                send_command('input /echo waiting; wait 1.5; input //temps buy radialens')
                add_to_chat(158,'Warp to Radialens')
			elseif commandArgs:get(1) == 'mhaura' then
                send_command('input /echo waiting; wait 1.5; input //sw hp warp all Mhaura 1')
                add_to_chat(158,'Warp to Mhaura 1')
			elseif commandArgs:get(1) == 'pwin3' then
                send_command('input /echo waiting; wait 1.5; input //sw hp warp all Port Windurst 3')
                add_to_chat(158,'Warp to Port Windurst 3')
--[[ FeiYin ]]
			elseif commandArgs:get(1) == 'fei2' then
                send_command('input /echo waiting; wait 1.5; input //sw hp warp all Fei\'Yin 1')
                add_to_chat(158,'Warp to Qu\'Bia Arena')
--[[Windurst Walls ]]
			elseif commandArgs:get(1) == 'ww1' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp all Windurst Walls 1')
                add_to_chat(158,'Warp to Windurst Walls 1')
			elseif commandArgs:get(1) == 'ww2' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp all Windurst Walls 2')
                add_to_chat(158,'Warp to Windurst Walls 2')
			elseif commandArgs:get(1) == 'ww3' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp all Windurst Walls 3')
                add_to_chat(158,'Warp to Windurst Walls 3')
--[[ Windurst Waters ]]
			elseif commandArgs:get(1) == 'waters2' then
                send_command('input /ech Waiting; wait 1.5; input //sw hp warp all Windurst Waters 2')
                add_to_chat(158,'Warp to Windurst Waters 2')
			elseif commandArgs:get(1) == 'waters3' then
                send_command('input /ech Waiting; wait 1.5; input //sw hp warp all Windurst Waters 3')
                add_to_chat(158,'Warp to Windurst Waters 3')
--[[ Windurst Woods	]]
			elseif commandArgs:get(1) == 'woods2' then
                send_command('input /ech Waiting; wait 1.5; input //sw hp warp all Windurst Woods 2')
                add_to_chat(158,'Warp to Windurst Woods 2')
--[[ Western Adoulin ]]
			elseif commandArgs:get(1) == 'wado1' then                
				send_command('input /echo Waiting; wait 1.5; input //sw hp warp all Western Adoulin 1')
                add_to_chat(158,'Warp to Western Adoulin 1')
			elseif commandArgs:get(1) == 'wado2' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp all Western Adoulin 2')
                add_to_chat(158,'Warp to Western Adoulin 2')
--[[ Eastern Adoulin ]]
			elseif commandArgs:get(1) == 'eado1' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp all Eastern Adoulin 1')
                add_to_chat(158,'Warp to Eastern Adoulin 1')
			elseif commandArgs:get(1) == 'eado2' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp all Eastern Adoulin 2')
                add_to_chat(158,'Warp to Eastern Adoulin 2')
--[[ Leafallia ]]
			elseif commandArgs:get(1) == 'leaf' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp all Leafallia 1')
                add_to_chat(158,'Warp to Leafy City')
--[[ Misareaux Coast]]
			elseif commandArgs:get(1) == 'miser' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp all Misareaux Coast 1')
                add_to_chat(158,'Warp to Misareaux Coast')	
--[[ Jeuno ]]
			elseif commandArgs:get(1) == 'pj1' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp all port jeuno 1')
                add_to_chat(158,'Warp to Port Jeuno')	
			elseif commandArgs:get(1) == 'uj1' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp all Upper Jeuno 1')
                add_to_chat(158,'Warp to Upper Jeuno')
			elseif commandArgs:get(1) == 'lj1' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp all Lower Jeuno 1')
                add_to_chat(158,'Warp to Lower Jeuno #1')
			elseif commandArgs:get(1) == 'lj2' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp all Lower Jeuno 2')
                add_to_chat(158,'Warp to Lower Jeuno #2')	
			elseif commandArgs:get(1) == 'ru2' then
                send_command("input /echo Waiting; wait 1.5; input //sw hp warp all Ru'Lude Gardens 2")
                add_to_chat(158,'Warp to Ru\'Lude Gardens')
--[[ Bastok ]]
			elseif commandArgs:get(1) == 'pb2' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp all Port Bastok 2')
                add_to_chat(158,'Warp to Port Bastok')
			elseif commandArgs:get(1) == 'bm1' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp all Bastok Markets 1')
                add_to_chat(158,'Warp to Bastok Markets')
			elseif commandArgs:get(1) == 'bmine1' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp all Bastok Mines 1')
                add_to_chat(158,'Warp to Bastok Mines')
			elseif commandArgs:get(1) == 'mw1' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp all Metalworks 1')
                add_to_chat(158,'Warp to Metalworks')
--[[ San D'oria ]]
			elseif commandArgs:get(1) == 'ss2' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp all Southern San D\'oria 1')
                add_to_chat(158,'Warp to South Sandy')
			elseif commandArgs:get(1) == 'ns1' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp all Northern San D\'oria 3')
                add_to_chat(158,'Warp to North Sandy')
			elseif commandArgs:get(1) == 'ps1' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp all Port San D\'oria 1')
                add_to_chat(158,'Warp to Port Sandy')
--[[ Norg ]]
			elseif commandArgs:get(1) == 'norg' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp all Norg 1')
                add_to_chat(158,'Warp to Norg')
--[[ Mhaura ]]
			elseif commandArgs:get(1) == 'mhaura' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp all Mhaura 1')
                add_to_chat(158,'Warp to Mhaura')
--[[ Rabao ]]
			elseif commandArgs:get(1) == 'rabao' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp all Rabao 1')
                add_to_chat(158,'Warp to Rabao')
--[[ Selbina ]]
			elseif commandArgs:get(1) == 'selbina' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp all Selbina 1')
                add_to_chat(158,'Warp to Selbina')
--[[ Kazham ]]
			elseif commandArgs:get(1) == 'kazham' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp all Kazham 1')
                add_to_chat(158,'Warp to Kazham')
--[[ Shiva ]]
			elseif commandArgs:get(1) == 'shiva' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp all Fei\'Yin 2')
                add_to_chat(158,'Warp to Cloister of Frost')
--[[ Ramuh ]]
			elseif commandArgs:get(1) == 'ramuh' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp all The Boyahda Tree 1')
                add_to_chat(158,'Warp to Cloister of Lightning')
--[[ Titan ]]
			elseif commandArgs:get(1) == 'titan' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp all Quicksand Caves 2')
                add_to_chat(158,'Warp to Cloister of Tremors')
--[[ Levithan ]]
			elseif commandArgs:get(1) == 'levi' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp all Den of Rancor 2')
                add_to_chat(158,'Warp to Cloister of Tides')
--[[ Ifrit ]]
			elseif commandArgs:get(1) == 'ifrit' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp all Ifrit\'s Cauldron 1')
                add_to_chat(158,'Warp to Cloister of Flames')
--[[ Garuda ]]
			elseif commandArgs:get(1) == 'garuda' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp all Cape Teriggan 1')
                add_to_chat(158,'Warp to Cloister of Gales')
--[[ Sky ]]
			elseif commandArgs:get(1) == 'sky' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp all Ru\'Aun Gardens 2')
                add_to_chat(158,'Warp to Ru\'Aun Gardens')
--[[ Upper Delkfutt ]]
			elseif commandArgs:get(1) == 'ud1' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp all Upper Delkfutt\'s 1')
                add_to_chat(158,'Warp to Stellar Fulcrum')
--[[ Castle Zvahl Keep ]]
			elseif commandArgs:get(1) == 'czk' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp all Castle Zvahl Keep 1')
                add_to_chat(158,'Warp to Throne Room')
--[[ The Shrine of Ru'Avitau ]]
			elseif commandArgs:get(1) == 'avitau' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp all The Shrine of Ru\'Avitau 1')
                add_to_chat(158,'Warp to Celestial Nexus')
--[[ Tavnazian Safehold ]]
			elseif commandArgs:get(1) == 'tav' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp all Tavnazian Safehold 2')
                add_to_chat(158,'Warp to Tavnazin Safehold')
--[[ Attohwa Chasm ]]
			elseif commandArgs:get(1) == 'attohwa' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp all Attohwa Chasm 1')
                add_to_chat(158,'Warp to Attohwa Chasm')
--[[ The Garden of Ru'Hmet ]]
			elseif commandArgs:get(1) == 'hmet' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp all The Garden of Ru\'Hmet 1')
                add_to_chat(158,'Warp to Garden of Ru\'Hmet')
--[[ Bhaflau Thickets ]]
			elseif commandArgs:get(1) == 'thickets' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp all Bhaflau Thickets 1')
                add_to_chat(158,'Warp to Bhaflau Thickets')
--[[ Caedarva Mire ]]
			elseif commandArgs:get(1) == 'mire' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp all Caedarva Mire 1')
                add_to_chat(158,'Warp to Celestial Nexus')
--[[ Fenrir and Carbuncle ]]
			elseif commandArgs:get(1) == 'canal' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp all Toraimarai Canal 1')
                add_to_chat(158,'Warp to Full Moon Fountain')
--[[ Diablos ]]
			elseif commandArgs:get(1) == 'pso' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp all Pso\'Xja 1')
                add_to_chat(158,'Warp to Diablos')
--[[ Riverne - Site #B01 ]]
			elseif commandArgs:get(1) == 'b01' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp all Riverne - Site #B01 1')
                add_to_chat(158,'Warp to Riverne - Site #B01')
--[[ Riverne - Site #A01 ]]
			elseif commandArgs:get(1) == 'a01' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp all Riverne - Site #A01 1')
                add_to_chat(158,'Warp to Riverne - Site #A01')
--[[ Newtown Movalpolos ]]
			elseif commandArgs:get(1) == 'newtown' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp all Newtown Movalpolos 1')
                add_to_chat(158,'Warp to Newtown Movalpolos')
--[[ Aht Urhgan ]]
			elseif commandArgs:get(1) == 'whitegate' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp all Aht Urhgan Whitegate 2')
                add_to_chat(158,'Warp to Whitegate')
--[[ Qufim Island ]]
			elseif commandArgs:get(1) == 'qufim' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp all Qufim Island 1')
                add_to_chat(158,'Warp to Qufim')
--[[ WayPoint warps ]]
			elseif commandArgs:get(1) == 'wadowp' then
                send_command('input /echo Waiting; wait 1.5; input //sw wp warp all Western Adoulin Pioneers')
                add_to_chat(158,'Warp to Western Adoulin Pioneers Coalition')
	--[[ Yahse Hunting ]]
			elseif commandArgs:get(1) == 'yashfs' then
                send_command('input /echo Waiting; wait 1.5; input //sw wp warp all Yahse Hunting Grounds fs')
                add_to_chat(158,'Warp to Yahse Hunting Grounds Frontier Station')
	--[[ Ceizak Battlegrounds ]]
			elseif commandArgs:get(1) == 'ceifs' then
                send_command('input /echo Waiting; wait 1.5; input //sw wp warp all Ceizak Battlegrounds fs')
                add_to_chat(158,'Warp to Ceizak Battlegrounds Frontier Station')
	--[[ Foret de Hennetiel ]]
			elseif commandArgs:get(1) == 'forfs' then
                send_command('input /echo Waiting; wait 1.5; input //sw wp warp all Foret de Hennetiel fs')
                add_to_chat(158,'Warp to Foret de Hennetiel Frontier Station')
			elseif commandArgs:get(1) == 'forwp4' then
                send_command('input /echo Waiting; wait 1.5; input //sw wp warp all Foret de Hennetiel 4')
                add_to_chat(158,'Warp to Foret de Hennetiel WP #4')
	--[[ Yorcia Weald ]]
			elseif commandArgs:get(1) == 'yorfs' then
                send_command('input /echo Waiting; wait 1.5; input //sw wp warp all Yorcia Weald fs')
                add_to_chat(158,'Warp to Yorcia Weald Frontier Station')
	--[[ Morimar Basalt ]]
			elseif commandArgs:get(1) == 'morifs' then
                send_command('input /echo Waiting; wait 1.5; input //sw wp warp all Morimar Basalt Fields fs')
                add_to_chat(158,'Warp to Morimar Basalt Fields Frontier Station')
			elseif commandArgs:get(1) == 'moriwp5' then
                send_command('input /echo Waiting; wait 1.5; input //sw wp warp all Morimar Basalt Fields 5')
                add_to_chat(158,'Warp to Morimar Basalt Fields Waypoint #5')
	--[[ Marjami Ravine ]]
			elseif commandArgs:get(1) == 'marjfs' then
                send_command('input /echo Waiting; wait 1.5; input //sw wp warp all Marjami Ravine fs')
                add_to_chat(158,'Warp to Marjami Ravine Frontier Station')
			elseif commandArgs:get(1) == 'marjwp4' then
                send_command('input /echo Waiting; wait 1.5; input //sw wp warp all Marjami Ravine 4')
                add_to_chat(158,'Warp to Marjami Ravine Waypoint #4')
	--[[ Kamihr Drifts ]]
			elseif commandArgs:get(1) == 'kamfs' then
                send_command('input /echo Waiting; wait 1.5; input //sw wp warp all Kamihr Drifts fs')
                add_to_chat(158,'Warp to Kamihr Drifts Frontier Station')
	--[[ Outter Raz ]]
			elseif commandArgs:get(1) == 'outtwp' then
                send_command('input /echo Waiting; wait 1.5; input //sw wp warp all Outter Ra\'Kaznar')
                add_to_chat(158,'Warp to Kamihr Drifts Frontier Station')
--[[ Escha Zone WP warps ]]
			elseif commandArgs:get(1) == 'enter' then
                send_command('input /echo Waiting; wait 1.5; input //sw ew all enter')
                add_to_chat(158,'Now Entering an Escha Zone')
	--[[ Escha Zi'Tah ]]
			elseif commandArgs:get(1) == 'ew1' then
                send_command('input /echo Waiting; wait 1.5; input //sw ew warp all 1')
                add_to_chat(158,'Warp to Eschan Warp #1')
			elseif commandArgs:get(1) == 'ew2' then
                send_command('input /echo Waiting; wait 1.5; input //sw ew warp all 2')
                add_to_chat(158,'Warp to Eschan Warp #2')
			elseif commandArgs:get(1) == 'ew3' then
                send_command('input /echo Waiting; wait 1.5; input //sw ew warp all 3')
                add_to_chat(158,'Warp to Eschan Warp #3')
			elseif commandArgs:get(1) == 'ew4' then
                send_command('input /echo Waiting; wait 1.5; input //sw ew warp all 4')
                add_to_chat(158,'Warp to Eschan Warp #4')
			elseif commandArgs:get(1) == 'ew5' then
                send_command('input /echo Waiting; wait 1.5; input //sw ew warp all 5')
                add_to_chat(158,'Warp to Eschan Warp #5')
			elseif commandArgs:get(1) == 'ew6' then
                send_command('input /echo Waiting; wait 1.5; input //sw ew warp all 6')
                add_to_chat(158,'Warp to Eschan Warp #6')
			elseif commandArgs:get(1) == 'ew7' then
                send_command('input /echo Waiting; wait 1.5; input //sw ew warp all 7')
                add_to_chat(158,'Warp to Eschan Warp #7')
			elseif commandArgs:get(1) == 'ew8' then
                send_command('input /echo Waiting; wait 1.5; input //sw ew warp all 8')
                add_to_chat(158,'Warp to Eschan Warp #8')
			elseif commandArgs:get(1) == 'ew9' then
                send_command('input /echo Waiting; wait 1.5; input //sw ew warp all 9')
                add_to_chat(158,'Warp to Eschan Warp #9')
			elseif commandArgs:get(1) == 'ew10' then
                send_command('input /echo Waiting; wait 1.5; input //sw ew warp all 10')
                add_to_chat(158,'Warp to Eschan Warp #10')
			elseif commandArgs:get(1) == 'ew11' then
                send_command('input /echo Waiting; wait 1.5; input //sw ew warp all 11')
                add_to_chat(158,'Warp to Eschan Warp #11')
			elseif commandArgs:get(1) == 'ew12' then
                send_command('input /echo Waiting; wait 1.5; input //sw ew warp all 12')
                add_to_chat(158,'Warp to Eschan Warp #12')
			elseif commandArgs:get(1) == 'ew13' then
                send_command('input /echo Waiting; wait 1.5; input //sw ew warp all 13')
                add_to_chat(158,'Warp to Eschan Warp #13')
			elseif commandArgs:get(1) == 'ew14' then
                send_command('input /echo Waiting; wait 1.5; input //sw ew warp all 14')
                add_to_chat(158,'Warp to Eschan Warp #14')
			elseif commandArgs:get(1) == 'ew15' then
                send_command('input /echo Waiting; wait 1.5; input //sw ew warp all 15')
                add_to_chat(158,'Warp to Eschan Warp #15')
--[[ 	Temp Item Useage Section 	]]	
		--[[ Poison ]]
			elseif commandArgs:get(1) == 'poison' then
                send_command('input /item "Remedy" <me>')
                add_to_chat(158,'Using a Remedy')	
		--[[ Doom Guard ]]
			elseif commandArgs:get(1) == 'doom' then
                send_command('input /item "Savior\'s Tonic" <me>')
                add_to_chat(158,'Warp to Savior tonic')
		--[[ Terror ]]
			elseif commandArgs:get(1) == 'terror' then
                send_command('input /item "Steadfast Tonic" <me>')
                add_to_chat(158,'Warp to Savior tonic')
		--[[ Poison Buffer ]]
			elseif commandArgs:get(1) == 'poisonb' then
                send_command('input /item "Poison Buffer" <me>')
                add_to_chat(158,'Using Poison Buffer')
		--[[ tolba's shell ]]
			elseif commandArgs:get(1) == 'tolba' then
                send_command('input /item "tolba\'s shell" <t>')
                add_to_chat(158,'Warp to tolba shell')
		--[[ Charm Buffer ]]
			elseif commandArgs:get(1) == 'charm' then
                send_command('input /item "Charm Buffer" <me>')
                add_to_chat(158,'Warp to Charm buffer')
		--[[ TP Wings ]]
			elseif commandArgs:get(1) == 'wing1' then
                send_command('input /item "Lucid Wings I" <me>')
                add_to_chat(158,'Warp to Lucid Wings I')
			elseif commandArgs:get(1) == 'wing2' then
                send_command('input /item "Lucid Wings II" <me>')
                add_to_chat(158,'Warp to Lucid Wings II')
			elseif commandArgs:get(1) == 'wing3' then
                send_command('input /item "Daedalus wing" <me>')
                add_to_chat(158,'Warp to Daedalus wing')
		--[[ Super Revitalizer ]]
			elseif commandArgs:get(1) == 'super' then
                send_command('input /item "Super Revitalizer" <me>')
                add_to_chat(158,'Warp to Super Revitalizer')
		--[[ Re-Raise ]]
			elseif commandArgs:get(1) == 'RR1' then
                send_command('input /ma "reraise" <me>')
                add_to_chat(158,'Warp to Using Reraiser')
			elseif commandArgs:get(1) == 'RR2' then
                send_command('input /ma reraise" <me>')
                add_to_chat(158,'Warp to Using Hi-Reraiser')
			elseif commandArgs:get(1) == 'RR3' then
                send_command('input /ma reraise" <me>')		
--[[ Warp Ring Rules ]]
			elseif commandArgs:get(1) == 'w1' then 
                    if Armor == 'Warp' then
                            Armor = 'None'
                            add_to_chat(123,'Warp Set: [Unlocked]')
							send_command('gs enable ring1')
                    else
                            Armor = 'Warp'
                            add_to_chat(158,'Warp Set: [Locked]')
							send_command('gs disable ring1')
                    end
                    status_change(player.status)
			elseif commandArgs:get(1) == 'w2' then
                send_command('input /item "Warp ring" <me>')
                add_to_chat(158,'Using Warp Ring')
--[[ Mea Ring Rules]]
           elseif commandArgs:get(1) == 'mea1' then -- Mea Toggle --
                    if Armor == 'Mea' then
                            Armor = 'None'
                            add_to_chat(123,'Mea Set: [Unlocked]')
							send_command('gs enable ring1')
                    else
                            Armor = 'Mea'
                            add_to_chat(158,'Mea Set: [Locked]')
							send_command('gs disable ring1')
                    end
                    status_change(player.status)
			elseif commandArgs:get(1) == 'mea2' then
                send_command('input /item "Dim. ring (Mea)" <me>')
                add_to_chat(158,'Using Mea Ring')
--[[ Dem Ring Rules ]] 
           elseif commandArgs:get(1) == 'dem1' then -- Dem  Toggle --
                    if Armor == 'Dem' then
                            Armor = 'None'
                            add_to_chat(123,'Dem Set: [Unlocked]')
							send_command('gs enable ring1')
                    else
                            Armor = 'Dem'
                            add_to_chat(158,'Dem Set: [Locked]')
							send_command('gs disable ring1')
                    end
                    status_change(player.status)
			elseif commandArgs:get(1) == 'dem2' then
                send_command('input /item "Dim. ring (Dem)" <me>')
                add_to_chat(158,'Using Dem Ring')
--[[ Holla Ring Rules ]]
           elseif commandArgs:get(1) == 'hol1' then -- Holla Toggle --
                    if Armor == 'hol' then
                            Armor = 'None'
                            add_to_chat(123,'Holla Set: [Unlocked]')
							send_command('gs enable ring1')
                    else
                            Armor = 'Mea'
                            add_to_chat(158,'Holla Set: [Locked]')
							send_command('gs disable ring1')
                    end
                    status_change(player.status)
			elseif commandArgs:get(1) == 'hol2' then
                send_command('input /item "Dim. ring (Holla)" <me>')
                add_to_chat(158,'Using Holla Ring')
			end
	--[[	HTB Commands	]]
		if commandArgs:get(1) == 'AvatarKi' then
			windower.chat.input('//htmb Avatar phantom gem')
		end 
		if commandArgs:get(1) == 'TenzenKi' then
			windower.chat.input('//htmb Warroir\'s phantom gem')
		end
		if commandArgs:get(1) == 'LilithKi' then
			windower.chat.input('//htmb Maiden phantom gem')
		end
		if commandArgs:get(1) == 'AlexKi' then
			windower.chat.input('//htmb Divine phantom gem')
		end
		if commandArgs:get(1) == 'CaitKi' then
			windower.chat.input('//htmb Dawn phantom gem')
		end
		if commandArgs:get(1) == 'TenzenKi' then
			windower.chat.input('//htmb Warroir\'s phantom gem')
		end
		if commandArgs:get(1) == 'ShadowKi' then
			windower.chat.input('//htmb Shadow Lord phantom gem')
		end	
		if commandArgs:get(1) == 'StellarKi' then
			windower.chat.input('//htmb Stellar Fulcrum phantom gem')
		end	
		if commandArgs:get(1) == 'CelestialKi' then
			windower.chat.input('//htmb Celestial Nexus phantom gem')
		end	
		if commandArgs:get(1) == 'SavageKi' then
			windower.chat.input('//htmb Savage\'s phantom gem')
		end	
		if commandArgs:get(1) == 'PuppetKi' then
			windower.chat.input('//htmb Puppet in Peril phantom gem')
		end	
		if commandArgs:get(1) == 'LegacyKi' then
			windower.chat.input('//htmb Legacy phantom gem')
		end	
		if commandArgs:get(1) == 'HeadKi' then
			windower.chat.input('//htmb Head wind phantom gem')
		end	
		if commandArgs:get(1) == 'WakingKi' then
			windower.chat.input('//htmb Waking the Beast phantom gem')
		end		
		if commandArgs:get(1) == 'FearedKi' then
			windower.chat.input('//htmb Head wind phantom gem')
		end	
		if commandArgs:get(1) == 'WakingDreamKi' then
			windower.chat.input('//htmb Waking Dream phantom gem')
		end	
end
windower.register_event('chat message', function(message,sender,mode,gm)
 
    --Ignore it if it's not party chat or a tell
    if mode ~= 3 and mode ~= 4 then return end
     
    local play = windower.ffxi.get_player().name
     
    message = message:lower()
--[[	Tele Commands	]]
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
	if player.main_job == "GEO" then 
		if sender == 'Enuri' and message:contains('magical') then 
			windower.send_command('input //thebubbler geo malaise')
			windower.send_command('wait 1; input //thebubbler indi Acumen')
		end 
		if sender == 'Enuri' and message:contains('physical') then
			windower.send_command('input //thebubbler geo frailty')
			windower.send_command('wait 1; input //thebubbler indi Fury')
			--windower.send_command('wait 1; input //lua r thebubbler')
			--windower.send_command('wait 1; input //tb pause')
		end
		if sender == 'Enuri' and message:contains('songs') then
			windower.send_command('input //lua r thebubbler')
			windower.send_command('input //tb pause')
		end
		if sender == 'Enuri' and message:contains('mountfollow') then
			windower.send_command('input /mount "Red Crab" <me>')
			windower.send_command('wait 1; input //hb follow ' .. sender)
			windower.send_command('wait 1; input //hb follow dist 1')
		end
		if sender == 'Enuri' and message:contains('follow') then
			windower.send_command('wait 1; input //hb follow ' .. sender)
			windower.send_command('wait 1; input //hb follow dist 1')
		end
		if sender == 'Enuri' and message:contains('folbat') then
			windower.send_command('input //hb follow dist 2')
		end
		if sender == 'Enuri' and message:contains('foloff') then
			windower.send_command('input //hb follow off')
		end	
		if sender == 'Enuri' and message:contains('dismount') then
			windower.send_command('input /dismount')
		end	
	end 
	if player.main_job == "COR" then 
		if sender == 'Enuri' and message:contains('magical') then
			windower.send_command('input //lua r autocor')
			windower.send_command('wait 1;input //cor roll 1 wizard')
			windower.send_command('wait 2; input //cor roll 2 warlock')
			windower.send_command('wait 3; input //cor on')
		end
		if sender == 'Enuri' and message:contains('physical') then
			windower.send_command('input //lua r autocor')
			windower.send_command('input //cor roll 1 chaos')
			windower.send_command('wait 1; input //cor roll 2 sam')
			windower.send_command('wait 3; input //cor on')
		end
		if sender == 'Enuri' and message:contains('rolls') then
			windower.send_command('input //lua r autocor')
			windower.send_command('wait 1; input //cor on')
		end
		if sender == 'Ironhound' and message:contains('rolls') then
			--windower.send_command('input //lua r autocor')
			windower.send_command('wait 1; input //cor on')
		end
		if sender == 'Enuri' and message:contains('mountfollow') then
			windower.send_command('input /mount "Red Crab" <me>')
			windower.send_command('wait 1; input //hb follow ' .. sender)
			windower.send_command('wait 1; input //hb follow dist 1')
		end
		if sender == 'Enuri' and message:contains('follow') then
			windower.send_command('wait 1; input //hb follow ' .. sender)
			windower.send_command('wait 1; input //hb follow dist 1')
		end
		if sender == 'Enuri' and message:contains('folbat') then
			windower.send_command('input //hb follow dist 2')
		end
		if sender == 'Enuri' and message:contains('foloff') then
			windower.send_command('input //hb follow off')
		end	
		if sender == 'Enuri' and message:contains('dismount') then
			windower.send_command('input /dismount')
		end	
	end 
	if player.main_job == "BRD" then 
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
			windower.send_command('wait 1; input //sing minuet 0')
			windower.send_command('wait 3; input //sing madrigal 2')
			windower.send_command('wait 3; input //sing march 2')
			windower.send_command('wait 5; input //sing on')
			windower.send_command('wait 5; input /p buffs are swapped to melee')
		end
		if sender == 'Enuri' and message:contains('songs') then
			windower.send_command('input //lua r singer')
			windower.send_command('wait 2; input //sing on')
		end
		if sender == 'Ironhound' and message:contains('songs') then
			windower.send_command('input //lua r singer')
			windower.send_command('wait 2; input //sing on')
		end
		if sender == 'Faythie' and message:contains('songs') then
			windower.send_command('input //lua r singer')
			windower.send_command('wait 2; input //sing on')
		end
		if sender == 'Enuri' and message:contains('songs') then
			windower.send_command('input //lua r singer')
			windower.send_command('wait 2; input //sing on')
		end
		if sender == 'Ironhound' and message:contains('songs') then
			windower.send_command('input //lua r singer')
			windower.send_command('wait 2; input //sing on')
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
		if sender == 'Enuri' and message:contains('mountfollow') then
			windower.send_command('input /mount "Red Crab" <me>')
			windower.send_command('wait 1; input //hb follow ' .. sender)
			windower.send_command('wait 1; input //hb follow dist 1')
		end
		if sender == 'Enuri' and message:contains('follow') then
			windower.send_command('wait 1; input //hb follow ' .. sender)
			windower.send_command('wait 1; input //hb follow dist 1')
		end
		if sender == 'Enuri' and message:contains('folbat') then
			windower.send_command('input //hb follow dist 2')
		end
		if sender == 'Enuri' and message:contains('foloff') then
			windower.send_command('input //hb follow off')
		end	
		if sender == 'Enuri' and message:contains('dismount') then
			windower.send_command('input /dismount')
		end	
	end 
	if player.main_job == "WHM" then 
		if message:contains('cursna') then
			windower.send_command('input /ma Cursna ' .. sender)
		end
		if message:contains('zzz') then
			windower.send_command('input /ma Cure ' .. sender)
		end
		if message:contains('erase') then
			windower.send_command('input /ma Erase ' .. sender)
		end
		if message:contains('arise') then
			windower.send_command('input /ma arise ' .. sender)
		end	
		if message:contains('raise') then
			windower.send_command('input /ma raise ' .. sender)
		end	
		if sender == 'Enuri' and message:contains('barfire') then
			windower.send_command('input /ma Barfira <me>')
		end
		if sender == 'Enuri' and message:contains('barearth') then
			windower.send_command('input /ma Barstonra <me>')
		end
		if sender == 'Enuri' and message:contains('barwind') then
			windower.send_command('input /ma Baraera <me>')
		end
		if sender == 'Enuri' and message:contains('barthunder') then
			windower.send_command('input /ma Barthundra <me>')
		end
		if sender == 'Enuri' and message:contains('barwater') then
			windower.send_command('input /ma Barwatera <me>')
		end
		if message:contains('haste') then
			windower.send_command('input /ma Haste ' .. sender)
		end
		if sender == 'Enuri' and message:contains('para') then
			windower.send_command('input /ma Paralyna ' .. sender)
		end
		if sender == 'Enuri' and message:contains('stona') then
			windower.send_command('input /ma Stona ' .. sender)
		end
		if message:contains('pro') then
			windower.send_command('input /ma Protect V ' .. sender)
			windower.send_command('wait 5; input /ma Shell V ' .. sender)
		end
		if message:contains('shell') then
			windower.send_command('input /ma Shell V ' .. sender)
			windower.send_command('wait 5; input /ma Protect V ' .. sender)
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
		if message:contains('blindna') then
			windower.send_command('input /ma Blindna ' .. sender)
		end
		if sender == 'Enuri' and message:contains('regen') then
			windower.send_command('input /ja Light Arts <me>')
			windower.send_command('wait 2; input /ja Accession <me>')
			windower.send_command('wait 4; input /ja Perpetuance <me>')
			windower.send_command('wait 6; input /ja Regen V ' .. sender)
		end
		if sender == 'Enuri' and message:contains('mountfollow') then
			windower.send_command('input /mount "Raptor" <me>')
			windower.send_command('wait 1; input //hb follow ' .. sender)
			windower.send_command('wait 1; input //hb follow dist 1')
		end
		if sender == 'Enuri' and message:contains('follow') then
			windower.send_command('wait 1; input //hb follow ' .. sender)
			windower.send_command('wait 1; input //hb follow dist 1')
		end
		if sender == 'Enuri' and message:contains('folbat') then
			windower.send_command('input //hb follow dist 20.5')
		end
		if sender == 'Enuri' and message:contains('foloff') then
			windower.send_command('input //hb follow off')
		end		
		if sender == 'Enuri' and message:contains('dismount') then
			windower.send_command('input /dismount')
		end
	end 
	if player.main_job == "SCH" then 
		if message:contains('cursna') then
			windower.send_command('input /ma Cursna ' .. sender)
		end
		if message:contains('zzz') then
			windower.send_command('input /ma Cure ' .. sender)
		end
		if message:contains('erase') then
			windower.send_command('input /ma Erase ' .. sender)
		end
		if message:contains('arise') then
			windower.send_command('input /ma arise ' .. sender)
		end	
		if message:contains('raise') then
			windower.send_command('input /ma raise ' .. sender)
		end	
		if sender == 'Enuri' and message:contains('barfire') then
			windower.send_command('input /ma Barfira <me>')
		end
		if sender == 'Enuri' and message:contains('barearth') then
			windower.send_command('input /ma Barstonra <me>')
		end
		if sender == 'Enuri' and message:contains('barwind') then
			windower.send_command('input /ma Baraera <me>')
		end
		if sender == 'Enuri' and message:contains('barthunder') then
			windower.send_command('input /ma Barthundra <me>')
		end
		if sender == 'Enuri' and message:contains('barwater') then
			windower.send_command('input /ma Barwatera <me>')
		end
		if message:contains('haste') then
			windower.send_command('input /ma Haste ' .. sender)
		end
		if sender == 'Enuri' and message:contains('para') then
			windower.send_command('input /ma Paralyna ' .. sender)
		end
		if sender == 'Enuri' and message:contains('stona') then
			windower.send_command('input /ma Stona ' .. sender)
		end
		if message:contains('pro') then
			windower.send_command('input /ma Protect V ' .. sender)
			windower.send_command('wait 5; input /ma Shell V ' .. sender)
		end
		if message:contains('shell') then
			windower.send_command('input /ma Shell V ' .. sender)
			windower.send_command('wait 5; input /ma Protect V ' .. sender)
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
		if message:contains('blindna') then
			windower.send_command('input /ma Blindna ' .. sender)
		end
		if sender == 'Enuri' and message:contains('regen') then
			windower.send_command('input /ja Light Arts <me>')
			windower.send_command('wait 2; input /ja Accession <me>')
			windower.send_command('wait 4; input /ja Perpetuance <me>')
			windower.send_command('wait 6; input /ja Regen V ' .. sender)
		end
		if sender == 'Enuri' and message:contains('mountfollow') then
			windower.send_command('input /mount "Raptor" <me>')
			windower.send_command('wait 1; input //hb follow ' .. sender)
			windower.send_command('wait 1; input //hb follow dist 1')
		end
		if sender == 'Enuri' and message:contains('follow') then
			windower.send_command('wait 1; input //hb follow ' .. sender)
			windower.send_command('wait 1; input //hb follow dist 1')
		end
		if sender == 'Enuri' and message:contains('folbat') then
			windower.send_command('input //hb follow dist 20.5')
		end
		if sender == 'Enuri' and message:contains('foloff') then
			windower.send_command('input //hb follow off')
		end		
		if sender == 'Enuri' and message:contains('dismount') then
			windower.send_command('input /dismount')
		end
	end 
	if player.main_job == "SMN" then 
		if sender == 'Enuri' and message:contains('ipact') then
			windower.send_command('input /pet "Flaming Crush" <bt>')
		end
		if sender == 'Enuri' and message:contains('spact') then
			windower.send_command('input /pet "Flaming Crush" <bt>')
		end
		if sender == 'Enuri' and message:contains('lpact') then
			windower.send_command('input /pet "Flaming Crush" <bt>')
		end
		if sender == 'Enuri' and message:contains('rpact') then
			windower.send_command('input /pet "Flaming Crush" <bt>')
		end
		if sender == 'Enuri' and message:contains('gpact') then
			windower.send_command('input /pet "Flaming Crush" <bt>')
		end
		if sender == 'Enuri' and message:contains('tpact') then
			windower.send_command('input /pet "Flaming Crush" <bt>')
		end
		if sender == 'Enuri' and message:contains('dpact') then
			windower.send_command('input /pet "Flaming Crush" <bt>')
		end
		if sender == 'Enuri' and message:contains('cpact') then
			windower.send_command('input /pet "Flaming Crush" <bt>')
		end
		if sender == 'Enuri' and message:contains('caitpact') then
			windower.send_command('input /pet "Flaming Crush" <bt>')
		end
		if sender == 'Enuri' and message:contains('fpact') then
			windower.send_command('input /pet "Flaming Crush" <bt>')
		end
		if sender == 'Enuri' and message:contains('opact') then
			windower.send_command('input /pet "Flaming Crush" <bt>')
		end
		if sender == 'Enuri' and message:contains('apact') then
			windower.send_command('input /pet "Flaming Crush" <bt>')
		end
		if sender == 'Enuri' and message:contains('2hour') then
			windower.send_command('input /ja "Astral Flow" <me>')
			windower.send_command('wait 1; input /ja "Astral Conduit" <me>')
		end
		if sender == 'Enuri' and message:contains('mountfollow') then
			windower.send_command('input /mount "Raptor" <me>')
			windower.send_command('wait 1; input //hb follow ' .. sender)
			windower.send_command('wait 1; input //hb follow dist 1')
		end
		if sender == 'Enuri' and message:contains('follow') then
			windower.send_command('wait 1; input //hb follow ' .. sender)
			windower.send_command('wait 1; input //hb follow dist 1')
		end
		if sender == 'Enuri' and message:contains('folbat') then
			windower.send_command('input //hb follow dist 20.5')
		end
		if sender == 'Enuri' and message:contains('foloff') then
			windower.send_command('input //hb follow off')
		end		
		if sender == 'Enuri' and message:contains('dismount') then
			windower.send_command('input /dismount')
		end
	end 
end)