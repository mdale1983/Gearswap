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
	send_command('bind !f9 gs c cycle Empty')
	send_command('bind !f10 gs c cycle AutoSubMode')
	send_command('bind !f11 gs c toggle MagicBurst')
	send_command('bind !f12 gs c toggle PactSpamMode')
	send_command('bind != gs c toggle CapacityMode')
	send_command('bind !` input /ma "Berserk" <me>')
	send_command('bind !q input /ma "Aggresor" <me>')
--[[ CtrlF9-CtrlF12 keybinds ]]
	send_command('bind ^f9 gs c cycle Empty')
	send_command('bind ^f10 gs c cycle Empty')
	send_command('bind ^f11 gs c cycle Empty')
	send_command('bind ^f12 gs c cycle Empty')
	send_command('bind ^` input /ma "Empty" <me>')
	send_command('bind ^q input /ma "Empty" <me>')
--[[ WindowsF9-WindowsF12 keybinds ]]
	send_command('bind @f9 gs c set mainWeapon Nirvana')
	send_command('bind @f10 gs c set mainWeapon Chango')
	send_command('bind @f11 gs c set mainWeapon Ragnarok')
	send_command('bind @f12 gs c set mainWeapon Ukonvasara')
	send_command('bind @` input /ma "Empty" <t>')
	send_command('bind @q input /ma "Empty" <t>')
