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
	send_command('bind f12 gs c cycle CastingMode')
--[[ AltF9-AltF12 keybinds ]]
	send_command('bind !f9 gs c cycle stance')
	send_command('bind !f10 gs c cycle AutoWSMode')
	send_command('bind !f11 gs c toggle AutoShadowMode')
	send_command('bind !f12 gs c toggle AutoFoodMode')
	send_command('bind != gs c toggle CapacityMode')
	send_command('bind !` input /ma "Utsusemi: Ni" <me>')
	send_command('bind !q input /ma "Utsusemi: Ichi" <me>')
--[[ CtrlF9-CtrlF12 keybinds ]]
	send_command('bind ^f9 gs c cycle AutoBuffMode')
	send_command('bind ^f10 gs c cycle AutoTankMode')
	send_command('bind ^f11 gs c cycle ElementalWheel')
	send_command('bind ^f12 gs c cycle Empty')
	send_command('bind ^` input /ma "Tonko: Ni" <me>')
	send_command('bind ^q input /ma "Monomi: Ichi" <me>')
--[[ WindowsF9-WindowsF12 keybinds ]]
	send_command('bind @f7 gs c set Weapons Kannagi')
	send_command('bind @f8 gs c set Weapons Nagi')
	send_command('bind @f9 gs c set Weapons Kikoku')
	send_command('bind @f10 gs c set Weapons Shuhansadamune')
	send_command('bind @f11 gs c set Weapons Kanaria')
	send_command('bind @f12 gs c set Weapons HeishiShorinken')
	send_command('bind @` input /ma "Aquaveil" <me>')
	send_command('bind @q input /ma "Sheep Song" <t>')
end
--------------------------
--  Job Setup Section   --
--------------------------
function job_setup()
	state.mainWeapon = M{'None', 'Shuhansadamune', 'Kikoku', 'Kanaria', 'HeishiShorinken', 'Kannagi', 'Nagi'}
	state.Weapons = M{'None', 'Kikoku', 'Kanaria', 'HeishiShorinken', 'Kannagi', 'Nagi'}
	state.rangeWeapon = M{'None', 'Anarchy', 'Fomalhaut'}
	oneHandList = S{'replace with your weapons'}
	ktList = S{'Umaru', 'Kurikaranotachi'}
	
	state.crafting = M(false)
	state.Stance = M{['description']='Stance','Innin','Yonin'}
	
	autows = "Blade: Metsu"
	autowstp = 1200
	autofood = 'Soy Ramen'
--[[ Initialization of auto job functions ]]
	init_job_states({
		"Capacity","AutoWSMode","AutoShadowMode","AutoFoodMode",
		"AutoDefenseMode", "AutoRuneMode","ElementalWheel"
		},
		{
		"AutoBuffMode","AutoTankMode","AutoFoodMode",
		"Stance","AutoWSMode","ElementalMode","AutoShadowMode"		
	})
