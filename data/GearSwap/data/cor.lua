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
--[[ CtrlF9-CtrlF12 keybinds ]]
	send_command('bind ^f9 gs c cycle empty')
	send_command('bind ^f10 gs c cycle empty')
	send_command('bind ^f11 gs c cycle empty')
	send_command('bind ^f12 gs c cycle empty')
--[[ WindowsF9-WindowsF12 keybinds ]]
	send_command('bind @f7 gs c set Weapons DP') 				--Mythic Weapon 
	send_command('bind @f8 gs c set Weapons Anarchy')			--Empy Weapon 
	send_command('bind @f9 gs c set Weapons Fomalhaut')			--Relic Weapon
	send_command('bind @f10 gs c set Weapons Molybdosis')		--Relic Weapon
	send_command('bind @f11 gs c set Weapons Armageddon')		--Empy Weapon
	send_command('bind @f12 gs c set Weapons Doomsday')			--Aeonic Weapon
end
--------------------------
--  Job Setup Section   --
--------------------------
function job_setup()
	state.mainWeapon = M{'None', 'Perun', 'Maleo'}
	state.Weapons = M{'None', 'Fomalhaut','Anarchy','DP', 'Molybdosis', 'Armageddon', 'Doomsday'}
	
	state.crafting = M(false)
	
	state.CompensatorMode = M{'Always','300','1000','Never'}
	state.LuzafRing = M(true, "Luzaf's Ring")
	state.AutoAmmoMode = M(true,'Auto Ammo Mode')
	state.UseDefaultAmmo = M(true,'Use Default Ammo')
	state.Buff['Aftermath'] = buffactive['Aftermath'] or false
    state.Buff['Aftermath: Lv.3'] = buffactive['Aftermath: Lv.3'] or false
	
	autowstp = 1200
	autows = "Leaden Salute"
	autofood = 'Soy Ramen'
	statusammo = nil
	ammostock = 198
	
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
		"Leaden Salute", "Wildfire", "Last Stand",
		"Savage Blade", "Requiescat", 'Sanguine Blade'
	}
	magicWS = S{
		'Leaden Salute', 'Wildfire', 'Hot Shot'
	}
	physWS = S{
		'Last Stand'
	}
	gav_ws = S{
		"Leaden Salute", "Wildfire", "Last Stand",
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
	WeaponType =  {
        ['Death Penalty'] = 	"Gun",
        ['Armageddon'] = 		"Gun",
        ['Fomalhaut'] = 		"Gun",
		['Anarchy +3'] = 		"Gun",
		['Compensator'] = 		"Gun",
		['Molybdosis'] = 		"Gun",
		['Doomsday'] = 			"Gun",
	}
	DefaultAmmo = {
		['Gun']  = {
			['Default'] = 		"Decimating Bullet",
			['WS'] = 			"Decimating Bullet",
			['MagicWS'] =		"Orichalc. Bullet",
			['Acc'] = 			"Decimating Bullet",
			['Magic'] = 		"Orichalc. Bullet",
			['MagicAcc'] = 		"Decimating Bullet",
			['CorsairShot'] = 	"Orichalc. Bullet"
		}
	}
end 
--------------------------
--  User Setup Section  --
--------------------------
function user_setup()
	state.IdleMode:options('Normal', 'MagicEva')
 	state.OffenseMode:options('Melee', 'Ranged')
  	state.HybridMode:options('Normal', 'MagicEva', 'DT')
  	state.WeaponskillMode:options('Physical', 'Magical')
  	state.RangedMode:options('Normal', 'Acc')
--[[ User Created states ]]
	options.ammo_warning_limit = 15
	state.CapacityMode = M(false, 'Capacity Point Mantle')
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
		send_command('gs c Weapons Molybdosis')
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
		elseif player.equipment.range == 'Anarchy' then
			state.CombatWeapon:set('Anarchy')
		elseif player.equipment.range == 'Death Penalty' then
			state.CombatWeapon:set('Death Penalty')
		elseif player.equipment.range == 'Molybdosis' then
			state.CombatWeapon:set('Molybdosis')
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
	if state.Weapons.value == "Fomalhaut" then 
		enable('ammo')
	elseif state.Weapons.value == "Anarchy" then 
		enable('ammo')
	elseif state.Weapons.value == "DP" then 
		enable('ammo')
	elseif state.Weapons.value == "Armageddon" then 
		enable('ammo')
	elseif state.Weapons.value == "Molybdosis" then 
		enable('ammo')
	elseif state.Weapons.value == "Doomsday" then 
		enable('ammo')
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
	if spell.action_type == 'Ranged Attack' then
		if state.RangedMode.value:contains('Acc') then
			equip({ammo=DefaultAmmo[WeaponType[player.equipment.range]].Acc})
		else
			equip({ammo=DefaultAmmo[WeaponType[player.equipment.range]].Default})
		end			
	end
	if magicWS:contains(spell.english) then 
		equip({ammo=DefaultAmmo[WeaponType[player.equipment.range]].Magic})
	elseif physWS:contains(spell.english) then 
		equip({ammo=DefaultAmmo[WeaponType[player.equipment.range]].WS})
	end	
	if count_available_ammo(player.equipment.ammo) < 15 then
		add_to_chat(122,"Ammo Warning: Your '"..player.equipment.ammo.."' is running low: ("..count_available_ammo(player.equipment.ammo)..") remaining.")
	end
end
function job_filter_precast(spell, spellMap, eventArgs)
	
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
	if spell.type == 'CorsairRoll' and state.CompensatorMode.value ~= 'Never' and (state.CompensatorMode.value == 'Always' or tonumber(state.CompensatorMode.value) > player.tp) then
		if item_available("Compensator") then
			enable('range')
			equip({range="Compensator"})
		end
		if sets.precast.CorsairRoll.main and sets.precast.CorsairRoll.main ~= player.equipment.main then
			enable('main')
			equip({main=sets.precast.CorsairRoll.main})
		end
	end
-- Equip obi if weather/day matches for WS.
	if spell.type == 'WeaponSkill' then
		if spell.english == 'Leaden Salute' then
			if world.weather_element == 'Dark' or world.day_element == 'Dark' then
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
				add_to_chat(7, 'Flurry 2 detected')
			elseif flurry == 1 then
				equip(sets.precast.RA.Flurry1)
				add_to_chat(7, 'Flurry detected')
			end
		end
	end
	if player.equipment.main =="Armageddon" then 
		if spell.english == "Wildfire" and (player.tp >= 1000 and player.tp < 1999) then 
			add_to_chat(8, '*** Armageddon AM active: AM active. 50% Triple Damage ***')
			send_command('timers create "Aftermath" 60 down')
		elseif spell.english == "Wildfire" and (player.tp >= 2000 and player.tp < 2999) then 
			add_to_chat(8, '*** Armageddon AM active: AM active. 50% Triple Damage ***')
			send_command('timers create "Aftermath" 120 down')
		elseif spell.english == "Wildfire" and (player.tp >= 3000) then 
			add_to_chat(8, '*** Armageddon AM active. 50% Triple Damage ***')
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
	if spell.action_type == 'Ranged Attack' then
		if buffactive['Triple Shot'] then
			equip(sets.TripleShot)
		end
	end
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
	if state.UseDefaultAmmo.value and player.equipment.range and DefaultAmmo[WeaponType[player.equipment.range]].Default then
		equip({ammo=DefaultAmmo[WeaponType[player.equipment.range]].Default})
	end
	if spell.type == 'CorsairRoll' and not spell.interrupted then
		if state.CompensatorMode.value ~= 'Never' then
			if (player.equipment.range and player.equipment.range == 'Compensator') and sets.weapons[state.Weapons.value] and sets.weapons[state.Weapons.value].range then
				equip({range=sets.weapons[state.Weapons.value].range})
				disable('range')
			end
			if sets.precast.CorsairRoll.main and sets.weapons[state.Weapons.value] and sets.weapons[state.Weapons.value].main then
				equip({main=sets.weapons[state.Weapons.value].main})
				disable('main')
			end
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
		if player.equipment.main == 'Death Penalty' then
		--[[	Mythic Aftermath	]]
			classes.CustomMeleeGroups:clear()
			if (buff == "Aftermath: Lv.3" and gain) or buffactive['Aftermath: Lv.3'] then
				classes.CustomMeleeGroups:append('AM3')
				add_to_chat(8, '*** Death Penalty AM3 active: Increased Acc. and Atk. 40%-DA 20%-TA ***')
				send_command('timers create "Aftermath: Lv. 3" 180 down')
				send_command('timers delete "Aftermath: Lv. 2"')
				send_command('gs c autows Savage Blade')
			elseif (buff == "Aftermath: Lv.2" and gain) then
				add_to_chat(8, '*** Death Penalty AM2 active: Increased Acc. and Atk. ***')
				send_command('timers create "Aftermath: Lv. 2" 120 down')
				send_command('timers delete "Aftermath: Lv. 1"')
			elseif (buff == "Aftermath: Lv.1" and gain) then
				add_to_chat(8, '*** Death Penalty AM1 active: Increased Acc. ***')
				send_command('timers create "Aftermath: Lv. 1" 60 down')
			else 
				send_command('gs c autows Atonement')
			end
			if not midaction() then
				handle_equipping_gear(player.status)
			end
		elseif player.equipment.main =="Fomalhaut" then 
		--[[	Aeonic Aftermath	]]
			classes.CustomMeleeGroups:clear()
			if (buff == "Aftermath: Lv.3" and gain) or buffactive['Aftermath: Lv.3'] then
				classes.CustomMeleeGroups:append('AM3')
				add_to_chat(8, '*** Fomalhaut AM3 active: Ultimate SC Available ***')
				send_command('timers create "Aftermath: Lv. 3" 180 down')
				send_command('timers delete "Aftermath: Lv. 2"')
			elseif (buff == "Aftermath: Lv.2" and gain) then
				add_to_chat(8, '*** Fomalhaut AM2 active: Ultimate SC Available ***')
				send_command('timers create "Aftermath: Lv. 2" 120 down')
				send_command('timers delete "Aftermath: Lv. 1"')
			elseif (buff == "Aftermath: Lv.1" and gain) then
				add_to_chat(8, '*** Fomalhaut AM1 active: Ultimate SC Available ***')
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
--------------------------
-- Define Roll Values	--
--------------------------
	function define_roll_values()
		rolls = {
			["Corsair's Roll"]   = {lucky=5, unlucky=9, bonus="Experience Points"},
			["Ninja Roll"]       = {lucky=4, unlucky=8, bonus="Evasion"},
			["Hunter's Roll"]    = {lucky=4, unlucky=8, bonus="Accuracy"},
			["Chaos Roll"]       = {lucky=4, unlucky=8, bonus="Attack"},
			["Magus's Roll"]     = {lucky=2, unlucky=6, bonus="Magic Defense"},
			["Healer's Roll"]    = {lucky=3, unlucky=7, bonus="Cure Potency Received"},
			["Puppet Roll"]      = {lucky=4, unlucky=8, bonus="Pet Magic Accuracy/Attack"},
			["Choral Roll"]      = {lucky=2, unlucky=6, bonus="Spell Interruption Rate"},
			["Monk's Roll"]      = {lucky=3, unlucky=7, bonus="Subtle Blow"},
			["Beast Roll"]       = {lucky=4, unlucky=8, bonus="Pet Attack"},
			["Samurai Roll"]     = {lucky=2, unlucky=6, bonus="Store TP"},
			["Evoker's Roll"]    = {lucky=5, unlucky=9, bonus="Refresh"},
			["Rogue's Roll"]     = {lucky=5, unlucky=9, bonus="Critical Hit Rate"},
			["Warlock's Roll"]   = {lucky=4, unlucky=8, bonus="Magic Accuracy"},
			["Fighter's Roll"]   = {lucky=5, unlucky=9, bonus="Double Attack Rate"},
			["Drachen Roll"]     = {lucky=3, unlucky=7, bonus="Pet Accuracy"},
			["Gallant's Roll"]   = {lucky=3, unlucky=7, bonus="Defense"},
			["Wizard's Roll"]    = {lucky=5, unlucky=9, bonus="Magic Attack"},
			["Dancer's Roll"]    = {lucky=3, unlucky=7, bonus="Regen"},
			["Scholar's Roll"]   = {lucky=2, unlucky=6, bonus="Conserve MP"},
			["Bolter's Roll"]    = {lucky=3, unlucky=9, bonus="Movement Speed"},
			["Caster's Roll"]    = {lucky=2, unlucky=7, bonus="Fast Cast"},
			["Courser's Roll"]   = {lucky=3, unlucky=9, bonus="Snapshot"},
			["Blitzer's Roll"]   = {lucky=4, unlucky=9, bonus="Attack Delay"},
			["Tactician's Roll"] = {lucky=5, unlucky=8, bonus="Regain"},
			["Allies's Roll"]    = {lucky=3, unlucky=10, bonus="Skillchain Damage"},
			["Miser's Roll"]     = {lucky=5, unlucky=7, bonus="Save TP"},
			["Companion's Roll"] = {lucky=2, unlucky=10, bonus="Pet Regain and Regen"},
			["Avenger's Roll"]   = {lucky=4, unlucky=8, bonus="Counter Rate"},
		}
	end
	function display_roll_info(spell)
		rollinfo = rolls[spell.english]
		local rollsize = 'Small'
		if state.LuzafRing then
			rollsize = 'Large'
		end
		if rollinfo then
			add_to_chat(36, spell.english..' provides a bonus to '..rollinfo.bonus..'.  Roll size: '..rollsize)
			add_to_chat(217, 'Lucky roll is '..tostring(rollinfo.lucky)..', Unlucky roll is '..tostring(rollinfo.unlucky)..'.')
		end
	end
----------------------------
--	Bullet Check Function --
----------------------------
function check_ammo(spell, action, spellMap, eventArgs)
	-- Filter ammo checks depending on Unlimited Shot
	if state.Buff['Unlimited Shot'] then
		if player.equipment.ammo ~= U_Shot_Ammo[player.equipment.range] then
			if player.wardrobe2[U_Shot_Ammo[player.equipment.range]] or player.wardrobe[U_Shot_Ammo[player.equipment.range]] then
				add_to_chat(122,"Unlimited Shot active. Using custom ammo.")
				equip({ammo=U_Shot_Ammo[player.equipment.range]})
			elseif player.wardrobe2[DefaultAmmo[player.equipment.range]] or player.wardrobe[DefaultAmmo[player.equipment.range]] then
				add_to_chat(122,"Unlimited Shot active but no custom ammo available. Using default ammo.")
				equip({ammo=DefaultAmmo[player.equipment.range]})
			else
				add_to_chat(122,"Unlimited Shot active but unable to find any custom or default ammo.")
			end
		end
	else
	if player.equipment.ammo == U_Shot_Ammo[player.equipment.range] and player.equipment.ammo ~= DefaultAmmo[player.equipment.range] then
		if DefaultAmmo[player.equipment.range] then
			if player.wardrobe2[DefaultAmmo[player.equipment.range]] then
				add_to_chat(122,"Unlimited Shot not active. Using Default Ammo")
				equip({ammo=DefaultAmmo[player.equipment.range]})
			else
				add_to_chat(122,"Default ammo unavailable.  Removing Unlimited Shot ammo.")
				equip({ammo=empty})
			end
		else
			add_to_chat(122,"Unable to determine default ammo for current weapon.  Removing Unlimited Shot ammo.")
			equip({ammo=empty})
		end
		elseif player.equipment.ammo == 'empty' then
			if DefaultAmmo[player.equipment.range] then
				if player.wardrobe2[DefaultAmmo[player.equipment.range]] then
					add_to_chat(122,"Using Default Ammo")
					equip({ammo=DefaultAmmo[player.equipment.range]})
				else
					add_to_chat(122,"Default ammo unavailable.  Leaving empty.")
				end
			else
				add_to_chat(122,"Unable to determine default ammo for current weapon.  Leaving empty.")
			end
		elseif player.wardrobe2[player.equipment.ammo].count < 15 then
			add_to_chat(122,"Ammo '"..player.wardrobe2[player.equipment.ammo].shortname.."' running low ("..player.wardrobe2[player.equipment.ammo].count..")")
		end
	end
end 
--------------------------
--	Checking for flurry	--
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
            if param == 845 and flurry ~= 2 then
    add_to_chat(122, 'Flurry Status: Flurry I')
                flurry = 1
            elseif param == 846 then
    add_to_chat(122, 'Flurry Status: Flurry II')
                flurry = 2
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
	send_command('wait 4; input /lockstyleset 38')
end
------------------------------
--	Auto ability section	--
------------------------------
function job_tick()
	if check_ammo() then return true end
	if check_buff() then return true end
	return false
end
function check_buff() 
	if state.AutoBuffMode.value and player.in_combat then
		
		local abil_recasts = windower.ffxi.get_ability_recasts()

		if not buffactive['Triple Shot'] and abil_recasts[84] < latency then
			windower.chat.input('/ja "Triple Shot" <me>')
			tickdelay = os.clock() + 1.8
			return true
		else
			return false
		end
	end
		
	return false
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