end
--------------------------
--  Job Setup Section   --
--------------------------
function job_setup()
	state.mainWeapon = M{'None', 'Nirvana', 'Espiritus', 'Gridarvor', 'Grioavolr'}
	
	state.Buff["Avatar's Favor"] = buffactive["Avatar's Favor"] or false
    state.Buff["Astral Conduit"] = buffactive["Astral Conduit"] or false
	state.Buff['Aftermath: Lv.3'] = buffactive['Aftermath: Lv.3'] or false

    avatars = S{"Carbuncle", "Fenrir", "Diabolos", "Ifrit", "Titan", "Leviathan", "Garuda", "Shiva", "Ramuh", "Odin", "Alexander", "Cait Sith", "Siren"}
    spirits = S{"LightSpirit", "DarkSpirit", "FireSpirit", "EarthSpirit", "WaterSpirit", "AirSpirit", "IceSpirit", "ThunderSpirit"}
	spirit_of = {['Light']="Light Spirit", ['Dark']="Dark Spirit", ['Fire']="Fire Spirit", ['Earth']="Earth Spirit",
        ['Water']="Water Spirit", ['Wind']="Air Spirit", ['Ice']="Ice Spirit", ['Lightning']="Thunder Spirit"}

    magicalRagePacts = S{
		'Inferno','Earthen Fury','Tidal Wave','Aerial Blast','Diamond Dust','Judgment Bolt','Searing Light','Howling Moon','Ruinous Omen','Clarsach Call','Impact',
		'Fire II','Stone II','Water II','Aero II','Blizzard II','Thunder II',
		'Fire IV','Stone IV','Water IV','Aero IV','Blizzard IV','Thunder IV',
		'Thunderspark','Burning Strike','Meteorite','Nether Blast','Flaming Crush',
		'Meteor Strike','Conflag Strike','Heavenly Strike','Wind Blade','Geocrush','Grand Fall','Thunderstorm',
		'Holy Mist','Lunar Bay','Night Terror','Level ? Holy','Tornado II','Sonic Buffet'}

    pacts = {}
    pacts.cure = {['Carbuncle']='Healing Ruby'}
    pacts.curaga = {['Carbuncle']='Healing Ruby II', ['Garuda']='Whispering Wind', ['Leviathan']='Spring Water'}
    pacts.buffoffense = {['Carbuncle']='Glittering Ruby', ['Ifrit']='Crimson Howl', ['Garuda']='Hastega II', ['Ramuh']='Rolling Thunder',
		['Fenrir']='Ecliptic Growl', ['Siren']='Katabatic Blades'}
    pacts.buffdefense = {['Carbuncle']='Shining Ruby', ['Shiva']='Frost Armor', ['Garuda']='Aerial Armor', ['Titan']='Earthen Ward',
		['Ramuh']='Lightning Armor', ['Fenrir']='Ecliptic Howl', ['Diabolos']='Noctoshield', ['Cait Sith']='Reraise II', ['Siren']="Wind's Blessing"}
    pacts.buffspecial = {['Ifrit']='Inferno Howl', ['Garuda']='Fleet Wind', ['Titan']='Earthen Armor', ['Diabolos']='Dream Shroud',
		['Carbuncle']='Soothing Ruby', ['Fenrir']='Heavenward Howl', ['Cait Sith']='Raise II', ['Siren']='Chinook'}
	pacts.buffspecial2 = {['Carbuncle']='Pacifying Ruby',['Leviathan']='Soothing Current',['Shiva']='Crystal Blessing'}
    pacts.debuff1 = {['Shiva']='Diamond Storm', ['Ramuh']='Shock Squall', ['Leviathan']='Tidal Roar', ['Fenrir']='Lunar Cry',
		['Diabolos']='Pavor Nocturnus', ['Cait Sith']='Eerie Eye', ['Siren']='Lunatic Voice'}
    pacts.debuff2 = {['Shiva']='Sleepga', ['Leviathan']='Slowga', ['Fenrir']='Lunar Roar', ['Diabolos']='Somnolence', ['Ramuh']='Thunderspark',
		['Siren']='Bitter Elegy'}
    pacts.sleep = {['Shiva']='Sleepga', ['Diabolos']='Nightmare', ['Cait Sith']='Mewing Lullaby'}
    pacts.nuke2 = {['Ifrit']='Fire II', ['Shiva']='Blizzard II', ['Garuda']='Aero II', ['Titan']='Stone II',
		['Ramuh']='Thunder II', ['Leviathan']='Water II', ['Siren']='Tornado II'}
    pacts.nuke4 = {['Ifrit']='Fire IV', ['Shiva']='Blizzard IV', ['Garuda']='Aero IV', ['Titan']='Stone IV',
		['Ramuh']='Thunder IV', ['Leviathan']='Water IV', ['Siren']='Torando II'}
    pacts.bp70 = {['Ifrit']='Flaming Crush', ['Shiva']='Rush', ['Garuda']='Predator Claws', ['Titan']='Mountain Buster',
		['Ramuh']='Chaotic Strike', ['Leviathan']='Spinning Dive', ['Carbuncle']='Meteorite', ['Fenrir']='Eclipse Bite',
		['Diabolos']='Nether Blast',['Cait Sith']='Regal Scratch'}
    pacts.bp75 = {['Ifrit']='Meteor Strike', ['Shiva']='Heavenly Strike', ['Garuda']='Wind Blade', ['Titan']='Geocrush',
		['Ramuh']='Thunderstorm', ['Leviathan']='Grand Fall', ['Carbuncle']='Holy Mist', ['Fenrir']='Lunar Bay',
		['Diabolos']='Night Terror', ['Cait Sith']='Level ? Holy'}
	pacts.bp99 = {['Ifrit']='Conflag Strike',['Titan']='Crag Throw',['Ramuh']='Volt Strike', ['Siren']='Hysteric Assault'}
    pacts.astralflow = {['Ifrit']='Inferno', ['Shiva']='Diamond Dust', ['Garuda']='Aerial Blast', ['Titan']='Earthen Fury',
		['Ramuh']='Judgment Bolt', ['Leviathan']='Tidal Wave', ['Carbuncle']='Searing Light', ['Fenrir']='Howling Moon',
		['Diabolos']='Ruinous Omen', ['Cait Sith']="Altana's Favor"}
	
	--Most commonly used offensive pacts by avatar split into two categories.
	pacts.physical = {['Carbuncle']='Poison Nails',['Fenrir']='Eclipse Bite',['Ifrit']='Flaming Crush',['Titan']='Mountain Buster',
		['Leviathan']='Spinning Dive',['Garuda']='Predator Claws',['Shiva']='Rush',['Ramuh']='Volt Strike',['Diabolos']='Blindside',
		['Cait Sith']='Regal Gash',['Siren']='Hysteric Assault'}
	pacts.magical = {['Carbuncle']='Holy Mist',['Fenrir']='Lunar Bay',['Ifrit']='Meteor Strike',['Titan']='Geocrush',
		['Leviathan']='Grand Fall',['Garuda']='Wind Blade',['Shiva']='Heavenly Strike',['Ramuh']='Thunderstorm',['Diabolos']='Nether Blast',
		['Cait Sith']='Level ? Holy',['Siren']='Sonic Buffet'}

	ConduitLock = true
	ConduitLocked = nil
	state.PactSpamMode = M(false, 'Pact Spam Mode')
	state.AutoFavor = M(true, 'Auto Favor')
	state.AutoConvert = M(true, 'Auto Convert')
	
	autows = 'Spirit Taker'
	autofood = 'Akamochi'
	
	init_job_states({"Capacity","AutoRuneMode","AutoTrustMode","AutoNukeMode","PactSpamMode","AutoWSMode","AutoShadowMode","AutoFoodMode","AutoStunMode","AutoDefenseMode"},{"AutoBuffMode","Weapons","OffenseMode","WeaponskillMode","IdleMode","Passive","RuneElement","ElementalMode","CastingMode","TreasureMode",})