--[[ Moonshade earring and Gav. Helmet ]]
	moonshade_WS = S{
		"Blade: Hi", "Blade: Jin", "Blade: Ten",
		"Blade: Kamu", "Blade: Shun", 'Blade: Metsu',
		"Blade: Ku", 
	}
	gav_ws = S{
		"Blade: Hi", "Blade: Jin", "Blade: Ten",
		"Blade: Kamu", "Blade: Shun", 'Blade: Metsu',
		"Blade: Ku", 
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
	state.Buff.Migawari = buffactive.Migawari or false
	state.Buff.Yonin = buffactive.Yonin or false
	state.Buff.Innin = buffactive.Innin or false
	state.Buff.Futae = buffactive.Futae or false
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
		if player.equipment.range == 'Fomalhaut' then
			state.CombatWeapon:set('Fomalhuat')
		elseif player.equipment.range == 'Annihilator' then
			state.CombatWeapon:set('Annihilator')
		elseif player.equipment.range == 'Gastraphetas' then
			state.CombatWeapon:set('Gastraphetas')
		elseif player.equipment.range == 'Yoichinoyumi' then
			state.CombatWeapon:set('Yoichinoyumi')
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
	if state.Weapons.value == "Kikoku" then 
		equip({main="Kikoku", sub="Shuhansadamune"})
	elseif state.Weapons.value == "Kanaria" then 
		equip({main="Ragnarok", sub="Utu grip"})
	elseif state.Weapons.value == "HeishiShorinken" then 
		equip({main="Heishi Shorinken", sub="Kikoku"})
	elseif state.Weapons.value == "Kannagi" then 
		equip({main="Kannagi", sub="Shuhansadamune"}) 
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
	--classes.CustomMeleeGroups:clear()
	-- mythic AM	
	if player.equipment.main == 'Nagi' then
		if buffactive['Aftermath: Lv.3'] then
			classes.CustomMeleeGroups:append('AM3')
		end
	elseif buffactive['Aftermath'] then
		classes.CustomMeleeGroups:append('AM')
	end
	if player.equipment.main == 'Kannagi' then 
		if buffactive['Aftermath: Lv.3'] then 
			classes.CustomMeleeGroups:append('AM3')
			add_to_chat(8, '***Kannagi AM active. 50% Triple Damage***')
		end
	elseif buffactive['Aftermath'] then
		classes.CustomMeleeGroups:append('AM')
	end
	if player.equipment.main == 'Heishi Shorinken' then 
		if buffactive['Aftermath: Lv.3'] then 
			classes.CustomMeleeGroups:append('AM3')
			add_to_chat(8, '***Heishi Shorinken AM active. Ultimate SC Available***')
		end
	elseif buffactive['Aftermath'] then
		classes.CustomMeleeGroups:append('AM')
	end
	if player.equipment.main == 'Kikoku' then 
		if buffactive['Aftermath: Lv.3'] then 
			classes.CustomMeleeGroups:append('AM3')
			add_to_chat(8, '***Kikoku AM active. attk +10% Subtle Blow +10***')
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
	 if spell.action_type == 'Ranged Attack' and (player.equipment.ammo == 'Togakushi Shuriken' or player.equipment.ammo == 'Happo Shuriken') then
		cancel_spell()
		add_to_chat(123,'Abort: Don\'t throw your good ammo!')
	elseif spell.english == 'Sange' and (player.equipment.ammo == 'Togakushi Shuriken' or player.equipment.ammo == 'Happo Shuriken') then
		cancel_spell()
		add_to_chat(123,'Abort: Don\'t throw your good ammo!')
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
	if spell.english == 'Mijin Gakure' and windower.ffxi.get_ability_recasts()[0] < latency and not state.UnlockWeapons.value and not state.Weapons.value == 'None' then
		local mijinmain = standardize_set(sets.precast.JA['Mijin Gakure'].main)
		local equippedweapons = standardize_set(sets.weapons[state.Weapons.value])
		
		if mijinmain == 'Nagi' and item_available('Nagi') and not equippedweapons:contains('Nagi') then
			enable('main','sub','range','ammo')
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
-- Equip obi if weather/day matches for WS.
	if spell.type == 'WeaponSkill' then
		if spell.english == 'Trueflight' then
			if world.weather_element == 'Light' or world.day_element == 'Light' then
				equip({waist="Hachirin-no-Obi"})
			end
		elseif spell.english == 'Wildfire' and (world.weather_element == 'Fire' or world.day_element == 'Fire') then
			equip({waist="Hachirin-no-Obi"})
		end
	end
	if spell.action_type == 'Ranged Attack' then
		if spell.action_type == 'Ranged Attack' then
			if flurry == 2 then
				equip(sets.precast.RA.Flurry2)
			elseif flurry == 1 then
				equip(sets.precast.RA.Flurry1)
			end
		end
	end
	if spell.type == 'WeaponSkill' then 
		if spell.target.distance > 5 then 
			cancel_spell()
			add_to_chat(8, 'Target to far away. Move closer')
			return
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
	if spellMap == 'ElementalNinjutsu' then
		if state.MagicBurstMode.value ~= 'Off' then 
			equip(sets.MagicBurst) 
		end
		if spell.element == world.weather_element or spell.element == world.day_element then
			if state.CastingMode.value == 'Normal' or state.CastingMode.value == 'Fodder' then
				-- if item_available('Twilight Cape') and not state.Capacity.value then
					-- sets.TwilightCape = {back="Twilight Cape"}
					-- equip(sets.TwilightCape)
				-- end
				if spell.element == world.day_element then
					if item_available('Zodiac Ring') then
						sets.ZodiacRing = {ring2="Zodiac Ring"}
						equip(sets.ZodiacRing)
					end
				end
			end
		end
		if spell.element and sets.element[spell.element] then
			equip(sets.element[spell.element])
		end
		if state.Buff.Futae and sets.buff.Futae then
			equip(sets.buff.Futae)
		end
	end
end 
-------------------------
--  after-cast Section --
-------------------------
function job_aftercast(spell, spellMap, eventArgs)
	if spell.english == "Mijin Gakure" then
		if not state.Weapons.value == 'None' then
			disable('main','sub','range','ammo')
		end
	elseif spell.interrupted then
		return
	elseif spell.english == "Migawari: Ichi" then
		state.Buff.Migawari = true
	elseif spellMap == 'ElementalNinjutsu' then
		if state.MagicBurstMode.value == 'Single' then
			state.MagicBurstMode:reset()
		end
		if state.DisplayMode.value then 
			update_job_states()	
		end
	end
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
		if player.equipment.main == 'Nagi' then
			classes.CustomMeleeGroups:clear()
			if (buff == "Aftermath: Lv.3" and gain) or buffactive['Aftermath: Lv.3'] then
				classes.CustomMeleeGroups:append('AM3')
				add_to_chat(8, '*** Burtgang AM3 active: Increased Acc. and Atk. 40%-DA 20%-TA ***')
				send_command('timers create "Aftermath: Lv. 3" 180 down')
				send_command('gs c autows Blade: Hi')
			elseif (buff == "Aftermath: Lv.2" and gain) then
				add_to_chat(8, '*** Burtgang AM2 active: Increased Acc. and Atk. ***')
				send_command('timers create "Aftermath: Lv. 2" 120 down')
			elseif (buff == "Aftermath: Lv.1" and gain) then
				add_to_chat(8, '*** Burtgang AM1 active: Increased Acc. ***')
				send_command('timers create "Aftermath: Lv. 1" 60 down')
			else 
				send_command('gs c autows Blade: Kamu')
			end
			if not midaction() then
				handle_equipping_gear(player.status)
			end
		elseif player.equipment.main =="Kikoku" then 
			if (buff == "Aftermath" and gain) then
				add_to_chat(8, '*** Kikou AM active: Attk +10% Subtle Blow +10 ***')
				send_command('timers create "Aftermath: Lv. 1" 60 down')
				send_command('gs c autows Blade: Shun')
			else 
				send_command('gs c autows Blade: Metsu')
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
	set_macro_page(1, 19)
	send_command('wait 4; input //gs org get')
	--send_command('wait 6; input //du blinking self always on')
end
function set_lockstyle()
	send_command('wait 4; input /lockstyleset 19')
end
------------------------------
--	Auto ability section	--
------------------------------
function job_self_command(commandArgs, eventArgs)
	if commandArgs[1]:lower() == 'elemental' then
		handle_elemental(commandArgs)
		eventArgs.handled = true

	elseif commandArgs[1] == 'SubJobEnmity' then
		if not buffactive['Enmity Boost'] then 
		local spell_recasts = windower.ffxi.get_spell_recasts()
			if spell_recasts[505] < spell_latency then 
				windower.chat.input('/ma "Gekka: Ichi" <me>')
			end 
		end 
		if player.target.type ~= "MONSTER" then
			add_to_chat(123,'Abort: You are not targeting a monster.')
			return

		elseif player.sub_job == 'RUN' then
			local spell_recasts = windower.ffxi.get_spell_recasts()

			if spell_recasts[112] < spell_latency then
				send_command('input /ma "Flash" <t>')
				return
			end
		
			local abil_recasts = windower.ffxi.get_ability_recasts()
			
			if abil_recasts[24] < latency then
				send_command('input /ja "Swordplay" <me>')
			end
			
		elseif player.sub_job == 'BLU' and not moving then
			local spell_recasts = windower.ffxi.get_spell_recasts()
					
			if spell_recasts[584] < spell_latency then
				windower.chat.input('/ma "Sheep Song" <t>')
			elseif spell_recasts[598] < spell_latency then
				windower.chat.input('/ma "Soporific" <t>')
			elseif spell_recasts[605] < spell_latency then
				windower.chat.input('/ma "Geist Wall" <t>')
			elseif spell_recasts[575] < spell_latency then
				windower.chat.input('/ma "Jettatura" <t>')
			elseif spell_recasts[537] < spell_latency then
				windower.chat.input('/ma "Stinking Gas" <t>')
			elseif spell_recasts[592] < spell_latency then
				windower.chat.input('/ma "Blank Gaze" <t>')
			elseif not check_auto_tank_ws() then
				if not state.AutoTankMode.value then add_to_chat(123,'All Enmity Blue Magic on cooldown.') end
			end

		elseif player.sub_job == 'DRK' then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			local spell_recasts = windower.ffxi.get_spell_recasts()
			
			if (state.HybridMode.value ~= 'Normal' or state.DefenseMode.value ~= 'None')  and buffactive['Souleater'] then
				send_command('cancel souleater')
			end
			
			if (state.HybridMode.value ~= 'Normal' or state.DefenseMode.value ~= 'None')  and buffactive['Last Resort'] then
				send_command('cancel last resort')
			end
			
			if spell_recasts[252] < spell_latency and not silent_check_silence() then
				windower.chat.input('/ma "Stun" <t>')
			elseif abil_recasts[85] < latency then
				windower.chat.input('/ja "Souleater" <me>')
			elseif abil_recasts[87] < latency then
				windower.chat.input('/ja "Last Resort" <me>')
			elseif abil_recasts[86] < latency then
				windower.chat.input('/ja "Arcane Circle" <me>')
			elseif not check_auto_tank_ws() then
				if not state.AutoTankMode.value then add_to_chat(123,'All Enmity Dark Knight abillities on cooldown.') end
			end

		elseif player.sub_job == 'WAR' then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			
			if state.HybridMode.value:contains('DD') then
				if buffactive['Defender'] then send_command('cancel defender') end
			elseif state.HybridMode.value ~= 'Normal' and not state.HybridMode.value:contains('DD') then
				if buffactive['Berserk'] then send_command('cancel berserk') end
			end
			
			if abil_recasts[5] < latency then
				send_command('input /ja "Provoke" <t>')
			elseif abil_recasts[2] < latency and not buffactive['Berserk'] then
				send_command('input /ja "Warcry" <me>')
			elseif abil_recasts[3] < latency and not buffactive['Berserk'] then
				send_command('input /ja "Defender" <me>')
			elseif abil_recasts[4] < latency then
				send_command('input /ja "Aggressor" <me>')
			elseif abil_recasts[1] < latency and not buffactive['Warcryt'] then
				send_command('input /ja "Berserk" <me>')
			elseif not check_auto_tank_ws() then
				if not state.AutoTankMode.value then add_to_chat(123,'All Enmity Warrior Job Abilities on cooldown.') end
			end
			
		elseif player.sub_job == 'DNC' then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			local under3FMs = not buffactive['Finishing Move 3'] and not buffactive['Finishing Move 4'] and not buffactive['Finishing Move 5']
        
			if under3FMs then
				if abil_recasts[220] < latency then
				send_command('@input /ja "'..state.CurrentStep.value..'" <t>')
				return
				end
			elseif abil_recasts[221] < latency then
				send_command('input /ja "Animated Flourish" <t>')
				return
			elseif abil_recasts[220] < latency and not buffactive['Finishing Move 5'] then
				send_command('@input /ja "'..state.CurrentStep.value..'" <t>')
				return
			elseif not check_auto_tank_ws() then
				if not state.AutoTankMode.value then add_to_chat(123,'Dancer job abilities not needed.') end
			end
		end

	end
end
function job_tick()
	--get_combat_form()
	if check_stance() then return true end
	if check_buff() then return true end
	if check_buffup() then return true end
	if state.AutoTankMode.value and player.in_combat and player.target.type == "MONSTER" and not moving then
		windower.send_command('gs c SubJobEnmity')
		state.Stance:set('Yonin')
		tickdelay = os.clock() + 1
		return true
	end
	return false
end
function check_stance()
	if player.in_combat then
		
		local abil_recasts = windower.ffxi.get_ability_recasts()
		
		if state.Stance.value == 'Innin' and not buffactive['Innin'] and abil_recasts[147] < latency and not state.AutoTankMode.value then
			windower.chat.input('/ja "Innin" <me>')
			tickdelay = os.clock() + 1.8
			return true
		elseif state.Stance.value == 'Yonin' and not buffactive['Yonin'] and abil_recasts[146] < latency then
			windower.chat.input('/ja "Yonin" <me>')
			tickdelay = os.clock() + 1.8
			return true
		else
			return false
		end
	end

	return false
end
function handle_elemental(cmdParams)
    -- cmdParams[1] == 'elemental'
    -- cmdParams[2] == ability to use
	--[[ 
		gs c cycle ElementalMode
		gs c cycleback ElementalMode
		gs c elemental nuke 
	]]
    if not cmdParams[2] then
        add_to_chat(123,'Error: No elemental command given.')
        return
    end
    local command = cmdParams[2]:lower()
	local target = '<t>'
	if cmdParams[3] then
		if tonumber(cmdParams[3]) then
			target = tonumber(cmdParams[3])
		else
			target = table.concat(cmdParams, ' ', 3)
			target = get_closest_mob_id_by_name(target) or '<t>'
		end
	end
	local spell_recasts = windower.ffxi.get_spell_recasts()
	
	if command == 'nuke' then
		local tiers = {'San','Ni','Ichi'}
		for k in ipairs(tiers) do
			if spell_recasts[get_spell_table_by_name(elements.ninnuke[state.ElementalMode.value]..': '..tiers[k]..'').id] < spell_latency then
				windower.chat.input('/ma "'..elements.ninnuke[state.ElementalMode.value]..': '..tiers[k]..'" '..target..'')
				return
			end
		end
		add_to_chat(123,'Abort: All '..elements.nuke_of[state.ElementalMode.value]..' nukes on cooldown or or not enough MP.')
	elseif S{'San','Ni','Ichi'}:contains(command) then
		windower.chat.input('/ma "'..elements.ninnuke[state.ElementalMode.value]..': '..command..'" '..target..'')
	elseif command == 'proc' then
		windower.chat.input('/ma "'..elements.ninnuke[state.ElementalMode.value]..': Ni" '..target..'')
	end
end

function check_buff()
	if state.AutoBuffMode.value and not areas.Cities:contains(world.area) then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		for i in pairs(buff_spell_lists['Auto']) do
			if not buffactive[buff_spell_lists['Auto'][i].Buff] and (buff_spell_lists['Auto'][i].When == 'Always' or (buff_spell_lists['Auto'][i].When == 'Combat' and (player.in_combat or being_attacked)) or (buff_spell_lists['Auto'][i].When == 'Engaged' and player.status == 'Engaged') or (buff_spell_lists['Auto'][i].When == 'Idle' and player.status == 'Idle') or (buff_spell_lists['Auto'][i].When == 'OutOfCombat' and not (player.in_combat or being_attacked))) and spell_recasts[buff_spell_lists['Auto'][i].SpellID] < latency and silent_can_use(buff_spell_lists['Auto'][i].SpellID) then
				windower.chat.input('/ma "'..buff_spell_lists['Auto'][i].Name..'" <me>')
				tickdelay = os.clock() + 2
				return true
			end
		end
		if player.in_combat then
			local abil_recasts = windower.ffxi.get_ability_recasts()

			if player.sub_job == 'WAR' and not buffactive.Berserk and not is_defensive() and abil_recasts[1] < latency and not buffactive['Warcry'] then
				windower.chat.input('/ja "Berserk" <me>')
				tickdelay = os.clock() + 1.1
				return true
			elseif player.sub_job == 'WAR' and not buffactive.Aggressor and not is_defensive() and abil_recasts[4] < latency then
				windower.chat.input('/ja "Aggressor" <me>')
				tickdelay = os.clock() + 1.1
				return true
			else
				return false
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
			if not buffactive[buff_spell_lists[buffup][i].Buff] and silent_can_use(buff_spell_lists[buffup][i].SpellID) and spell_recasts[buff_spell_lists[buffup][i].SpellID] < spell_latency then
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
	Auto = {	
		{Name='Kakka: Ichi',		Buff='Store TP',		SpellID=509,	When='Combat'},
		{Name='Myoshu: Ichi',		Buff='Subtle Blow Plus',SpellID=507,	When='Combat'},
	},
	
	Default = {
		{Name='Myoshu: Ichi',Buff='Subtle Blow Plus',SpellID=507,Reapply=false},
		{Name='Kakka: Ichi',Buff='Store TP',SpellID=509,Reapply=false},
	},
}
----------------------------------
--	Command Section for Warping	--
----------------------------------
function user_job_self_command(commandArgs, eventArgs) 
	include('commands')
	include('telecmds')
	include('htmbki')
end