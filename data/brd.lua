--[[
	Generic file
	Creator: Enuri
	Server:	 Asura
	Funcitons: 
]]
----------------------------------------------
--  Initialization function required for    --
--          this to work properly           --
----------------------------------------------
function get_sets()
	include_version = 2
	include('Include.lua')
end 
------------------------------------------
-- Initialization of the various job 	--
-- Binds for the differnt modes			--
------------------------------------------
function job_binds()
 --[[ F9-F12 keybinds ]]
	send_command('bind f9 gs c cycle IdleMode')
	send_command('bind f10 gs c cycle OffenseMode')
	send_command('bind f11 gs c cycle HybridMode')
	send_command('bind f12 gs c cycle DefenseMode')
--[[ AltF9-AltF12 keybinds ]]
	send_command('bind !f9 gs c cycle AutoBuffMode')
	send_command('bind !f10 gs c cycle AutoShadowMode')
	send_command('bind !f11 gs c toggle LastResortMode')
	send_command('bind !f12 gs c toggle SouleaterMode')
	send_command('bind != gs c toggle CapacityMode')
	send_command('bind !` input /ma "Utsusemi: Ni" <me>')
	send_command('bind !q input /ma "Utsusemi: Ichi" <me>')
--[[ CtrlF9-CtrlF12 keybinds ]]
	send_command('bind ^f9 gs c cycle Empty')
	send_command('bind ^f10 gs c cycle Empty')
	send_command('bind ^f11 gs c cycle Empty')
	send_command('bind ^f12 gs c cycle Empty')
	send_command('bind ^` input /ma "Tonko: Ni" <me>')
	send_command('bind ^q input /ma "Monomi: Ichi" <me>')
--[[ WindowsF9-WindowsF12 keybinds ]]
	send_command('bind @f9 gs c set mainWeapon Kaja')
	send_command('bind @f10 gs c set mainWeapon Kali')
	send_command('bind @f11 gs c set mainWeapon Empty')
	send_command('bind @f12 gs c set mainWeapon Empty')
	send_command('bind @` input /ma "Chocobo Mazurka" <me>')
	send_command('bind @q input /ma "Sheep Song" <t>')
end
--------------------------
--  Job Setup Section   --
--------------------------
function job_setup()
	state.ExtraSongsMode = M{['description']='Extra Songs','None','Dummy','DummyLock','FullLength','FullLengthLock'}
	state.Buff['Aftermath: Lv.3'] = buffactive['Aftermath: Lv.3'] or false
    state.Buff['Pianissimo'] = buffactive['Pianissimo'] or false
	state.Buff['Nightingale'] = buffactive['Nightingale'] or false
	dummySongs = S{
		"Knight's Minne","Knight's Minne II","Knight's Minne III","Knight's Minne IV","Knight's Minne V",
	}
	debuffSongs = S{
		'Carnage Elegy', 'Foe Requiem VII', 'Fire Threnody', 'Ice Threnody', 'Wind Threnody', 'Earth Threnody',
		'Ltng. Threnody', 'Water Threnody', 'Dark Threnody', 'Light Threnody', 'Fire Threnody II', 'Ice Threnody II',
		'Wind Threnody II', 'Earth Threnody II', 'Ltng. Threnody II', 'Water Threnody II', 'Dark Threnody II', 'Light Threnody II'
	}
	state.RecoverMode = M('35%', '60%', 'Always', 'Never')
	autows = "Rudra\s Storm"
	autowstp = 1200
	autofood = 'Sublime Sushi'
	init_job_states({
		"Capacity","AutoRuneMode","AutoTrustMode","AutoNukeMode",
		"AutoWSMode","AutoShadowMode","AutoFoodMode","AutoStunMode",
		"AutoDefenseMode","AutoBuffMode",
		},{
		"AutoSambaMode","Weapons","OffenseMode","WeaponskillMode",
		"IdleMode","Passive","RuneElement","ExtraSongsMode","CastingMode",
		"TreasureMode",
	})
	state.mainWeapon = M{'None', 'Kaja', 'Kali'}
	oneHandList = S{'replace with your weapons'}
  	gsList = S{'Macbain', 'Crobaci +1'}
  	scytheList = S{'Cronus', 'Raetic Scythe'}
	bowList = S{'Bow1', 'Bow2'}
	gunList = S{'Doomsday', 'Holliday', 'Lionsquall'}
	state.rangedWeapon = M{'None', 'Fomalhaut', 'Annihilator', 'Yoichinoyumi', 'Gandiva'}
	-- For tracking current recast timers via the Timers plugin.
    custom_timers = {}
	moonshade_WS = S{
		"Rudra's Storm", "Evisceration"
	}
	gav_ws = S{
		"Rudra's Storm", "Evisceration"
	}
	--[[ Ninja Tools Section ]]
		ninjaTools = {
			Utsusemi = S{"Shihei",},--"Shikanofuda" 
			Hojo = S{"Kaginawa",},--"Chonofuda"
			Migawari = S{"Mokujin",},
			Kakka = S{"Ryuno",},
			Tonko = S{"Shinobi-tabi",},
			Kurayami = S{"Sairui-Ran",},
			Raiton = S{"Hiraishin",},
			Hyoton = S{"Tsurara",},
			Monomi = S{"Sanjaku-Tenugui",},
		}