end 
--------------------------
--  User Setup Section  --
--------------------------
function user_setup()
	state.OffenseMode:options('Normal','Acc')
    state.CastingMode:options('Normal','Resistant','OccultAcumen')
    state.IdleMode:options('Normal', 'PDT','TPEat')
	state.Weapons:options('None','Gridarvor','Khatvanga','Nirvana')
--[[ User Created states ]]
	state.CapacityMode = M(false, 'Capacity Point Mantle')
	gear.perp_staff = {name="Gridarvor"}
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
	if pet.isvalid then
        if pet.element == world.day_element then
            idleSet = set_combine(idleSet, sets.perp.Day)
        end
        if pet.element == world.weather_element then
            idleSet = set_combine(idleSet, sets.perp.Weather)
        end
        if sets.perp[pet.name] then
            idleSet = set_combine(idleSet, sets.perp[pet.name])
        end
        if state.Buff["Avatar's Favor"] and avatars:contains(pet.name) then
            idleSet = set_combine(idleSet, sets.idle.Avatar.Favor)
        end
        if pet.status == 'Engaged' then
            idleSet = set_combine(idleSet, sets.idle.Avatar.Engaged)
			if sets.idle.Avatar.Engaged[pet.name] then
				idleSet = set_combine(idleSet, sets.idle.Avatar.Engaged[pet.name])
			end
        end
    end    
    if player.mpp < 51 and (state.IdleMode.value == 'Normal' or state.IdleMode.value == 'Sphere') and state.DefenseMode.value == 'None' then
        idleSet = set_combine(idleSet, sets.latent_refresh)
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
	update_melee_group()
end 
function job_status_change(newStatus, oldStatus, eventArgs)
	classes.CustomIdleGroups:clear()
    if pet.isvalid then
        if avatars:contains(pet.name) then
            classes.CustomIdleGroups:append('Avatar')
        elseif spirits:contains(pet.name) then
            classes.CustomIdleGroups:append('Spirit')
        end
    end
end 
function get_combat_weapon()
	if state.mainWeapon.value == "Nirvana" then 
		equip({main="Nirvana", sub="Utu Grip"})	
	end	
	return get_combat_weapon
