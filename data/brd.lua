--[[
	Ninja: v2.0.2
	Creator: Enuri
	Server:	 Asura
	Funcitons: 	This lua will allow the user to change main weapons on the fly
				and gives the user the ability to maintain buffs and perform 
				weaponskills and auto eat food.
				
				This lua requires my libs which are based on Selindrile's LIBS
				There are a few modifications that have been made. 
		Auto Functions 
			Weapon Skill 
			Tanking
			Buffs
			Job Abilites
		Display has been setup to the bottom of the screen using a resolution of 2560x1440
			the display bar is used to display the current states of the various functions
			not all functions have been displayed; only certain ones are allowed. 
]]
----------------------------------------------
--  Initialization function required for    --
--          this to work properly           --
----------------------------------------------
function get_sets()
	include('Include.lua')
	include('organizer-lib')
end 
------------------------------------------
-- Initialization of the various job 	--
-- Binds for the differnt modes			--
------------------------------------------
function job_binds()
 --[[ F9-F12 keybinds ]]
	send_command('bind f7 gs c cycle RangedMode')
	send_command('bind f9 gs c cycle IdleMode')
	send_command('bind f10 gs c cycle OffenseMode')
	send_command('bind f11 gs c cycle HybridMode')
	send_command('bind f12 gs c cycle WeaponskillMode')
--[[ AltF9-AltF12 keybinds ]]
	send_command('bind !f9 gs c toggle AutoBuffMode')
	send_command('bind !f10 gs c toggle AutoWSMode')
	send_command('bind !f11 gs c toggle AutoFoodMode')
	send_command('bind !f12 gs c toggle AutoShadowMode')
	send_command('bind != gs c toggle CapacityMode')
	send_command('bind !` input /ma "Utsusemi: Ni" <me>')
	send_command('bind !q input /ma "Utsusemi: Ichi" <me>')
--[[ CtrlF9-CtrlF12 keybinds ]]
	send_command('bind ^f9 gs c cycle empty')
	send_command('bind ^f10 gs c cycle empty')
	send_command('bind ^f11 gs c cycle empty')
	send_command('bind ^f12 gs c cycle empty')
	send_command('bind ^` input /ma "Tonko: Ni" <me>')
	send_command('bind ^q input /ma "Monomi: Ichi" <me>')
--[[ WindowsF9-WindowsF12 keybinds ]]
	send_command('bind @f7 gs c set Weapons Carnwenhan') 	--Mythic Weapon 
	send_command('bind @f8 gs c set Weapons Mandau')			--Empy Weapon 
	send_command('bind @f9 gs c set Weapons Aeneas')			--Relic Weapon
	send_command('bind @f10 gs c set Weapons Tauret')		--Relic Weapon
	send_command('bind @f11 gs c set Weapons Armageddon')		--Empy Weapon
	send_command('bind @f12 gs c set Weapons Twashtar')			--Aeonic Weapon
	send_command('bind @` input /ma "Aquaveil" <me>')
	send_command('bind @q input /ma "Sheep Song" <t>')
end
--------------------------
--  Job Setup Section   --
--------------------------
function job_setup()
	state.Weapons = M{'None', 'Tauret','Carnwenhan', 'Twashtar', 'Mandau', 'Aeneas'}
	
	state.crafting = M(false)
	
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
	state.Buff['Aftermath'] = buffactive['Aftermath'] or false
    state.Buff['Aftermath: Lv.3'] = buffactive['Aftermath: Lv.3'] or false
	state.RecoverMode = M('35%', '60%', 'Always', 'Never')
	
	autows = "Rudra\s Storm"
	autowstp = 1600
	autofood = 'Sublime Sushi'
	
--[[ Initialization of auto job functions ]]
	init_job_states({
		"Capacity","AutoRuneMode","AutoWSMode",
		"AutoShadowMode","AutoFoodMode","AutoBuffMode",
		},{
		"Weapons","AutoFoodMode","AutoBuffMode",
		"OffenseMode","WeaponskillMode","IdleMode","AutoWSMode"
	})
