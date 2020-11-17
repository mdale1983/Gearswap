function user_job_self_command(commandArgs, eventArgs) 
--[[ Mea Ring ]]
			if commandArgs:get(1) == 'mea3' then
                send_command('input //gs c mea1; wait 10; input //gs c mea2; wait 10; input //gs c mea1')
				send_command('input /equip Ring1 "Dim. Ring (Mea)"')
                add_to_chat(158,'Warping to Mea')
--[[ Dem Ring ]]
			elseif commandArgs:get(1) == 'dem3' then
                send_command('input //gs c dem1; wait 10; input //gs c dem2; wait 10; input //gs c dem1')
				send_command('input /equip Ring1 "Dim. Ring (Dem)"')
                add_to_chat(158,'Warping to Dem')
--[[ Holla Ring ]]
			elseif commandArgs:get(1) == 'hol3' then
                send_command('input //gs c hol1; wait 10; input //gs c hol2; wait 10; input //gs c hol1')
				send_command('input /equip Ring1 "Dim. Ring (Holla)"')
                add_to_chat(158,'Warping to Holla')
--[[ Warp Ring ]]
			elseif commandArgs:get(1) == 'warp' then
                send_command('input //gs c w1; wait 10; input //gs c w2; wait 10; input //gs c w1')
				send_command('input /equip Ring1 "Warp Ring"')
                add_to_chat(158,'Warping to Warp Ring')				
			elseif commandArgs:get(1) == 'rad' then
                send_command('input /echo waiting; wait 1.5; input //temps buy radialens')
                add_to_chat(158,'Warping to Radialens')
			elseif commandArgs:get(1) == 'mhaura' then
                send_command('input /echo waiting; wait 1.5; input //sw hp warp Mhaura 1')
                add_to_chat(158,'Warping to Mhaura 1')
			elseif commandArgs:get(1) == 'pwin3' then
                send_command('input /echo waiting; wait 1.5; input //sw hp warp Port Windurst 3')
                add_to_chat(158,'Warping to Port Windurst 3')
--[[ FeiYin ]]
			elseif commandArgs:get(1) == 'fei2' then
                send_command('input /echo waiting; wait 1.5; input //sw hp warp Fei\'Yin 1')
                add_to_chat(158,'Warping to Qu\'Bia Arena')
--[[Windurst Walls ]]
			elseif commandArgs:get(1) == 'ww1' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp Windurst Walls 1')
                add_to_chat(158,'Warping to Windurst Walls 1')
			elseif commandArgs:get(1) == 'ww2' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp Windurst Walls 2')
                add_to_chat(158,'Warping to Windurst Walls 2')
			elseif commandArgs:get(1) == 'ww3' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp Windurst Walls 3')
                add_to_chat(158,'Warping to Windurst Walls 3')
--[[ Windurst Waters ]]
			elseif commandArgs:get(1) == 'waters2' then
                send_command('input /ech Waiting; wait 1.5; input //sw hp warp Windurst Waters 2')
                add_to_chat(158,'Warping to Windurst Waters 2')
			elseif commandArgs:get(1) == 'waters3' then
                send_command('input /ech Waiting; wait 1.5; input //sw hp warp Windurst Waters 3')
                add_to_chat(158,'Warping to Windurst Waters 3')
--[[ Windurst Woods	]]
			elseif commandArgs:get(1) == 'woods2' then
                send_command('input /ech Waiting; wait 1.5; input //sw hp warp Windurst Woods 2')
                add_to_chat(158,'Warping to Windurst Woods 2')
--[[ Western Adoulin ]]
			elseif commandArgs:get(1) == 'wado1' then                
				send_command('input /echo Waiting; wait 1.5; input //sw hp warp Western Adoulin 1')
                add_to_chat(158,'Warping to Western Adoulin 1')
			elseif commandArgs:get(1) == 'wado2' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp Western Adoulin 2')
                add_to_chat(158,'Warping to Western Adoulin 2')
--[[ Eastern Adoulin ]]
			elseif commandArgs:get(1) == 'eado1' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp Eastern Adoulin 1')
                add_to_chat(158,'Warping to Eastern Adoulin 1')
			elseif commandArgs:get(1) == 'eado2' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp Eastern Adoulin 2')
                add_to_chat(158,'Warping to Eastern Adoulin 2')