end 
function job_state_change(cmdParams, eventArgs) 
--[[ Can use this to create your own custom Template ]]
	if commandArgs[1]:lower() == 'petweather' then
        handle_petweather()
        eventArgs.handled = true
    elseif commandArgs[1]:lower() == 'siphon' then
        handle_siphoning()
        eventArgs.handled = true
    elseif commandArgs[1]:lower() == 'pact' then
        handle_pacts(commandArgs)
        eventArgs.handled = true
	elseif commandArgs[1]:lower() == 'elemental' then
		handle_elemental(commandArgs)
		eventArgs.handled = true			
    elseif commandArgs[1]:lower() == 'conduitlock' then
		if ConduitLock == true then
			ConduitLock = false
			add_to_chat(122, "Astral Conduit no longer locks gear.")
		elseif ConduitLock == false then
			ConduitLock = true
			add_to_chat(122, "Astral Conduit now locks gear.")
		end
    end
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
function job_get_spell_map(spell)
	if spell.type == 'BloodPactRage' then
        if magicalRagePacts:contains(spell.english) then
            return 'MagicalBloodPactRage'
        else
            return 'PhysicalBloodPactRage'
        end
    elseif spell.type == 'BloodPactWard' then
		if  spell.target.type == 'MONSTER' then
			return 'DebuffBloodPactWard'
		else
			return 'BloodPactWard'
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
	if pet.name == spell.english and pet.hpp > 50 then
		add_to_chat(122, "You already have that avatar active!")
		eventArgs.cancel = true
	elseif avatars:contains(spell.english) and pet.isvalid then
		eventArgs.cancel = true
		windower.chat.input('/pet Release <me>')
		windower.chat.input:schedule(2,'/ma "'..spell.english..'" <me>')
	end

	if state.Buff['Astral Conduit'] and spell.type:startswith('BloodPact') and player.mp < (actual_cost(spell) + actual_cost(spell)) then
		local abil_recasts = windower.ffxi.get_ability_recasts()
		local available_ws = S(windower.ffxi.get_abilities().weapon_skills)

		if player.tp > 999 and available_ws:contains(190) then
			add_to_chat(122,'Not enough MP to Pact while using Conduit, using Myrkr!')
			windower.chat.input('/ws Myrkr <me>')
		elseif player.sub_job == 'SCH' and buffactive['Sublimation: Complete'] then
			add_to_chat(122,'Not enough MP to Pact while using Conduit, using Sublimation!')
			windower.chat.input('/ja Sublimation <me>')	
		elseif player.sub_job == 'RDM' and abil_recasts[49] < latency and player.mp > 0 and player.hp > 400 and state.AutoConvert.value then
			add_to_chat(122,'Not enough MP to Pact while using Conduit, Converting!')
			eventArgs.cancel = true
			windower.chat.input('/ja Convert <me>')
		end
	end
end
function job_precast(spell, spellMap, eventArgs)
	if spell.action_type == 'Magic' then
		if state.CastingMode.value == 'Proc' then
            classes.CustomClass = 'Proc'
        elseif state.CastingMode.value == 'OccultAcumen' then
            classes.CustomClass = 'OccultAcumen'
        end
	end
end 
function job_post_precast(spell, spellMap, eventArgs)
	if spell.type == 'WeaponSkill' then
		local WSset = standardize_set(get_precast_set(spell, spellMap))
		
		if (WSset.ear1 == "Moonshade Earring" or WSset.ear2 == "Moonshade Earring") then
			-- Replace Moonshade Earring if we're at cap TP
			if sets.MaxTP and get_effective_player_tp(spell, WSset) > 3200 then
				equip(sets.MaxTP[spell.english] or sets.MaxTP)
			end
		end
	end
end 
-----------------------
--  Mid-cast Section --
-----------------------
function job_midcast(spell, action, spellMap, eventArgs)

end
function job_post_midcast(spell, spellMap, eventArgs)
	if spell.skill == 'Elemental Magic' and default_spell_map ~= 'ElementalEnfeeble' and spell.english ~= 'Impact' then
        if state.MagicBurstMode.value ~= 'Off' then equip(sets.MagicBurst) end
		if spell.element == world.weather_element or spell.element == world.day_element then
			if state.CastingMode.value == 'Fodder' then
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
    end
