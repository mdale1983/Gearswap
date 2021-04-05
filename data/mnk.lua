--[[
	Dark Knight: v2.0.1
	Creator: Enuri
	Server:	 Asura
	Funcitons: 	This lua will allow the user to change main weapons on the fly
				and gives the user the ability to maintain buffs and perform 
				weaponskills and auto eat food.
]]
----------------------------------------------
--  Initialization function required for    --
--          this to work properly           --
----------------------------------------------
function get_sets()
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
	send_command('bind f12 gs c cycle WeaponskillMode')
--[[ AltF9-AltF12 keybinds ]]
	send_command('bind !f9 gs c cycle AutoBuffMode')
		send_command('bind !f10 gs c cycle AutoWSMode')
		send_command('bind !f11 gs c toggle AutoShadowMode')
	send_command('bind !f12 gs c toggle AutoFoodMode')
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
	send_command('bind @f7 gs c set Weapons Glanzfaust')
	send_command('bind @f8 gs c set Weapons Spharai')
	send_command('bind @f9 gs c set Weapons HesyFists')
	send_command('bind @f10 gs c set Weapons Emeici')
	send_command('bind @f11 gs c set Weapons Verethragna')
	send_command('bind @f12 gs c set Weapons Godhands')
	send_command('bind @` input /ma "Aquaveil" <me>')
	send_command('bind @q input /ma "Sheep Song" <t>')
end
--------------------------
--  Job Setup Section   --
--------------------------
function job_setup()
	state.mainWeapon = M{'None', 'HesyFists', 'Emeici', 'Verethragna', 'Godhands'}
	state.Weapons = M{'None', 'HesyFists', 'Emeici', 'Verethragna', 'Spharai', 'Godhands', 'Glanzfaust'}
	autows = "Victory Smite"
	autowstp = 1200
	autofood = 'Pear Crepe'
	init_job_states({
		"Capacity","AutoWSMode","AutoShadowMode","AutoFoodMode",
		"AutoDefenseMode", "AutoRuneMode","ElementalWheel"
		},
		{
		"AutoBuffMode","AutoFoodMode","AutoWSMode",
		"RuneElement","AutoShadowMode"
		
	})