--[[ Leafallia ]]
			elseif commandArgs:get(1) == 'leaf' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp Leafallia 1')
                add_to_chat(158,'Warping to Leafy City')
--[[ Misareaux Coast]]
			elseif commandArgs:get(1) == 'miser' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp Misareaux Coast 1')
                add_to_chat(158,'Warping to Misareaux Coast')	
--[[ Jeuno ]]
			elseif commandArgs:get(1) == 'pj1' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp port jeuno 1')
                add_to_chat(158,'Warping to Port Jeuno')	
			elseif commandArgs:get(1) == 'uj1' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp Upper Jeuno 1')
                add_to_chat(158,'Warping to Upper Jeuno')
			elseif commandArgs:get(1) == 'lj1' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp Lower Jeuno 1')
                add_to_chat(158,'Warping to Lower Jeuno #1')
			elseif commandArgs:get(1) == 'lj2' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp Lower Jeuno 2')
                add_to_chat(158,'Warping to Lower Jeuno #2')	
			elseif commandArgs:get(1) == 'ru2' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp Ru\'Lude Gardens 2')
                add_to_chat(158,'Warping to Ru\'Lude Gardens')
--[[ Bastok ]]
			elseif commandArgs:get(1) == 'pb2' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp Port Bastok 2')
                add_to_chat(158,'Warping to Port Bastok')
			elseif commandArgs:get(1) == 'bm1' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp Bastok Markets 1')
                add_to_chat(158,'Warping to Bastok Markets')
			elseif commandArgs:get(1) == 'bmine1' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp Bastok Mines 1')
                add_to_chat(158,'Warping to Bastok Mines')
			elseif commandArgs:get(1) == 'mw1' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp Metalworks 1')
                add_to_chat(158,'Warping to Metalworks')
--[[ San D'oria ]]
			elseif commandArgs:get(1) == 'ss2' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp Southern San D\'oria 1')
                add_to_chat(158,'Warping to South Sandy')
			elseif commandArgs:get(1) == 'ns1' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp Northern San D\'oria 3')
                add_to_chat(158,'Warping to North Sandy')
			elseif commandArgs:get(1) == 'ps1' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp Port San D\'oria 1')
                add_to_chat(158,'Warping to Port Sandy')
--[[ Norg ]]
			elseif commandArgs:get(1) == 'norg' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp Norg 1')
                add_to_chat(158,'Warping to Norg')
--[[ Mhaura ]]
			elseif commandArgs:get(1) == 'mhaura' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp Mhaura 1')
                add_to_chat(158,'Warping to Mhaura')
--[[ Rabao ]]
			elseif commandArgs:get(1) == 'rabao' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp Rabao 1')
                add_to_chat(158,'Warping to Rabao')
--[[ Selbina ]]
			elseif commandArgs:get(1) == 'selbina' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp Selbina 1')
                add_to_chat(158,'Warping to Selbina')
--[[ Kazham ]]
			elseif commandArgs:get(1) == 'kazham' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp Kazham 1')
                add_to_chat(158,'Warping to Kazham')
--[[ Shiva ]]
			elseif commandArgs:get(1) == 'shiva' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp Fei\'Yin 2')
                add_to_chat(158,'Warping to Cloister of Frost')
--[[ Ramuh ]]
			elseif commandArgs:get(1) == 'ramuh' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp The Boyahda Tree 1')
                add_to_chat(158,'Warping to Cloister of Lightning')
--[[ Titan ]]
			elseif commandArgs:get(1) == 'titan' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp Quicksand Caves 2')
                add_to_chat(158,'Warping to Cloister of Tremors')
--[[ Levithan ]]
			elseif commandArgs:get(1) == 'levi' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp Den of Rancor 2')
                add_to_chat(158,'Warping to Cloister of Tides')
--[[ Ifrit ]]
			elseif commandArgs:get(1) == 'ifrit' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp Ifrit\'s Cauldron 1')
                add_to_chat(158,'Warping to Cloister of Flames')