end 
-------------------------
--  after-cast Section --
-------------------------
function job_aftercast(spell, spellMap, eventArgs)
	if not spell.interrupted then
		if state.UseCustomTimers.value and spell.english == 'Sleep' or spell.english == 'Sleepga' then
            send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 60 down spells/00220.png')
        elseif spell.skill == 'Elemental Magic' and state.MagicBurstMode.value == 'Single' then
            state.MagicBurstMode:reset()
			if state.DisplayMode.value then update_job_states()	end
		elseif type(spell.type) == 'string' and spell.type:startswith('BloodPact') and state.DefenseMode.value == 'None' then
			petWillAct = os.clock()
			if ConduitLocked and ConduitLocked ~= spell.english then
				ConduitLocked = nil
				if state.Weapons.value == 'None' then
					enable('main','sub','range','ammo','head','neck','lear','rear','body','hands','lring','rring','back','waist','legs','feet')
				else
					enable('range','ammo','head','neck','lear','rear','body','hands','lring','rring','back','waist','legs','feet')
				end
			end
			equip(get_pet_midcast_set(spell, spellMap))
			if state.Buff['Aftermath: Lv.3'] then
				if sets.midcast.Pet[spell.english] and sets.midcast.Pet[spell.english].AM then
					equip(sets.midcast.Pet[spell.english].AM)
				elseif spellMap == 'PhysicalBloodPactRage' and sets.midcast.Pet.PhysicalBloodPactRage.AM then
					equip(sets.midcast.Pet.PhysicalBloodPactRage.AM)
				end
			end

			if state.CastingMode.value == 'Resistant' then
				if sets.midcast.Pet[spell.english] and sets.midcast.Pet[spell.english].Acc then
					equip(sets.midcast.Pet[spell.english].Acc)
				elseif spellMap == 'PhysicalBloodPactRage' and sets.midcast.Pet.PhysicalBloodPactRage.Acc then
					equip(sets.midcast.Pet.PhysicalBloodPactRage.Acc)
				elseif spellMap == 'MagicalBloodPactRage' and sets.midcast.Pet.MagicalBloodPactRage.Acc then
						equip(sets.midcast.Pet.MagicalBloodPactRage.Acc)
				end
			end
			
			if spellMap == 'PhysicalBloodPactRage' then
				if sets.midcast.Pet.PhysicalBloodPactRage[pet.name] then
					equip(sets.midcast.Pet.PhysicalBloodPactRage[pet.name])
				end
			elseif spellMap == 'MagicalBloodPactRage' then
				if sets.midcast.Pet.MagicalBloodPactRage[pet.name] then
					equip(sets.midcast.Pet.MagicalBloodPactRage[pet.name])
				end
			elseif spellMap == 'DebuffBloodPactWard' then
				if sets.midcast.Pet.BloodPactWard[pet.name] then
					equip(sets.midcast.Pet.BloodPactWard[pet.name])
				end
			end	
			
			if state.Buff['Astral Conduit'] and ConduitLock and ConduitLocked == nil then
				ConduitLocked = spell.english
				disable('main','sub','range','ammo','head','neck','lear','rear','body','hands','lring','rring','back','waist','legs','feet')
				add_to_chat(217, "Astral Conduit on, locking your "..spell.english.." set.")
			end
			eventArgs.handled = true
		elseif pet_midaction() or avatars:contains(spell.english) then
			eventArgs.handled = true
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
---------------------------------
--  Pet section for Summoner   --
---------------------------------
function job_pet_status_change(newStatus, oldStatus, eventArgs)
   if pet.isvalid and not midaction() and not pet_midaction() and (newStatus == 'Engaged' or oldStatus == 'Engaged') then
        handle_equipping_gear(player.status, newStatus)
    end
end
function job_pet_change(petparam, gain)
    classes.CustomIdleGroups:clear()
    if gain then
        if avatars:contains(pet.name) then
            classes.CustomIdleGroups:append('Avatar')
        elseif spirits:contains(pet.name) then
            classes.CustomIdleGroups:append('Spirit')
        end
    else
		if ConduitLocked ~= nil then
			ConduitLocked = nil
			add_to_chat(217, "No Avatar summoned, enabling slots.")

			if state.OffenseMode.value == 'None' then
				enable('main','sub','range','ammo','head','neck','lear','rear','body','hands','lring','rring','back','waist','legs','feet')
			else
				enable('range','ammo','head','neck','lear','rear','body','hands','lring','rring','back','waist','legs','feet')
			end
		end
    end
end
function handle_petweather()
    if player.sub_job ~= 'SCH' then
        add_to_chat(123, "You can not cast storm spells.")
        return
    end
        
    if not pet.isvalid then
        add_to_chat(123, "You do not have an active avatar.")
        return
    end
    
    local element = pet.element
    if element == 'Thunder' then
        element = 'Lightning'
    end
    
    local storm = elements.storm_of[element]
    
    if storm then
        windower.chat.input('/ma "'..elements.storm_of[element]..'" <me>')
    else
        add_to_chat(123, 'Error: Unknown element ('..tostring(element)..')')
    end
