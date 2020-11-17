--[[
	Dark Knight: v2.0.1
	Creator: Enuri
	Server:	 Asura
	Funcitons: 	This lua will allow the user to change main weapons on the fly
				and gives the user the ability to maintain buffs and perform 
				weaponskills and auto eat food and put up enspells based on elemental mode. 
		Macros:	/console gs c cycle elementalmode
				/console gs c cycleback elementalmode
				/console gs c elemental enspell
			These are for manually applying your enspells 
		alt+F9	toggles AutoBuffMode on or off
		alt+F10	toggles AutoWSMode on or off
		alt+F11	toggles AutoEnMode on or off
		alt+F12	toggles AutoFoodMode on or off
		alt+=	toggles ComposureMode on or off
	spell casting binds 
		alt+`	casts Dispel on current target
		alt+q 	casts Frazzle III on current target
		ctrl+`	casts Paralyze II on current target
		ctrl+q	casts Slow II on current target
		win+` 	casts Addle II on current target
	Capacity Mode	
		ctrl+z 	will toggle capacity mode to on
					keep your capacity gear in inventory
					This mode will not block WS capes from being equipped
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
	send_command('bind !f10 gs c cycle AutoWSMode')
	send_command('bind !f11 gs c toggle AutoEnMode')
	send_command('bind !f12 gs c toggle AutoShadowMode')
	send_command('bind != gs c toggle ComposureMode')
	send_command('bind !` input /ma "Dispel" <t>')				--M1
	send_command('bind !q input /ma "Frazzle III" <t>')			--M2
--[[ CtrlF9-CtrlF12 keybinds ]]
	send_command('bind ^f9 gs c cycle Empty')
	send_command('bind ^f10 gs c cycle Empty')
	send_command('bind ^f11 gs c cycle Empty')
	send_command('bind ^f12 gs c cycle AutoShadowMode')
	send_command('bind ^` input /ma "Paralyze II" <t>')			--M4
	send_command('bind ^q input /ma "Slow II" <t>')				--M5
--[[ WindowsF9-WindowsF12 keybinds ]]
	send_command('bind @f9 gs c set mainWeapon Naegling')
	send_command('bind @f10 gs c set mainWeapon Ceremonial')
	send_command('bind @f11 gs c set mainWeapon Excalibur')
	send_command('bind @f12 gs c set mainWeapon Almace')
	send_command('bind @` input /ma "Addle II" <t>')			--M3	
end
--------------------------
--  Job Setup Section   --
--------------------------
function job_setup()
	state.mainWeapon = M{'None', 'Naegling', 'Ceremonial', 'Excalibur', 'Almace'}
	oneHandList = S{'Naegling', 'Ceremonial', 'Excalibur', 'Almace'}
	autows = "Savage Blade"
	autowstp = 1400
	autofood = 'Sublime Sushi'
	enspell = ''
	state.Stance = M{['description']='Stance','None'}
	init_job_states({
		"Capacity","AutoRuneMode","AutoTrustMode","AutoWSMode","AutoShadowMode",
		"AutoFoodMode","AutoStunMode","AutoEnMode"
	},{
		"Weapons","OffenseMode","WeaponskillMode",
		"IdleMode","Passive","ElementalMode","TreasureMode",
	})
--[[ Moonshade earring ]]
	moonshade_WS = S{
		"Chant du Cygne", "Savage Blade", "Death Blossom", "Evisceration", 
		"Savage Blade", "Vorpal Blade", "Requiescat", 'Sanguine Blade'
	}
	--[[ Spell Maps ]]
		enfeebling_magic_acc = S{
			'Bind', 'Break', 'Dispel', 'Distract', 'Distract II', 'Frazzle',
			'Frazzle II',  'Gravity', 'Gravity II', 'Silence', 'Sleep', 
			'Sleep II', 'Sleepga', 'Inundation'
		}
		enfeebling_magic_skill = S{
			'Distract III', 'Frazzle III', 'Poison II'
		}
		enfeebling_magic_effect = S{
			'Dia', 'Dia II', 'Dia III', 'Diaga'
		}
		ElementalNukes = S{
			'Stone', 'Stone II', 'Stone III',  'Stone IV', 'Stone V',
			'Stonega', 'Stonega II', 'Stonega III',
			'Water', 'Water II', 'Water III',  'Water IV', 'Water V',
			'Waterga', 'Waterga II', 'Waterga III',
			'Aero', 'Aero II', 'Aero III',  'Aero IV', 'Aero V',
			'Aeroga', 'Aeroga II', 'Aeroga III',
			'Fire', 'Fire II', 'Fire III',  'Fire IV', 'Fire V',
			'Firaga', 'Firaga II', 'Firaga III',
			'Blizzard', 'Blizzard II', 'Blizzard III',  'Blizzard IV', 'Blizzard V',
			'Blizzaga', 'Blizzaga II', 'Blizzaga III',
			'Thunder', 'Thunder II', 'Thunder III',  'Thunder IV', 'Thunder V',
			'Thundaga', 'Thundaga II', 'Thundaga III',
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
	state.ComposureMode = M(false, 'Composure Mode')
	state.SaboteurMode = M(false, 'Saboteur Mode')
    state.Buff['Aftermath'] = buffactive['Aftermath'] or false
    state.Buff['Aftermath: Lv.3'] = buffactive['Aftermath: Lv.3'] or false
	state.ElementalMode = M{['description'] = 'Elemental Mode', 'Fire','Ice','Wind','Earth','Lightning','Water'}
--[[ Loading of various functions ]]
  	select_default_macro_book()
  	set_lockstyle()
	get_player_name()
  	job_binds()
	update_melee_groups()
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
	if state.OffenseMode.value == "Mid" then 
		state.WeaponskillMode:set('Mid')
	elseif state.OffenseMode.value == "Acc" then 
		state.WeaponskillMode:set('Acc')
	else 
		state.WeaponskillMode:reset()
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
	if state.mainWeapon.value == "Naegling" then 
		equip({main="Naegling", sub="Vitiation sword"})
	elseif state.mainWeapon.value == "Ceremonial" then 
		equip({main="Ceremonial dagger", sub="Ceremonial dagger"})
	elseif state.mainWeapon.value == "Excalibur" then 
		equip({main="Excalibur", sub="Blurred knife +1"})
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
		if state.mainWeapon.value == 'Ceremonial' then
			state.CombatWeapon:set('Ceremonial')
		else
			state.CombatWeapon:set('engaged')
		end
	end
end 
function get_combat_weapon()
	if state.mainWeapon.value == "Naegling" then 
		equip({main="Naegling", sub="Vitiation sword"})
	elseif state.mainWeapon.value == "Ceremonial" then 
		equip({main="Ceremonial dagger", sub="Ceremonial dagger"})
	elseif state.mainWeapon.value == "Excalibur" then 
		equip({main="Excalibur", sub="Blurred knife +1"})
	end	
	return get_combat_weapon
end 
function job_state_change(cmdParams, eventArgs) 
	if newStatus == "Engaged" then 
	-- handle weapon sets
	end 
	if player.sub_job == 'NIN' then
		state.CombatForm:set("DW")
	else
		state.CombatForm:reset()
	end
--[[ Can use this to create your own custom Template ]]
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
	if player.in_combat then 
		if buffactive.march == 2 then
			classes.CustomMeleeGroups:append('Haste_43')
			add_to_chat(8, '---43% Haste Detected, equipping 11 DW to cap---')
		elseif buffactive.embrava and buffactive.haste then
			classes.CustomMeleeGroups:append('Haste_40')
			add_to_chat(8, '---40% Haste Detected, equipping 27DW to cap---')
		elseif buffactive.haste then
			classes.CustomMeleeGroups:append('Haste_30')
			add_to_chat(8, '---30% Haste Detected, equipping 31DW to cap---')
		else 
			add_to_chat(8, '---No Haste Detected, equipping 49DW to cap---')
		end
	end 
end 
function job_self_command(commandArgs, eventArgs)
	if commandArgs[1]:lower() == 'elemental' then
		handle_elemental(commandArgs)
		eventArgs.handled = true			
	end
end
-------------------------------------
--  Creating a custom spellMap,    --
-------------------------------------
function job_get_spell_map(spell, default_spell_map)
		if spell.action_type == 'Magic' then
			if default_spell_map == 'Cure' or default_spell_map == 'Curaga' then
				if (world.weather_element == 'Light' or world.day_element == 'Light') then
					return 'CureWeather'
				end
			end
			if spell.skill == 'Enfeebling Magic' then
				if spell.type == "WhiteMagic" then
					if  enfeebling_magic_effect:contains(spell.english) then
						return "EffectEnfeebles"
					elseif not enfeebling_magic_skill:contains(spell.english) then
						if enfeebling_magic_acc:contains(spell.english) and not buffactive.Stymie then
							return "MndEnfeeblesAcc"
						else
							return "MndEnfeebles"
						end
					end
				elseif spell.type == "BlackMagic" then
					if  enfeebling_magic_effect:contains(spell.english) then
						return "EffectEnfeebles"
					elseif not enfeebling_magic_skill:contains(spell.english) then
						if enfeebling_magic_acc:contains(spell.english) and not buffactive.Stymie then
							return "IntEnfeeblesAcc"
						else
							return "IntEnfeebles"
						end
					end
				else
					return "MndEnfeebles"
				end
			end
		end
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
	if spell.english:startswith('Cur') and spell.english ~= "Cursna" then
			equip(sets.precast.Cure)
	elseif spell.english == "Stun" then
		if buffactive.Composure then -- Cancel Composure When You Cast Stun --
			cast_delay(0.2)
			send_command('cancel Composure')
		end
	end
	if spell.english == 'Impact' then 
		equip({head=empty, body="Twilight Cloak",})
	end 
--[[ Lock Weaponskill if you are to far from the mob as to not lose TP ]]
	if spell.type == 'WeaponSkill' then 
		if spell.target.distance > 5 then 
			cancel_spell()
			add_to_chat(8, 'Target to far away. Move closer')
			return
		end 
	end
	if spell.type=='WeaponSkill' then
		if moonshade_WS:contains(spell.english) and player.tp < 2850 then
			equip({ear2="Moonshade Earring"})
		end
	end
end 
function job_post_precast(eventArgs, spell, action, spellMap)

end 
-----------------------
--  Mid-cast Section --
-----------------------
function job_midcast(spell, action, spellMap, eventArgs)
	
end
function job_post_midcast(spell, action, spellMap, eventArgs)
		if spell.skill == 'Enfeebling Magic' and state.Buff.Saboteur then
			equip(sets.buff.Saboteur)
		elseif spell.skill == 'Enhancing Magic' then
			if buffactive.composure and spell.target.type == 'PLAYER' then
				equip(sets.buff.ComposureOther)
			elseif spell.english:startswith('En') then
				equip(sets.midcast['Enhancing Magic'].EnSpells)
			elseif spell.english:startswith('Gain') then
				equip(sets.midcast['Enhancing Magic'].GainSpells)
			elseif spell.english == "Haste II" then 
				equip(sets.midcast.Duration)	
			end
		elseif spellMap == 'Cure' and spell.target.type == 'SELF' then
			equip(sets.midcast.CureSelf)
		end
		if spell.skill == 'Enfeebling Magic' then
			if enfeebling_magic_skill:contains(spell.english) or enfeebling_magic_effect:contains(spell.english) then
				if spell.type == "WhiteMagic" then
					equip(sets.midcast.MndEnfeeblesAcc)
				else
					equip(sets.midcast.IntEnfeeblesAcc)
				end
			end
		end
		if spell.skill == 'Elemental Magic' then
			if (spell.element == world.day_element or spell.element == world.weather_element) and not string.find(spell.english, 'helix') then
				equip(sets.Obi)
			end
		end
		if spell.english == 'Impact' then 
			equip(sets.midcast.Impact)
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
	if buff == enspell and not gain then
		enspell = ''
	end
	update_melee_groups()
end 
----------------------------------
--  Sub job section for Ninja   --
----------------------------------

----------------------------------------
--  Selecting and Setting the default --
--	Macro book and Lock style 		  --
----------------------------------------
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'NIN' then
		set_macro_page(1, 10)
	else
		set_macro_page(1, 10)
	end
end
function set_lockstyle()
	send_command('wait 4; input /lockstyleset 6')
end
-----------------------
-- Miscelanous Stuff --
-----------------------
function handle_elemental(cmdParams)
    -- cmdParams[1] == 'elemental'
    -- cmdParams[2] == ability to use

    if not cmdParams[2] then
        add_to_chat(123,'Error: No elemental command given.')
        return
    end
    local command = cmdParams[2]:lower()

	if command == 'spikes' then
		windower.chat.input('/ma "'..data.elements.spikes_of[state.ElementalMode.value]..' Spikes" <me>')
		return
	elseif command == 'enspell' then
		if  (player.sub_job == 'NIN' or player.sub_job == 'DNC') then 
			windower.chat.input('/ma "En'..elements.enspell[state.ElementalMode.value]..' II" <me>')
		else
			windower.chat.input('/ma "En'..elements.enspell[state.ElementalMode.value]..' II" <me>')
		end
		return
	elseif command == 'bardsong' then
		windower.chat.input('/ma "'..elements.threnody_of[state.ElementalMode.value]..' Threnody" '..target..'')
    else
        add_to_chat(123,'Unrecognized elemental command.')
    end
end
function job_tick()
	if check_enspell() then return true end
	if check_buff() then return true end
	if check_buffup() then return true end
	return false
end
function check_enspell()
	if state.AutoEnMode.value and player.in_combat then
	
		if silent_check_silence() then return false end
		local spell_recasts = windower.ffxi.get_spell_recasts()
		
		if not buffactive['En'..elements.enspell[state.ElementalMode.value].. ''] and (spell_recasts[100] or spell_recasts[101] or spell_recasts[102] or spell_recasts[103] or spell_recasts[104] or spell_recasts[105]) < spell_latency then 
			windower.chat.input('/ma "En'..elements.enspell[state.ElementalMode.value]..' <me>')
			tickdelay = os.clock() + 1.8
			return true
		else
			return false
		end
	end 
end
function check_buff()
	if (player.status == 'Idle' or player.in_combat) and not areas.Cities:contains(world.area) then 
		local abil_recasts = windower.ffxi.get_ability_recasts()
		if state.ComposureMode.value then 
			if not buffactive['Composure'] and abil_recasts[50] < latency then
				windower.chat.input('/ja "Composure" <me>')
				tickdelay = os.clock() + 1.8
				return true
			end
		end
	end 
	if state.AutoBuffMode.value and not areas.Cities:contains(world.area) then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		for i in pairs(buff_spell_lists['Auto']) do
			if not buffactive[buff_spell_lists['Auto'][i].Buff] and (buff_spell_lists['Auto'][i].When == 'Always' or (buff_spell_lists['Auto'][i].When == 'Combat' and (player.in_combat or being_attacked)) or (buff_spell_lists['Auto'][i].When == 'Engaged' and player.status == 'Engaged') or (buff_spell_lists['Auto'][i].When == 'Idle' and player.status == 'Idle') or (buff_spell_lists['Auto'][i].When == 'OutOfCombat' and not (player.in_combat or being_attacked))) and spell_recasts[buff_spell_lists['Auto'][i].SpellID] < latency and silent_can_use(buff_spell_lists['Auto'][i].SpellID) then
				windower.chat.input('/ma "'..buff_spell_lists['Auto'][i].Name..'" <me>')
				tickdelay = os.clock() + 2
				return true
			end
		end
	else
		return false
	end
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
function update_melee_groups()
	classes.CustomMeleeGroups:clear()
	
	if enspell ~= '' then
		if enspell:endswith('II') then
			classes.CustomMeleeGroups:append('Enspell2')
		else
			classes.CustomMeleeGroups:append('Enspell')
		end
	end
	
	if player.equipment.main and player.equipment.main == "Murgleis" and state.Buff['Aftermath: Lv.3'] then
		classes.CustomMeleeGroups:append('AM')
	end	
end
buff_spell_lists = {
	Auto = {
		{Name='Refresh III',	Buff='Refresh',		SpellID=894,	When='Always'},
		{Name='Phalanx',		Buff='Phalanx',		SpellID=106,	When='Combat'},
		{Name='Haste II',		Buff='Haste',		SpellID=511,	When='Always'},
		{Name='Stoneskin',		Buff='Stoneskin',	SpellID=54,		When='Idle'},
		{Name='Aquaveil',		Buff='Aquaveil',	SpellID=55,		When='Idle'},
		{Name='Temper II',		Buff='Multi Strikes',SpellID=895,	When='Always'},
		--{Name='Gain-STR',		Buff='STR Boost',	SpellID=486,	When='Engaged'},
		{Name='Gain-MND',		Buff='MND Boost',	SpellID=491,	When='Always'},
	},
	
	AutoMelee = {
		--{Name='Haste II',		Buff='Haste',		SpellID=511,	When='Engaged'},
		--{Name='Temper II',		Buff='Multi Strikes',SpellID=895,	When='Engaged'},
		{Name='Temper',			Buff='Multi Strikes',SpellID=493,	When='Engaged'},
	},
	
	Default = {
		{Name='Refresh III',	Buff='Refresh',		SpellID=894,	Reapply=false},
		{Name='Haste II',		Buff='Haste',		SpellID=511,	Reapply=true},
		{Name='Stoneskin',		Buff='Stoneskin',	SpellID=54,		Reapply=false},
		{Name='Shell V',		Buff='Shell',		SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',		SpellID=47,		Reapply=false},
	},

	MageBuff = {
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		{Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		{Name='Aquaveil',		Buff='Aquaveil',		SpellID=55,		Reapply=false},
		{Name='Phalanx',		Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Blink',			Buff='Blink',			SpellID=53,		Reapply=false},
		{Name='Gain-INT',		Buff='INT Boost',		SpellID=490,	Reapply=false},
		{Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
	},
	
	FullMeleeBuff = {
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		{Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		{Name='Regen II',		Buff='Regen',			SpellID=110,	Reapply=false},
		{Name='Aquaveil',		Buff='Aquaveil',		SpellID=55,		Reapply=false},
		{Name='Phalanx',		Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Blink',			Buff='Blink',			SpellID=53,		Reapply=false},
		{Name='Gain-STR',		Buff='STR Boost',		SpellID=486,	Reapply=false},
		{Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
		{Name='Shock Spikes',	Buff='Shock Spikes',	SpellID=251,	Reapply=false},
		{Name='Enthunder',		Buff='Enthunder',		SpellID=104,	Reapply=false},
		{Name='Temper II',		Buff='Multi Strikes',	SpellID=895,	Reapply=false},
		{Name='Barfire',		Buff='Barfire',			SpellID=60,		Reapply=false},
		{Name='Barparalyze',	Buff='Barparalyze',		SpellID=74,		Reapply=false},
	},
	
	MeleeBuff = {
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		{Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		{Name='Temper II',		Buff='Multi Strikes',	SpellID=895,	Reapply=false},
		{Name='Gain-STR',		Buff='STR Boost',		SpellID=486,	Reapply=false},
		{Name='Phalanx',		Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
		{Name='Shock Spikes',	Buff='Shock Spikes',	SpellID=251,	Reapply=false},
		{Name='Enthunder',		Buff='Enthunder',		SpellID=104,	Reapply=false},
		{Name='Barblizzard',	Buff='Barblizzard',		SpellID=61,		Reapply=false},
		{Name='Barparalyze',	Buff='Barparalyze',		SpellID=74,		Reapply=false},
	},

	Odin = {
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		{Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		{Name='Phalanx',		Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Gain-INT',		Buff='INT Boost',		SpellID=490,	Reapply=false},
		{Name='Temper II',		Buff='Multi Strikes',	SpellID=895,	Reapply=false},
		{Name='Regen II',		Buff='Regen',			SpellID=110,	Reapply=false},
		{Name='Enaero',			Buff='Enaero',			SpellID=102,	Reapply=false},
		{Name='Enthunder',		Buff='Enthunder',		SpellID=104,	Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
	},
	
	HybridCleave = {
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		{Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		{Name='Phalanx',		Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Gain-INT',		Buff='INT Boost',		SpellID=490,	Reapply=false},
		{Name='Enthunder II',	Buff='Enthunder II',	SpellID=316,	Reapply=false},
		{Name='Temper II',		Buff='Multi Strikes',	SpellID=895,	Reapply=false},
		{Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
	},
}
----------------------------------
--	Command Section for Warping	--
----------------------------------
function user_job_self_command(commandArgs, eventArgs) 
	include('commands')
end