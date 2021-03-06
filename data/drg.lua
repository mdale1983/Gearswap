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
	send_command('bind !f10 gs c toggle AutoWSMode')
	send_command('bind !f11 gs c toggle AutoFoodMode')
	send_command('bind !f12 gs c toggle AutoJumpMode')
	send_command('bind != input //send @all /p this is an example of using your LUA to insert something into something ^.~ OHHHHHHHH BABBBBBBBY LUAS ARE AWESOME')
	send_command('bind !` input /ja "Berserk" <me>')
	send_command('bind !q input /ja "Warcry" <me>')
--[[ CtrlF9-CtrlF12 keybinds ]]
	send_command('bind ^f9 gs c cycle Stance')
	send_command('bind ^f10 gs c cycle AutoBondMode')
	send_command('bind ^f11 gs c cycle AutoRuneMode')
	send_command('bind ^f12 gs c cycle SkillchainMode')
	send_command('bind ^` input /ja "Meditate" <me>')
	send_command('bind ^q input /ja "Aggresor" <me>')
--[[ WindowsF9-WindowsF12 keybinds ]]
	send_command('bind @f7 gs c set Weapons Ryunohige')
	send_command('bind @f8 gs c set Weapons ShiningOne')
	send_command('bind @f9 gs c set Weapons Rhomphaia')
	send_command('bind @f10 gs c set Weapons Gungnir')
	send_command('bind @f11 gs c set Weapons Rhongomiant')
	send_command('bind @f12 gs c set Weapons Trishula')
	send_command('bind @` input /ja "Provoke" <me>')
	send_command('bind @q input /ja "Fly High" <t>')
end
--------------------------
--  Job Setup Section   --
--------------------------
function job_setup()
	state.mainWeapon = M{'None', 'Gungnir', 'Rhomphaia', 'Rhongomiant', 'Trishula', 'Ryunohige', 'ShiningOne'}
	state.Weapons = M{'None', 'Gungnir', 'Rhomphaia', 'Rhongomiant', 'Trishula', 'Ryunohige', 'ShiningOne'}
	state.rangeWeapon = M{'None', 'Anarchy', 'Fomalhaut'}
	oneHandList = S{'replace with your weapons'}
	ktList = S{'Umaru', 'Kurikaranotachi'}
	
	state.crafting = M(false)
	state.Stance = M{['description']='Stance','Hasso','Seigan'}
	state.AutoJumpMode = M(false, 'Auto Jump Mode')
	state.AutoBondMode = M(true, 'Auto Bond Mode')
    state.Buff['Spirit Surge'] = buffactive['Spirit Surge'] or false
	state.Buff['Third Eye'] = buffactive['Third Eye'] or false
    state.Buff.Hasso = buffactive.Hasso or false
    state.Buff.Seigan = buffactive.Seigan or false
	
	autows = "Stardiver"
	autowstp = 1600
	autofood = 'Grape daifuku'
	
	Breath_HPP = 60
	
--[[ Initialization of auto job functions ]]
	init_job_states({
		"Capacity","AutoWSMode","AutoFoodMode","AutoBuffMode",
		"AutoBondMode","AutoJumpMode",
	},{
		"Weapons","Stance","AutoBuffMode","AutoWSMode","AutoFoodMode",
		"AutoJumpMode","IdleMode","WeaponskillMode","OffenseMode",
	})