end
function job_self_command(commandArgs, eventArgs)
    if commandArgs[1]:lower() == 'petweather' then
        handle_petweather()
        eventArgs.handled = true
    elseif commandArgs[1]:lower() == 'siphon' then
        handle_siphoning()
        eventArgs.handled = true
    elseif commandArgs[1]:lower() == 'pact' then
        handle_pacts(commandArgs)
        eventArgs.handled = true
	elseif commandArgs[1]:lower() == 'elemental' then
		handle_elemental(commandArgs)
		eventArgs.handled = true			
    elseif commandArgs[1]:lower() == 'conduitlock' then
		if ConduitLock == true then
			ConduitLock = false
			add_to_chat(122, "Astral Conduit no longer locks gear.")
		elseif ConduitLock == false then
			ConduitLock = true
			add_to_chat(122, "Astral Conduit now locks gear.")
		end
    end
end
function handle_petweather()
    if player.sub_job ~= 'SCH' then
        add_to_chat(123, "You can not cast storm spells.")
        return
    end
        
    if not pet.isvalid then
        add_to_chat(123, "You do not have an active avatar.")
        return
    end
    
    local element = pet.element
    if element == 'Thunder' then
        element = 'Lightning'
    end
    
    local storm = data.elements.storm_of[element]
    
    if storm then
        windower.chat.input('/ma "'..data.elements.storm_of[element]..'" <me>')
    else
        add_to_chat(123, 'Error: Unknown element ('..tostring(element)..')')
    end
end
function handle_siphoning()
	local abil_recasts = windower.ffxi.get_ability_recasts()
    if areas.Cities:contains(world.area) then
        add_to_chat(122, 'Cannot use Elemental Siphon in a city area.')
        return
	elseif abil_recasts[175] > 0 then
        add_to_chat(123,'Abort: [Elemental Siphon] waiting on recast. ('..seconds_to_clock(abil_recasts[175])..')')
        return
    end

    local siphonElement
    local stormElementToUse
    local releasedAvatar
    local dontRelease
    
    -- If we already have a spirit out, just use that.
    if pet.isvalid and spirits:contains(pet.name) then
        siphonElement = pet.element
        dontRelease = true
        -- If current weather doesn't match the spirit, but the spirit matches the day, try to cast the storm.
        if player.sub_job == 'SCH' and pet.element == world.day_element and pet.element ~= world.weather_element then
            if not S{'Light','Dark','Lightning'}:contains(pet.element) then
                stormElementToUse = pet.element
            end
        end
    -- If we're subbing /sch, there are some conditions where we want to make sure specific weather is up.
    -- If current (single) weather is opposed by the current day, we want to change the weather to match
    -- the current day, if possible.
    elseif player.sub_job == 'SCH' and world.weather_element ~= 'None' then
        -- We can override single-intensity weather; leave double weather alone, since even if
        -- it's partially countered by the day, it's not worth changing.
        if world.weather_intensity == 1 then
            -- If current weather is weak to the current day, it cancels the benefits for
            -- siphon.  Change it to the day's weather if possible (+0 to +20%), or any non-weak
            -- weather if not.
            -- If the current weather matches the current avatar's element (being used to reduce
            -- perpetuation), don't change it; just accept the penalty on Siphon.
            if world.weather_element == data.elements.weak_to[world.day_element] and (not pet.isvalid or world.weather_element ~= pet.element) then
				stormElementToUse = world.day_element
            end
        end
    end
    
    -- If we decided to use a storm, set that as the spirit element to cast.
    if stormElementToUse then
        siphonElement = stormElementToUse
    elseif world.weather_element ~= 'None' and (world.weather_intensity == 2 or world.weather_element ~= data.elements.weak_to[world.day_element]) then
        siphonElement = world.weather_element
    else
        siphonElement = world.day_element
    end
    
    local command = ''
    local releaseWait = 0
    
    if pet.isvalid and avatars:contains(pet.name) then
        command = command..'input /pet "Release" <me>;wait 1.1;'
        releasedAvatar = pet.name
        releaseWait = 10
    end
    
    if stormElementToUse then
        command = command..'input /ma "'..data.elements.storm_of[stormElementToUse]..'" <me>;wait 4;'
        releaseWait = releaseWait - 4
    end
    
    if not (pet.isvalid and spirits:contains(pet.name)) then
        command = command..'input /ma "'..spirit_of[siphonElement]..'" <me>;wait 4;'
        releaseWait = releaseWait - 4
    end
    
    command = command..'input /ja "Elemental Siphon" <me>;'
    releaseWait = releaseWait - 1
    releaseWait = releaseWait + 0.1
    
    if not dontRelease then
        if releaseWait > 0 then
            command = command..'wait '..tostring(releaseWait)..';'
        else
            command = command..'wait 1.1;'
        end
        
        command = command..'input /pet "Release" <me>;'
    end
    
    if releasedAvatar then
        command = command..'wait 1.1;input /ma "'..releasedAvatar..'" <me>'
    end
    
    send_command(command)
