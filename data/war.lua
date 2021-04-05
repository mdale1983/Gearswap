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
	send_command('bind f9 gs c cycle IdleMode')
	send_command('bind f10 gs c cycle OffenseMode')
	send_command('bind f11 gs c cycle HybridMode')
	send_command('bind f12 gs c cycle WeaponskillMode')
--[[ AltF9-AltF12 keybinds ]]
	send_command('bind !f9 gs c toggle AutoBuffMode')
	send_command('bind !f10 gs c toggle AutoRuneMode')
	send_command('bind !f11 gs c toggle AutoFoodMode')
	send_command('bind !f12 gs c toggle autowsmode')
	send_command('bind != gs c toggle CapacityMode')
	send_command('bind !` input /ma "Utsusemi: Ni" <me>')
	send_command('bind !q input /ma "Utsusemi: Ichi" <me>')
--[[ CtrlF9-CtrlF12 keybinds ]]
	send_command('bind ^f9 gs c cycle AutoTankMode')
	send_command('bind ^f10 gs c cycle SouleaterMode')
	send_command('bind ^f11 gs c cycle Stance')
	send_command('bind ^f12 gs c cycle SkillchainMode')
	send_command('bind ^` input /ma "Tonko: Ni" <me>')
	send_command('bind ^q input /ma "Monomi: Ichi" <me>')
--[[ WindowsF9-WindowsF12 keybinds ]]
	send_command('bind @f7 gs c set Weapons Conqueror') 		--Mythic Weapon 
	send_command('bind @f8 gs c set Weapons Lycurgos')			--Empy Scythe Weapon 
	send_command('bind @f9 gs c set Weapons Ragnarok')			--Relic Weapon
	send_command('bind @f10 gs c set Weapons Bravura')			--Relic Weapon
	send_command('bind @f11 gs c set Weapons Ukonvasara')		--Empy GSD Weapon
	send_command('bind @f12 gs c set Weapons Chango')			--Aeonic Weapon
	send_command('bind @` input /ma "Aquaveil" <me>')
	send_command('bind @q input /ma "Sheep Song" <t>')
end
--------------------------
--  Job Setup Section   --
--------------------------
function job_setup()
	state.Weapons = M{'None', 'Ukonvasara', 'Chango', 'Bravura', 'Ragnarok','Lycurgos','Conqueror'}
	oneHandList = S{'replace with your weapons'}
	gsList = S{'Macbain', 'Crobaci +1'}
  	scytheList = S{'Cronus', 'Raetic Scythe'}
	
	state.crafting = M(false)
	state.Stance = M{['description']='Stance','Hasso','Seigan'}
	
	state.Buff['Brazen Rush'] = buffactive['Brazen Rush'] or false
	state.Buff["Warrior's Charge"] = buffactive["Warrior's Charge"] or false
	state.Buff['Mighty Strikes'] = buffactive['Mighty Strikes']  or false
	state.Buff.Retaliation = buffactive['Retaliation'] or false
	state.Buff.Restraint = buffactive['Restraint'] or false
    state.Buff['Aftermath'] = buffactive['Aftermath'] or false
	state.Buff['Aftermath: Lv.3'] = buffactive['Aftermath: Lv.3'] or false
    state.Buff.Hasso = buffactive.Hasso or false
    state.Buff.Seigan = buffactive.Seigan or false
	
	
	autowstp = 1200
	autows = 'Upheaval'
	autofood = 'Soy Ramen'
	
	Breath_HPP = 60
	
--[[ Initialization of auto job functions ]]
	init_job_states({
		"Capacity","AutoRuneMode","AutoWSMode",
		"AutoShadowMode","AutoFoodMode","AutoBuffMode",
		},{
		"Weapons","AutoFoodMode","AutoBuffMode","Stance",
		"OffenseMode","WeaponskillMode","IdleMode","AutoWSMode"
	})