--[[ Garuda ]]
			elseif commandArgs:get(1) == 'garuda' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp Cape Teriggan 1')
                add_to_chat(158,'Warping to Cloister of Gales')
--[[ Sky ]]
			elseif commandArgs:get(1) == 'sky' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp Ru\'Aun Gardens 2')
                add_to_chat(158,'Warping to Ru\'Aun Gardens')
--[[ Upper Delkfutt ]]
			elseif commandArgs:get(1) == 'ud1' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp Upper Delkfutt\'s 1')
                add_to_chat(158,'Warping to Stellar Fulcrum')
--[[ Castle Zvahl Keep ]]
			elseif commandArgs:get(1) == 'czk' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp Castle Zvahl Keep 1')
                add_to_chat(158,'Warping to Throne Room')
--[[ The Shrine of Ru'Avitau ]]
			elseif commandArgs:get(1) == 'avitau' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp The Shrine of Ru\'Avitau 1')
                add_to_chat(158,'Warping to Celestial Nexus')
--[[ Tavnazian Safehold ]]
			elseif commandArgs:get(1) == 'tav' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp Tavnazian Safehold 2')
                add_to_chat(158,'Warping to Tavnazin Safehold')
--[[ Attohwa Chasm ]]
			elseif commandArgs:get(1) == 'attohwa' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp Attohwa Chasm 1')
                add_to_chat(158,'Warping to Attohwa Chasm')
--[[ The Garden of Ru'Hmet ]]
			elseif commandArgs:get(1) == 'hmet' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp The Garden of Ru\'Hmet 1')
                add_to_chat(158,'Warping to Garden of Ru\'Hmet')
--[[ Bhaflau Thickets ]]
			elseif commandArgs:get(1) == 'thickets' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp Bhaflau Thickets 1')
                add_to_chat(158,'Warping to Bhaflau Thickets')
--[[ Caedarva Mire ]]
			elseif commandArgs:get(1) == 'mire' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp Caedarva Mire 1')
                add_to_chat(158,'Warping to Celestial Nexus')
--[[ Fenrir and Carbuncle ]]
			elseif commandArgs:get(1) == 'canal' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp Toraimarai Canal 1')
                add_to_chat(158,'Warping to Full Moon Fountain')
--[[ Diablos ]]
			elseif commandArgs:get(1) == 'pso' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp Pso\'Xja 1')
                add_to_chat(158,'Warping to Diablos')
--[[ Riverne - Site #B01 ]]
			elseif commandArgs:get(1) == 'b01' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp Riverne - Site #B01 1')
                add_to_chat(158,'Warping to Riverne - Site #B01')
--[[ Riverne - Site #A01 ]]
			elseif commandArgs:get(1) == 'a01' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp Riverne - Site #A01 1')
                add_to_chat(158,'Warping to Riverne - Site #A01')
--[[ Newtown Movalpolos ]]
			elseif commandArgs:get(1) == 'newtown' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp Newtown Movalpolos 1')
                add_to_chat(158,'Warping to Newtown Movalpolos')
--[[ Aht Urhgan ]]
			elseif commandArgs:get(1) == 'whitegate' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp Aht Urhgan Whitegate 2')
                add_to_chat(158,'Warping to Whitegate')
--[[ Qufim Island ]]
			elseif commandArgs:get(1) == 'qufim' then
                send_command('input /echo Waiting; wait 1.5; input //sw hp warp Qufim Island 1')
                add_to_chat(158,'Warping to Qufim')
--[[ WayPoint warps ]]
			elseif commandArgs:get(1) == 'wadowp' then
                send_command('input /echo Waiting; wait 1.5; input //sw wp warp Western Adoulin Pioneers')
                add_to_chat(158,'Warping to Western Adoulin Pioneers Coalition')
	--[[ Yahse Hunting ]]
			elseif commandArgs:get(1) == 'yashfs' then
                send_command('input /echo Waiting; wait 1.5; input //sw wp warp Yahse Hunting Grounds fs')
                add_to_chat(158,'Warping to Yahse Hunting Grounds Frontier Station')
	--[[ Ceizak Battlegrounds ]]
			elseif commandArgs:get(1) == 'ceifs' then
                send_command('input /echo Waiting; wait 1.5; input //sw wp warp Ceizak Battlegrounds fs')
                add_to_chat(158,'Warping to Ceizak Battlegrounds Frontier Station')
	--[[ Foret de Hennetiel ]]
			elseif commandArgs:get(1) == 'forfs' then
                send_command('input /echo Waiting; wait 1.5; input //sw wp warp Foret de Hennetiel fs')
                add_to_chat(158,'Warping to Foret de Hennetiel Frontier Station')
			elseif commandArgs:get(1) == 'forwp4' then
                send_command('input /echo Waiting; wait 1.5; input //sw wp warp Foret de Hennetiel 4')
                add_to_chat(158,'Warping to Foret de Hennetiel WP #4')
	--[[ Yorcia Weald ]]
			elseif commandArgs:get(1) == 'yorfs' then
                send_command('input /echo Waiting; wait 1.5; input //sw wp warp Yorcia Weald fs')
                add_to_chat(158,'Warping to Yorcia Weald Frontier Station')
	--[[ Morimar Basalt ]]
			elseif commandArgs:get(1) == 'morifs' then
                send_command('input /echo Waiting; wait 1.5; input //sw wp warp Morimar Basalt Fields fs')
                add_to_chat(158,'Warping to Morimar Basalt Fields Frontier Station')
			elseif commandArgs:get(1) == 'moriwp5' then
                send_command('input /echo Waiting; wait 1.5; input //sw wp warp Morimar Basalt Fields 5')
                add_to_chat(158,'Warping to Morimar Basalt Fields Waypoint #5')
	--[[ Marjami Ravine ]]
			elseif commandArgs:get(1) == 'marjfs' then
                send_command('input /echo Waiting; wait 1.5; input //sw wp warp Marjami Ravine fs')
                add_to_chat(158,'Warping to Marjami Ravine Frontier Station')
			elseif commandArgs:get(1) == 'marjwp4' then
                send_command('input /echo Waiting; wait 1.5; input //sw wp warp Marjami Ravine 4')
                add_to_chat(158,'Warping to Marjami Ravine Waypoint #4')
	--[[ Kamihr Drifts ]]
			elseif commandArgs:get(1) == 'kamfs' then
                send_command('input /echo Waiting; wait 1.5; input //sw wp warp Kamihr Drifts fs')
                add_to_chat(158,'Warping to Kamihr Drifts Frontier Station')
	--[[ Outter Raz ]]
			elseif commandArgs:get(1) == 'outtwp' then
                send_command('input /echo Waiting; wait 1.5; input //sw wp warp Outter Ra\'Kaznar')
                add_to_chat(158,'Warping to Kamihr Drifts Frontier Station')
--[[ Escha Zone WP warps ]]
			elseif commandArgs:get(1) == 'enter' then
                send_command('input /echo Waiting; wait 1.5; input //sw ew all enter')
                add_to_chat(158,'Now Entering an Escha Zone')
	--[[ Escha Zi'Tah ]]
			elseif commandArgs:get(1) == 'ew1' then
                send_command('input /echo Waiting; wait 1.5; input //sw ew warp 1')
                add_to_chat(158,'Warping to Eschan Warp #1')
			elseif commandArgs:get(1) == 'ew2' then
                send_command('input /echo Waiting; wait 1.5; input //sw ew warp 2')
                add_to_chat(158,'Warping to Eschan Warp #2')
			elseif commandArgs:get(1) == 'ew3' then
                send_command('input /echo Waiting; wait 1.5; input //sw ew warp 3')
                add_to_chat(158,'Warping to Eschan Warp #3')
			elseif commandArgs:get(1) == 'ew4' then
                send_command('input /echo Waiting; wait 1.5; input //sw ew warp 4')
                add_to_chat(158,'Warping to Eschan Warp #4')
			elseif commandArgs:get(1) == 'ew5' then
                send_command('input /echo Waiting; wait 1.5; input //sw ew warp 5')
                add_to_chat(158,'Warping to Eschan Warp #5')
			elseif commandArgs:get(1) == 'ew6' then
                send_command('input /echo Waiting; wait 1.5; input //sw ew warp 6')
                add_to_chat(158,'Warping to Eschan Warp #6')
			elseif commandArgs:get(1) == 'ew7' then
                send_command('input /echo Waiting; wait 1.5; input //sw ew warp 7')
                add_to_chat(158,'Warping to Eschan Warp #7')
			elseif commandArgs:get(1) == 'ew8' then
                send_command('input /echo Waiting; wait 1.5; input //sw ew warp 8')
                add_to_chat(158,'Warping to Eschan Warp #8')
			elseif commandArgs:get(1) == 'ew9' then
                send_command('input /echo Waiting; wait 1.5; input //sw ew warp 9')
                add_to_chat(158,'Warping to Eschan Warp #9')
			elseif commandArgs:get(1) == 'ew10' then
                send_command('input /echo Waiting; wait 1.5; input //sw ew warp 10')
                add_to_chat(158,'Warping to Eschan Warp #10')
			elseif commandArgs:get(1) == 'ew11' then
                send_command('input /echo Waiting; wait 1.5; input //sw ew warp 11')
                add_to_chat(158,'Warping to Eschan Warp #11')
			elseif commandArgs:get(1) == 'ew12' then
                send_command('input /echo Waiting; wait 1.5; input //sw ew warp 12')
                add_to_chat(158,'Warping to Eschan Warp #12')
			elseif commandArgs:get(1) == 'ew13' then
                send_command('input /echo Waiting; wait 1.5; input //sw ew warp 13')
                add_to_chat(158,'Warping to Eschan Warp #13')
			elseif commandArgs:get(1) == 'ew14' then
                send_command('input /echo Waiting; wait 1.5; input //sw ew warp 14')
                add_to_chat(158,'Warping to Eschan Warp #14')
			elseif commandArgs:get(1) == 'ew15' then
                send_command('input /echo Waiting; wait 1.5; input //sw ew warp 15')
                add_to_chat(158,'Warping to Eschan Warp #15')
--[[ 	Temp Item Useage Section 	]]		
		--[[ Doom Guard ]]
			elseif commandArgs:get(1) == 'doom' then
                send_command('input /item "Savior\'s Tonic" <me>')
                add_to_chat(158,'Warping to Savior tonic')
		--[[ Terror ]]
			elseif commandArgs:get(1) == 'terror' then
                send_command('input /item "Steadfast Tonic" <me>')
                add_to_chat(158,'Warping to Savior tonic')
		--[[ Poison Buffer ]]
			elseif commandArgs:get(1) == 'poison' then
                send_command('input /item "Poison Buffer" <me>')
                add_to_chat(158,'Using Poison Buffer')
		--[[ tolba's shell ]]
			elseif commandArgs:get(1) == 'tolba' then
                send_command('input /item "tolba\'s shell" <t>')
                add_to_chat(158,'Warping to tolba shell')
		--[[ Charm Buffer ]]
			elseif commandArgs:get(1) == 'charm' then
                send_command('input /item "Charm Buffer" <me>')
                add_to_chat(158,'Warping to Charm buffer')
		--[[ TP Wings ]]
			elseif commandArgs:get(1) == 'wing1' then
                send_command('input /item "Lucid Wings I" <me>')
                add_to_chat(158,'Warping to Lucid Wings I')
			elseif commandArgs:get(1) == 'wing2' then
                send_command('input /item "Lucid Wings II" <me>')
                add_to_chat(158,'Warping to Lucid Wings II')
			elseif commandArgs:get(1) == 'wing3' then
                send_command('input /item "Daedalus wing" <me>')
                add_to_chat(158,'Warping to Daedalus wing')
		--[[ Super Revitalizer ]]
			elseif commandArgs:get(1) == 'super' then
                send_command('input /item "Super Revitalizer" <me>')
                add_to_chat(158,'Warping to Super Revitalizer')
		--[[ Re-Raise ]]
			elseif commandArgs:get(1) == 'RR1' then
                send_command('input /ma "reraise" <me>')
                add_to_chat(158,'Warping to Using Reraiser')
			elseif commandArgs:get(1) == 'RR2' then
                send_command('input /ma reraise" <me>')
                add_to_chat(158,'Warping to Using Hi-Reraiser')
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
end