end
function handle_pacts(commandArgs)
    if data.areas.cities:contains(world.area) then
        add_to_chat(123, 'Abort:You cannot use pacts in town.')
        return
    end

    if not pet.isvalid then
        add_to_chat(123,'Abort: You do not have an Avatar summoned.')
        return
    end

    if spirits:contains(pet.name) then
        add_to_chat(123,'Abort: Spirits cannot use blood pacts.')
        return
    end

    if not commandArgs[2] then
        add_to_chat(123,'Abort: No blood pact type given.')
        return
    end
    
    local pact = commandArgs[2]:lower()
    
    if not pacts[pact] then
        add_to_chat(123,'Abort: Unknown blood pact type: '..tostring(pact))
        return
    end
    
    if pacts[pact][pet.name] then
        if pact == 'astralflow' and not buffactive['astral flow'] then
            add_to_chat(123,'Abort: Astral Flow not active.')
            return
        end
        
        -- Leave out target; let Shortcuts auto-determine it.
        windower.chat.input('/pet "'..pacts[pact][pet.name]..'"')
    else
        add_to_chat(123,'Abort: '..pet.name..' does not have a pact of type ['..pact..'].')
    end
end
----------------------------------------
--  Selecting and Setting the default --
--	Macro book and Lock style 		  --
----------------------------------------
function select_default_macro_book()
	set_macro_page(1, 3)
	send_command('wait 4; input //gs org get')
end
function set_lockstyle()
	send_command('wait 4; input /lockstyleset 3')
end
-----------------------
-- Miscelanous Stuff --
-----------------------
function job_tick()
	if check_favor() then return true end
	if check_buff() then return true end
	if check_buffup() then return true end
	return false
end

