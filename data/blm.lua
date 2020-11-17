--[[
	Black Mage: v1.0.1
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
	send_command('bind !f9 gs c cycle AutoBuffMode')
	send_command('bind !f10 gs c cycle AutoSubMode')
	send_command('bind !f11 gs c toggle MagicBurst')
	send_command('bind !f12 gs c toggle empty')
	send_command('bind != gs c toggle CapacityMode')
	send_command('bind !` input /ja "Mana Wall" <me>')
	send_command('bind !q input /ja "Enmity Douse" <me>')
--[[ CtrlF9-CtrlF12 keybinds ]]
	send_command('bind ^f9 gs c cycle Empty')
	send_command('bind ^f10 gs c cycle Empty')
	send_command('bind ^f11 gs c cycle Empty')
	send_command('bind ^f12 gs c cycle Empty')
	send_command('bind ^` input /ja "Dark Arts" <me>')
	send_command('bind ^q input /ja "Addendum: Black" <me>')
--[[ WindowsF9-WindowsF12 keybinds ]]
	send_command('bind @f9 gs c set mainWeapon Lathi')
	send_command('bind @f10 gs c set mainWeapon Raetic')
	send_command('bind @f11 gs c set mainWeapon empty')
	send_command('bind @f12 gs c set mainWeapon empty')
	send_command('bind @` input /ma "Empty" <t>')
	send_command('bind @q input /ma "Empty" <t>')
end
--------------------------
--  Job Setup Section   --
--------------------------
function job_setup()
	autows = 'Spirit Taker'
	autowstp = 1000
	autofood = 'Tropical Crepe'
	check_enspell = ' '
	state.mainWeapon = M{'None', 'Raetic', 'Lathi'}
	init_job_states({
		"AutoFoodMode","AutoNukeMode","AutoStunMode","AutoBuffMode","AutoWSMode",
	},{
		"CastingMode"
	})
	LowTierNuke = S{
      'Stone', 'Water', 'Aero',
      'Fire', 'Blizzard', 'Thunder'
    }
    MidTierNuke = S{
      'Stone II', 'Water II', 'Aero II',
      'Fire II', 'Blizzard II', 'Thunder II',
      'Stone III', 'Water III', 'Aero III',
      'Fire III', 'Blizzard III', 'Thunder III',
    }
    HighTierNuke = S{
      'Stone IV', 'Water IV', 'Aero IV',
      'Fire IV', 'Blizzard IV', 'Thunder IV',
      'Stone V', 'Water V', 'Aero V',
      'Fire V', 'Blizzard V', 'Thunder V',
	  'Stone VI', 'Water VI', 'Aero VI',
      'Fire VI', 'Blizzard VI', 'Thunder VI',
	  'Firaja', 'Blizzaja', 'Aeroja', 'Thundaja',
	  'Stoneja', 'Waterja', 'Flare II', 'Flare',
	  'Freeze', 'Freeze II', 'Tornado', 'Tornado II',
	  'Quake', 'Quake II', 'Burst', 'Burst II', 'Flood',
	  'Flood II', 'Comet', 'Firaga II', 'Blizzaga II', 'Aeroga II', 
	  'Thundaga II', 'Stonega II', 'Waterga II',
	  'Firaga III', 'Blizzaga III', 'Aeroga III', 
	  'Thundaga III', 'Stonega III', 'Waterga III',
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
  	state.CastingMode:options('Normal', 'Burst')
--[[ User Created states ]]
	state.CapacityMode = M(false, 'Capacity Point Mantle')
	AutoManawellSpells = S{'Impact'}
	AutoManawellOccultSpells = S{
		'Impact','Meteor','Thundaja','Blizzaja',
		'Firaja','Thunder VI','Blizzard VI',
	}
	state.DeathMode 	  = M{['description'] = 'Death Mode', 'Off', 'Single', 'Lock'}
	state.AutoManawell = M(true, 'Auto Manawell Mode')
	state.RecoverMode = M('35%', '60%', 'Always', 'Never')
	state.Buff['Mana Wall'] = buffactive['Mana Wall'] or false
	state.Buff['Manafont'] = buffactive['Manafont'] or false
	state.Buff['Manawell'] = buffactive['Manawell'] or false
--[[ Loading of various functions ]]
  	select_default_macro_book()
  	set_lockstyle()
	get_player_name()
  	job_binds()
	set_addons()
	check_ws()
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
		send_command('gs c set mainWeapon Lathi')
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
	if player.mpp < 51 then
		idleSet = set_combine(idleSet, sets.latent_refresh)
	end
	if state.IdleMode.value == "PDT" then 
		idleSet = set_combine(idleSet, sets.idle.PDT)
	elseif state.IdleMode.value == "MagicEva" then 
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
	
end 
function get_combat_weapon()
	if state.mainWeapon.value == "Raetic" then 
		equip({main="Raetic staff", sub="Enki strap"})
	elseif state.mainWeapon.value == "Lathi" then 
		equip({main="Lathi", sub="Enki strap"})
	end	
	return get_combat_weapon
end 
function job_state_change(cmdParams, eventArgs) 
--[[ Can use this to create your own custom Template ]]
	
end 
function update_melee_group()
	
	if buffactive['Samurai Roll'] then
		classes.CustomRangedGroups:append('SamRoll')
	end
end
function get_combat_form() 
	
end 
-------------------------------------
--  Creating a custom spellMap,    --
-------------------------------------
function job_get_spell_map(spell, default_spell_map)
	if spell.action_type == 'Magic' then 
		if default_spell_map == 'Cure' or default_spell_map == 'Curaga' then 
			return 'Cure'
		elseif world.weather_element == 'Light' then 
			return 'CureLight'
		end
	end 
	if spell.english == 'Fire' then 
		equip(sets.midcast.LowTierNuke)
	end 
	if spell.skill == 'Elemental Magic' then
		if LowTierNuke:contains(spell.english) then
			return 'LowTierNuke'
		elseif MidTierNuke:contains(spell.english) then
			return 'MidTierNuke'
		elseif HighTierNuke:contains(spell.english) then
			return 'HighTierNuke'
		elseif spell.skill == "Enfeebling Magic" then
			if spell.type == "WhiteMagic" then
				return "MndEnfeebles"
			else
				return "IntEnfeebles"
			end 
		end 
	end
end	
-------------------------
-- Pre-Target section  --
-------------------------
function job_pretarget(spell, spellMap, eventArgs)
    if spell.action_type == 'Magic' then
		if state.AutoManawell.value and (AutoManawellSpells:contains(spell.english) or (state.CastingMode.value == 'OccultAcumen' and AutoManawellOccultSpells:contains(spell.english) and actual_cost(spell) > player.mp)) then
			local abil_recasts = windower.ffxi.get_ability_recasts()

			if abil_recasts[35] < latency and not buffactive['amnesia'] then
				cancel_spell()
				send_command('@input /ja "Manawell" <me>;wait 1;input /ma '..spell.english..' '..spell.target.raw..'')
				return
			end
		end
	end
end
-----------------------
-- Pre-cast section  --
-----------------------
function job_filter_precast(spell, spellMap, eventArgs)
	
end
function job_precast(spell, action, spellMap, eventArgs)
	if spell.action_type == 'Magic' then
		if (spell.element == world.day_element or spell.element == world.weather_element) then
            equip(sets.Obi)
        end
		
        if state.CastingMode.value == 'Proc' then
            classes.CustomClass = 'Proc'
        elseif state.CastingMode.value == 'OccultAcumen' then
            classes.CustomClass = 'OccultAcumen'
        end
        if state.DeathMode.value ~= 'Off' then
            classes.CustomClass = 'Death'
        end
	end
end 
function job_post_precast(eventArgs, spell, action, spellMap)
	if state.DeathMode.value ~= 'Off' then
		equip(sets.precast.FC.Death)
	end
	
	if state.Buff['Mana Wall'] and (state.IdleMode.value:contains('DT') or state.DefenseMode.value ~= 'None') then
		equip(sets.buff['Mana Wall'])
	end
end 
-----------------------
--  Mid-cast Section --
-----------------------
function job_midcast(spell, action, spellMap, eventArgs)

end
function job_post_midcast(spell, action, spellMap, eventArgs)
	if spell.action_type == 'Magic' then
		if state.DeathMode.value ~= 'Off' and spell.english ~= 'Death' then
			if sets.midcast[spell.english] and sets.midcast[spell.english].Death then
				equip(sets.midcast[spell.english].Death)
			elseif sets.midcast[spellMap] and sets.midcast[spellMap].Death then
				equip(sets.midcast[spellMap].Death)
			elseif sets.midcast[spell.skill] and sets.midcast[spell.skill].Death then
				equip(sets.midcast[spell.skill].Death)
			else
				equip(sets.precast.FC.Death)
			end
	
		elseif is_nuke(spell, spellMap) and spell.english ~= 'Impact' then
			if state.MagicBurstMode.value ~= 'Off' then
				if state.CastingMode.value:contains('Resistant') and sets.ResistantMagicBurst then
					equip(sets.ResistantMagicBurst)
				else
					equip(sets.MagicBurst)
				end
			end

			if player.hpp < 75 and player.tp < 1000 and state.CastingMode.value == 'Fodder' then
				if item_available("Sorcerer's Ring") then
					sets.SorcRing = {ring1="Sorcerer's Ring"}
					equip(sets.SorcRing)
				end
			end
			
			if spell.element == world.weather_element or spell.element == world.day_element then
				if state.CastingMode.value == 'Fodder' then
					-- if item_available('Twilight Cape') and not LowTierNukes:contains(spell.english) and not state.Capacity.value then
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
			
			if (spell.element == world.day_element or spell.element == world.weather_element) then
				equip({waist="Hachirin-no-Obi"})
			end
			
			if state.RecoverMode.value ~= 'Never' and not (state.Buff['Manafont'] or state.Buff['Manawell']) and (state.RecoverMode.value == 'Always' or tonumber(state.RecoverMode.value:sub(1, -2)) > player.mpp) then
				if state.MagicBurstMode.value ~= 'Off' then
					if state.CastingMode.value:contains('Resistant') and sets.ResistantRecoverBurst then
						equip(sets.ResistantRecoverBurst)
					elseif sets.RecoverBurst then
						equip(sets.RecoverBurst)
					end
				elseif sets.RecoverMP then
					equip(sets.RecoverMP)
				end
			end
		end
		
		if state.Buff['Mana Wall'] and (state.IdleMode.value:contains('DT') or state.DefenseMode.value ~= 'None') then
			equip(sets.buff['Mana Wall'])
		end
	end
end 
-------------------------
--  after-cast Section --
-------------------------
function job_aftercast(spell, action, spellMap, eventArgs)
	-- Lock feet after using Mana Wall.
    if not spell.interrupted then
        if spell.english == 'Sleep' or spell.english == 'Sleepga' then
            send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 60 down spells/00220.png')
        elseif spell.english == 'Sleep II' or spell.english == 'Sleepga II' then
            send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 90 down spells/00220.png')
		elseif spell.english == "Death" and state.DeathMode.value == 'Single' then
			state.DeathMode:reset()
			if state.DisplayMode.value then update_job_states()	end
        end
    end
end 
function job_post_aftercast(spell, action, spellMap, eventArgs)
	
end	
function job_pet_aftercast(spell, spellMap, eventArgs)
	if state.PactSpamMode.value == true and spell.type == 'BloodPactRage'then
		abil_recasts = windower.ffxi.get_ability_recasts()
		if abil_recasts[173] == 0 then
			windower.chat.input('/pet "'..spell.name..'" <t>')
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
function job_buff_change(buff, gain)	
	if state.Buff[buff] ~= nil then
		state.Buff[buff] = gain
		handle_equipping_gear(player.status)
	end
	if buff:startswith('Aftermath') then
        if player.equipment.main == 'Nirvana' then
            classes.CustomMeleeGroups:clear()

            if (buff == "Aftermath: Lv.3" and gain) or buffactive['Aftermath: Lv.3'] then
                classes.CustomMeleeGroups:append('AM3')
                add_to_chat(8, '*** Nirvana AM3 active: Increased Acc. and Atk. 40%-DA 20%-TA ***')
				send_command('timers create "Aftermath: Lv. 3" 180 down')
            elseif (buff == "Aftermath: Lv.2" and gain) then
                add_to_chat(8, '*** Nirvana AM2 active: Increased Acc. and Atk. ***')
				send_command('timers create "Aftermath: Lv. 2" 120 down')
			elseif (buff == "Aftermath: Lv.1" and gain) then
                add_to_chat(8, '*** Nirvana AM1 active: Increased Acc. ***')
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
	if buff == 'Astral Conduit' and ConduitLocked ~= nil and not gain then
		ConduitLocked = nil
		add_to_chat(217, "Astral Conduit has worn, enabling all slots.")

		if state.Weapons.value == 'None' then
			enable('main','sub','range','ammo','head','neck','lear','rear','body','hands','lring','rring','back','waist','legs','feet')
		else
			enable('range','ammo','head','neck','lear','rear','body','hands','lring','rring','back','waist','legs','feet')
		end
	end
end 
----------------------------------------
--  Selecting and Setting the default --
--	Macro book and Lock style 		  --
----------------------------------------
function select_default_macro_book()
	set_macro_page(1, 17)
	send_command('wait 4; input //gs org get')
end
function set_lockstyle()
	send_command('wait 4; input /lockstyleset 17')
end
-----------------------
-- Miscelanous Stuff --
-----------------------
function set_addons()
	send_command('wait 6; input //lua l autoburst')
end 
function job_tick()
	if check_arts() then return true end
	if check_buff() then return true end
	if check_buffup() then return true end
	return false
end
function check_arts()
	if (player.sub_job == 'SCH' and not arts_active()) and (buffup ~= '' or (not areas.Cities:contains(world.area) and ((state.AutoArts.value and player.in_combat) or state.AutoBuffMode.value))) then
	
		local abil_recasts = windower.ffxi.get_ability_recasts()

		if abil_recasts[232] < latency then
			windower.chat.input('/ja "Dark Arts" <me>')
			tickdelay = os.clock() + 1
			return true
		end

	end
	
	return false
end
function handle_elemental(cmdParams)
	-- cmdParams[1] == 'elemental'
    -- cmdParams[2] == ability to use

    if not cmdParams[2] then
        add_to_chat(123,'Error: No elemental command given.')
        return
    end
    local command = cmdParams[2]:lower()

    if command == 'nuke' then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		
		if state.ElementalMode.value == 'Light' then
			if spell_recasts[29] < spell_latency and actual_cost(get_spell_table_by_name('Banish II')) < player.mp then
				windower.chat.input('/ma "Banish II" <t>')
			elseif spell_recasts[28] < spell_latency and actual_cost(get_spell_table_by_name('Banish')) < player.mp then
				windower.chat.input('/ma "Banish" <t>')
			else
				add_to_chat(123,'Abort: Banishes on cooldown or not enough MP.')
			end

		elseif state.ElementalMode.value == 'Dark' then
			if spell_recasts[219] < spell_latency and actual_cost(get_spell_table_by_name('Comet')) < player.mp then
				windower.chat.input('/ma "Comet" <t>')
			else
				add_to_chat(123,'Abort: Comet on cooldown or not enough MP.')
			end

		else
			if player.job_points[(res.jobs[player.main_job_id].ens):lower()].jp_spent > 99 and spell_recasts[get_spell_table_by_name(elements.nuke[state.ElementalMode.value]..' VI').id] < spell_latency and actual_cost(get_spell_table_by_name(elements.nuke[state.ElementalMode.value]..' VI')) < player.mp then
				windower.chat.input('/ma "'..elements.nuke[state.ElementalMode.value]..' VI" <t>')
			else
				local tiers = {' V',' IV',' III',' II',''}
				for k in ipairs(tiers) do
					if spell_recasts[get_spell_table_by_name(elements.nuke[state.ElementalMode.value]..''..tiers[k]..'').id] < spell_latency and actual_cost(get_spell_table_by_name(elements.nuke[state.ElementalMode.value]..''..tiers[k]..'')) < player.mp then
						windower.chat.input('/ma "'..elements.nuke[state.ElementalMode.value]..''..tiers[k]..'" <t>')
						return
					end
				end
				add_to_chat(123,'Abort: All '..elements.nuke[state.ElementalMode.value]..' nukes on cooldown or or not enough MP.')
			end
		end
			
	elseif command == 'ninjutsu' then
		windower.chat.input('/ma "'..elements.ninnuke[state.ElementalMode.value]..': Ni" <t>')
			
	elseif command == 'smallnuke' then
		local spell_recasts = windower.ffxi.get_spell_recasts()
	
		local tiers = {' II',''}
		for k in ipairs(tiers) do
			if spell_recasts[get_spell_table_by_name(elements.nuke[state.ElementalMode.value]..''..tiers[k]..'').id] < spell_latency and actual_cost(get_spell_table_by_name(elements.nuke[state.ElementalMode.value]..''..tiers[k]..'')) < player.mp then
				windower.chat.input('/ma "'..elements.nuke[state.ElementalMode.value]..''..tiers[k]..'" <t>')
				return
			end
		end
		add_to_chat(123,'Abort: All '..elements.nuke[state.ElementalMode.value]..' nukes on cooldown or or not enough MP.')
		
	elseif command:contains('tier') then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		local tierlist = {['tier1']='',['tier2']=' II',['tier3']=' III',['tier4']=' IV',['tier5']=' V',['tier6']=' VI'}
		
		windower.chat.input('/ma "'..elements.nuke[state.ElementalMode.value]..tierlist[command]..'" <t>')
		
	elseif command:contains('aga') or command == 'aja' then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		local tierkey = {'aja','aga3','aga2','aga1'}
		local tierlist = {['aja']='ja',['aga3']='ga III',['aga2']='ga II',['aga1']='ga',}
		if command == 'aga' then
			for i in ipairs(tierkey) do
				if spell_recasts[get_spell_table_by_name(elements.nukega[state.ElementalMode.value]..''..tierlist[tierkey[i]]..'').id] < spell_latency and actual_cost(get_spell_table_by_name(elements.nukega[state.ElementalMode.value]..''..tierlist[tierkey[i]]..'')) < player.mp then
					windower.chat.input('/ma "'..elements.nukega[state.ElementalMode.value]..''..tierlist[tierkey[i]]..'" <t>')
					return
				end
			end
		else
			windower.chat.input('/ma "'..elements.nukega[state.ElementalMode.value]..tierlist[command]..'" <t>')
		end

	elseif command == 'ara' then
		windower.chat.input('/ma "'..elements.nukera[state.ElementalMode.value]..'ra" <t>')
		
	elseif command == 'helix' then
		windower.chat.input('/ma "'..elements.helix[state.ElementalMode.value]..'helix" <t>')
	
	elseif command == 'ancientmagic' then
		windower.chat.input('/ma "'..elements.ancient[state.ElementalMode.value]..'" <t>')
		
	elseif command == 'ancientmagic2' then
		windower.chat.input('/ma "'..elements.ancient[state.ElementalMode.value]..' II" <t>')
		
	elseif command == 'enfeeble' then
		windower.chat.input('/ma "'..elements.enfeeble[state.ElementalMode.value]..'" <t>')
	
	elseif command == 'bardsong' then
		windower.chat.input('/ma "'..elements.threnody[state.ElementalMode.value]..' Threnody" <t>')
		
	elseif command == 'spikes' then
		windower.chat.input('/ma "'..elements.spikes[state.ElementalMode.value]..' Spikes" <me>')
		
	elseif command == 'enspell' then
			windower.chat.input('/ma "En'..elements.enspell[state.ElementalMode.value]..'" <me>')
	
	--Leave out target, let shortcuts auto-determine it.
	elseif command == 'weather' then
		if player.sub_job == 'SCH' then
			windower.chat.input('/ma "Phalanx" <me>')
		else
			local spell_recasts = windower.ffxi.get_spell_recasts()
			if (player.target.type == 'SELF' or not player.target.in_party) and buffactive[elements.storm_of[state.ElementalMode.value]] and not buffactive['Klimaform'] and spell_recasts[287] < spell_latency then
				windower.chat.input('/ma "Klimaform" <me>')
			else
				windower.chat.input('/ma "'..elements.storm_of[state.ElementalMode.value]..'"')
			end
		end
		
    else
        add_to_chat(123,'Unrecognized elemental command.')
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
buff_spell_lists = {
	Auto = {--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
		-- {Name='Reraise',	Buff='Reraise',		SpellID=113,	When='Always'},
		-- {Name='Haste',		Buff='Haste',		SpellID=57,		When='Always'},
		-- {Name='Refresh',	Buff='Refresh',		SpellID=109,	When='Always'},
		-- {Name='Stoneskin',	Buff='Stoneskin',	SpellID=54,		When='Always'},
		{Name='Klimaform',	Buff='Klimaform',	SpellID=287,	When='Always'},
		{Name='Thunderstorm',	Buff='Thunderstorm',	SpellID=117,	When='Always'},
		{Name='Refresh',	Buff='Refresh',		SpellID=109,	When='Always'},
	},
	
	Default = {
		{Name='Reraise',	Buff='Reraise',		SpellID=113,	Reapply=false},
		{Name='Haste',		Buff='Haste',		SpellID=57,		Reapply=false},
		{Name='Refresh',	Buff='Refresh',		SpellID=109,	Reapply=false},
		{Name='Aquaveil',	Buff='Aquaveil',	SpellID=55,		Reapply=false},
		{Name='Stoneskin',	Buff='Stoneskin',	SpellID=54,		Reapply=false},
		{Name='Klimaform',	Buff='Klimaform',	SpellID=287,	Reapply=true},
		{Name='Blink',		Buff='Blink',		SpellID=53,		Reapply=false},
		{Name='Regen',		Buff='Regen',		SpellID=108,	Reapply=false},
		{Name='Phalanx',	Buff='Phalanx',		SpellID=106,	Reapply=false},
	},
}
----------------------------------
--	Command Section for Warping	--
----------------------------------
function user_job_self_command(commandArgs, eventArgs) 
	include('commands')
end