--[[ Moonshade earring and Gav. Helmet ]]
	moonshade_WS = S{
		"Drakesbane", "Stardiver", "Impulse Drive", 
		"Sonic Thrust", "Geirskogul", "Camlann's Torment"
	}
	gav_ws = S{
		"Drakesbane", "Stardiver", "Impulse Drive", 
		"Sonic Thrust", "Geirskogul", "Camlann's Torment"
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
	state.ElementalMode = M{['description'] = 'Elemental Mode','Fire','Water','Lightning','Earth','Wind','Ice','Light','Dark',}
end 
--------------------------
--  User Setup Section  --
--------------------------
function user_setup()
	state.IdleMode:options('Normal', 'MagicEva')
  	state.OffenseMode:options('Normal', 'Acc')
  	state.HybridMode:options('Normal', 'MagicEva')
  	state.WeaponskillMode:options('Normal', 'Acc')
  	state.CastingMode:options('Normal', 'Resistant', 'Enmity')
--[[ User Created states ]]
	state.SouleaterMode = M(false, 'Soul Eater Mode')
	state.LastResortMode = M(false, 'Last Resort Mode')
	state.CapacityMode = M(false, 'Capacity Point Mantle')
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
	state.CapacityMode = M(false, 'Capacity Point Mantle')
	state.HasteMode = M{['description']='Haste Mode', 'Hi', 'Normal'}
    state.Buff['Aftermath'] = buffactive['Aftermath'] or false
    state.Buff['Aftermath: Lv.3'] = buffactive['Aftermath: Lv.3'] or false
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
		send_command('gs c Weapons Gungnir')
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
	if state.OffenseMode.value == "Reraise" then 
		idleSet = set_combine(idleSet, sets.Reraise)
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
	if state.IdleMode.value == "MagicEva" then 
		meleeSet = set_combine(meleeSet, sets.idle.MagicEva)
	end 
	if state.OffenseMode.value == "Reraise" then 
		meleeSet = set_combine(meleeSet, sets.Reraise)
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
		if player.equipment.main == 'Rhomphaia' then
			state.CombatWeapon:set('Rhomphaia')
			set_macro_page(1, 20)
		elseif player.equipment.main == 'Rhongomiant' then
			state.CombatWeapon:set('Rhongomiant')
			set_macro_page(1, 20)
		elseif player.equipment.main == 'Gungnir Yasutsuna' then
			state.CombatWeapon:set('Gungnir Yasutsuna')
			set_macro_page(1, 20)
		elseif player.equipment.main == 'Trishula' then
			state.CombatWeapon:set('Trishula')
			set_macro_page(1, 20)
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
	if state.Weapons.value == "Rhomphaia" then 
		equip({main="Rhomphaia", sub="Utu Grip"})
	elseif state.Weapons.value == "Rhongomiant" then 
		equip({main="Rhongomiant", sub="Utu grip"})
	elseif state.Weapons.value == "Trishula" then 
		equip({main="Trishula", sub="Rhomphaia"})
	elseif state.Weapons.value == "Ryunohige" then 
		equip({main="Ryunohige", sub="Utu Grip"})
	elseif state.Weapons.value == "Gungnir" then 
		equip({main="Gungnir", sub="Utu Grip"}) 
	elseif state.Weapons.value == "ShiningOne" then 
		equip({main="Shining One", sub="Utu Grip"}) 
	end
	return get_combat_weapon
end 
function job_state_change(cmdParams, eventArgs) 
	--[[	Left empty for now	]]
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
	-- mythic AM	
	if player.equipment.main == 'Ryunohige' then
		if buffactive['Aftermath: Lv.3'] then
			classes.CustomMeleeGroups:append('AM3')
		end
	elseif buffactive['Aftermath'] then
		classes.CustomMeleeGroups:append('AM')
	end
	if player.equipment.main == 'Rhongomiant' then 
		if buffactive['Aftermath: Lv.3'] then 
			classes.CustomMeleeGroups:append('AM3')
			add_to_chat(8, '***Rhongomiant AM active. 50% Triple Damage***')
		end
	elseif buffactive['Aftermath'] then
		classes.CustomMeleeGroups:append('AM')
	end
	if player.equipment.main == 'Trishula' then 
		if buffactive['Aftermath: Lv.3'] then 
			classes.CustomMeleeGroups:append('AM3')
			add_to_chat(8, '***Trishula AM active. Ultimate SC Available***')
		end
	elseif buffactive['Aftermath'] then
		classes.CustomMeleeGroups:append('AM')
	end
	if player.equipment.main == 'Gungnir' then 
		if buffactive['Aftermath: Lv.3'] then 
			classes.CustomMeleeGroups:append('AM3')
			add_to_chat(8, '*** Gungnir AM active. Attack +5% DA +5% ***')
		end
	elseif buffactive['Aftermath'] then
		classes.CustomMeleeGroups:append('AM')
	end		
	if buffactive['Samurai Roll'] then
		classes.CustomRangedGroups:append('SamRoll')
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
	if spell.type=="Ninjutsu" then 
		check_tools(spell) 
	end 
end 
function job_post_precast(spell, spellMap, eventArgs)
	if spell.type == 'WeaponSkill' then
		if world.time >= 17*60 or world.time < 7*60 then -- Dusk to Dawn time.
			equip({ear1="Lugra Earring +1", ear2="Lugra Earring"})
		end
	end
	if spell.type=='WeaponSkill' then
		if moonshade_WS:contains(spell.english) and player.tp < 2850 then
			equip({ear2="Moonshade Earring"})
		end
	end
	if spell.type == 'WeaponSkill' then 
		if spell.target.distance > 5 then 
			cancel_spell()
			add_to_chat(8, 'Target to far away. Move closer')
			return
		end 
	end
	if player.equipment.main =="Gungnir" then 
		if spell.english == "Geirskogul" and (player.tp >= 1000 and player.tp < 1999) then 
			add_to_chat(8, '*** Gungnir AM active: Attk +5!% DA +5% ***')
			send_command('timers create "Aftermath" 60 down')
		elseif spell.english == "Geirskogul" and (player.tp >= 2000 and player.tp < 2999) then 
			add_to_chat(8, '*** Gungnir AM active: Attk +5% DA +5% ***')
			send_command('timers create "Aftermath" 120 down')
		elseif spell.english == "Geirskogul" and (player.tp >= 3000) then 
			add_to_chat(8, '*** Gungnir AM active: Attk +5% DA +5% ***')
			send_command('timers create "Aftermath" 180 down')
		end
	end
end 
-----------------------
--  Mid-cast Section --
-----------------------
function job_midcast(spell, spellMap, eventArgs)
	if spell.type == 'CorsairShot' or spell.action_type == 'Ranged Attack' then
		if state.CapacityMode.value then
			equip(sets.CapacityMantle)
		end
	end
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
------------------------------------------
--	Pet Midcast and Aftercast Section	--
------------------------------------------
function job_pet_aftercast(spell, spellMap, eventArgs)
	if spell.english == 'Restoring Breath' and state.AutoBondMode.value then
		windower.send_command('cancel spirit bond')
	end
end
function job_aftercast(spell, spellMap, eventArgs)
	if pet.isvalid then
		if (spell.action_type == 'Magic' and player.hpp < Breath_HPP) or spell.english == 'Steady Wing' or spell.english == 'Restoring Breath' then
			petWillAct = os.clock()
			equip(sets.HealingBreath)
			eventArgs.handled = true
		elseif spell.english == 'Smiting Breath' and sets.SmitingBreath then
			petWillAct = os.clock()
			equip(sets.SmitingBreath)
			eventArgs.handled = true
		end
	end
end
--------------------------------------
-- 	Called when a player gains 		--
--	or loses a buff. buff == buff 	--
--	gained or lost. gain == true 	--
--	if the buff was gained, false 	--
--	if it was lost.   				--
--------------------------------------
function job_buff_change(buff, gain, spell, spellMap, eventArgs)	
	if S{'haste','march','embrava','haste samba'}:contains(buff:lower()) then
		determine_haste_group()
		handle_equipping_gear(player.status)
	elseif state.Buff[buff] ~= nil then
		handle_equipping_gear(player.status)
	end
	if buff:startswith('Aftermath') then
		if player.equipment.main == 'Ryunohige' then
		--[[	Mythic Aftermath	]]
			classes.CustomMeleeGroups:clear()
			if (buff == "Aftermath: Lv.3" and gain) or buffactive['Aftermath: Lv.3'] then
				classes.CustomMeleeGroups:append('AM3')
				add_to_chat(8, '*** Ryunohige AM3 active: Increased Acc. and Atk. 40%-DA 20%-TA ***')
				send_command('timers create "Aftermath: Lv. 3" 180 down')
				send_command('timers delete "Aftermath: Lv. 2"')
				send_command('gs c autows Stardiver')
			elseif (buff == "Aftermath: Lv.2" and gain) then
				add_to_chat(8, '*** Ryunohige AM2 active: Increased Acc. and Atk. ***')
				send_command('timers create "Aftermath: Lv. 2" 120 down')
				send_command('timers delete "Aftermath: Lv. 1"')
			elseif (buff == "Aftermath: Lv.1" and gain) then
				add_to_chat(8, '*** Ryunohige AM1 active: Increased Acc. ***')
				send_command('timers create "Aftermath: Lv. 1" 60 down')
			else 
				send_command('gs c autows Drakesbane')
			end
			if not midaction() then
				handle_equipping_gear(player.status)
			end
		elseif player.equipment.main =="Trishula" then 
		--[[	Aeonic Aftermath	]]
			classes.CustomMeleeGroups:clear()
			if (buff == "Aftermath: Lv.3" and gain) or buffactive['Aftermath: Lv.3'] then
				classes.CustomMeleeGroups:append('AM3')
				add_to_chat(8, '*** Trishula AM3 active: Ultimate SC Available ***')
				send_command('timers create "Aftermath: Lv. 3" 180 down')
				send_command('timers delete "Aftermath: Lv. 2"')
			elseif (buff == "Aftermath: Lv.2" and gain) then
				add_to_chat(8, '*** Trishula AM2 active: Ultimate SC Available ***')
				send_command('timers create "Aftermath: Lv. 2" 120 down')
				send_command('timers delete "Aftermath: Lv. 1"')
			elseif (buff == "Aftermath: Lv.1" and gain) then
				add_to_chat(8, '*** Trishula AM1 active: Ultimate SC Available ***')
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
	set_macro_page(1, 20)
	send_command('wait 4; input //gs org get')
end
function set_lockstyle()
	send_command('wait 4; input /lockstyleset 20')
end
------------------------------
--	Auto ability section	--
------------------------------
function job_tick()
	if check_hasso() then return true end
	if check_jump() then return true end
	if check_buff() then return true end
	return false
end
function check_hasso()
	if player.in_combat and player.sub_job == "SAM" then
		
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
function check_jump()
    if state.AutoJumpMode.value and player.status == 'Engaged' and player.tp < 570 then

        local abil_recasts = windower.ffxi.get_ability_recasts()

        if abil_recasts[166] < latency then
            windower.chat.input('/ja "Spirit Jump" <t>')
            tickdelay = os.clock() + 1.1
            return true
        elseif abil_recasts[167] < latency then
            windower.chat.input('/ja "Soul Jump" <t>')
            tickdelay = os.clock() + 1.1
            return true
        elseif abil_recasts[158] < latency then
            windower.chat.input('/ja "Jump" <t>')
            tickdelay = os.clock() + 1.1
            return true
        elseif abil_recasts[159] < latency then
            windower.chat.input('/ja "High Jump" <t>')
            tickdelay = os.clock() + 1.1
            return true
        elseif pet.isvalid and abil_recasts[162] < latency and pet.tp > 350 then
            windower.chat.input('/ja "Spirit Link" <me>')
            tickdelay = os.clock() + 1.1
            return true
        else
            return false
        end
    end
end
function check_buff()
	if state.AutoBuffMode.value and player.in_combat then
		
		local abil_recasts = windower.ffxi.get_ability_recasts()
		
		if not pet.isvalid and abil_recasts[163] < latency then
			windower.chat.input('/ja "Call Wyvern" <me>')
			tickdelay = os.clock() + 1.1
			return true
		elseif player.sub_job == "SAM" and player.tp < 1000 and abil_recasts[134] < latency then 
			windower.chat.input('/ja "Meditate" <me>')
			tickdelay = os.clock() + 1.8
			return true
		elseif player.sub_job == 'DRK' and not buffactive['Last Resort'] and abil_recasts[87] < latency then
			windower.chat.input('/ja "Last Resort" <me>')
			tickdelay = os.clock() + 1.8
			return true
		elseif player.sub_job == 'WAR' and not buffactive.Berserk and abil_recasts[1] < latency then
			windower.chat.input('/ja "Berserk" <me>')
			tickdelay = os.clock() + 1.8
			return true
		elseif player.sub_job == 'WAR' and not buffactive.Aggressor and abil_recasts[4] < latency then
			windower.chat.input('/ja "Aggressor" <me>')
			tickdelay = os.clock() + 1.8
			return true
		else
			return false
		end
	end
		
	return false
end
function find_breath_hpp()
	if S{'WHM','BLM','RDM','SMN','BLU','SCH','GEO'}:contains(player.sub_job) then
		if sets.midcast.HB_Trigger and (sets.midcast.HB_Trigger.head:contains('Vishap') or sets.midcast.HB_Trigger.head:contains('Drachen')) then
			Breath_HPP = 65
		else
			Breath_HPP = 45
		end
	elseif S{'PLD','DRK','BRD','NIN','RUN'}:contains(player.sub_job) then
		if sets.midcast.HB_Trigger and (sets.midcast.HB_Trigger.head:contains('Vishap') or sets.midcast.HB_Trigger.head:contains('Drachen')) then
			Breath_HPP = 45
		else
			Breath_HPP = 35
		end
	end
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