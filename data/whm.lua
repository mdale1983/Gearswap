--[[ Ranger V2.1.1
	Creator: Enuri
	Server:	 Asura
	Funcitons: 
]]
----------------------------------------------
--  Initialization function required for    --
--          this to work properly           --
----------------------------------------------
  function get_sets() 
  --Load and initialize the include file
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
		send_command('bind f12 gs c cycle RangedMode')
	--[[ AltF9-AltF12 keybinds ]]
		send_command('bind !f9 gs c cycle Empty')
		send_command('bind !f10 gs c cycle Empty')
		send_command('bind !f11 gs c toggle Empty')
		send_command('bind !f12 gs c toggle Empty')
		send_command('bind != gs c toggle CapacityMode')
		send_command('bind !` input /ma "Utsusemi: Ni" <me>')
		send_command('bind !q input /ma "Utsusemi: Ichi" <me>')
	--[[ CtrlF9-CtrlF12 keybinds ]]
		send_command('bind ^f9 gs c cycle AutoRA')
		send_command('bind ^f10 gs c cycle Empty')
		send_command('bind ^f11 gs c cycle Empty')
		send_command('bind ^f12 gs c cycle Empty')
		send_command('bind ^` input /ma "Tonko: Ni" <me>')
		send_command('bind ^q input /ma "Monomi: Ichi" <me>')
	--[[ WindowsF9-WindowsF12 keybinds ]]
		send_command('bind @f9 gs c set mainWeapon Fomalhaut')
		send_command('bind @f10 gs c set mainWeapon Annihilator')
		send_command('bind @f11 gs c set mainWeapon Yoichinoyumi')
		send_command('bind @f12 gs c set mainWeapon Gandiva')
		send_command('bind @` input /ma "blank" <me>')
		send_command('bind @q input /ma "blank" <t>')
  end 
--------------------------
--  Job Setup Section   --
--------------------------
	function job_setup()
		state.mainWeapon = M{'None', 'Fomalhaut', 'Annihilator', 'Yoichinoyumi', 'Gandiva'}
		oneHandList = S{'Perun +1', ''}
		bowList = S{'Bow1', 'Bow2'}
		gunList = S{'Doomsday', 'Holliday', 'Lionsquall'}
	--[[ Other states]]
	state.Buff['Afflatus Solace'] = buffactive['Afflatus Solace'] or false
    state.Buff['Afflatus Misery'] = buffactive['Afflatus Misery'] or false
  	state.Buff['Sublimation: Activated'] = buffactive['Sublimation: Activated'] or false
	autows = 'Mystic Boon'
	autofood = 'Miso Ramen'
	state.Kiting = M(false, 'Kiting')
	state.ElementalMode = M{['description'] = 'Elemental Mode','Light','Dark','Fire','Ice','Wind','Earth','Lightning','Water',}

	init_job_states({"Capacity","AutoRuneMode","AutoTrustMode","AutoNukeMode","AutoWSMode","AutoShadowMode","AutoFoodMode","AutoStunMode","AutoDefenseMode","AutoBuffMode",},{"Weapons","OffenseMode","WeaponskillMode","IdleMode","Passive","RuneElement","ElementalMode","CastingMode","TreasureMode",})
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
    --[[
    arts = {}	
		arts.Light = {}
		arts.Light.Types = {'Divine Magic','Healing Magic','Enhancing Magic','Enfeebling Magic'}
		arts.Dark = {}
		arts.Dark.Types = {'Elemental Magic','Dark Magic','Enfeebling Magic'}
    ]]
  end 
--------------------------
--  User Setup Section  --
--------------------------
	function user_setup()
  	state.IdleMode:options('Normal', 'MagicEva')
  	state.OffenseMode:options('None', 'Normal')
  	state.HybridMode:options('Normal', 'MagicEva')
  	state.WeaponskillMode:options('Normal', 'Mid', 'Acc')
  	state.CastingMode:options('Normal', 'Resistant', 'Burst', 'Enfeebling')
  --[[ User Created states ]]
	state.CapacityMode = M(false, 'Capacity Point Mantle')
	state.inCombat = M('outCombat', 'In Combat')
  --[[ Loading of various functions ]]
  	getHp()
  	select_default_macro_book()
  	set_lockstyle()
	get_player_name()
  	job_binds()
	update_active_strategems()
	set_healbot()
  end 
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
--  This tells Gear swap what sets to fetch  --
--  Recommend creating a Car file.          --
----------------------------------------------
	function init_gear_sets()
		--[[Gear is in a seperate File]]
	end 
-----------------------------------------
-- Checking Player HP for Hybird modes --	
-----------------------------------------
	function getHp()
		if player.hpp <= 51 then 
			state.HybridMode:set('DT')
    	elseif player.hpp > 51 then 
    		state.HybridMode:set('Normal')
    	end 
  end