function check_favor()
	if state.AutoFavor.value and pet.isvalid and not buffactive["Avatar's Favor"] and not (buffactive.amnesia or buffactive.impairment) then
		local abil_recasts = windower.ffxi.get_ability_recasts()
		
		if abil_recasts[176] < latency then
			windower.chat.input('/pet "Avatar\'s Favor" <me>')
			tickdelay = os.clock() + 1.1
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

	if command == 'spikes' then
		windower.chat.input('/ma "'..data.elements.spikes_of[state.ElementalMode.value]..' Spikes" <me>')
		return
	elseif command == 'enspell' then
		windower.chat.input('/ma "En'..data.elements.enspell_of[state.ElementalMode.value]..'" <me>')
		return
	--Leave out target, let shortcuts auto-determine it.
	elseif command == 'weather' then
		if player.sub_job == 'RDM' then
			windower.chat.input('/ma "Phalanx" <me>')
		else
			local spell_recasts = windower.ffxi.get_spell_recasts()
			if (player.target.type == 'SELF' or not player.target.in_party) and buffactive[data.elements.storm_of[state.ElementalMode.value]] and not buffactive['Klimaform'] and spell_recasts[287] < spell_latency then
				windower.chat.input('/ma "Klimaform" <me>')
			else
				windower.chat.input('/ma "'..data.elements.storm_of[state.ElementalMode.value]..'"')
			end
		end
		return
	end

	local target = '<t>'
	if cmdParams[3] then
		if tonumber(cmdParams[3]) then
			target = tonumber(cmdParams[3])
		else
			target = table.concat(cmdParams, ' ', 3)
			target = get_closest_mob_id_by_name(target) or '<t>'
		end
	end

	if command == 'nuke' or command == 'smallnuke' then
		local spell_recasts = windower.ffxi.get_spell_recasts()
	
		local tiers = {' II',''}
		for k in ipairs(tiers) do
			if spell_recasts[get_spell_table_by_name(data.elements.nuke_of[state.ElementalMode.value]..''..tiers[k]..'').id] < spell_latency and actual_cost(get_spell_table_by_name(data.elements.nuke_of[state.ElementalMode.value]..''..tiers[k]..'')) < player.mp then
				windower.chat.input('/ma "'..data.elements.nuke_of[state.ElementalMode.value]..''..tiers[k]..'" '..target..'')
				windower.add_to_chat(7,'/ma "'..data.elements.nuke_of[state.ElementalMode.value]..''..tiers[k]..'" '..target..'')
				return
			end
		end
		add_to_chat(123,'Abort: All '..data.elements.nuke_of[state.ElementalMode.value]..' nukes on cooldown or or not enough MP.')
		
	elseif command:contains('tier') then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		local tierlist = {['tier1']='',['tier2']=' II',['tier3']=' III',['tier4']=' IV',['tier5']=' V',['tier6']=' VI'}
		
		windower.chat.input('/ma "'..data.elements.nuke_of[state.ElementalMode.value]..tierlist[command]..'" '..target..'')
		
	elseif command == 'ara' then
		windower.chat.input('/ma "'..data.elements.nukera_of[state.ElementalMode.value]..'ra" '..target..'')
		
	elseif command == 'aga' then
		windower.chat.input('/ma "'..data.elements.nukega_of[state.ElementalMode.value]..'ga" '..target..'')
		
	elseif command == 'helix' then
		windower.chat.input('/ma "'..data.elements.helix_of[state.ElementalMode.value]..'helix" '..target..'')
	
	elseif command == 'enfeeble' then
		windower.chat.input('/ma "'..data.elements.elemental_enfeeble_of[state.ElementalMode.value]..'" '..target..'')
	
	elseif command == 'bardsong' then
		windower.chat.input('/ma "'..data.elements.threnody_of[state.ElementalMode.value]..' Threnody" '..target..'')		
    else
        add_to_chat(123,'Unrecognized elemental command.')
    end
end

function check_buff()
	if state.AutoBuffMode.value and not areas.Cities:contains(world.area) then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		for i in pairs(buff_spell_lists['Auto']) do
			if not buffactive[buff_spell_lists[state.AutoBuffMode.Value][i].Buff] and (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'Always' or (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'Combat' and (player.in_combat or being_attacked)) or (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'Engaged' and player.status == 'Engaged') or (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'Idle' and player.status == 'Idle') or (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'OutOfCombat' and not (player.in_combat or being_attacked))) and spell_recasts[buff_spell_lists[state.AutoBuffMode.Value][i].SpellID] < spell_latency and silent_can_use(buff_spell_lists[state.AutoBuffMode.Value][i].SpellID) then
				windower.chat.input('/ma "'..buff_spell_lists[state.AutoBuffMode.Value][i].Name..'" <me>')
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
	Auto = {--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
		--{Name='Reraise',	Buff='Reraise',		SpellID=113,	When='Always'},
		--{Name='Haste',		Buff='Haste',		SpellID=57,		When='Always'},
		{Name='Refresh',	Buff='Refresh',		SpellID=109,	When='Always'},
		{Name='Stoneskin',	Buff='Stoneskin',	SpellID=54,		When='Always'},
	},
	
	Default = {
		{Name='Reraise',	Buff='Reraise',		SpellID=113,	Reapply=false},
		{Name='Haste',		Buff='Haste',		SpellID=57,		Reapply=false},
		{Name='Refresh',	Buff='Refresh',		SpellID=109,	Reapply=false},
		{Name='Aquaveil',	Buff='Aquaveil',	SpellID=55,		Reapply=false},
		{Name='Stoneskin',	Buff='Stoneskin',	SpellID=54,		Reapply=false},
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
	include('smnmands')
end