--[[ Moonshade earring and Gav. Helmet ]]
	moonshade_WS = S{
		"Rudra's Storm", "Evisceration"
	}
	gav_ws = S{
		"Rudra's Storm", "Evisceration"
	}
	utsusemi_ni_cancel_delay = .1
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
	state.HasteMode = M{['description']='Haste Mode', 'Hi', 'Normal'}
--[[ Organizer stuff ]]
	organizer_items = {
		echos="Echo Drops",
		holyWater="Holy Water",	
	}
--[[ Loading of various functions ]]
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
		--state.Weapons:set('Tauret')
		send_command('gs c Weapons Tauret')
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
		send_command('unbind ^`')
		send_command('unbind ^q')
	--[[ WindowsF9-WindowsF12 unbind's ]]
		send_command('unbind @f7')
		send_command('unbind @f8')
		send_command('unbind @f9')
		send_command('unbind @f10')
		send_command('unbind @f11')
		send_command('unbind @f12')
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
	if state.HybridMode.value == "MagicEva" then 
		meleeSet = set_combine(meleeSet, sets.idle.MagicEva)
	end 
	if state.CapacityMode.value then 
		meleeSet = set_combine(meleeSet, sets.CapacityMantle)
	end
	if state.Buff.Doom then
		meleeSet = set_combine(meleeSet, sets.buff.Doom)
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
	determine_haste_group()
	update_melee_group()
end 
function job_status_change(newStatus, oldStatus, eventArgs)
	if newStatus == "Engaged" then 
	-- handle weapon sets
		if player.equipment.range == 'Fomalhuat' then
			state.CombatWeapon:set('Fomalhuat')
		elseif player.equipment.range == 'Mandau' then
			state.CombatWeapon:set('Mandau')
		elseif player.equipment.range == 'Carnwenhan' then
			state.CombatWeapon:set('Carnwenhan')
		elseif player.equipment.range == 'Tauret' then
			state.CombatWeapon:set('Tauret')
		elseif player.equipment.range == 'Armageddon' then
			state.CombatWeapon:set('Armageddon')
		end
	end 
end 
function get_combat_form() 
	if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
		state.CombatForm:set("DW")
	else
		state.CombatForm:reset()
	end
	if buffactive['Samurai Roll'] then
		classes.CustomRangedGroups:append('SamRoll')
	end
end 
function get_combat_weapon()
	if state.Weapons.value == "Tauret" then 
	elseif state.Weapons.value == "Carnwenhan" then 
	elseif state.Weapons.value == "Twashtar" then 
	elseif state.Weapons.value == "Mandau" then 
	elseif state.Weapons.value == "Aeneas" then 
	end
	return get_combat_weapon
end 
function job_state_change(cmdParams, eventArgs) 
	--[[	Left empty for now	]]
	if buffactive['Samurai Roll'] then
		classes.CustomRangedGroups:append('SamRoll')
	end
end 
function determine_haste_group(buff, gain)
	classes.CustomMeleeGroups:clear()
		--[[
			Haste (white magic) 15%  [33]
			Haste Samba (Sub) 5%		[370]
			Mighty Guard - 15%		[604]
			Victory March +3/+4/+5     14%/15.6%/17.1%
		 	Advancing March +3/+4/+5   10.9%/12.5%/14%
			Embrava 25%
		]]
	if (buffactive[604] and buffactive[33]) or buffactive.March == 2 then
		classes.CustomMeleeGroups:append('Haste_43')
	elseif buffactive.haste and state.HasteMode.Value == "Hi" then
		classes.CustomMeleeGroups:append('Haste_30')
	elseif buffactive.haste then
		classes.CustomMeleeGroups:append('Haste_15')
	else 
		classes.CustomMeleeGroups:append('DW')
	end
end 
function update_melee_group()
--[[ Can use this to create your own custom Template ]]
	classes.CustomMeleeGroups:clear()
	if buffactive['Aftermath'] then
		classes.CustomMeleeGroups:append('AM')
	end	
end
-------------------------------------
--  Creating a custom spellMap,    --
-------------------------------------
function job_get_spell_map(spell, default_spell_map)
	if spell.skill == "Ninjutsu" then
		if not default_spell_map then
			if spell.target.type == 'SELF' then
				return 'NinjutsuBuff'
			else
				return 'NinjutsuDebuff'
			end
		end
	end
end	
function job_self_command(commandArgs, eventArgs)
    if commandArgs[1]:lower() == 'statusammo' then
		if commandArgs[2] then
			statusammo = table.concat(commandArgs, ' ', 2)
		else
			statusammo = nil
		end
		if state.DisplayMode.value then update_job_states()	end
	end
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
function check_ammo_precast(spell, action, spellMap, eventArgs)
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
	if spell.type == "CorsairShot" then 
		equip({ammo=DefaultAmmo[WeaponType[player.equipment.range]].Magic})
	end 
	if spellMap == 'Utsusemi' then
		if buffactive['Copy Image (3)'] or buffactive['Copy Image (4+)'] then
			cancel_spell()
			add_to_chat(123, '**!! '..spell.english..' Canceled: [3+ IMAGES] !!**')
			eventArgs.handled = true
			return
		elseif buffactive['Copy Image'] or buffactive['Copy Image (2)'] then
			send_command('cancel 66; cancel 444; cancel Copy Image; cancel Copy Image (2)')
		end
	end
	if spell.action_type == 'Ranged Attack' then
		state.CombatWeapon:set(player.equipment.range)
	end
		if spell.action_type == 'Ranged Attack' or spell.name == 'Bounty Shot' or spell.name == 'Shadowbind' or (spell.type == 'WeaponSkill' and (spell.skill == 'Marksmanship' or spell.skill == 'Archery')) then
		check_ammo_precast(spell, action, spellMap, eventArgs)
	end
end 
function job_post_precast(spell, spellMap, eventArgs)
	if spell.action_type=="Magic" and buffactive.Silence then
		eventArgs.cancel = true
		send_command('input /item "Echo Drops" <me>')
	end
	if spell.type=='WeaponSkill' then
		if moonshade_WS:contains(spell.english) and player.tp < 2750 then
			equip({ear2="Moonshade Earring"})
		end
	end
	if player.equipment.main =="Twashtar" then 
		if spell.english == "Rudra's Storm" and (player.tp >= 1000 and player.tp < 1999) then 
			add_to_chat(8, '*** Twashtar AM active: AM active. 50% Triple Damage ***')
			send_command('timers create "Aftermath" 60 down')
		elseif spell.english == "Rudra's Storm" and (player.tp >= 2000 and player.tp < 2999) then 
			add_to_chat(8, '*** Twashtar AM active: AM active. 50% Triple Damage ***')
			send_command('timers create "Aftermath" 120 down')
		elseif spell.english == "Rudra's Storm" and (player.tp >= 3000) then 
			add_to_chat(8, '*** Twashtar AM active. 50% Triple Damage ***')
			send_command('timers create "Aftermath" 180 down')
		end 
	elseif player.equipment.main =="Mandau" then 
		if spell.english == "Mercy Stroke" and (player.tp >= 1000 and player.tp < 1999) then 
			add_to_chat(8, '*** Mandau AM active: AM active. 50% Triple Damage ***')
			send_command('timers create "Aftermath" 60 down')
		elseif spell.english == "Mercy Stroke" and (player.tp >= 2000 and player.tp < 2999) then 
			add_to_chat(8, '*** Mandau AM active: AM active. 50% Triple Damage ***')
			send_command('timers create "Aftermath" 120 down')
		elseif spell.english == "Mercy Stroke" and (player.tp >= 3000) then 
			add_to_chat(8, '*** Mandau AM active. 50% Triple Damage ***')
			send_command('timers create "Aftermath" 180 down')
		end 
	end
end 
-----------------------
--  Mid-cast Section --
-----------------------
function job_midcast(spell, spellMap, eventArgs)
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
function job_post_midcast(spell, spellMap, eventArgs)
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
function job_aftercast(spell, spellMap, eventArgs)
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
function job_post_aftercast(spell, spellMap, eventArgs)
	
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
--[[    for i,v in pairs(custom_timers) do
        send_command('timers delete "'..i..'"')
    end
    custom_timers = {}]]
end		
--------------------------------------
-- 	Called when a player gains 		--
--	or loses a buff. buff == buff 	--
--	gained or lost. gain == true 	--
--	if the buff was gained, false 	--
--	if it was lost.   				--
--------------------------------------
function job_buff_change(buff, gain)	
	if S{'haste','march','embrava','haste samba'}:contains(buff:lower()) then
		determine_haste_group()
		handle_equipping_gear(player.status)
	elseif state.Buff[buff] ~= nil then
		handle_equipping_gear(player.status)
	end
	if buff:startswith('Aftermath') then
		if player.equipment.main == 'Carnwenhan' then
		--[[	Mythic Aftermath	]]
			classes.CustomMeleeGroups:clear()
			if (buff == "Aftermath: Lv.3" and gain) or buffactive['Aftermath: Lv.3'] then
				classes.CustomMeleeGroups:append('AM3')
				add_to_chat(8, '*** Carnwenhan AM3 active: Increased Acc. and Atk. 40%-DA 20%-TA ***')
				send_command('timers create "Aftermath: Lv. 3" 180 down')
				send_command('timers delete "Aftermath: Lv. 2"')
				send_command('gs c autows Savage Blade')
			elseif (buff == "Aftermath: Lv.2" and gain) then
				add_to_chat(8, '*** Carnwenhan AM2 active: Increased Acc. and Atk. ***')
				send_command('timers create "Aftermath: Lv. 2" 120 down')
				send_command('timers delete "Aftermath: Lv. 1"')
			elseif (buff == "Aftermath: Lv.1" and gain) then
				add_to_chat(8, '*** Carnwenhan AM1 active: Increased Acc. ***')
				send_command('timers create "Aftermath: Lv. 1" 60 down')
			else 
				send_command('gs c autows Atonement')
			end
			if not midaction() then
				handle_equipping_gear(player.status)
			end
		elseif player.equipment.main =="Aeneas" then 
		--[[	Aeonic Aftermath	]]
			classes.CustomMeleeGroups:clear()
			if (buff == "Aftermath: Lv.3" and gain) or buffactive['Aftermath: Lv.3'] then
				classes.CustomMeleeGroups:append('AM3')
				add_to_chat(8, '*** Aeneas AM3 active: Ultimate SC Available ***')
				send_command('timers create "Aftermath: Lv. 3" 180 down')
				send_command('timers delete "Aftermath: Lv. 2"')
			elseif (buff == "Aftermath: Lv.2" and gain) then
				add_to_chat(8, '*** Aeneas AM2 active: Ultimate SC Available ***')
				send_command('timers create "Aftermath: Lv. 2" 120 down')
				send_command('timers delete "Aftermath: Lv. 1"')
			elseif (buff == "Aftermath: Lv.1" and gain) then
				add_to_chat(8, '*** Aeneas AM1 active: Ultimate SC Available ***')
				send_command('timers create "Aftermath: Lv. 1" 60 down')
			end
			if not midaction() then
				handle_equipping_gear(player.status)
			end
		else
			classes.CustomMeleeGroups:clear()
			if buff == "Aftermath" and gain or buffactive.Aftermath then
				classes.CustomMeleeGroups:append('AM')
			end
			if not midaction() then
				handle_equipping_gear(player.status)
			end
		end
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
--------------------------
--	Checking for Haste	--
--------------------------
windower.register_event('action',
function(act)
--check if you are a target of spell
    local actionTargets = act.targets
		playerId = windower.ffxi.get_player().id
		isTarget = false
    for _, target in ipairs(actionTargets) do
        if playerId == target.id then
            isTarget = true
        end
    end
	if isTarget == true then
        if act.category == 4 then
            local param = act.param
            if param == 57 then
				add_to_chat(122, 'Haste Status: Haste I')
				state.HasteMode:set('Normal')
                haste = 1
            elseif param == 511 then
				add_to_chat(122, 'Haste Status: Haste II')
				state.HasteMode:set('Hi')
                haste = 2
            end
        end
    end
end)
----------------------------------------
--  Selecting and Setting the default --
--	Macro book and Lock style 		  --
----------------------------------------
function select_default_macro_book()
	set_macro_page(1, 10)
	send_command('wait 4; input //gs org get')
end
function set_lockstyle()
	send_command('wait 4; input /lockstyleset 4')
end

------------------------------
--	Auto ability section	--
------------------------------
function job_tick()
	if check_buff() then return true end
	if check_buffup() then return true end
	return false
end
function check_buff(spell)
	--[[if player.in_combat and not assisting then 
		assisting = true 
		target = windower.ffxi.get_party()
		windower.chat.input('//gs c assist')
		return 
	elseif not player.in_combat and assisting then 
		assisting = false 
		windower.chat.input('//gs c stopAssist')	
		return
	end]]
	if state.AutoBuffMode.value and not areas.Cities:contains(world.area) then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		for i in pairs(buff_spell_lists['Auto']) do
			if not buffactive[buff_spell_lists['Auto'][i].Buff] and (buff_spell_lists['Auto'][i].When == 'Always' or (buff_spell_lists['Auto'][i].When == 'Combat' and (player.in_combat or being_attacked)) or (buff_spell_lists['Auto'][i].When == 'Engaged' and player.status == 'Engaged') or (buff_spell_lists['Auto'][i].When == 'Idle' and player.status == 'Idle') or (buff_spell_lists['Auto'][i].When == 'OutOfCombat' and not (player.in_combat or being_attacked))) and spell_recasts[buff_spell_lists['Auto'][i].SpellID] < latency and silent_can_use(buff_spell_lists['Auto'][i].SpellID) then
				windower.chat.input('/ma "'..buff_spell_lists['Auto'][i].Name..'" <me>')
				tickdelay = os.clock() + 2
				return true
			end
		end
	end
	return false
end
function check_buffup()
	if buffup ~= '' then
		local needsbuff = false
		for i in pairs(buff_spell_lists[buffup]) do
			if not buffactive[buff_spell_lists[buffup][i].Buff] and silent_can_use(buff_spell_lists[buffup][i].SpellID) then
				needsbuff = true
				break
			end
		end
	
		if not needsbuff then
			add_to_chat(217, 'All '..buffup..' buffs are up!')
			buffup = ''
			return false
		end
		
		local spell_recasts = windower.ffxi.get_spell_recasts()
		
		for i in pairs(buff_spell_lists[buffup]) do
			if not buffactive[buff_spell_lists[buffup][i].Buff] and silent_can_use(buff_spell_lists[buffup][i].SpellID) and spell_recasts[buff_spell_lists[buffup][i].SpellID] < latency then
				windower.chat.input('/ma "'..buff_spell_lists[buffup][i].Name..'" <me>')
				tickdelay = os.clock() + 2
				return true
			end
		end
		
		return false
	else
		return false
	end
end
buff_spell_lists = {
	Auto = {--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
		{Name='Refresh',			Buff='Refresh',			SpellID=109,	When='Idle'},
		{Name='Phalanx',			Buff='Phalanx',			SpellID=106,	When='Idle'},
		{Name='Stoneskin',			Buff='Stoneskin',		SpellID=54,		When='Idle'},
		{Name='Blink',				Buff='Blink',			SpellID=53,		When='Idle'},
	},
	Default = {
		{Name='Refresh',			Buff='Refresh',			SpellID=109,	Reapply=false},
		{Name='Phalanx',			Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Stoneskin',			Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Blink',				Buff='Blink',			SpellID=53,		Reapply=false},
	},
}
-----------------------
-- Miscelanous Stuff --
-----------------------
function set_healbot()
	--send_command('wait 6; input //lua l healbot')
	--[[send_command('wait 7; input //hb disable cure')
	send_command('wait 8; input //hb disable buff')
	send_command('wait 9; input //hb disable debuff')
	send_command('wait 10; input //hb disable curaga')
	send_command('wait 11; input //hb assist Enuri')
	send_command('wait 12; input //hb assist attack on')]]
end 
windower.raw_register_event('zone change',reset_timers)
windower.raw_register_event('logout',reset_timers)
----------------------------------
--	Command Section for Warping	--
----------------------------------
function user_job_self_command(commandArgs, eventArgs) 
	include('commands')
end