---------------------------
--  Custom Idle Gear set --
---------------------------	
	function customize_idle_set(idleSet)
		if player.mpp < 51 then
			idleSet = set_combine(idleSet, sets.latent_refresh)
		end
		if state.IdleMode.value == "PDT" then 
			idleSet = set_combine(idleSet, sets.idle.PDT)
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
	function customize_melee_set(meleeSet)
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
		 if cmdParams[1] == 'user' and not areas.Cities:contains(world.area) then
			local needsArts = 
				player.sub_job:lower() == 'sch' and
				not buffactive['Light Arts'] and
				not buffactive['Addendum: White'] and
				not buffactive['Dark Arts'] and
				not buffactive['Addendum: Black']
				
			if not buffactive['Afflatus Solace'] and not buffactive['Afflatus Misery'] then
				if needsArts then
					send_command('@input /ja "Afflatus Solace" <me>;wait 1.2;input /ja "Light Arts" <me>')
				else
					send_command('@input /ja "Afflatus Solace" <me>')
				end
			end
		end 
		update_active_strategems()
		update_sublimation()
	end
	function job_status_change(newStatus, oldStatus, eventArgs)
		----auto_sublimation() 
		if new == 'Idle' then
        enable('main','sub')
        if Armor == '119' then
        equip(sets.aftercast.defense)
        else
            Idle()
        end
		elseif new == 'Resting' then
			equip(sets.aftercast.resting)
		elseif new == 'Engaged' then
			disable('main','sub')
			equipSet = sets.TP
			if equipSet[AccArray[AccIndex]] then
				equipSet = equipSet[AccArray[AccIndex]]
			end
			equip(equipSet)
		end 
	end 
	function get_combat_form()

	end 
	function job_self_command(cmdParams, eventArgs)
		if cmdParams[1]:lower() == 'scholar' then
			handle_strategems(cmdParams)
			eventArgs.handled = true
		end
	end
	function job_state_change(stateField, newValue, oldValue)
		if stateField == 'Offense Mode' then
			if newValue == 'None' then
				enable('main','sub','range')
			else
				disable('main','sub','range')
			end
		end
	end
	function display_current_job_state(eventArgs)
		display_current_caster_state()
		eventArgs.handled = true
	end
-------------------------------------
--  Creating a custom spellMap,    --
-------------------------------------
	function job_get_spell_map(spell, default_spell_map)
		if spell.action_type == 'Magic' then
			if (default_spell_map == 'Cure' or default_spell_map == 'Curaga') and player.status == 'Engaged' then
				return "CureMelee"
			elseif default_spell_map == 'Cure' and state.Buff['Afflatus Solace'] then
				return "CureSolace"
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
	function job_pretarget(spell, action, spellMap, eventArgs)
		
	end
-----------------------
-- Pre-cast section  --
-----------------------
	function job_precast(spell, action, spellMap, eventArgs) 
		if spell.english == "Paralyna" and buffactive.Paralyzed then
        -- no gear swaps if we're paralyzed, to avoid blinking while trying to remove it.
			eventArgs.handled = true
		end
		if spell.type:endswith('Magic') and buffactive.silence then
		eventArgs.cancel = true
		send_command('input /item "Echo Drops" <me>')
	end
		if spell.skill == 'Healing Magic' then
			gear.default.obi_back = "Mending Cape"
		else
			gear.default.obi_back = "Toro Cape"
		end
	end 
	function job_post_precast(spell, spellMap, eventArgs)
		if spell.action_type=="Magic" and buffactive.Silence then
			eventArgs.cancel = true
			send_command('input /item "Echo Drops" <me>')
		end
		-- Apply Divine Caress boosting items as highest priority over other gear, if applicable.
		if spellMap == 'StatusRemoval' and buffactive['Divine Caress'] then
			equip(sets.buff['Divine Caress'])
		end
	end 
-----------------------
--  Mid-cast Section --
-----------------------
	function job_midcast(spell, spellMap, eventArgs)
		
	end
	function job_post_midcast(spell, spellMap, eventArgs)
		if spell.action_type == 'Magic' then
			apply_grimoire_bonuses(spell, action, spellMap, eventArgs)
		end
	end 
-------------------------
--  after-cast Section --
-------------------------
	function job_aftercast(spell, spellMap, eventArgs)
		equip({feet="Inyan. Crackows +2"})
	end 
	function job_post_aftercast(spell, action, spellMap, eventArgs)
		get_current_strategem_count()
		if  spell.skill ~= 'Job Ability' then
			--auto_sublimation()
		end
		equip({feet="Inyan. Crackows +2"})
	end 
----------------------------------
--	Auto-Sublimation Function	--
----------------------------------
	--[[function auto_sublimation()
		local abil_recasts = windower.ffxi.get_ability_recasts()
		if not (buffactive['Sublimation: Activated'] or buffactive['Sublimation: Complete']) then
			if not (buffactive['Invisible'] or buffactive['Weakness']) then
				if abil_recasts[234] == 0 then
					send_command('@wait 2;input /ja "Sublimation" <me>')
				end
			end
		elseif buffactive['Sublimation: Complete'] then
			if player.mpp < 80 and abil_recasts[234] == 0 then
				send_command('@wait 2;input /ja "Sublimation" <me>')
			end
		end         
	end ]]
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
		--[[if not buffactive['Ballad'] and player.mpp < 70  then 
			send_command('input //send Aelwulf /ma "Mage\'s Ballad III Gunhild')
			send_command('@wait 5; input //send Aelwulf /ma "Mage\'s Ballad II Gunhild')
		end ]]
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
----------------------------------------------
--	Utility functions specific to this job.	--
----------------------------------------------
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
	function update_sublimation()
		state.Buff['Sublimation: Activated'] = buffactive['Sublimation: Activated'] or false
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
	set_macro_page(1, 14)
	end
	function set_lockstyle()
		send_command('wait 4; input /lockstyleset 1')
	end
function set_healbot()
		send_command('wait 6; input //lua l healbot')
end	
----------------------------------
--	Command Section for Warping	--
----------------------------------
function user_job_self_command(commandArgs, eventArgs) 
	include('commands')
	include('buffs') 
end



