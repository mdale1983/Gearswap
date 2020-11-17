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
	send_command('bind f12 gs c cycle CastingMode')
--[[ AltF9-AltF12 keybinds ]]
	send_command('bind !f9 gs c toggle AutoBuffMode')
	send_command('bind !f10 gs c toggle AutoWSMode')
	send_command('bind !f11 gs c toggle AutoShadowMode')
	send_command('bind !f12 gs c toggle AutoTankMode')
	send_command('bind != gs c toggle CapacityMode')
	send_command('bind !` input /ma "Stun" <t>')
	send_command('bind !q input /ma "Drain III" <t>')
--[[ CtrlF9-CtrlF12 keybinds ]]
	send_command('bind ^f9 gs c toggle Empty')
	send_command('bind ^f10 gs c cycle Empty')
	send_command('bind ^f11 gs c cycle Empty')
	send_command('bind !f12 gs c cycle Empty')
	send_command('bind ^` input /ma "Chocobo Mazurka" <me>')
	send_command('bind ^q input /ma "Temper" <me>')
--[[ WindowsF9-WindowsF12 keybinds ]]
	send_command('bind @f9 gs c set mainWeapon Minos')
	send_command('bind @f10 gs c set mainWeapon Chango')
	send_command('bind @f11 gs c set mainWeapon Ragnarok')
	send_command('bind @f12 gs c set mainWeapon empty')
	send_command('bind @` input /ma "Aquaveil" <me>')
	send_command('bind @q input /ma "Sheep Song" <t>')
end
--------------------------
--  Job Setup Section   --
--------------------------
function job_setup()
	state.mainWeapon = M{'None', 'Minos', 'Caladbolg', 'Ragnarok', 'Anguta'}
	oneHandList = S{'replace with your weapons'}
	gsList = S{'Macbain', 'Crobaci +1'}
  	scytheList = S{'Cronus', 'Raetic Scythe'}
	autows = "Torcleaver"
	autowstp = 1200
	autofood = 'Sublime Sushi'
	state.Stance = M{['description']='Stance','Hasso','Seigan','None'}
	init_job_states({
		"Capacity","AutoRuneMode","AutoTrustMode","AutoTankMode",
		"AutoWSMode","AutoShadowMode","AutoFoodMode","AutoNukeMode",
		"AutoStunMode","AutoDefenseMode","AutoBuffMode",
		},{
		"AutoSambaMode","Weapons","OffenseMode","WeaponskillMode",
		"Stance","IdleMode","Passive","RuneElement","PhysicalDefenseMode",
		"MagicalDefenseMode","ResistDefenseMode","TreasureMode",
	})
--[[ Moonshade earring and Gav. Helmet ]]
	moonshade_WS = S{
		"Resolution", "Torcleaver", "Catastrophe", "Cross Reaper", 
		"Quietus", "Entropy", "Insurgency", "Savage Blade", 
		"Vorpal Blade", "Requiescat", 'Sanguine Blade'
	}
	gav_ws = S{
		"Resolution", "Torcleaver", "Catastrophe", "Cross Reaper", 
		"Quietus", "Entropy", "Insurgency", "Savage Blade", 
		"Vorpal Blade", "Requiescat", 'Sanguine Blade'
	}
end 
--------------------------
--  User Setup Section  --
--------------------------
function user_setup()
	state.IdleMode:options('Normal', 'MagicEva')
  	state.OffenseMode:options('Normal', 'Mid', 'Acc')
  	state.HybridMode:options('Normal', 'MagicEva', 'Reraise')
  	state.WeaponskillMode:options('Normal', 'Mid', 'Acc')
  	state.CastingMode:options('Normal', 'Resistant', 'Burst', 'Enfeebling')