end 
--------------------------
--  User Setup Section  --
--------------------------
function user_setup()
	state.IdleMode:options('Normal', 'MagicEva')
  	state.OffenseMode:options('Normal', 'MagicEva')
  	state.HybridMode:options('Normal', 'MagicEva')
  	state.WeaponskillMode:options('Normal', 'Mid', 'Acc')
  	state.CastingMode:options('Normal', 'Acc')
--[[ User Created states ]]
	state.CapacityMode = M(false, 'Capacity Point Mantle')
	info.ExtraSongInstrument = 'Daurdabla'
-- How many extra songs we can keep from Daurdabla/Terpander
		info.ExtraSongs = 1
-- Set this to false if you don't want to use custom timers.
	state.UseCustomTimers = M(true, 'Use Custom Timers')
--[[ Loading of various functions ]]
  	job_update(cmdParams, eventArgs)
  	select_default_macro_book()
  	set_lockstyle()
	get_player_name()
  	job_binds()
	set_healbot()
end 
--------------------------------
--  Gearswap Loading Section  --
--------------------------------
function get_player_name()
  	if windower.ffxi.get_player() then 
    	self = windower.ffxi.get_player().name
    	roll = windower.ffxi.get_player().main_job_full
    	windower.add_to_chat(7, 'Hello '..self..' your '..roll..' LUA is now loaded')
    	windower.add_to_chat(7, 'The gerbils are fetching your '..roll..' Lockstyle!')
		state.mainWeapon:set('Kaja')
    end 
