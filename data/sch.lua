--[[
	Scholar: v2.0.1
	Creator: Enuri
	Server:	 Asura
	Funcitons: Allows the user to create Skillchains off a single button push
				The user will need to create a few macros in game for skillchains
			IE	/console gs c elemental skillchain1
			IE	/console gs c elemental skillchain2		
			IE	/console gs c elemental skillchain3		
			IE	/console gs c elemental skillchain6 	This one will do 6 step SC
		if the user wishs to set a specific element for SC you can create custom macros
			/console gs c set elementalmode ElementName 	
				the following is a list of accecptable elements
					[*]fire
					[*]ice
					[*]wind
					[*]lightning
					[*]water
					[*]earth 
					[*]light
					[*]dark
		AutofoodMode is a toggle that will auto eat food 
		AutoBuffMode is a toggle that will start auto buffing
		CapacityMode toggles whether to wear capacity points mantle or not
		mainWeapon gives the user the ability to quickly swap between weapons is not used
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
	send_command('bind !f9 gs c cycle Empty')
	send_command('bind !f10 gs c cycle ElementalMode')
	send_command('bind !f11 gs c toggle AutoFoodMode')
	send_command('bind !f12 gs c toggle AutoBuffMode')
	send_command('bind != gs c toggle CapacityMode')
	send_command('bind !` input /ma "Stun" <t>')
	send_command('bind !q input /ma "Aspir II" <t>')
--[[ CtrlF9-CtrlF12 keybinds ]]
	send_command('bind ^f9 gs c cycle Empty')
	send_command('bind ^f10 gs c cycle Empty')
	send_command('bind ^f11 gs c cycle Empty')
	send_command('bind ^f12 gs c cycle Empty')
	send_command('bind ^` input /ma "Light Arts" <me>')
	send_command('bind ^q input /ma "Dark Arts" <me>')
--[[ WindowsF9-WindowsF12 keybinds ]]
	send_command('bind @f9 gs c set mainWeapon Empty')
	send_command('bind @f10 gs c set mainWeapon Empty')
	send_command('bind @f11 gs c set mainWeapon Empty')
	send_command('bind @f12 gs c set mainWeapon Empty')
	send_command('bind @` input /ma "Accession" <me>')
	send_command('bind @q input /ma "SpellName" <t>')
end
--------------------------
--  Job Setup Section   --
--------------------------
function job_setup()
	autows = 'Realmrazer'
	autofood = 'Pear Crepe'
	init_job_states({
		"AutoFoodMode","AutoNukeMode","AutoStunMode","AutoBuffMode",
	},{
		"CastingMode"
	})
	update_active_strategems()
	
	state.RecoverMode = M('35%', '60%', 'Always', 'Never')

--[[ Other states]]
  	state.Buff['Sublimation: Activated'] = buffactive['Sublimation: Activated'] or false
 --[[ Addendum Nukes ]]
    addendumNukes = S{
      'Stone IV', 'Water IV', 'Aero IV',
      'Fire IV', 'Blizzard IV', 'Thunder IV',
      'Stone V', 'Water V', 'Aero V', 'Fire V',
      'Blizzard V', 'Thunder V'
    }
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
	if state.Buff['Sublimation: Activated'] then
		if state.IdleMode.value == 'Normal' then
			idleSet = set_combine(idleSet, sets.buff.FullSublimation)
		elseif state.IdleMode.value == 'PDT' then
			idleSet = set_combine(idleSet, sets.buff.PDTSublimation)
		end
	end
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
	
	return get_combat_weapon
end 
function job_state_change(cmdParams, eventArgs) 

end 
function update_melee_group()

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
		elseif addendumNukes:contains(spell.english) then
			return 'addendumNukes'
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
    
end
-----------------------
-- Pre-cast section  --
-----------------------
function job_filter_precast(spell, spellMap, eventArgs)
	
end
function job_precast(spell, action, spellMap, eventArgs)
	
end 
function job_post_precast(eventArgs, spell, action, spellMap)
	
end 
-----------------------
--  Mid-cast Section --
-----------------------
function job_midcast(spell, action, spellMap, eventArgs)
	
end
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Magic' then
		apply_grimoire_bonuses(spell, action, spellMap, eventArgs)
	end
	if spell.skill == 'Enfeebling Magic' then
		if (state.Buff['Light Arts'] or state.Buff['Addendum: White']) and sets.buff['Light Arts'] then
			equip(sets.buff['Light Arts'])
		elseif (state.Buff['Dark Arts'] or state.Buff['Addendum: Black']) and sets.buff['Dark Arts'] then
			equip(sets.buff['Dark Arts'])
		end
	elseif default_spell_map == 'ElementalEnfeeble' and (state.Buff['Dark Arts']  or state.Buff['Addendum: Black']) and sets.buff['Dark Arts'] then
		equip(sets.buff['Dark Arts'])
    elseif spell.skill == 'Elemental Magic' and spell.english ~= 'Impact' then
		if state.MagicBurstMode.value ~= 'Off' then
			if state.CastingMode.value:contains('Resistant') and sets.ResistantMagicBurst then
				equip(sets.ResistantMagicBurst)
			else
				equip(sets.MagicBurst)
			end
		end
		if not state.CastingMode.value:contains('Resistant') then
			if spell.element == world.weather_element or spell.element == world.day_element then
				-- if item_available('Twilight Cape') and not LowTierNukes:contains(spell.english) and not state.Capacity.value then
					-- sets.TwilightCape = {back="Twilight Cape"}
					-- equip(sets.TwilightCape)
				-- end
				if spell.element == world.day_element and state.CastingMode.value == 'Fodder' then
					if item_available('Zodiac Ring') then
						sets.ZodiacRing = {ring2="Zodiac Ring"}
						equip(sets.ZodiacRing)
					end
				end
				if state.Buff.Klimaform and spell.element == world.weather_element then
					equip(sets.buff['Klimaform'])
				end
			end
			if spell.element and sets.element[spell.element] then
				equip(sets.element[spell.element])
			end
			if state.Buff.Ebullience then
				equip(sets.buff['Ebullience'])
			end
		end
		
        if state.Buff.Immanence then
            equip(sets.buff['Immanence'])
        end
		
		if state.RecoverMode.value ~= 'Never' and (state.RecoverMode.value == 'Always' or tonumber(state.RecoverMode.value:sub(1, -2)) > player.mpp) then
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
	if spell.skill == 'Elemental Magic' then
		if spell.element == world.day_element or spell.element == world.weather_element then
			equip(sets.midcast['Elemental Magic'], {waist="Hachirin-no-Obi"})
		end
	end
end 
-------------------------
--  after-cast Section --
-------------------------
function job_aftercast(spell, action, spellMap, eventArgs)
	if spell.name == "Stratagems" then
		stratrecast = windower.ffxi.get_ability_recasts()[spell.recast_id]
		stratsremaining = math.floor(((165 - stratrecast) / 33) - 1)
		add_to_chat(2,'Remaining Stratagems: '..stratsremaining..'')
	end
end 
function job_post_aftercast(spell, action, spellMap, eventArgs)
	if spell.english == "Sleep II" then 
		send_command('timers create "Sleep II" 60 down')
	elseif spell.english == "Sleep" then 
		send_command('timers create "Sleep" 30 down')
	end
	get_current_strategem_count()
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
	if buff == "Sublimation: Activated" then
		handle_equipping_gear(player.status)
	end
end 
-------------------------------
--  Section for Stratagems   --
-------------------------------
function update_active_strategems()
	state.Buff['Ebullience'] = buffactive['Ebullience'] or false
	state.Buff['Rapture'] = buffactive['Rapture'] or false
	state.Buff['Perpetuance'] = buffactive['Perpetuance'] or false
	state.Buff['Immanence'] = buffactive['Immanence'] or false
	state.Buff['Penury'] = buffactive['Penury'] or false
	state.Buff['Parsimony'] = buffactive['Parsimony'] or false
	state.Buff['Celerity'] = buffactive['Celerity'] or false
	state.Buff['Alacrity'] = buffactive['Alacrity'] or false
	state.Buff['Klimaform'] = buffactive['Klimaform'] or false
end
--------------------------------------------------
-- 	Equip sets appropriate to the active buffs, --
--	relative to the spell being cast			--
--------------------------------------------------
function apply_grimoire_bonuses(spell, action, spellMap)
    if state.Buff.Perpetuance and spell.type =='WhiteMagic' and spell.skill == 'Enhancing Magic' then
        equip(sets.buff['Perpetuance'])
    end
    if state.Buff.Rapture and (spellMap == 'Cure' or spellMap == 'Curaga') then
        equip(sets.buff['Rapture'])
    end
    if spell.skill == 'Elemental Magic' and spellMap ~= 'ElementalEnfeeble' then
        if state.Buff.Ebullience and spell.english ~= 'Impact' then
            equip(sets.buff['Ebullience'])
        end
        if state.Buff.Immanence then
            equip(sets.buff['Immanence'])
        end
        if state.Buff.Klimaform and spell.element == world.weather_element then
            equip(sets.buff['Klimaform'])
        end
    end
    if state.Buff.Penury then equip(sets.buff['Penury']) end
    if state.Buff.Parsimony then equip(sets.buff['Parsimony']) end
    if state.Buff.Celerity then equip(sets.buff['Celerity']) end
    if state.Buff.Alacrity then equip(sets.buff['Alacrity']) end
end
--------------------------------------
-- Handleing of strategems 			--
-- Format: gs c scholar <strategem>	--
--------------------------------------
function handle_strategems(cmdParams)
-- cmdParams[1] == 'scholar'
-- cmdParams[2] == strategem to use
    if not cmdParams[2] then
        add_to_chat(123,'Error: No strategem command given.')
        return
    end
    local strategem = cmdParams[2]:lower()
    if strategem == 'light' then
        if buffactive['light arts'] then
            send_command('input /ja "Addendum: White" <me>')
        elseif buffactive['addendum: white'] then
            add_to_chat(122,'Error: Addendum: White is already active.')
        else
            send_command('input /ja "Light Arts" <me>')
        end
		elseif strategem == 'dark' then
			if buffactive['dark arts'] then
            send_command('input /ja "Addendum: Black" <me>')
		elseif buffactive['addendum: black'] then
            add_to_chat(122,'Error: Addendum: Black is already active.')
    else
        send_command('input /ja "Dark Arts" <me>')
    end
    elseif buffactive['light arts'] or buffactive['addendum: white'] then
		if strategem == 'cost' then
			send_command('input /ja Penury <me>')
		elseif strategem == 'speed' then
			send_command('input /ja Celerity <me>')
		elseif strategem == 'aoe' then
			send_command('input /ja Accession <me>')
		elseif strategem == 'power' then
			send_command('input /ja Rapture <me>')
		elseif strategem == 'duration' then
			send_command('input /ja Perpetuance <me>')
		elseif strategem == 'accuracy' then
			send_command('input /ja Altruism <me>')
		elseif strategem == 'enmity' then
			send_command('input /ja Tranquility <me>')
		elseif strategem == 'skillchain' then
			add_to_chat(122,'Error: Light Arts does not have a skillchain strategem.')
		elseif strategem == 'addendum' then
			send_command('input /ja "Addendum: White" <me>')
		else
			add_to_chat(123,'Error: Unknown strategem ['..strategem..']')
    end
    elseif buffactive['dark arts']  or buffactive['addendum: black'] then
		if strategem == 'cost' then
			send_command('input /ja Parsimony <me>')
		elseif strategem == 'speed' then
			send_command('input /ja Alacrity <me>')
		elseif strategem == 'aoe' then
			send_command('input /ja Manifestation <me>')
		elseif strategem == 'power' then
			send_command('input /ja Ebullience <me>')
		elseif strategem == 'duration' then
			add_to_chat(122,'Error: Dark Arts does not have a duration strategem.')
		elseif strategem == 'accuracy' then
			send_command('input /ja Focalization <me>')
		elseif strategem == 'enmity' then
			send_command('input /ja Equanimity <me>')
		elseif strategem == 'skillchain' then
			send_command('input /ja Immanence <me>')
		elseif strategem == 'addendum' then
			send_command('input /ja "Addendum: Black" <me>')
		else
			add_to_chat(123,'Error: Unknown strategem ['..strategem..']')
		end
		else
			add_to_chat(123,'No arts has been activated yet.')
    end
end
-- Handling Elemental spells within Gearswap.
-- Format: gs c elemental <nuke, helix, skillchain1, skillchain2, weather>
function handle_elemental(cmdParams)
    -- cmdParams[1] == 'elemental'
    -- cmdParams[2] == ability to use

    if not cmdParams[2] then
        add_to_chat(123,'Error: No elemental command given.')
        return
    end
    local command = cmdParams[2]:lower()

		
	local immactive = 0
		
	if state.Buff['Immanence'] then
		immactive = 1
	end
	
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

		else
			if state.Buff['Addendum: Black'] and spell_recasts[get_spell_table_by_name(elements.nuke[state.ElementalMode.value]..' V').id] < spell_latency and actual_cost(get_spell_table_by_name(elements.nuke[state.ElementalMode.value]..' V')) < player.mp then
				windower.chat.input('/ma "'..elements.nuke[state.ElementalMode.value]..' V" <t>')
			elseif state.Buff['Addendum: Black'] and spell_recasts[get_spell_table_by_name(elements.nuke[state.ElementalMode.value]..' IV').id] < spell_latency and actual_cost(get_spell_table_by_name(elements.nuke[state.ElementalMode.value]..' IV')) < player.mp then
				windower.chat.input('/ma "'..elements.nuke[state.ElementalMode.value]..' IV" <t>')
			else
				local tiers = {' III',' II',''}
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
		
	elseif command == 'ara' then
		windower.chat.input('/ma "'..elements.nukera[state.ElementalMode.value]..'ra" <t>')
		
	elseif command == 'aga' then
		windower.chat.input('/ma "'..elements.nukega[state.ElementalMode.value]..'ga" <t>')
		
	elseif command == 'helix' then
		if player.job_points[(res.jobs[player.main_job_id].ens):lower()].jp_spent > 1199 then
			windower.chat.input('/ma "'..elements.helix[state.ElementalMode.value]..'helix II" <t>')
		else
			windower.chat.input('/ma "'..elements.helix[state.ElementalMode.value]..'helix" <t>')
		end
		
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
		local spell_recasts = windower.ffxi.get_spell_recasts()
		
		if (player.target.type == 'SELF' or not player.target.in_party) and buffactive[elements.storm_of[state.ElementalMode.value]] and not buffactive['Klimaform'] and spell_recasts[287] < spell_latency then
			windower.chat.input('/ma "Klimaform" <me>')
		elseif player.job_points[(res.jobs[player.main_job_id].ens):lower()].jp_spent > 99 then
			windower.chat.input('/ma "'..elements.storm_of[state.ElementalMode.value]..' II"')
		else
			windower.chat.input('/ma "'..elements.storm_of[state.ElementalMode.value]..'"')
		end
	
	elseif command == 'skillchain1' then
		if player.target.type ~= "MONSTER" then
			add_to_chat(123,'Abort: You are not targeting a monster.')
		elseif buffactive.silence or buffactive.mute or buffactive.paralysis then
			add_to_chat(123,'You are silenced, muted, or paralyzed, cancelling skillchain.')
		elseif (get_current_strategem_count() + immactive) < 2 then
			add_to_chat(123,'Abort: You have less than two stratagems available.')
		elseif not (state.Buff['Dark Arts']  or state.Buff['Addendum: Black']) then
			add_to_chat(123,'Can\'t use elemental skillchain commands without Dark Arts - Activating.')
			windower.chat.input('/ja "Dark Arts" <me>')
		elseif state.ElementalMode.value ~= nil then
			if not buffactive['Immanence'] then windower.chat.input('/ja "Immanence" <me>') end
			
			if state.ElementalMode.value == 'Fire' then
				windower.chat.input('/p '..auto_translate('Liquefaction')..' -<t>- MB: '..auto_translate('Fire')..' <scall21> OPEN!')
				windower.chat.input:schedule(1,'/ma "Stone" <t>')
				windower.chat.input:schedule(5,'/ja "Immanence" <me>')
				windower.chat.input:schedule(6,'/p '..auto_translate('Liquefaction')..' -<t>- MB: '..auto_translate('Fire')..' <scall21> CLOSE!')
				windower.chat.input:schedule(6,'/ma "Fire" <t>')
			elseif state.ElementalMode.value == 'Wind' then
				windower.chat.input('/p '..auto_translate('Detonation')..' -<t>- MB: '..auto_translate('wind')..' <scall21> OPEN!')
				windower.chat.input:schedule(1,'/ma "Stone" <t>')
				windower.chat.input:schedule(5,'/ja "Immanence" <me>')
				windower.chat.input:schedule(6,'/p '..auto_translate('Detonation')..' -<t>- MB: '..auto_translate('wind')..' <scall21> CLOSE!')
				windower.chat.input:schedule(6,'/ma "Aero" <t>')
			elseif state.ElementalMode.value == 'Lightning' then
				windower.chat.input('/p '..auto_translate('Impaction')..' -<t>- MB: '..auto_translate('Thunder')..' <scall21> OPEN!')
				windower.chat.input:schedule(1,'/ma "Water" <t>')
				windower.chat.input:schedule(5,'/ja "Immanence" <me>')
				windower.chat.input:schedule(6,'/p '..auto_translate('Impaction')..' -<t>- MB: '..auto_translate('Thunder')..' <scall21> CLOSE!')
				windower.chat.input:schedule(6,'/ma "Thunder" <t>')
			elseif state.ElementalMode.value == 'Light' then
				windower.chat.input('/p '..auto_translate('Transfixion')..' -<t>- MB: '..auto_translate('Light')..' <scall21> OPEN!')
				windower.chat.input:schedule(1,'/ma "Noctohelix" <t>')
				windower.chat.input:schedule(6,'/ja "Immanence" <me>')
				windower.chat.input:schedule(7,'/p '..auto_translate('Transfixion')..' -<t>- MB: '..auto_translate('Light')..' <scall21> CLOSE!')
				windower.chat.input:schedule(7,'/ma "Luminohelix" <t>')
			elseif state.ElementalMode.value == 'Earth' then
				windower.chat.input('/p '..auto_translate('Scission')..' -<t>- MB: '..auto_translate('earth')..' <scall21> OPEN!')
				windower.chat.input:schedule(1,'/ma "Fire" <t>')
				windower.chat.input:schedule(5,'/ja "Immanence" <me>')
				windower.chat.input:schedule(6,'/p '..auto_translate('Scission')..' -<t>- MB: '..auto_translate('earth')..' <scall21> CLOSE!')
				windower.chat.input:schedule(6,'/ma "Stone" <t>')
			elseif state.ElementalMode.value == 'Ice' then
				windower.chat.input('/p '..auto_translate('Induration')..' -<t>- MB: '..auto_translate('ice')..' <scall21> OPEN!')
				windower.chat.input:schedule(1,'/ma "Water" <t>')
				windower.chat.input:schedule(5,'/ja "Immanence" <me>')
				windower.chat.input:schedule(6,'/p '..auto_translate('Induration')..' -<t>- MB: '..auto_translate('ice')..' <scall21> CLOSE!')
				windower.chat.input:schedule(6,'/ma "Blizzard" <t>')
			elseif state.ElementalMode.value == 'Water' then
				windower.chat.input('/p '..auto_translate('Reverberation')..' -<t>- MB: '..auto_translate('Water')..' <scall21> OPEN!')
				windower.chat.input:schedule(1,'/ma "Stone" <t>')
				windower.chat.input:schedule(5,'/ja "Immanence" <me>')
				windower.chat.input:schedule(6,'/p '..auto_translate('Reverberation')..' -<t>- MB: '..auto_translate('Water')..' <scall21> CLOSE!')
				windower.chat.input:schedule(6,'/ma "Water" <t>')
			elseif state.ElementalMode.value == 'Dark' then
				windower.chat.input('/p '..auto_translate('Compression')..' -<t>- MB: '..auto_translate('Darkness')..' <scall21> OPEN!')
				windower.chat.input:schedule(1,'/ma "Blizzard" <t>')
				windower.chat.input:schedule(5,'/ja "Immanence" <me>')
				windower.chat.input:schedule(6,'/p '..auto_translate('Compression')..' -<t>- MB: '..auto_translate('Darkness')..' <scall21> CLOSE!')
				windower.chat.input:schedule(6,'/ma "Noctohelix" <t>')
			else
				add_to_chat(123,'Abort: '..state.ElementalMode.value..' is not an Elemental Mode with a skillchain1 command!')
			end
		end
	
	elseif command == 'skillchain2' then
		if player.target.type ~= "MONSTER" then
			add_to_chat(123,'Abort: You are not targeting a monster.')
		elseif buffactive.silence or buffactive.mute or buffactive.paralysis then
			add_to_chat(123,'You are silenced, muted, or paralyzed, cancelling skillchain.')
		elseif (get_current_strategem_count() + immactive) < 2 then
			add_to_chat(123,'Abort: You have less than two stratagems available.')
		elseif not (state.Buff['Dark Arts']  or state.Buff['Addendum: Black']) then
			add_to_chat(123,'Can\'t use elemental skillchain commands without Dark Arts - Activating.')
			windower.chat.input('/ja "Dark Arts" <me>')
			
			
		elseif state.ElementalMode.value ~= nil then
			if not buffactive['Immanence'] then windower.chat.input('/ja "Immanence" <me>') end
			
			if state.ElementalMode.value == 'Fire' or state.ElementalMode.value == 'Light' then
				windower.chat.input('/p '..auto_translate('Fusion')..' -<t>- MB: '..auto_translate('Fire')..' '..auto_translate('Light')..' <scall21> OPEN!')
				windower.chat.input:schedule(1,'/ma "Fire" <t>')
				windower.chat.input:schedule(5,'/ja "Immanence" <me>')
				windower.chat.input:schedule(6,'/p '..auto_translate('Fusion')..' -<t>- MB: '..auto_translate('Fire')..' '..auto_translate('Light')..' <scall21> CLOSE!')
				windower.chat.input:schedule(6,'/ma "Thunder" <t>')
			elseif state.ElementalMode.value == 'Wind' or state.ElementalMode.value == 'Lightning' then
				windower.chat.input('/p '..auto_translate('Fragmentation')..' -<t>- MB: '..auto_translate('wind')..' '..auto_translate('Thunder')..' <scall21> OPEN!')
				windower.chat.input:schedule(1,'/ma "Blizzard" <t>')
				windower.chat.input:schedule(5,'/ja "Immanence" <me>')
				windower.chat.input:schedule(6,'/p '..auto_translate('Fragmentation')..' -<t>- MB: '..auto_translate('wind')..' '..auto_translate('Thunder')..' <scall21> CLOSE!')
				windower.chat.input:schedule(6,'/ma "Water" <t>')
			elseif state.ElementalMode.value == 'Earth' or state.ElementalMode.value == 'Dark' then
				windower.chat.input('/p '..auto_translate('Gravitation')..' -<t>- MB: '..auto_translate('earth')..' '..auto_translate('Darkness')..' <scall21> OPEN!')
				windower.chat.input:schedule(1,'/ma "Aero" <t>')
				windower.chat.input:schedule(5,'/ja "Immanence" <me>')
				windower.chat.input:schedule(6,'/p '..auto_translate('Gravitation')..' -<t>- MB: '..auto_translate('earth')..' '..auto_translate('Darkness')..' <scall21> CLOSE!')
				windower.chat.input:schedule(6,'/ma "Noctohelix" <t>')
			elseif state.ElementalMode.value == 'Ice' or state.ElementalMode.value == 'Water' then
				windower.chat.input('/p '..auto_translate('Distortion')..' -<t>- MB: '..auto_translate('ice')..' '..auto_translate('Water')..' <scall21> OPEN!')
				windower.chat.input:schedule(1,'/ma "Luminohelix" <t>')
				windower.chat.input:schedule(7,'/ja "Immanence" <me>')
				windower.chat.input:schedule(8,'/p '..auto_translate('Distortion')..' -<t>- MB: '..auto_translate('ice')..' '..auto_translate('Water')..' <scall21> CLOSE!')
				windower.chat.input:schedule(8,'/ma "Stone" <t>')
			else
				add_to_chat(123,'Abort: '..state.ElementalMode.value..' is not an Elemental Mode with a skillchain1 command!')
			end
			

		end
		
	elseif command == 'skillchain3' then
		if player.target.type ~= "MONSTER" then
			add_to_chat(123,'Abort: You are not targeting a monster.')
		elseif buffactive.silence or buffactive.mute or buffactive.paralysis then
			add_to_chat(123,'You are silenced, muted, or paralyzed, cancelling skillchain.')
		elseif (get_current_strategem_count() + immactive) < 3 then
			add_to_chat(123,'Abort: You have less than three stratagems available.')
		elseif not (state.Buff['Dark Arts']  or state.Buff['Addendum: Black']) then
			add_to_chat(123,'Can\'t use elemental skillchain commands without Dark Arts - Activating.')
			windower.chat.input('/ja "Dark Arts" <me>')
		elseif state.ElementalMode.value == 'Fire' then
			windower.chat.input('/p Starting 3-Step '..auto_translate('Skillchain')..' -<t>-')
			if not buffactive['Immanence'] then windower.chat.input('/ja "Immanence" <me>') end
			windower.chat.input('/p '..auto_translate('Liquefaction')..' -<t>- MB: '..auto_translate('Fire')..' <scall21> OPEN!')
			windower.chat.input:schedule(1,'/ma "Stone" <t>')
			windower.chat.input:schedule(5,'/ja "Immanence" <me>')
			windower.chat.input:schedule(6,'/p '..auto_translate('Liquefaction')..' -<t>- MB: '..auto_translate('Fire')..' <scall21> CLOSE!')
			windower.chat.input:schedule(6,'/ma "Fire" <t>')
			windower.chat.input:schedule(13,'/ja "Immanence" <me>')
			windower.chat.input:schedule(14,'/p '..auto_translate('Fusion')..' -<t>- MB: '..auto_translate('Fire')..' '..auto_translate('Light')..' <scall21> CLOSE!')
			windower.chat.input:schedule(14,'/ma "Thunder" <t>')
		else
			add_to_chat(123,'Abort: Fire is the only element with a consecutive 3-step skillchain.')
		end
	
	elseif command == 'skillchain4' then
		if player.target.type ~= "MONSTER" then
			add_to_chat(123,'Abort: You are not targeting a monster.')
		elseif buffactive.silence or buffactive.mute or buffactive.paralysis then
			add_to_chat(123,'You are silenced, muted, or paralyzed, cancelling skillchain.')
		elseif (get_current_strategem_count() + immactive) < 4 then
			add_to_chat(123,'Abort: You have less than four stratagems available.')
		elseif not (state.Buff['Dark Arts']  or state.Buff['Addendum: Black']) then
			add_to_chat(123,'Can\'t use elemental skillchain commands without Dark Arts - Activating.')
			windower.chat.input('/ja "Dark Arts" <me>')
		else 
			windower.chat.input('/p Starting 4-Step '..auto_translate('Skillchain')..' -<t>-')
			if not buffactive['Immanence'] then windower.chat.input('/ja "Immanence" <me>') end
			windower.chat.input:schedule(1,'/ma "Aero" <t>')
			windower.chat.input:schedule(5,'/ja "Immanence" <me>')
			windower.chat.input:schedule(6,'/ma "Stone" <t>')
			windower.chat.input:schedule(10,'/ja "Immanence" <me>')
			windower.chat.input:schedule(11,'/ma "Water" <t>')
			windower.chat.input:schedule(15,'/ja "Immanence" <me>')
			windower.chat.input:schedule(16,'/ma "Thunder" <t>')
		end
		
	elseif command == 'skillchain6' then
		if player.target.type ~= "MONSTER" then
			add_to_chat(123,'Abort: You are not targeting a monster.')
		elseif buffactive.silence or buffactive.mute or buffactive.paralysis then
			add_to_chat(123,'You are silenced, muted, or paralyzed, cancelling skillchain.')
		elseif get_current_strategem_count() < 5 then
			add_to_chat(123,'Abort: You have less than five stratagems available.')
		elseif not (state.Buff['Dark Arts']  or state.Buff['Addendum: Black']) then
			add_to_chat(123,'Can\'t use elemental skillchain commands without Dark Arts - Activating.')
			windower.chat.input('/ja "Dark Arts" <me>')
		elseif not buffactive['Immanence'] then
			add_to_chat(123,'Immanence not active, wait for stratagem cooldown. - Activating Immanence.')
			windower.chat.input('/ja "Immanence" <me>')
		else
			windower.chat.input('/p Starting 6-Step '..auto_translate('Skillchain')..' -<t>-')
			windower.chat.input('/ma "Aero" <t>')
			windower.chat.input:schedule(4,'/ja "Immanence" <me>')
			windower.chat.input:schedule(5,'/ma "Stone" <t>')
			windower.chat.input:schedule(9,'/ja "Immanence" <me>')
			windower.chat.input:schedule(10,'/ma "Water" <t>')
			windower.chat.input:schedule(14,'/ja "Immanence" <me>')
			windower.chat.input:schedule(15,'/ma "Thunder" <t>')
			windower.chat.input:schedule(19,'/ja "Immanence" <me>')
			windower.chat.input:schedule(20,'/ma "Fire" <t>')
			windower.chat.input:schedule(24,'/ja "Immanence" <me>')
			windower.chat.input:schedule(25,'/ma "Thunder" <t>')
		end
	
	elseif command == 'wsskillchain' then
		if player.target.type ~= "MONSTER" then
			add_to_chat(123,'Abort: You are not targeting a monster.')
		elseif player.tp < 1000 then
			add_to_chat(123,'Abort: You don\'t have enough TP for this skillchain.')
		elseif buffactive.silence or buffactive.mute or buffactive.paralysis then
			add_to_chat(123,'You are silenced, muted, or paralyzed, cancelling skillchain.')
		elseif (get_current_strategem_count() + immactive) < 1 then
			add_to_chat(123,'Abort: You have less than one stratagems available.')
		elseif not (state.Buff['Dark Arts']  or state.Buff['Addendum: Black']) then
			add_to_chat(123,'Can\'t use elemental skillchain commands without Dark Arts - Activating.')
			windower.chat.input('/ja "Dark Arts" <me>')
		elseif state.ElementalMode.value == 'Fire' then
			windower.chat.input('/p '..auto_translate('Liquefaction')..' -<t>- MB: '..auto_translate('Fire')..' <scall21> OPEN!')
			windower.chat.input('/ws "Rock Crusher" <t>')
			windower.chat.input:schedule(5,'/ja "Immanence" <me>')
			windower.chat.input:schedule(6,'/p '..auto_translate('Liquefaction')..' -<t>- MB: '..auto_translate('Fire')..' <scall21> CLOSE!')
			windower.chat.input:schedule(6,'/ma "Fire" <t>')
		elseif state.ElementalMode.value == 'Wind' then
			windower.chat.input('/p '..auto_translate('Detonation')..' -<t>- MB: '..auto_translate('wind')..' <scall21> OPEN!')
			windower.chat.input('/ws "Rock Crusher" <t>')
			windower.chat.input:schedule(5,'/ja "Immanence" <me>')
			windower.chat.input:schedule(6,'/p '..auto_translate('Detonation')..' -<t>- MB: '..auto_translate('wind')..' <scall21> CLOSE!')
			windower.chat.input:schedule(6,'/ma "Aero" <t>')
		elseif state.ElementalMode.value == 'Lightning' then
			windower.chat.input('/p '..auto_translate('Impaction')..' -<t>- MB: '..auto_translate('Thunder')..' <scall21> OPEN!')
			windower.chat.input('/ws "Starburst" <t>')
			windower.chat.input:schedule(5,'/ja "Immanence" <me>')
			windower.chat.input:schedule(6,'/p '..auto_translate('Impaction')..' -<t>- MB: '..auto_translate('Thunder')..' <scall21> CLOSE!')
			windower.chat.input:schedule(6,'/ma "Thunder" <t>')
		elseif state.ElementalMode.value == 'Light' then
			windower.chat.input('/p '..auto_translate('Transfixion')..' -<t>- MB: '..auto_translate('Light')..' <scall21> OPEN!')
			windower.chat.input('/ws "Starburst" <t>')
			windower.chat.input:schedule(5,'/ja "Immanence" <me>')
			windower.chat.input:schedule(6,'/p '..auto_translate('Transfixion')..' -<t>- MB: '..auto_translate('Light')..' <scall21> CLOSE!')
			windower.chat.input:schedule(6,'/ma "Luminohelix" <t>')
		elseif state.ElementalMode.value == 'Earth' then
			if player.sub_job == 'WHM' then
				windower.chat.input('/p '..auto_translate('Scission')..' -<t>- MB: '..auto_translate('earth')..' <scall21> OPEN!')
				windower.chat.input('/ws "Earth Crusher" <t>')
				windower.chat.input:schedule(5,'/ja "Immanence" <me>')
				windower.chat.input:schedule(6,'/p '..auto_translate('Scission')..' -<t>- MB: '..auto_translate('earth')..' <scall21> CLOSE!')
				windower.chat.input:schedule(6,'/ma "Stone" <t>')
			else
				windower.chat.input('/p '..auto_translate('Scission')..' -<t>- MB: '..auto_translate('earth')..' <scall21> OPEN!')
				windower.chat.input('/ws "Shell Crusher" <t>')
				windower.chat.input:schedule(5,'/ja "Immanence" <me>')
				windower.chat.input:schedule(6,'/p '..auto_translate('Scission')..' -<t>- MB: '..auto_translate('earth')..' <scall21> CLOSE!')
				windower.chat.input:schedule(6,'/ma "Stone" <t>')
			end
		elseif state.ElementalMode.value == 'Ice' then
			windower.chat.input('/p '..auto_translate('Induration')..' -<t>- MB: '..auto_translate('ice')..' <scall21> OPEN!')
			windower.chat.input('/ws "Starburst" <t>')
			windower.chat.input:schedule(5,'/ja "Immanence" <me>')
			windower.chat.input:schedule(6,'/p '..auto_translate('Induration')..' -<t>- MB: '..auto_translate('ice')..' <scall21> CLOSE!')
			windower.chat.input:schedule(6,'/ma "Blizzard" <t>')
		elseif state.ElementalMode.value == 'Water' then
			windower.chat.input('/p '..auto_translate('Reverberation')..' -<t>- MB: '..auto_translate('Water')..' <scall21> OPEN!')
			windower.chat.input('/ws "Omniscience" <t>')
			windower.chat.input:schedule(5,'/ja "Immanence" <me>')
			windower.chat.input:schedule(6,'/p '..auto_translate('Reverberation')..' -<t>- MB: '..auto_translate('Water')..' <scall21> CLOSE!')
			windower.chat.input:schedule(6,'/ma "Water" <t>')
		elseif state.ElementalMode.value == 'Dark' then
			if player.sub_job == 'WHM' then
				windower.chat.input('/p '..auto_translate('Gravitation')..' -<t>- MB: '..auto_translate('earth')..' '..auto_translate('Darkness')..' <scall21> OPEN!')
				windower.chat.input('/ws "Earth Crusher" <t>')
				windower.chat.input:schedule(5,'/ja "Immanence" <me>')
				windower.chat.input:schedule(6,'/p '..auto_translate('Gravitation')..' -<t>- MB: '..auto_translate('earth')..' '..auto_translate('Darkness')..' <scall21> CLOSE!')
				windower.chat.input:schedule(6,'/ma "Noctohelix" <t>')
			else
				windower.chat.input('/p '..auto_translate('Compression')..' -<t>- MB: '..auto_translate('Darkness')..' <scall21> OPEN!')
				windower.chat.input('/ws "Omniscience" <t>')
				windower.chat.input:schedule(5,'/ja "Immanence" <me>')
				windower.chat.input:schedule(6,'/p '..auto_translate('Compression')..' -<t>- MB: '..auto_translate('Darkness')..' <scall21> CLOSE!')
				windower.chat.input:schedule(6,'/ma "Noctohelix" <t>')
			end
		end
		
	elseif command == 'endskillchain' then
		if player.target.type ~= "MONSTER" then
			add_to_chat(123,'Abort: You are not targeting a monster.')
		elseif buffactive.silence or buffactive.mute or buffactive.paralysis then
			add_to_chat(123,'You are silenced, muted, or paralyzed, cancelling skillchain.')
		elseif not (state.Buff['Dark Arts']  or state.Buff['Addendum: Black']) then
			add_to_chat(123,'Can\'t use elemental skillchain commands without Dark Arts - Activating.')
			windower.chat.input('/ja "Dark Arts" <me>')
		elseif state.ElementalMode.value == 'Fire' then
			if not buffactive['Immanence'] then windower.chat.input('/ja "Immanence" <me>') end
			windower.chat.input:schedule(1,'/p '..auto_translate('Skillchain')..' -<t>- MB: '..auto_translate('Fire')..' <scall21> CLOSE!')
			windower.chat.input:schedule(1,'/ma "Fire" <t>')
		elseif state.ElementalMode.value == 'Wind' then
			if not buffactive['Immanence'] then windower.chat.input('/ja "Immanence" <me>') end
			windower.chat.input:schedule(1,'/p '..auto_translate('Skillchain')..' -<t>- MB: '..auto_translate('wind')..' <scall21> CLOSE!')
			windower.chat.input:schedule(1,'/ma "Aero" <t>')
		elseif state.ElementalMode.value == 'Lightning' then
			if not buffactive['Immanence'] then windower.chat.input('/ja "Immanence" <me>') end
			windower.chat.input:schedule(1,'/p '..auto_translate('Skillchain')..' -<t>- MB: '..auto_translate('Thunder')..' <scall21> CLOSE!')
			windower.chat.input:schedule(1,'/ma "Thunder" <t>')
		elseif state.ElementalMode.value == 'Light' then
			if not buffactive['Immanence'] then windower.chat.input('/ja "Immanence" <me>') end
			windower.chat.input:schedule(1,'/p '..auto_translate('Skillchain')..' -<t>- MB: '..auto_translate('Light')..' <scall21> CLOSE!')
			windower.chat.input:schedule(1,'/ma "Luminohelix" <t>')
		elseif state.ElementalMode.value == 'Earth' then
			if not buffactive['Immanence'] then windower.chat.input('/ja "Immanence" <me>') end
			windower.chat.input:schedule(1,'/p '..auto_translate('Skillchain')..' -<t>- MB: '..auto_translate('earth')..' <scall21> CLOSE!')
			windower.chat.input:schedule(1,'/ma "Stone" <t>')
		elseif state.ElementalMode.value == 'Ice' then
			if not buffactive['Immanence'] then windower.chat.input('/ja "Immanence" <me>') end
			windower.chat.input:schedule(1,'/p '..auto_translate('Skillchain')..' -<t>- MB: '..auto_translate('ice')..' <scall21> CLOSE!')
			windower.chat.input:schedule(1,'/ma "Blizzard" <t>')
		elseif state.ElementalMode.value == 'Water' then
			if not buffactive['Immanence'] then windower.chat.input('/ja "Immanence" <me>') end
			windower.chat.input:schedule(1,'/p '..auto_translate('Skillchain')..' -<t>- MB: '..auto_translate('Water')..' <scall21> CLOSE!')
			windower.chat.input:schedule(1,'/ma "Water" <t>')
		elseif state.ElementalMode.value == 'Dark' then
			if not buffactive['Immanence'] then windower.chat.input('/ja "Immanence" <me>') end
			windower.chat.input:schedule(1,'/p '..auto_translate('Skillchain')..' -<t>- MB: '..auto_translate('Darkness')..' <scall21> CLOSE!')
			windower.chat.input:schedule(1,'/ma "Noctohelix" <t>')
		end
	
    else
        add_to_chat(123,'Unrecognized elemental command.')
    end
end
------------------------------------------
-- Gets the current number of available --
-- strategems based on racast and lvl		--
------------------------------------------
function get_current_strategem_count()
-- returns recast in seconds.
	local allRecasts = windower.ffxi.get_ability_recasts()
	local stratsRecast = allRecasts[231]
	local maxStrategems = (player.main_job_level + 10) / 20
	local fullRechargeTime = 4*60
	local currentCharges = math.floor(maxStrategems - maxStrategems * stratsRecast / fullRechargeTime)
	return currentCharges
end
----------------------------------------
--  Selecting and Setting the default --
--	Macro book and Lock style 		  --
----------------------------------------
function select_default_macro_book()
	set_macro_page(1, 2)
end
function set_lockstyle()
	send_command('wait 4; input /lockstyleset 2')
end
-----------------------
-- Miscelanous Stuff --
-----------------------
function set_healbot()
	send_command('wait 6; input //lua l healbot')
end 
function job_tick()
	if check_arts() then return true end
	if check_buff() then return true end
	if check_buffup() then return true end
	return false
end

function check_arts()
	if not arts_active() and (buffup ~= '' or (not areas.Cities:contains(world.area) and ((state.AutoArts.value and player.in_combat) or state.AutoBuffMode.value))) then
	
		local abil_recasts = windower.ffxi.get_ability_recasts()

		if abil_recasts[232] < latency then
			windower.chat.input('/ja "Dark Arts" <me>')
			tickdelay = os.clock() + .7
			return true
		end

	end
	
	return false
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
		{Name='Reraise',	Buff='Reraise',		SpellID=113,	When='Always'},
		{Name='Haste',		Buff='Haste',		SpellID=57,		When='Always'},
		{Name='Refresh',	Buff='Refresh',		SpellID=109,	When='Always'},
		{Name='Stoneskin',	Buff='Stoneskin',	SpellID=54,		When='Always'},
		{Name='Klimaform',	Buff='Klimaform',	SpellID=287,	When='Combat'},
	},
	
	Default = {
		{Name='Reraise',	Buff='Reraise',		SpellID=113,	Reapply=false},
		{Name='Haste',		Buff='Haste',		SpellID=57,		Reapply=false},
		{Name='Refresh',	Buff='Refresh',		SpellID=109,	Reapply=false},
		{Name='Aquaveil',	Buff='Aquaveil',	SpellID=55,		Reapply=false},
		{Name='Stoneskin',	Buff='Stoneskin',	SpellID=54,		Reapply=false},
		{Name='Klimaform',	Buff='Klimaform',	SpellID=287,	Reapply=false},
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
function job_self_command(commandArgs, eventArgs)
    if commandArgs[1]:lower() == 'scholar' then
        handle_strategems(commandArgs)
        eventArgs.handled = true
    elseif commandArgs[1]:lower() == 'elemental' then
        handle_elemental(commandArgs)
        eventArgs.handled = true
	elseif commandArgs[1]:lower() == 'showcharge' then
		add_to_chat(204, '~~~Current Stratagem Charges Available: ['..get_current_strategem_count()..']~~~')
	end
end