--[[ Moonshade earring and Gav. Helmet ]]
	moonshade_WS = S{
		"Upheaval", "King's Justice",  'Raging Rush',
		'Raging Rush', 'Ukko\'s Fury', "Cross Reaper", 
		"Resolution", "Scourge", "Metatron Torment", 
		"Savage Blade", "Requiescat", 'Sanguine Blade'
	}
	gav_ws = S{
		"Upheaval", "King's Justice",  'Raging Rush',
		'Raging Rush', 'Ukko\'s Fury', "Cross Reaper", 
		"Resolution", "Scourge", "Metatron Torment", 
		"Savage Blade", "Requiescat", 'Sanguine Blade'
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
	state.warned = M(false)
	state.crafting = M(false)
	options.ammo_warning_limit = 10
end 
--------------------------
--  User Setup Section  --
--------------------------
function user_setup()
	state.IdleMode:options('Normal', 'MagicEva')
	state.OffenseMode:options('Normal', 'Reraise')
	state.HybridMode:options('Normal', 'MagicEva')
	state.WeaponskillMode:options('Normal', 'Mid', 'Acc')
  	state.CastingMode:options('Normal', 'Resistant', 'Enmity')
--[[ User Created states ]]
	
	state.CapacityMode = M(false, 'Capacity Point Mantle')
	state.HasteMode = M{['description']='Haste Mode', 'Hi', 'Normal'}
	state.Runes = M{['description']='Rune', 
		"Ignis", 
		"Gelus", 
		"Flabra", 
		"Tellus", 
		"Sulpor", 
		"Unda", 
		"Lux", 
		"Tenebrae"
	}
	state.Rune = M{['description']='which', 
		"Fire Dmg | Ice Resist: Paralyze, Bind, Frost", 
		"Ice Dmg | Wind Resist: Choke, Gravity, Silence", 
		"Wind dmg | Earth Resist: Slow, Petrify, Rasp", 
		"Earth dmg | Lightning Resist: Stun, Shock", 
		"Lightning Dmg | Water Resist: Poison, Drown", 
		"Water dmg | Fire Resist: Addle, Burn, Plague, Amnesia", 
		"Light Dmg | Dark Resist's: Blind, Bio, Sleep", 
		"Dark Dmg | Light Resist's: Repose, Dia, Charm"
	}
	state.Rune2 = M{['description']='which', 
		"Fire", 
		"Ice", 
		"Wind", 
		"Earth", 
		"Lightning", 
		"Water", 
		"Light", 
		"Dark"
	}
--[[ Loading of various functions ]]
  	select_default_macro_book()
  	set_lockstyle()
	get_player_name()
  	job_binds()
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
		send_command('gs c Weapons Lycurgos')
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
-----------------------------------------------------------
--  Rune Fencer Rune section for displaying rune info    --
-----------------------------------------------------------
function define_rune_info()
	rune_info = {
		["Ignis"]   = {damage="Fire", resistance="Ice"},
		["Gelus"]   = {damage="Ice", resistance="Wind"},
		["Flabra"]  = {damage="Wind", resistance="Earth"},
		["Tellus"]  = {damage="Earth", resistance="Lightning"},
		["Sulpor"]  = {damage="Lightning", resistance="Water"},
		["Unda"]    = {damage="Water", resistance="Fire"},
		["Lux"]     = {damage="Light", resistance="Darkness"},
		["Tenebrae"]= {damage="Darkness", resistance="Light"},
	}
end
function display_rune_info(spell)
	runeinfo = rune_info[spell.english]
	if runeinfo then
		add_to_chat(122, '*'..spell.english..' is '..runeinfo.damage..'-based dmg. and '..runeinfo.resistance..' resistance*')
	end
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
	if player.hpp < 80 then 
		idleSet = set_combine(idleSet, sets.regen)
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
	if state.OffenseMode.value == "Reraise" then 
		meleeSet = set_combine(meleeSet, sets.Reraise)
	end
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
	if player.status == "Engaged" then 
		if gsList:contains(player.equipment.main) then
			state.CombatWeapon:set('GreatSword')
		elseif scytheList:contains(player.equipment.main) then
			state.CombatWeapon:set('Engaged')
		elseif oneHandList:contains(player.equipment.main) then
			state.CombatWeapon:set('Engaged')
		elseif player.equipment.main == 'Ragnarok' then
			state.CombatWeapon:set('GreatSword')
		elseif player.equipment.main == 'Lycurgos' then
			state.CombatWeapon:set('GreatAxe')
		elseif player.equipment.main == 'Ukonvasara' then
			state.CombatWeapon:set('GreatAxe')
		elseif player.equipment.main == 'Chango' then
			state.CombatWeapon:set('Chango')
		elseif player.equipment.main == 'Bravura' then
			state.CombatWeapon:set('GreatAxe')
		elseif player.equipment.main == 'Conqueror' then
			state.CombatWeapon:set('GreatAxe')
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
	if state.Weapons.value == "Ukonvasara" then 
		set_macro_page(2, 6)
	elseif state.Weapons.value == "Ragnarok" then 
		set_macro_page(1, 6)
	elseif state.Weapons.value == "Chango" then 
		set_macro_page(2, 6)
	elseif state.Weapons.value == "Bravura" then 
		set_macro_page(3, 6)
	elseif state.Weapons.value == "Lycurgos" then 
		set_macro_page(2, 6)
	elseif state.Weapons.value == "Conqueror" then 
		set_macro_page(4, 6)
	end	
	return get_combat_weapon
end 
function job_state_change(cmdParams, eventArgs) 
	if player then
		classes.CustomMeleeGroups:clear()
		
		if state.Buff['Brazen Rush'] or state.Buff["Warrior's Charge"] then
			classes.CustomMeleeGroups:append('Charge')
		end
		
		if state.Buff['Mighty Strikes'] then
			classes.CustomMeleeGroups:append('Mighty')
		end
		
		if (player.equipment.main == "Conqueror" and buffactive['Aftermath: Lv.3']) or ((player.equipment.main == "Bravura" or player.equipment.main == "Ragnarok") and state.Buff['Aftermath']) then
			classes.CustomMeleeGroups:append('AM')
		end
	end
end 
function determine_haste_group(buff, gain)
	--classes.CustomMeleeGroups:clear()
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
	-- mythic AM	
	if player.equipment.main == 'Kogarasumaru' then
		if buffactive['Aftermath: Lv.3'] then
			classes.CustomMeleeGroups:append('AM3')
		end
	elseif buffactive['Aftermath'] then
		classes.CustomMeleeGroups:append('AM')
	end
	if player.equipment.main == 'Ukonvasara' then 
		if buffactive['Aftermath: Lv.3'] then 
			classes.CustomMeleeGroups:append('AM3')
			add_to_chat(8, '***Ukonvasara AM active. 50% Triple Damage***')
		end
	elseif buffactive['Aftermath'] then
		classes.CustomMeleeGroups:append('AM')
	end
	if player.equipment.main == 'Chango' then 
		if buffactive['Aftermath: Lv.3'] then 
			classes.CustomMeleeGroups:append('AM3')
			add_to_chat(8, '***Chango AM active. Ultimate SC Available***')
		end
	elseif buffactive['Aftermath'] then
		classes.CustomMeleeGroups:append('AM')
	end
	if player.equipment.main == 'Ragnarok' then 
		if buffactive['Aftermath: Lv.3'] then 
			classes.CustomMeleeGroups:append('AM3')
			add_to_chat(8, '***Ragnarok AM active. sTP+10 Zanshin +10***')
		end
	elseif buffactive['Aftermath'] then
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
	
end
function job_precast(spell, action, spellMap, eventArgs)
	local abil_recasts = windower.ffxi.get_ability_recasts()
	if spell.type=="Ninjutsu" then 
		check_tools(spell) 
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
end 
function job_post_precast(spell, spellMap, eventArgs)
	if spell.type == 'WeaponSkill' then
		if world.time >= 17*60 or world.time < 7*60 then -- Dusk to Dawn time.
			equip({ear1="Lugra Earring +1", ear2="Lugra Earring"})
		end
	end
	if spell.action_type=="Magic" and buffactive.Silence then
		eventArgs.cancel = true
		send_command('input /item "Echo Drops" <me>')
	end
	if spell.type=='WeaponSkill' then
		if moonshade_WS:contains(spell.english) and player.tp < 2850 then
			equip({ear2="Moonshade Earring"})
		end
	end
	--[[ Lock Weaponskill if you are to far from the mob  ]]
	if spell.type == 'WeaponSkill' then 
		if spell.target.distance > 5 then 
			cancel_spell()
			add_to_chat(8, 'Target to far away. Move closer')
			return
		end 
	end
	if player.equipment.main =="Ragnarok" then 
		if spell.english == "Scourge" and (player.tp >= 1000 and player.tp < 1999) then 
			add_to_chat(8, '*** Ragarok AM active: Acc +15 Crit Hit +10% ***')
			send_command('timers create "Aftermath" 60 down')
			send_command('gs c autows Resolution')
		elseif spell.english == "Scourge" and (player.tp >= 2000 and player.tp < 2999) then 
			add_to_chat(8, '*** Ragarok AM active: Acc +15 Crit Hit +10% ***')
			send_command('timers create "Aftermath" 120 down')
			send_command('gs c autows Resolution')
		elseif spell.english == "Scourge" and (player.tp >= 3000) then 
			add_to_chat(8, '*** Ragarok AM active: Acc +15 Crit Hit +10% ***')
			send_command('timers create "Aftermath" 180 down')
			send_command('gs c autows Resolution')
		else 
			send_command('gs c autows Scourge')
		end
	end
	if player.equipment.main =="Bravura" then 
		if spell.english == "Metatron Torment" and (player.tp >= 1000 and player.tp < 1999) then 
			add_to_chat(8, '*** Bravura AM active: DT -20% Regen +15 ***')
			send_command('timers create "Aftermath" 60 down')
			send_command('gs c autows Resolution')
		elseif spell.english == "Metatron Torment" and (player.tp >= 2000 and player.tp < 2999) then 
			add_to_chat(8, '*** Bravura AM active: DT -20% Regen +15 ***')
			send_command('timers create "Aftermath" 120 down')
			send_command('gs c autows Resolution')
		elseif spell.english == "Metatron Torment" and (player.tp >= 3000) then 
			add_to_chat(8, '*** Bravura AM active: DT -20% Regen +15 ***')
			send_command('timers create "Aftermath" 180 down')
			send_command('gs c autows Resolution')
		else 
			send_command('gs c autows Metatron Torment')
		end
	end
	if player.equipment.main =="Ukonvasara" then 
		if spell.english == "Ukko's fury" and (player.tp >= 1000 and player.tp < 1999) then 
			add_to_chat(8, '*** Ukonvasara AM active: AM active. 50% Triple Damage ***')
			send_command('timers create "Aftermath" 60 down')
			send_command('gs c autows Upheaval')
		elseif spell.english == "Ukko's fury" and (player.tp >= 2000 and player.tp < 2999) then 
			add_to_chat(8, '*** Ukonvasara AM active: AM active. 50% Triple Damage ***')
			send_command('timers create "Aftermath" 120 down')
			send_command('gs c autows Upheaval')
		elseif spell.english == "Ukko's fury" and (player.tp >= 3000) then 
			add_to_chat(8, '*** Ukonvasara AM active. 50% Triple Damage ***')
			send_command('timers create "Aftermath" 180 down')
			send_command('gs c autows Upheaval')
		else 
			send_command('gs c autows Ukko\'s fury')
		end 
	end
end 
-----------------------
--  Mid-cast Section --
-----------------------
function job_midcast(spell, spellMap, eventArgs)

end
function job_post_midcast(spell, spellMap, eventArgs)
	if spell.type == 'WeaponSkill' then 
		if gav_ws:contains(spell.english) and (spell.element==world.day_element or spell.element==world.weather_element) then
			equip({head="Gavialis Helm"})
		end
	end
end 
-------------------------
--  after-cast Section --
-------------------------
function job_aftercast(spell, spellMap, eventArgs)
	
end 
function job_post_aftercast(spell, spellMap, eventArgs)
	
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
		if player.equipment.main == 'Conqueror' then
		--[[	Mythic Aftermath	]]
			classes.CustomMeleeGroups:clear()
			if (buff == "Aftermath: Lv.3" and gain) or buffactive['Aftermath: Lv.3'] then
				classes.CustomMeleeGroups:append('AM3')
				add_to_chat(8, '*** Conqueror AM3 active: Increased Acc. and Atk. 40%-DA 20%-TA ***')
				send_command('timers create "Aftermath: Lv. 3" 180 down')
				send_command('timers delete "Aftermath: Lv. 2"')
				send_command('gs c autows Upheaval')
			elseif (buff == "Aftermath: Lv.2" and gain) then
				add_to_chat(8, '*** Conqueror AM2 active: Increased Acc. and Atk. ***')
				send_command('timers create "Aftermath: Lv. 2" 120 down')
				send_command('timers delete "Aftermath: Lv. 1"')
			elseif (buff == "Aftermath: Lv.1" and gain) then
				add_to_chat(8, '*** Conqueror AM1 active: Increased Acc. ***')
				send_command('timers create "Aftermath: Lv. 1" 60 down')
			else 
				send_command('gs c autows King\'s Justice')
			end
			if not midaction() then
				handle_equipping_gear(player.status)
			end
		elseif player.equipment.main =="Chango" then 
		--[[	Aeonic Aftermath	]]
			classes.CustomMeleeGroups:clear()
			if (buff == "Aftermath: Lv.3" and gain) or buffactive['Aftermath: Lv.3'] then
				classes.CustomMeleeGroups:append('AM3')
				add_to_chat(8, '*** Chango AM3 active: Ultimate SC Available ***')
				send_command('timers create "Aftermath: Lv. 3" 180 down')
				send_command('timers delete "Aftermath: Lv. 2"')
			elseif (buff == "Aftermath: Lv.2" and gain) then
				add_to_chat(8, '*** Chango AM2 active: Ultimate SC Available ***')
				send_command('timers create "Aftermath: Lv. 2" 120 down')
				send_command('timers delete "Aftermath: Lv. 1"')
			elseif (buff == "Aftermath: Lv.1" and gain) then
				add_to_chat(8, '*** Chango AM1 active: Ultimate SC Available ***')
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
	set_macro_page(2, 6)
	send_command('wait 4; input //gs org get')
end
function set_lockstyle()
	send_command('wait 4; input /lockstyleset 7')
end
------------------------------
--	Auto ability section	--
------------------------------
function job_tick()
	if check_hasso() then return true end
	if check_buff() then return true end
	return false
end
function check_hasso()
	if player.sub_job == 'SAM' and player.in_combat then
		
		local abil_recasts = windower.ffxi.get_ability_recasts()
		
		if state.Stance.value == 'Hasso' and not buffactive['Hasso'] and abil_recasts[138] < latency then
			--send_command('input //cancel seigan')
			windower.chat.input('/ja "Hasso" <me>')
			tickdelay = os.clock() + 1.8
			return true
		elseif state.Stance.value == 'Seigan' and not buffactive['Seigan'] and abil_recasts[139] < latency then
			windower.chat.input('/ja "Seigan" <me>')
			tickdelay = os.clock() + 1.8
			return true
		elseif state.Stance.value == 'Seigan' and not buffactive['Third Eye'] and abil_recasts[133] < latency then 
			windower.chat.input('/ja "Third Eye" <me>')
			tickdelay = os.clock() + 1.8
			return true
		else
			return false
		end
	end

	return false
end
function check_buff()
	if state.AutoBuffMode.value and not areas.Cities:contains(world.area) then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		if player.in_combat then
			local abil_recasts = windower.ffxi.get_ability_recasts()

			if not buffactive.Berserk and abil_recasts[1] < latency then
				windower.chat.input('/ja "Berserk" <me>')
				tickdelay = os.clock() + 1.8
				return true
			elseif not buffactive.Restraint and abil_recasts[9] < latency then
				windower.chat.input('/ja "Restraint" <me>')
				tickdelay = os.clock() + 1.8
				return true
			elseif not buffactive['Blood Rage'] and abil_recasts[11] < latency then
				windower.chat.input('/ja "Blood Rage" <me>')
				tickdelay = os.clock() + 1.8
				return true
			elseif not buffactive.Aggressor and abil_recasts[4] < latency then
				windower.chat.input('/ja "Aggressor" <me>')
				tickdelay = os.clock() + 1.8
				return true
			else
				return false
			end
		end
	end
	return false
end
----------------------------------
--	Command Section for Warping	--
----------------------------------
function user_job_self_command(commandArgs, eventArgs) 
	include('commands')
	include('telecmds')
	include('follow')
	include('testing')
	include('htmbki')
end