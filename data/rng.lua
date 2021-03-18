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
	send_command('bind @f7 gs c set Weapons Gastraphetes') 		--Mythic Weapon 
	send_command('bind @f8 gs c set Weapons Annihilator')			--Empy Weapon 
	send_command('bind @f9 gs c set Weapons Fomalhaut')			--Relic Weapon
	send_command('bind @f10 gs c set Weapons Yoichinoyumi')			--Relic Weapon
	send_command('bind @f11 gs c set Weapons Gandiva')			--Empy Weapon
	send_command('bind @f12 gs c set Weapons FailNot')			--Aeonic Weapon
	send_command('bind @` input /ma "Aquaveil" <me>')
	send_command('bind @q input /ma "Sheep Song" <t>')
end
--------------------------
--  Job Setup Section   --
--------------------------
function job_setup()
	state.mainWeapon = M{'None', 'Perun', 'Maleo'}
	state.Weapons = M{'None', 'Fomalhaut','Annihilator','Gastraphetes', 'Yoichinoyumi', 'Gandiva', 'FailNot'}
	state.subWeapon = M{'None', 'Yoichinoyumi', 'Gandiva'}
	shieldList = S{'Yoichinoyumi', 'Gandiva'}
	oneHandList = S{'replace with your weapons'}
	gsList = S{'Macbain', 'Crobaci +1'}
  	scytheList = S{'Cronus', 'Raetic Scythe'}
	
	state.crafting = M(false)
	
	state.AutoAmmoMode = M(true,'Auto Ammo Mode')
	state.UseDefaultAmmo = M(true,'Use Default Ammo')
	state.Buff.Barrage = buffactive.Barrage or false
	state.Buff.Camouflage = buffactive.Camouflage or false
	state.Buff['Double Shot'] = buffactive['Double Shot'] or false
	state.Buff['Unlimited Shot'] = buffactive['Unlimited Shot'] or false
	state.Buff['Velocity Shot'] = buffactive['Velocity Shot'] or false
	
	
	autowstp = 1200
	autows = "Trueflight"
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
		"Trueflight", "Coronach", "Hot Shot", "Last Stand", 
		"Refulgent Arrow", "Wildfire", "Namas Arrow", "Jishnu's Radiance", 
		"Apex Arrow", "Savage Blade", "Requiescat", 'Sanguine Blade'
	}
	gav_ws = S{
		"Trueflight", "Coronach", "Hot Shot", "Last Stand", 
		"Refulgent Arrow", "Wildfire", "Namas Arrow", "Jishnu's Radiance", 
		"Apex Arrow", "Savage Blade", "Requiescat", 'Sanguine Blade'
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
		['Yoichinoyumi'] = 	"Bow",
		['Gandiva'] = 		"Bow",
        ['Fail-Not'] = 		"Bow",
        ['Accipiter'] = 	"Bow",
        ['Annihilator'] = 	"Gun",
        ['Armageddon'] = 	"Gun",
        ['Fomalhaut'] = 	"Gun",
		['Ataktos'] = 		"Gun",
        ['Gastraphetes'] = 	"Crossbow",
	}
	DefaultAmmo = {
		['Bow']  = {
			['Default'] = 			"Chrono Arrow",
			['WS'] = 				"Chrono Arrow",
			['Acc'] = 				"Yoichi's Arrow",
			['Magic'] = 			"Yoichi's Arrow",
			['MagicAcc'] = 			"Yoichi's Arrow",
			['Unlimited'] = 		"Hauksbok Arrow",
			['MagicUnlimited'] =	"Hauksbok Arrow",
			['MagicAccUnlimited'] =	"Hauksbok Arrow"
		},
		['Gun']  = {
			['Default'] = 			"Chrono Bullet",
			['WS'] = 				"Chrono Bullet",
			['Acc'] = 				"Eradicating Bullet",
			['Magic'] = 			"Devastating Bullet",
			['MagicAcc'] = 			"Devastating Bullet",
			['Unlimited'] = 		"Hauksbok Bullet",
			['MagicUnlimited'] = 	"Hauksbok Bullet",
			['MagicAccUnlimited'] =	"Animikii Bullet"
		},					
		['Crossbow'] = {
			['Default'] = 			"Quelling Bolt",
			['WS'] = 				"Quelling Bolt",
			['Acc'] = 				"Quelling Bolt",
			['MagicWS'] = 			"Quelling Bolt",
			['MagicAcc'] = 			"Quelling Bolt",
			['Unlimited'] = 		"Quelling Bolt",
			['MagicUnlimited'] = 	"Quelling Bolt",
			['MagicAccUnlimited'] =	"Quelling Bolt"
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
	state.AutoRA = M{['description']='Auto RA', 'Normal', 'Shoot', 'WS' }
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
		send_command('gs c Weapons Gastraphetes')
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
		elseif player.equipment.range == 'Annihilator' then
			state.CombatWeapon:set('Annihilator')
		elseif player.equipment.range == 'Gastraphetes' then
			state.CombatWeapon:set('Gastraphetes')
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
	if state.Weapons.value == "Fomalhaut" then 
		set_macro_page(1, 16)
	elseif state.Weapons.value == "Annihilator" then 
		set_macro_page(1, 16)
	elseif state.Weapons.value == "Gastraphetes" then 
		set_macro_page(1, 16)
	elseif state.Weapons.value == "Gandiva" then 
		set_macro_page(2, 16)
	elseif state.Weapons.value == "Yoichinoyumi" then 
		set_macro_page(2, 16)
	elseif state.Weapons.value == "FailNot" then 
		set_macro_page(3, 16)
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
	-- Filter ammo checks depending on Unlimited Shot
	if state.Buff['Unlimited Shot'] and spell.type == 'Weaponskill' then
		if data.Weaponskills.elemental:contains(spell.name) then
			if check_ws_acc():contains('Acc') then
				equip({ammo=DefaultAmmo[WeaponType[player.equipment.range]].MagicAccUnlimited})
			else
				equip({ammo=DefaultAmmo[WeaponType[player.equipment.range]].MagicUnlimited})
			end
		else
			equip({ammo=DefaultAmmo[WeaponType[player.equipment.range]].Unlimited})
		end
		return
	elseif player.equipment.ammo:startswith('Hauksbok') or player.equipment.ammo == "Animikii Bullet" then
		cancel_spell()
		eventArgs.cancel = true
		enable('ammo')
		if sets.Weapons[state.Weapons.value].ammo and item_available(sets.Weapons[state.Weapons.value].ammo) then
			equip({ammo=sets.Weapons[state.Weapons.value].ammo})
			disable('ammo')
		elseif item_available(DefaultAmmo[WeaponType[player.equipment.range]].Default) then
			equip({ammo=DefaultAmmo[WeaponType[player.equipment.range]].Default})
		else
			equip({ammo=empty})
		end
		add_to_chat(123,"Abort: Don't shoot your good ammo!")
		return
	elseif not state.UseDefaultAmmo.value then
	elseif spell.name == 'Shadowbind' then
		equip({ammo=DefaultAmmo[WeaponType[player.equipment.range]].Default})
	elseif spell.action_type == 'Ranged Attack' then
		if state.RangedMode.value:contains('Acc') then
			equip({ammo=DefaultAmmo[WeaponType[player.equipment.range]].Acc})
		else
			equip({ammo=DefaultAmmo[WeaponType[player.equipment.range]].Default})
		end			
	end
	if magicWS:contains(spell.english) then 
		equip({ammo=DefaultAmmo[WeaponType[player.equipment.range]].MagicWS})
	elseif spell.type == "Weaponskill" then 
		equip({ammo=DefaultAmmo[WeaponType[player.equipment.range]].WS})
	end 
	if player.status == "idle" then 
		equip({ammo=DefaultAmmo[WeaponType[player.equipment.range]].Default})
	end 
	if count_available_ammo(player.equipment.ammo) < 15 then
		add_to_chat(122,"Ammo Warning: Your '"..player.equipment.ammo.."' is running low: ("..count_available_ammo(player.equipment.ammo)..") remaining.")
		if DefaultAmmo[WeaponType[player.equipment.range]].Default == "Quelling Bolt" then 
			send_command('wait 1; input //gs equip sets.Quelling')
			send_command('wait 2; input //gs disable waist')
			send_command('wait 12; input /item "'..rema_ranged_weapons_ammo_pouch[player.equipment.range]..'" <me>')
				--add_to_chat(8, 'Generating more bolts')
			send_command('wait 15; input //gs enable waist')
		elseif DefaultAmmo[WeaponType[player.equipment.range]].Default == "Yoichi's Arrow" then 
			send_command('wait 1; input //gs equip sets.Yoichi')
			--send_command('input //gs disable waist')
			send_command('wait 10; input /item '..player.equipment.range.." <me>")
				--add_to_chat(8, 'Generating more Yoichi\'s Arrows')
			send_command('wait 15; input //gs enable waist')
		elseif DefaultAmmo[WeaponType[player.equipment.range]].Default == "Devastating Bullet" then 
			equip({range="Quelling B. quiver"})
			send_command('input //gs disable waist')
			send_command('wait 10; input /item "Quelling B. quiver" <me>')
			send_command('wait 15; input //gs enable waist')
		elseif DefaultAmmo[WeaponType[player.equipment.range]].Default == "Chrono Bullet" then 
			send_command('wait 1; input //gs equip sets.Chrono')
			send_command('wait 2; input //gs disable waist') 
			send_command('wait 12; input /item "'..rema_ranged_weapons_ammo_pouch[player.equipment.range]..'" <me>')
			send_command('wait 15; input //gs enable waist')
		end 
	end
end
function job_filter_precast(spell, spellMap, eventArgs)
	
end
function job_precast(spell, action, spellMap, eventArgs)
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
	if spell.action_type == 'Ranged Attack' then
		state.CombatWeapon:set(player.equipment.range)
	end

	if spell.action_type == 'Ranged Attack' or spell.name == 'Bounty Shot' or spell.name == 'Shadowbind' or (spell.type == 'Weaponskill' and (spell.skill == 'Marksmanship' or spell.skill == 'Archery')) then
		check_ammo_precast(spell, action, spellMap, eventArgs)
	end
end 
function job_post_precast(spell, spellMap, eventArgs)
	if spell.type=='WeaponSkill' then
		if moonshade_WS:contains(spell.english) and player.tp < 2850 then
			equip({ear2="Moonshade Earring"})
		end
	end
-- Equip obi if weather/day matches for WS.
	if spell.type == 'Weaponskill' then
		if spell.english == 'Trueflight' then
			if world.weather_element == 'Light' or world.day_element == 'Light' then
				equip({waist="Hachirin-no-Obi"})
			end
		elseif spell.english == 'Wildfire' and (world.weather_element == 'Fire' or world.day_element == 'Fire') then
			equip({waist="Hachirin-no-Obi"})
		end
	end
	if spell.action_type == 'Ranged Attack' then
		if flurry == 2 then
			equip(sets.precast.RA.Flurry2)
			--add_to_chat(7, 'Flurry 2 detected')
		elseif flurry == 1 then
			equip(sets.precast.RA.Flurry1)
			--add_to_chat(7, 'Flurry detected')
		end
	end
	if spell.action_type == 'Ranged Attack' and player.equipment.range == "Gastraphetes" then 
		if flurry == 2 then
			equip(sets.precast.RA.Gastraphetes.Flurry2)
		elseif flurry == 1 then
			equip(sets.precast.RA.Gastraphetes.Flurry1)
		end
	end
	if player.equipment.main =="Yoichinoyumi" then 
		if spell.english == "Namas Arrow" and (player.tp >= 1000 and player.tp < 1999) then 
			add_to_chat(8, '*** Yoichinoyumi AM active: RAcc +30 Snapshot +5 ***')
			send_command('timers create "Aftermath" 60 down')
			send_command('gs c autows Jishnu\'s Radiance')
		elseif spell.english == "Namas Arrow" and (player.tp >= 2000 and player.tp < 2999) then 
			add_to_chat(8, '*** Yoichinoyumi AM active: RAcc +30 Snapshot +5 ***')
			send_command('timers create "Aftermath" 120 down')
			send_command('gs c autows Jishnu\'s Radiance')
		elseif spell.english == "Namas Arrow" and (player.tp >= 3000) then 
			add_to_chat(8, '*** Yoichinoyumi AM active: RAcc +30 Snapshot +5 ***')
			send_command('timers create "Aftermath" 180 down')
			send_command('gs c autows Jishnu\'s Radiance')
		else 
			send_command('gs c autows Namas Arrow')
		end
	end
	if player.equipment.main =="Annihilator" then 
		if spell.english == "Coronach" and (player.tp >= 1000 and player.tp < 1999) then 
			add_to_chat(8, '*** Annihilator AM active: AM active. Rattk +15% ENM -25 ***')
			send_command('timers create "Aftermath" 60 down')
			send_command('gs c autows Last Stand')
		elseif spell.english == "Coronach" and (player.tp >= 2000 and player.tp < 2999) then 
			add_to_chat(8, '*** Annihilator AM active: AM active. Rattk +15% ENM -25 ***')
			send_command('timers create "Aftermath" 120 down')
			send_command('gs c autows Last Stand')
		elseif spell.english == "Coronach" and (player.tp >= 3000) then 
			add_to_chat(8, '*** Annihilator AM active: AM active. Rattk +15% ENM -25 ***')
			send_command('timers create "Aftermath" 180 down')
			send_command('gs c autows Last Stand')
		else 
			send_command('gs c autows Coronach')
		end 
	end
	if player.equipment.main =="Gandiva" then 
		if spell.english == "Jishnu\'s Radiance" and (player.tp >= 1000 and player.tp < 1999) then 
			add_to_chat(8, '*** Gandiva AM active: AM active. 50% Triple Damage ***')
			send_command('timers create "Aftermath" 60 down')
		elseif spell.english == "Jishnu\'s Radiance" and (player.tp >= 2000 and player.tp < 2999) then 
			add_to_chat(8, '*** Gandiva AM active: AM active. 50% Triple Damage ***')
			send_command('timers create "Aftermath" 120 down')
		elseif spell.english == "Jishnu\'s Radiance" and (player.tp >= 3000) then 
			add_to_chat(8, '*** Gandiva AM active. 50% Triple Damage ***')
			send_command('timers create "Aftermath" 180 down')
		end 
	end
end 
-----------------------
--  Mid-cast Section --
-----------------------
function job_midcast(spell, spellMap, eventArgs)
	--Probably overkill but better safe than sorry.
	if spell.action_type == 'Ranged Attack' then
		if player.equipment.ammo:startswith('Hauksbok') or player.equipment.ammo == "Animikii Bullet" then
			enable('ammo')
			equip({ammo=empty})
			add_to_chat(123,"Abort Ranged Attack: Don't shoot your good ammo!")
			return
		end
	end
	if spell.type=='Weaponskill' then
		if moonshade_WS:contains(spell.english) and player.tp < 2750 then
			equip({ear2="Moonshade Earring"})
		end
	end
end
function job_post_midcast(spell, spellMap, eventArgs)
	if spell.action_type == 'Ranged Attack' then
		if buffactive['Double Shot'] then
			equip(sets.midcast.DoubleShot)
		end
		if buffactive['Double Shot'] and player.equipment.range == "Gastraphetes" then 
			equip(sets.midcast.DoubleShot.Gastraphetes)
		end
		if buffactive['Barrage'] then
			equip(sets.midcast.Barrage)
		end
	end
	
	if spell.type == 'Weaponskill' then 
		if gav_ws:contains(spell.english) and (spell.element==world.day_element or spell.element==world.weather_element) then
			equip({head="Gavialis Helm"})
		end
	end
	
	if spell.action_type == 'Ranged Attack' then
        if state.Buff['Camouflage'] and sets.buff.Camouflage then
            if sets.buff['Camouflage'][state.RangedMode.value] then
                equip(sets.buff['Camouflage'][state.RangedMode.value])
            else
                equip(sets.buff['Camouflage'])
            end
        end
    end
end 
-------------------------
--  after-cast Section --
-------------------------
function job_aftercast(spell, spellMap, eventArgs)
	if spell.english == "Shadowbind" then
		send_command('@timers c "Shadowbind ['..spell.target.name..']" 42 down abilities/00122.png')
	end
	if state.UseDefaultAmmo.value and player.equipment.range and DefaultAmmo[WeaponType[player.equipment.range]].Default then
		equip({ammo=DefaultAmmo[WeaponType[player.equipment.range]].Default})
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
		if player.equipment.main == 'Gastraphetes' then
		--[[	Mythic Aftermath	]]
			classes.CustomMeleeGroups:clear()
			if (buff == "Aftermath: Lv.3" and gain) or buffactive['Aftermath: Lv.3'] then
				classes.CustomMeleeGroups:append('AM3')
				add_to_chat(8, '*** Gastraphetes AM3 active: Increased Acc. and Atk. 40%-DA 20%-TA ***')
				send_command('timers create "Aftermath: Lv. 3" 180 down')
				send_command('timers delete "Aftermath: Lv. 2"')
				send_command('gs c autows Savage Blade')
			elseif (buff == "Aftermath: Lv.2" and gain) then
				add_to_chat(8, '*** Gastraphetes AM2 active: Increased Acc. and Atk. ***')
				send_command('timers create "Aftermath: Lv. 2" 120 down')
				send_command('timers delete "Aftermath: Lv. 1"')
			elseif (buff == "Aftermath: Lv.1" and gain) then
				add_to_chat(8, '*** Gastraphetes AM1 active: Increased Acc. ***')
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
		elseif player.equipment.main =="Fail-Not" then 
		--[[	Aeonic Aftermath	]]
			classes.CustomMeleeGroups:clear()
			if (buff == "Aftermath: Lv.3" and gain) or buffactive['Aftermath: Lv.3'] then
				classes.CustomMeleeGroups:append('AM3')
				add_to_chat(8, '*** Fail-Not AM3 active: Ultimate SC Available ***')
				send_command('timers create "Aftermath: Lv. 3" 180 down')
				send_command('timers delete "Aftermath: Lv. 2"')
			elseif (buff == "Aftermath: Lv.2" and gain) then
				add_to_chat(8, '*** Fail-Not AM2 active: Ultimate SC Available ***')
				send_command('timers create "Aftermath: Lv. 2" 120 down')
				send_command('timers delete "Aftermath: Lv. 1"')
			elseif (buff == "Aftermath: Lv.1" and gain) then
				add_to_chat(8, '*** Fail-Not AM1 active: Ultimate SC Available ***')
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
end)--[[
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
	end]]
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
	set_macro_page(1, 16)
	send_command('wait 4; input //gs org get')
end
function set_lockstyle()
	send_command('wait 4; input /lockstyleset 15')
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

		if not buffactive['Velocity Shot'] and abil_recasts[129] < latency then
			windower.chat.input('/ja "Velocity Shot" <me>')
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
		elseif not buffactive['Double Shot'] and not buffactive['Barrage'] and abil_recasts[126] < latency then
			windower.chat.input('/ja "Double Shot" <me>')
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
----------------------------------
--	Command Section for Warping	--
----------------------------------
function user_job_self_command(commandArgs, eventArgs) 
	include('commands')
	include('telecmds')
	include('follow')
end