end
--------------------------------------------------
--  This section is called when you change jobs --
--------------------------------------------------
function file_unload()
--[[ F9-F12 unbind's ]]
	send_command('unbind f9')
	send_command('unbind f10')
	send_command('unbind f11')
	send_command('unbind f12')
--[[ AltF9-AltF12 unbind's ]]
	send_command('unbind !f9')
	send_command('unbind !f10')
	send_command('unbind !f11')
	send_command('unbind !f12')
	send_command('unbind !=')
	send_command('unbind !`')
	send_command('unbind !q')
--[[ CtrlF9-CtrlF12 unbind's ]]
	send_command('unbind ^f9')
	send_command('unbind ^f10')
	send_command('unbind ^f11')
	send_command('unbind ^f12')
	send_command('unbind !`')
	send_command('unbind !q')
--[[ WindowsF9-WindowsF12 unbind's ]]
	send_command('unbind @f9')
	send_command('unbind @f10')
	send_command('unbind @f11')
	send_command('unbind @f12')
	send_command('unbind !`')
	send_command('unbind !q')
end 
----------------------------------------------
--  This tells Gear swap what sets to fetch --
--  Recommend creating a Car file.          --
----------------------------------------------
function init_gear_sets()
	--[[Gear is in a seperate File]]
end 
---------------------------
--  Custom Idle Gear set --
---------------------------	
function job_customize_idle_set(idleSet)
	if state.IdleMode.value == "MagicEva" then 
		idleSet = set_combine(idleSet, sets.idle.MagicEva)
	end 
	if state.CapacityMode.value then 
		idleSet = set_combine(idleSet, sets.CapacityMantle)
	end
	if state.Buff.Doom then
		idleSet = set_combine(idleSet, sets.buff.Doom)
	end		
	if S{"Eastern Adoulin","Western Adoulin"}:contains(world.area) then
		idleSet = set_combine(idleSet,{body="Councilor's Garb"})
	end
	return idleSet
end 
-------------------------------
--  Custom Melee Gear set    --
-------------------------------
function job_customize_melee_set(meleeSet)
	local abil_recasts = windower.ffxi.get_ability_recasts()
	if state.OffenseMode.value == "Acc" then 
		state.WeaponskillMode:set("Acc")
	elseif state.OffenseMode.value == "Normal" then  
		state.WeaponskillMode:reset()
	end		
	if state.HybridMode.value == "MagicEva" then 
		meleeSet = set_combine(meleeSet, sets.Engaged.MagicEva)
	elseif state.HybridMode.value == "DT" then 
		meleeSet = set_combine(meleeSet, sets.DT)
	end
	if state.CapacityMode.value then 
		meleeSet = set_combine(meleeSet, sets.CapacityMantle)
	end 
	if state.Buff.Doom then
		meleeSet = set_combine(meleeSet, sets.buff.Doom)
	end
--Dual Weild rule for more Double Attack. A Minimum of +11 DW is needed
	if (buffactive['Haste'] and buffactive['Mighty Guard']) or (buffactive['Haste'] and buffactive.march == 2) then 
		meleeSet = set_combine(meleeSet, sets.DA)
		--add_to_chat(8, '--Magic Haste 30%--')
	end 
	return meleeSet
end 
----------------------------------------------
--  General hooks for setting combat state  --
----------------------------------------------
  ------------------------------------------------ 
  --  	Called by the 'update' self-command,	-- 
  --  	for common needs.      					--
  --  	Set eventArgs.handled to true if we		-- 
  --	don't want automatic    				--
  --  	equipping of gear.                      --
  ------------------------------------------------
function job_update(cmdParams, eventArgs)
	job_status_change()
	get_combat_form()
	get_combat_weapon()
	job_state_change()
	update_melee_group()
end 
function job_status_change(newStatus, oldStatus, eventArgs)
	if newStatus == "Engaged" then 
	-- handle weapon sets
	end 
	if player.sub_job == 'NIN' then
		state.CombatForm:set("DW")
	else
		state.CombatForm:reset()
	end
end 
function get_combat_weapon()
	if state.mainWeapon.value == "Kaja" then 
		equip({main="Kaja Knife", sub="Taming Sari"})
	elseif state.mainWeapon.value == "Kali" then 
		equip({main="Kali", sub="Kali"})
	elseif state.mainWeapon.value == "Almace" then 
		equip({main="Almace", sub="Colada"})
	end	
	return get_combat_weapon
end 
function job_state_change() 
	if stateField == 'Offense Mode' then
		if newValue == 'Normal' then
			disable('main','sub','ammo')
		else
			enable('main','sub','ammo')
		end
	end
end 
function update_melee_group()
--[[ Can use this to create your own custom Template ]]
	classes.CustomMeleeGroups:clear()
	-- mythic AM	
	if player.equipment.main == 'Liberator' then
		if buffactive['Aftermath: Lv.3'] then
			classes.CustomMeleeGroups:append('AM3')
		end
	elseif buffactive['Aftermath'] then
		classes.CustomMeleeGroups:append('AM')
	end
	if player.equipment.main == 'Apocalypse' then 
		if buffactive['Aftermath'] then 
			classes.CustomMeleeGroups:append('AM')
			add_to_chat(8, '***Apocalypse haste is active. Switching to AM set***')
		end 
	end 
	if buffactive['Samurai Roll'] then
		classes.CustomRangedGroups:append('SamRoll')
	end
end
function get_combat_form() 
	if CombatForm == 'DW' then 
		classes.CustomMeleeGroups:clear()
	-- Haste (white magic) 15%  [33]
	-- Haste Samba (Sub) 5%		[370]
	-- Mighty Guard - 15%		[604]
	-- Victory March +3/+4/+5     14%/15.6%/17.1%
	-- Advancing March +3/+4/+5   10.9%/12.5%/14%
	-- Embrava 25%
		if (buffactive[604] and buffactive[33]) or buffactive.march == 2 then
			classes.CustomMeleeGroups:append('Haste_43')
			add_to_chat(8, '------------43% Haste Detected, equipping 11 DW to cap------------')
		elseif buffactive.embrava and buffactive.haste then
			classes.CustomMeleeGroups:append('Haste_40')
			add_to_chat(8, '-------------40% Haste Detected, equipping 27DW to cap-------------')
		elseif buffactive.haste then
			classes.CustomMeleeGroups:append('Haste_30')
			add_to_chat(8, '-------------30% Haste Detected, equipping 31DW to cap--------------')
		else 
			classes.CustomMeleeGroups:append('DW')
			add_to_chat(8, '-------------No Haste Detected, equipping 49DW to cap--------------')
		end
	end 
end 
-------------------------------------
--  Creating a custom spellMap,    --
-------------------------------------
function job_get_spell_map(spell, default_spell_map)
	
end	
-------------------------
-- Pre-Target section  --
-------------------------
function job_pretarget(spell, action, spellMap, eventArgs)
	if spell.type:endswith('Magic') and buffactive.silence then
		eventArgs.cancel = true
		send_command('input /item "Echo Drops" <me>')
	end
end
-----------------------
-- Pre-cast section  --
-----------------------
function job_filter_precast(spell, spellMap, eventArgs)
	if dummySongs:contains(spell.english) then 
		state.ExtraSongsMode:set('Dummy')
	else
		state.ExtraSongsMode:reset()
	end
end
function job_precast(spell, action, spellMap, eventArgs)
	if spell.type=="Ninjutsu" then 
		check_tools(spell) 
	end 
	if spell.type == 'BardSong' then
        -- Auto-Pianissimo
        if ((spell.target.type == 'PLAYER' and not spell.target.charmed) or (spell.target.type == 'NPC' and spell.target.in_party)) and
            not state.Buff['Pianissimo'] then
            
            local spell_recasts = windower.ffxi.get_spell_recasts()
            if spell_recasts[spell.recast_id] < 2 then
                send_command('@input /ja "Pianissimo" <me>; wait 1.5; input /ma "'..spell.name..'" '..spell.target.name)
                eventArgs.cancel = true
                return
            end
        end
    end
end 
function job_post_precast(eventArgs, spell, action, spellMap)
	--[[if spell.type=='WeaponSkill' then
		if moonshade_WS:contains(spell.english) and player.tp < 2850 then
			equip({ear2="Moonshade Earring"})
		end
	end]]
end 
-----------------------
--  Mid-cast Section --
-----------------------
function job_midcast(spell, action, spellMap, eventArgs)
	if spell.action_type == 'Magic' then
		if spell.type == 'BardSong' then
-- layer general gear on first, then let default handler add song-specific gear.
			local generalClass = get_song_class(spell)
			if generalClass and sets.midcast[generalClass] then
				equip(sets.midcast[generalClass])
			end
		end
	end
end
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.type == 'BardSong' then
		if state.ExtraSongsMode.value == 'FullLength' then
			equip(sets.midcast.SongEffect)
			state.ExtraSongsMode:reset()
		end 
	end
	if debuffSongs:contains(spell.english) then 
		equip(sets.midcast.SongDebuff)
	elseif debuffSongs:contains(spell.english) and state.CastingMode.value == "Resistant" then 
		equip (sets.midcast.ResistantSongDebuff)
	end 
end 
-------------------------
--  after-cast Section --
-------------------------
function job_aftercast(spell, action, spellMap, eventArgs)
	aftercast_start = os.clock()
		
	local generalClass = get_song_class(spell)
	if spell.type == 'BardSong' and not spell.interrupted then
			-- if spell.target and spell.target.type == 'SELF' then
			-- if spell.target.type ~= 'SELF' and spell.name ~= "Magic Finale" then   -- (Only using Custom Timers for debuffs; no huge reason for buffs)
		if spell.name ~= "Magic Finale" and (generalClass == "SongDebuff" or generalClass == "ResistantSongDebuff") then   -- (Only using Custom Timers for debuffs; no huge reason for buffs)
				--adjust_timers(spell, spellMap)
			local dur = calculate_duration(spell, spellMap)
			send_command('timers create "'..spell.target.name..':'..spell.name..'" '..dur..' down')
		end
		--state.ExtraSongsMode:reset()
	end
	--[[if state.SpellDebug.value == "On" then 
	  spelldebug(spell)
	end]]
	if spell.interrupted then
	  add_to_chat(8,'--------- Casting Interupted: '..spell.name..'---------')
	end 
		--equip(sets.Idle.Current)    
		--check_run_status()
	if precast_start and state.SpellDebug.value == "On" then 
			add_to_chat(8,"Spell: "..spell.name..string.format(" Casting Time: %.2f", aftercast_start - precast_start))
	end
	precast_start = nil
end 
function job_post_aftercast(spell, action, spellMap, eventArgs)
  
end 
function get_song_class(spell)
--[[
	Can't use spell.targets:contains() 
	because this is being pulled from resources 
]]
	if set.contains(spell.targets, 'Enemy') then
		if state.CastingMode.value == 'Resistant' then
			return 'ResistantSongDebuff'
		else
			return 'SongDebuff'
		end
	elseif state.ExtraSongsMode.value == 'Dummy' then
		return 'DaurdablaDummy'
	else
		return 'SongEffect'
	end
end
-----------------------------------------------------
	-- Function to create custom buff-remaining 	   --
	-- timers with the Timers plugin,				   --
	-- keeping only the actual valid songs rather than --
	-- spamming the default							   --
	-- buff remaining timers.						   --
	-----------------------------------------------------
function adjust_timers(spell, spellMap)
		if state.UseCustomTimers.value == false then
			return
		end
		
		local current_time = os.time()
--[[
	custom_timers contains a table of song names, with the
	os time when they will expire. Eliminate songs that 
	have already expired from our local list.
]]
		local temp_timer_list = {}
		for song_name,expires in pairs(custom_timers) do
			if expires < current_time then
				temp_timer_list[song_name] = true
			end
		end
		for song_name,expires in pairs(temp_timer_list) do
			custom_timers[song_name] = nil
		end			
		local dur = calculate_duration(spell.name, spellMap)
		if custom_timers[spell.name] then
--[[
	Songs always overwrite themselves now, unless the new song has
	less duration than the old one (ie: old one was NT version, new
	one has less duration than what's remaining).
	If new song will outlast the one in our list, replace it.
]]
			if custom_timers[spell.name] < (current_time + dur) then
				send_command('timers delete "'..spell.name..'"')
				custom_timers[spell.name] = current_time + dur
				send_command('timers create "'..spell.name..'" '..dur..' down')
			end
		else
			-- Figure out how many songs we can maintain.
			local maxsongs = 1
			if player.equipment.range == info.ExtraSongInstrument then
				maxsongs = maxsongs + info.ExtraSongs
			end
			if buffactive['Clarion Call'] then
				maxsongs = maxsongs + 1
			end
-- If we have more songs active than is currently apparent, we can still overwrite
-- them while they're active, even if not using appropriate gear bonuses (ie: Daur).
			if maxsongs < table.length(custom_timers) then
				maxsongs = table.length(custom_timers)
			end	
			-- Create or update new song timers.
			if table.length(custom_timers) < maxsongs then
				custom_timers[spell.name] = current_time + dur
				send_command('timers create "'..spell.name..'" '..dur..' down')
			else
				local rep,repsong
				for song_name,expires in pairs(custom_timers) do
					if current_time + dur > expires then
						if not rep or rep > expires then
							rep = expires
							repsong = song_name
						end
					end
				end
				if repsong then
					custom_timers[repsong] = nil
					send_command('timers delete "'..repsong..'"')
					custom_timers[spell.name] = current_time + dur
				send_command('timers create "'..spell.name..'" '..dur..' down')
			end
		end
	end
end
	---------------------------------------------------------------
	-- Function to calculate the duration of a song based on the --
	-- equipment used to -- cast it.Called from adjust_timers(), --
	-- which is only called on aftercast().						 --
	---------------------------------------------------------------
		function calculate_duration(spellName, spellMap)
			local mult = 1
	--[[ change to 0.25 with 90 Daur ]]
		if player.equipment.range == 'Daurdabla' then mult = mult + 0.3 end 
	--[[ change to 0.3 with 95 Gjall ]]
		if player.equipment.range == "Gjallarhorn" then mult = mult + 0.4 end 
	--[[ 0.1 for 75, 0.4 for 95, 0.5 for 99/119 ]]
		if player.equipment.main == "Carnwenhan" then mult = mult + 0.1 end 
		if player.equipment.main == "Legato Dagger" then mult = mult + 0.05 end
		if player.equipment.sub == "Legato Dagger" then mult = mult + 0.05 end
		if player.equipment.neck == "Aoidos' Matinee" then mult = mult + 0.1 end
		if player.equipment.body == "Aoidos' Hngrln. +2" then mult = mult + 0.1 end
		if player.equipment.legs == "Mdk. Shalwar +1" then mult = mult + 0.1 end
		if player.equipment.feet == "Brioso Slippers" then mult = mult + 0.1 end
		if player.equipment.feet == "Brioso Slippers +1" then mult = mult + 0.11 end
		
		if 
			spellMap == 'Paeon' and player.equipment.head == "Brioso Roundlet" then mult = mult + 0.1 
		end
		if 
			spellMap == 'Paeon' and player.equipment.head == "Brioso Roundlet +1" then mult = mult + 0.1 
		end
		if 
			spellMap == 'Madrigal' and player.equipment.head == "Aoidos' Calot +2" then mult = mult + 0.1 
		end
		if 
			spellMap == 'Minuet' and player.equipment.body == "Aoidos' Hngrln. +2" then 
			mult = mult + 0.1 
		end
		if 
			spellMap == 'March' and player.equipment.hands == 'Ad. Mnchtte. +2' then 
			mult = mult + 0.1 
		end
		if 
			spellMap == 'Ballad' and player.equipment.legs == "Aoidos' Rhing. +2" then mult = mult + 0.1 
		end
		if spellName == "Sentinel's Scherzo" and player.equipment.feet == "Aoidos' Cothrn. +2" then mult = mult + 0.1 end
		
		if buffactive.Troubadour then
			mult = mult*2
		end
		if spellName == "Sentinel's Scherzo" then
			if buffactive['Soul Voice'] then
				mult = mult*2
			elseif buffactive['Marcato'] then
				mult = mult*1.5
			end
		end	
		local totalDuration = math.floor(mult*120)
	return totalDuration
end	
function reset_timers()
    for i,v in pairs(custom_timers) do
        send_command('timers delete "'..i..'"')
    end
    custom_timers = {}
end		
--------------------------------------
-- 	Called when a player gains 		--
--	or loses a buff. buff == buff 	--
--	gained or lost. gain == true 	--
--	if the buff was gained, false 	--
--	if it was lost.   				--
--------------------------------------
function job_buff_change(buff, gain)	
	if state.Buff[buff] ~= nil then
		state.Buff[buff] = gain
		handle_equipping_gear(player.status)
	end
	if buff:lower()=='terror' or buff:lower()=='petrification' or buff:lower()=='stun' then
		if gain then
			equip(sets.DT)
			add_to_chat(8, 'DT set is equiped')
		elseif not gain then 
			handle_equipping_gear(player.status)
		end
	end
	if buff:lower()=='sleep' then
		if gain and player.hp > 120 and player.status == "Engaged" then 
		-- Equip Berserker's Torque / Frenzy Sallet 
			equip(sets.Asleep)
		elseif not gain then 
		-- Remove Berserker's Torque / Frenzy Sallet
			handle_equipping_gear(player.status)
		end
	end
	if buff == "doom" then
		if gain then           
			equip(sets.buff.Doom)
			--send_command('@input /p Doomed please cursna.')
			send_command('@input /item "Holy Water" <me>')
			disable('ring1','ring2','waist')
		else
			enable('ring1','ring2','waist')
			handle_equipping_gear(player.status)
		end
	end
	if buffactive['Reive Mark'] then
		equip(sets.Reive)
		disable('neck')
		else
			enable('neck')
	end
--[[ Haste Buffs Rules	]]	
	if S{'haste', 'march', 'mighty guard', 'embrava', 'haste samba', 'geo-haste', 'indi-haste'}:contains(buff:lower()) then
        get_combat_form()
        if not midaction() then
            handle_equipping_gear(player.status)
        end
    end
--[[ Job Specific Buff handling ]]	
end 
----------------------------------
--  Sub job section for Ninja   --
----------------------------------
function check_tools(spell)
	for prefix,tools in pairs(ninjaTools) do
		if spell.english:startswith(prefix) then
			for tool in tools:it() do
				if not player.inventory[tool] then
					add_to_chat(100,'WARNING: You are out of '..tool..'.')
				elseif player.inventory[tool].count < 10 then
					add_to_chat(100,'WARNING: You are low on '..tool..'. '..player.inventory[tool].count..' remaining.')
				end
			end
		end
	end
end
----------------------------------------
--  Selecting and Setting the default --
--	Macro book and Lock style 		  --
----------------------------------------
function select_default_macro_book()
	if player.sub_job == 'RDM' then
        set_macro_page(10, 7)
    else
        set_macro_page(1, 10)
    end
end
function set_lockstyle()
	send_command('wait 4; input /lockstyleset 4')
end
-----------------------
-- Miscelanous Stuff --
-----------------------
function set_healbot()
	send_command('wait 6; input //lua l healbot')
end 
windower.raw_register_event('zone change',reset_timers)
windower.raw_register_event('logout',reset_timers)
----------------------------------
--	Command Section for Warping	--
----------------------------------
function user_job_self_command(commandArgs, eventArgs) 
	include('commands')
	include('brdbuffs')
end