--[[ User Created states ]]
	state.CapacityMode = M(false, 'Capacity Point Mantle')
	state.Buff.Souleater = buffactive.Souleater or false
    state.Buff['Dark Seal'] = buffactive['Dark Seal'] or false
	state.Buff['Nether Void'] = buffactive['Nether Void'] or false
  	state.SouleaterMode = M(false, 'Soul Eater Mode')
	state.LastResortMode = M(false, 'Last Resort Mode')
    state.Buff['Aftermath'] = buffactive['Aftermath'] or false
    state.Buff['Aftermath: Lv.3'] = buffactive['Aftermath: Lv.3'] or false
    state.Buff.Hasso = buffactive.Hasso or false
    state.Buff.Seigan = buffactive.Seigan or false
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
		-- state.mainWeapon:set('Caladbolg')
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
	if state.HybridMode.value == "Reraise" then 
		idleSet = set_combine(idleSet, sets.Reraise)
	end
	if state.HybridMode.value == "MagicEva" then 
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
	if state.HybridMode.value == "Reraise" then 
		meleeSet = set_combine(meleeSet, sets.Reraise)
	elseif state.HybridMode.value == "MagicEva" then 
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
		if gsList:contains(player.equipment.main) then
			state.CombatWeapon:set('GreatSword')
		elseif scytheList:contains(player.equipment.main) then
			state.CombatWeapon:set('Engaged')
		elseif player.equipment.main == 'Ragnarok' then
			state.CombatWeapon:set('Ragnarok')
		elseif player.equipment.main == 'Minos' then
			state.CombatWeapon:set('Minos')
		elseif player.equipment.main == 'Caladbolg' then
			state.CombatWeapon:set('Caladbolg')
		elseif player.equipment.main == 'Chango' then
			state.CombatWeapon:set('Chango')
		elseif player.equipment.main == 'Liberator' then
			state.CombatWeapon:set('Liberator')
		end
	end 
end 
function get_combat_weapon()
	if state.mainWeapon.value == "Minos" then 
		equip({main="Minos", sub="Utu Grip"})
	elseif state.mainWeapon.value == "Ragnarok" then 
		equip({main="Ragnarok", sub="Utu Grip"})
	elseif state.mainWeapon.value == "Caladbolg" then 
		equip({main="Caladbolg", sub="Utu Grip"})
	elseif state.mainWeapon.value == "Liberator" then 
		equip({main="Liberator", sub="Utu Grip"})
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
	if player.equipment.main == 'Minos' then 
		if buffactive['Aftermath'] then 
			classes.CustomMeleeGroups:append('AM')
			add_to_chat(8, '***Minos AM Active: Acc 15 Haste 10% ***')
		end 
	end 
	if player.equipment.main == "Caladbolg" then 
		if buffactive['Aftermath'] then 
			classes.CustomMeleeGroups:append('AM')
			add_to_chat(7,'***Calad AM active: 50% Triple damage***')
		end 
	end 
	if player.equipment.main == "Ragarok" then 
		if buffactive['Aftermath'] then 
			classes.CustomMeleeGroups:append('AM')
			add_to_chat(7,'***Ragarok AM active: Acc 15 Crit Hit Rate 10%***')
		end 
	end
	if buffactive['Samurai Roll'] then
		classes.CustomRangedGroups:append('SamRoll')
	end
end 
function update_melee_group()
	
	if buffactive['Samurai Roll'] then
		classes.CustomRangedGroups:append('SamRoll')
	end
end
function get_combat_form() 
	classes.CustomMeleeGroups:clear()
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
		-- add_to_chat(8, '---------43% Haste Detected, equipping 11 DW to cap---------')
	elseif buffactive[51] and buffactive.march ==2 then
		classes.CustomMeleeGroups:append('Haste_43x')
		-- add_to_chat(8, '---------43% Haste Detected, equipping 27DW to cap---------')
	elseif buffactive.embrava and buffactive.haste then
		classes.CustomMeleeGroups:append('Haste_40')
		-- add_to_chat(8, '---------40% Haste Detected, equipping 27DW to cap---------')
	elseif buffactive.haste then
		classes.CustomMeleeGroups:append('Haste_30')
		-- add_to_chat(8, '---------30% Haste Detected, equipping 31DW to cap---------')
	else 
		-- add_to_chat(8, '---------No Haste Detected, equipping 49DW to cap---------')
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
function job_pretarget(spell, spellMap, eventArgs)
    
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
function job_post_precast(spell, action, spellMap)
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
end 
-----------------------
--  Mid-cast Section --
-----------------------
function job_midcast(spell, action, spellMap, eventArgs)
	if spell.english:startswith('Absorb') and spell.english ~= 'Absorb-TP' then 
		equip(sets.midcast.Absorb)
	elseif spell.english:startswith('Drain') or spell.english:startswith('Aspir') or spell.english:startswith('Bio') then 
		if world.day == "Darksday" or world.weather_element == "Dark" then
			equip({waist="Hachirin-no-Obi"})
		end 
	end 