--[[ Moonshade earring and Gav. Helmet ]]
	moonshade_WS = S{
		"Victory Smite", "Shijin Spiral", "Asuran Fists",
		"Raging Fists", "Ascetic's Fury", 'Howling Fists'
	}
	gav_ws = S{
		"Victory Smite", "Shijin Spiral", "Asuran Fists",
		"Raging Fists", "Ascetic's Fury", 'Howling Fists'
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
	state.warned = M(false)
	state.crafting = M(false)
	options.ammo_warning_limit = 10
end 
--------------------------
--  User Setup Section  --
--------------------------
function user_setup()
	state.IdleMode:options('Normal', 'MagicEva')
  	state.OffenseMode:options('Normal', 'Mid', 'Acc')
  	state.HybridMode:options('Normal', 'MagicEva')
  	state.WeaponskillMode:options('Magical', 'Physical')
  	state.CastingMode:options('Normal', 'Resistant', 'Burst', 'Enfeebling')
--[[ User Created states ]]
	state.CapacityMode = M(false, 'Capacity Point Mantle')
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
		-- state.mainWeapon:set('Godhands')
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
function display_current_job_state(eventArgs)

end
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
		if player.equipment.range == 'Emeici' then
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
function get_combat_weapon()
	if state.Weapons.value == "Emeici" then 
		equip({main="Emeici"})
	elseif state.Weapons.value == "HesyFists" then 
		equip({main="Hesychast's Fists"})
	elseif state.Weapons.value == "Spharai" then 
		equip({main="Spharai"})
	elseif state.Weapons.value == "Verethragna" then 
		equip({main="Verethragna"})
	elseif state.Weapons.value == "Godhands" then 
		equip({main="Godhands"})
	elseif state.Weapons.value == "Glanzfaust" then 
		equip({main="Glanzfaust"})
	end
	return get_combat_weapon
end 
function job_state_change(cmdParams, eventArgs) 
--[[ Can use this to create your own custom Template ]]
	buff = string.lower(buff)
	if buff == "Aftermath: Lv. 3" then 
		if gain then 
			send_command('timers create "Aftermath: Lv. 3" 180 down')
		end
	end 
	classes.CustomMeleeGroups:clear()
	-- mythic AM	
	if player.equipment.main == 'Liberator' then
		if buffactive['Aftermath: Lv.3'] then
			classes.CustomMeleeGroups:append('AM3')
		end
	elseif buffactive['Aftermath'] then
		classes.CustomMeleeGroups:append('AM')
	end
	if newStatus == "Engaged" then 
	-- handle weapon sets
	end 
	if buffactive['Samurai Roll'] then
		classes.CustomRangedGroups:append('SamRoll')
	end
end 
function update_melee_group()
	
end
function get_combat_form() 
	if CombatForm == 'DW' and player.in_combat then 
		-- Haste (white magic) 15%  [33]
		-- Haste Samba (Sub) 5%		[370]
		-- Mighty Guard - 15%		[604]
		-- Victory March +3/+4/+5     14%/15.6%/17.1%
		-- Advancing March +3/+4/+5   10.9%/12.5%/14%
		-- Embrava 25%
		-- Last Resort 25% JA Haste
		-- Hasso 10%
		if (buffactive[604] and buffactive[33]) or buffactive.march == 2 then
			classes.CustomMeleeGroups:append('Haste_43')
			add_to_chat(8, '---43% Haste Detected---')
		elseif buffactive[51] and buffactive.march ==2 then
			classes.CustomMeleeGroups:append('Haste_43x')
			add_to_chat(8, '---43% Haste Detected---')
		elseif buffactive.embrava and buffactive.haste then
			classes.CustomMeleeGroups:append('Haste_40')
			add_to_chat(8, '---40% Haste Detected---')
		elseif buffactive.haste then
			classes.CustomMeleeGroups:append('Haste_30')
			add_to_chat(8, '---30% Haste Detected---')
		else 
			add_to_chat(8, '---No Haste Detected---')
		end
	end 
end 
-------------------------------------
--  Creating a custom spellMap,    --
-------------------------------------
function job_get_spell_map(spell, default_spell_map)
	--[[no spell maps for drk]]
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
	if spell.action_type=="Magic" and buffactive.Silence then
		eventArgs.cancel = true
		send_command('input /item "Echo Drops" <me>')
	end
	if spell.type=='WeaponSkill' then
		if moonshade_WS:contains(spell.english) and player.tp < 2750 then
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
	if spell.english == "Shadowbind" then
		send_command('@timers c "Shadowbind ['..spell.target.name..']" 42 down abilities/00122.png')
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
	if state.Buff[buff] ~= nil then
		state.Buff[buff] = gain
		handle_equipping_gear(player.status)
	end
	if buff:startswith('Aftermath') then
        if player.equipment.main == 'Liberator' then
            classes.CustomMeleeGroups:clear()

            if (buff == "Aftermath: Lv.3" and gain) or buffactive['Aftermath: Lv.3'] then
                classes.CustomMeleeGroups:append('AM3')
                add_to_chat(8, '*** Liberator AM3 active: Increased Acc. and Atk. 40%-DA 20%-TA ***')
				send_command('timers create "Aftermath: Lv. 3" 180 down')
				send_command('gs c autows savage blade')
            elseif (buff == "Aftermath: Lv.2" and gain) then
                add_to_chat(8, '*** Liberator AM2 active: Increased Acc. and Atk. ***')
				send_command('timers create "Aftermath: Lv. 2" 120 down')
			elseif (buff == "Aftermath: Lv.1" and gain) then
                add_to_chat(8, '*** Liberator AM1 active: Increased Acc. ***')
				send_command('timers create "Aftermath: Lv. 1" 60 down')
			else 
				send_command('gs c autows Insurgency')
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
----------------------------------------
--  Selecting and Setting the default --
--	Macro book and Lock style 		  --
----------------------------------------
function select_default_macro_book()
	set_macro_page(1, 15)
	send_command('wait 4; input //gs org get')
end
function set_lockstyle()
	send_command('wait 4; input /lockstyleset 16')
end
-----------------------
-- Miscelanous Stuff --
-----------------------
function job_tick()
	if check_buff() then return true end
	return false
end
function check_buff()
	if state.AutoBuffMode.value and player.in_combat then
		
		local abil_recasts = windower.ffxi.get_ability_recasts()

			if not buffactive['Impetus'] and abil_recasts[31] < latency then
				windower.chat.input('/ja "Impetus" <me>')
				tickdelay = os.clock() + 1.8
				return true
			elseif not buffactive['Impetus'] and not buffactive['Focus'] and abil_recasts[13] < latency then
				windower.chat.input('/ja "Focus" <me>')
				tickdelay = os.clock() + 1.8
				return true
			elseif not buffactive['Footwork'] and abil_recasts[21] < latency then
				windower.chat.input('/ja "Footwork" <me>')
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
----------------------------------
--	Command Section for Warping	--
----------------------------------
function user_job_self_command(commandArgs, eventArgs) 
	include('commands')
	include('htmbki')
end