end
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Elemental Magic' then
		if spell.element == world.day_element or spell.element == world.weather_element then
			equip(sets.midcast['Elemental Magic'], {waist="Hachirin-no-Obi"})
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
function job_aftercast(spell, action, spellMap, eventArgs)
	
end 
function job_post_aftercast(spell, action, spellMap, eventArgs)
	if spell.english == "Sleep II" then 
		send_command('timers create "Sleep II" 60 down')
	elseif spell.english == "Sleep" then 
		send_command('timers create "Sleep" 30 down')
	end
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
	if state.LastResortMode.value == true then 
		send_command('@wait 1; cancel Last Resort')
	end 
	if state.SouleaterMode.value == true then 
		send_command('@wait 1; cancel Souleater')
	end 
	if buffactive['Last Resort'] then 
		send_command('@wait 1; cancel hasso')
	else 
		send_command('@wait 1; /ja "Hasso" <me>')
	end
	if buffactive['Souleater'] then
		equip({head="Ignominy Burgonet +1"})
		disable('Head')
		add_to_chat(100,'WARNING: Souleater set equiped.')
		else
			enable('Head')
	end
	if buffactive['Blood Weapon'] and buffactive['Souleater'] and player.hp > 8000 then
		equip({main="Dacnomania", head="Ignominy Burgonet +1"})
		disable('Head')
		--add_to_chat(100,'WARNING: SOUL EATER HEAD ON AND &&&& Dacnomania.')
		else
			enable('Head')
	end
	if not buffactive.hasso and player.status == "Engaged" then
		send_command('@wait 1.0;input /ja "Hasso" <me>')
	end
--[[ Drain II | Drain III HP Boost. Set Soul Eater to stay on. ]]
	if buff == "Max HP Boost" and state.SouleaterMode.value then
		if gain or buffactive['Max HP Boost'] then
			state.SouleaterMode:set(false)
		else
			state.SouleaterMode:set(true)
		end
	end
--[[ Make sure SE stays on for BW	]]
	if buff == 'Blood Weapon' and state.SouleaterMode.value then
		if gain or buffactive['Blood Weapon'] then
			state.SouleaterMode:set(false)
		else
			state.SouleaterMode:set(true)
		end
	end
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
	-- Default macro set/book
	send_command('wait 4; input //gs org get')
	if player.sub_job == 'DNC' then
		set_macro_page(4, 6)
	elseif player.sub_job == 'SAM' and player.equipment.main == 'Ragnarok' then
		set_macro_page(3, 6)
	elseif player.sub_job == 'SAM' and player.equipment.main == 'Caladbolg' then
		set_macro_page(1, 6)
	elseif player.sub_job == 'SAM' and player.equipment.main == 'Minos' then
		set_macro_page(2, 6)
	else
		set_macro_page(2, 6)
	end
end
function set_lockstyle()
	send_command('wait 4; input /lockstyleset 7')
end
-----------------------
-- Miscelanous Stuff --
-----------------------
function job_tick()
	if check_hasso() then return true end
	if check_buff() then return true end
	if check_buffup() then return true end
	return false
end
function check_hasso()
	if not (state.Stance.value == 'None' or state.Buff.Hasso or state.Buff.Seigan) and player.sub_job == 'SAM' and player.in_combat then
		
		local abil_recasts = windower.ffxi.get_ability_recasts()
		
		if state.Stance.value == 'Hasso' and abil_recasts[138] < latency then
			windower.chat.input('/ja "Hasso" <me>')
			tickdelay = os.clock() + 1.8
			return true
		elseif state.Stance.value == 'Seigan' and abil_recasts[139] < latency then
			windower.chat.input('/ja "Seigan" <me>')
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
----------------------------------
--	Command Section for Warping	--
----------------------------------
function user_job_self_command(commandArgs, eventArgs) 
	include('commands')
end