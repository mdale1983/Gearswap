--[[
	Puppet Master: v1.0.0
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
	send_command('bind !f9 gs c toggle autobuffmode')
	send_command('bind !f10 gs c cycle autopuppetmode')
	send_command('bind !f11 gs c toggle autorepairmode')
	send_command('bind !f12 gs c toggle skillchainmode')
	send_command('bind != gs c toggle CapacityMode')
	send_command('bind !` input /ma "Utsusemi: Ni" <me>')
	send_command('bind !q input /ma "Utsusemi: Ichi" <me>')
--[[ CtrlF9-CtrlF12 keybinds ]]
	send_command('bind ^f9 gs c cycle Empty')
	send_command('bind ^f10 gs c cycle Empty')
	send_command('bind ^f11 gs c cycle Empty')
	send_command('bind ^f12 gs c cycle Empty')
	send_command('bind ^` gs c toggle AutoPuppetMode')
	send_command('bind ^q gs c toggle AutoRepairMode')
--[[ WindowsF9-WindowsF12 keybinds ]]
	send_command('bind @f9 gs c set rangeWeapon Anarchy')
	send_command('bind @f10 gs c set rangeWeapon Fomalhaut')
	send_command('bind @f11 gs c set mainWeapon Ragnarok')
	send_command('bind @f12 gs c set mainWeapon Caladbolg')
	send_command('bind @` gs c cycle SkillchainMode')
	send_command('bind @q /ma "Tonko: Ni" <me>')
end
--------------------------
--  Job Setup Section   --
--------------------------
function job_setup()
	state.mainWeapon = M{'None', 'Anarchy', 'Fomalhaut', 'Ragnarok', 'Anguta'}
	state.rangeWeapon = M{'None', 'Anarchy', 'Fomalhaut'}
	state.Weapons = M{'PetWeapons', 'Godhands', 'Tokko'}
	
	autows = "Victory Smite"
	autofood = 'Bean Daifuku'
	autowstp = 1200
	init_job_states({
		"Capacity","AutoWSMode","AutoShadowMode","AutoFoodMode",
		"AutoDefenseMode"
		},
		{
		"AutoSambaMode","Weapons","OffenseMode","WeaponskillMode",
		
	})
--[[ Moonshade earring and Gav. Helmet ]]
	moonshade_WS = S{
		"Leaden Salute", "Wildfire", "Last Stand",
		"Savage Blade", "Requiescat", 'Sanguine Blade'
	}
	gav_ws = S{
		"Leaden Salute", "Wildfire", "Last Stand",
		"Savage Blade", "Requiescat", 'Sanguine Blade'
	}
	maneuvers = S{
		'Fire Maneuver', 'Ice Maneuver', 'Wind Maneuver', 'Earth Maneuver',
		'Thunder Maneuver', 'Water Maneuver', 'Light Maneuver', 'Dark Maneuver'
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
	state.crafting = M(false)
	petWeaponskills = S{
		"Slapstick", "Knockout", "Magic Mortar",
        "Chimera Ripper", "String Clipper", "Cannibal Blade", 
		"Bone Crusher", "String Shredder", "Arcuballista", 
		"Daze", "Armor Piercer", "Armor Shatterer"
	}
	state.PartyChatWS = M(false, 'Report pet weaponskills in party chat.')
	magicPetModes = S{'Nuke','Heal','Magic'}
	state.PetMode = M{['description']='Pet Mode', 'None','Melee','Ranged','HybridRanged','Tank','Skillup','Lilith','LightTank','Magic','Heal','Nuke'}

	state.AutoManeuvers = M{['description']='Auto Maneuver List', 'Default','Melee','Ranged','HybridRanged','Tank','Skillup','Lilith','LightTank','Magic','Heal','Nuke'}
	
	state.AutoPuppetMode = M(false, 'Auto Puppet Mode')
	state.AutoRepairMode = M(true, 'Auto Repair Mode')
	state.AutoDeployMode = M(true, 'Auto Deploy Mode')
	state.AutoPetMode 	 = M(true, 'Auto Pet Mode')
	state.PetWSGear		 = M(true, 'Pet WS Gear')
	state.PetEnmityGear	 = M(true, 'Pet Enmity Gear')
	
	deactivatehpp = 85
	lastpettp = 0
	deactivatehpp = 100
	repairhpp = 25
	PupFlashReady = 0
	PupVokeReady = 0
	PupFlashRecast = 38
	PupVokeRecast = 23
	
	update_pet_mode()
	update_melee_groups()
end 
--------------------------
--  User Setup Section  --
--------------------------
function user_setup()
	state.IdleMode:options('Normal', 'MagicEva')
  	state.OffenseMode:options('Normal', 'Mid', 'Acc')
  	state.HybridMode:options('Normal', 'MagicEva')
  	state.WeaponskillMode:options('Normal', 'Mid', 'Acc')
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
	if state.CapacityMode.value then 
		idleSet = set_combine(idleSet, sets.CapacityMantle)
	end
	if state.Buff.Doom then
		idleSet = set_combine(idleSet, sets.buff.Doom)
	end
	if pet.isvalid and pet.status == 'Engaged' then
		local now = os.clock()
		if state.PetWSGear.value and sets.midcast.Pet and pet.tp and pet.tp > 999 then
			if sets.midcast.Pet.PetWSGear and sets.midcast.Pet.PetWSGear[state.PetMode.value] then
				idleSet = set_combine(idleSet, sets.midcast.Pet.PetWSGear[state.PetMode.value])
			elseif sets.midcast.Pet.PetWSGear then
				idleSet = set_combine(idleSet, sets.midcast.Pet.PetWSGear)
			end
		elseif state.PetEnmityGear.value and sets.midcast.Pet.PetEnmityGear and ((PupFlashReady < now and buffactive['Light Maneuver']) or (PupVokeReady < now and buffactive['Fire Maneuver'])) then
			idleSet = set_combine(idleSet, sets.midcast.Pet.PetEnmityGear)
		elseif sets.idle.Pet.Engaged[state.PetMode.value] then
			idleSet = set_combine(idleSet, sets.idle.Pet.Engaged[state.PetMode.value])
		else
			idleSet = set_combine(idleSet, sets.idle.Pet.Engaged)
		end

		if buffactive['Overdrive'] and sets.buff.Overdrive then
			idleSet = set_combine(idleSet, sets.buff.Overdrive)
		end
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
	if pet.isvalid and pet.status == 'Engaged' and sets.midcast.Pet then
		local now = os.clock()
		if state.PetWSGear.value and pet.tp and pet.tp > 999 and player.tp < 999 and sets.midcast.Pet and sets.midcast.Pet.PetWSGear then
			if sets.midcast.Pet.PetWSGear[state.PetMode.value] then
				meleeSet = set_combine(meleeSet, sets.midcast.Pet.PetWSGear[state.PetMode.value])
			else
				meleeSet = set_combine(meleeSet, sets.midcast.Pet.PetWSGear)
			end
		elseif state.PetEnmityGear.value and sets.midcast.Pet.PetEnmityGear and ((PupFlashReady < now and buffactive['Light Maneuver'])) then
			meleeSet = set_combine(meleeSet, sets.midcast.Pet.PetEnmityGear)
		end
	end
	return meleeSet
end 
----------------------------------------------
--  General hooks for setting combat state  --
----------------------------------------------
function display_current_job_state(eventArgs)
    display_pet_status()
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
	get_combat_weapon()
	job_state_change()
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
	if newStatus == "Engaged" and pet.isvalid and pet.status == "Idle" and player.target.type == "MONSTER" and state.AutoDeployMode.value and player.target.distance < 20 then
		windower.chat.input('/pet Deploy <t>')
	end
end 
function get_combat_weapon()
	if state.rangeWeapon.value == "Fomalhaut" then 
		equip({range="Fomalhaut"})
	elseif state.rangeWeapon.value == "Anarchy" then 
		equip({range="Anarchy +3"})
	end
	if state.WeaponskillMode.value == "Physical" then 
		equip({main="Naegling", sub="Blurred knife +1"})
	elseif state.WeaponskillMode.value == "Magical" then 
		equip({main="Naegling",sub="Fettering blade",range="Fomalhaut"})
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
	if player.equipment.main == 'Kenkonken' then
		if buffactive['Aftermath: Lv.3'] then
			classes.CustomMeleeGroups:append('AM3')
		end
	elseif buffactive['Aftermath'] then
		classes.CustomMeleeGroups:append('AM')
	end
	if newStatus == "Engaged" then 
	-- handle weapon sets
	end 
	if player.sub_job == 'NIN' then
		state.CombatForm:set("DW")
	else
		state.CombatForm:reset()
	end
	if buffactive['Samurai Roll'] then
		classes.CustomRangedGroups:append('SamRoll')
	end
end 
function update_melee_group()
	if player.equipment.main then
		classes.CustomMeleeGroups:clear()

		if player.equipment.main == "Kenkonken" and state.Buff['Aftermath: Lv.3'] then
				classes.CustomMeleeGroups:append('AM')
		end
	end
end
function job_self_command(commandArgs, eventArgs)
	if commandArgs[1] == 'maneuver' then
		if pet.isvalid then
			if commandArgs[2] == nil then
				for i = 1,8 do
					local maneuver = defaultManeuvers[state.PetMode.Value][i]
					if maneuver then
						local maneuversActive = buffactive[maneuver.Name] or 0
						if maneuversActive < maneuver.Amount then
							windower.chat.input('/pet "'..maneuver.Name..'" <me>')
							return
						end
					else
						return
					end
				end
				add_to_chat(123,'Current Maneuvers match Default')
			elseif S{'1','2','3','4','5','6','7','8'}:contains(commandArgs[2]) then
				if defaultManeuvers[state.PetMode.Value][tonumber(commandArgs[2])] then
					windower.chat.input('/pet "'..defaultManeuvers[state.PetMode.Value][tonumber(commandArgs[2])].Name..'" <me>')
				else
					add_to_chat(123,'Error: You don\'t have that many maneuvers listed.')
				end
			else
				add_to_chat(123,'Error: Maneuver command format is wrong.')
			end
        else
            add_to_chat(123,'Error: No valid pet.')
        end
    end
end
-------------------------------------
--  Creating a custom spellMap,    --
-------------------------------------
function job_get_spell_map(spell, default_spell_map)
	if  default_spell_map == 'Cure' or default_spell_map == 'Curaga'  then
		if world.weather_element == 'Light' then
                return 'LightWeatherCure'
		elseif world.day_element == 'Light' then
                return 'LightDayCure'
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
end
-----------------------
-- Pre-cast section  --
-----------------------
function job_filter_precast(spell, spellMap, eventArgs)
	
end
function job_pet_precast(spell, spellMap, eventArgs)
	if spell.english == "Fire Maneuver" then 
		equip(sets.precast.JA.Maneuver)
	end 
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
	if maneuvers:contains(spell.english) then 
		equip(sets.precast.JA.Maneuver)
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
	
end 
-----------------------
--  Mid-cast Section --
-----------------------
function job_midcast(spell, spellMap, eventArgs)
	
end
function job_post_midcast(spell, spellMap, eventArgs)
	
end 
function job_pet_midcast(spell, spellMap, eventArgs)
--[[ Not working due to delay, preserving in case it does in the future.
    if petWeaponskills:contains(spell.english) then
        classes.CustomClass = "Weaponskill"

		if sets.midcast.Pet.WeaponSkill[spell] then
			equip(sets.midcast.Pet.WeaponSkill[spell.english])
		else
			equip(sets.midcast.Pet.WeaponSkill)
		end
    end
]]
end
windower.raw_register_event('action', function(act)
	if pet.isvalid and pet.id == act.actor_id then
		if act.category == 11 then
			if act.param == 1945 then
				PupVokeReady = os.clock() +	PupVokeRecast
			elseif act.param == 1947 then
				PupFlashReady = os.clock() + PupFlashRecast
			end
			send_command('gs c forceequip')
		end
	end
end)
-------------------------
--  after-cast Section --
-------------------------
function job_aftercast(spell, spellMap, eventArgs)
	if pet_midaction() or spell.english == 'Activate' or spell.english == 'Deus Ex Automata' then
		eventArgs.handled = true
	end
end 
function job_post_aftercast(spell, spellMap, eventArgs)
 
end 
function job_pet_aftercast(spell, spellMap, eventArgs)
	if petWeaponskills:contains(spell.english) then
		if state.PartyChatWS.value then
			windower.chat.input('/p '..auto_translate('Automaton')..' '..auto_translate('Weapon Skill')..' '..spell.english..'')
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
	update_melee_groups()
	if buff:startswith('Aftermath') then
        if player.equipment.main == 'Kenkonken' then
            classes.CustomMeleeGroups:clear()

            if (buff == "Aftermath: Lv.3" and gain) or buffactive['Aftermath: Lv.3'] then
                classes.CustomMeleeGroups:append('AM3')
                add_to_chat(8, '*** Kenkonken AM3 active: +70 Acc. | +100 Atk. | 40%-DA 20%-TA ***')
				send_command('timers create "Aftermath: Lv. 3" 180 down')
				send_command('gs c autows Victory Smite')
            elseif (buff == "Aftermath: Lv.2" and gain) then
                add_to_chat(8, '*** Kenkonken AM2 active: +50 Acc. and +40 Atk.  ***')
				send_command('timers create "Aftermath: Lv. 2" 120 down')
			elseif (buff == "Aftermath: Lv.1" and gain) then
                add_to_chat(8, '*** Kenkonken AM1 active: Increased Acc. +30 ***')
				send_command('timers create "Aftermath: Lv. 1" 60 down')
			else 
				send_command('gs c autows Stringing Pummel')
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
	set_macro_page(1, 18)
	send_command('wait 4; input //gs org get')
end
function set_lockstyle()
	send_command('wait 4; input /lockstyleset 18')
end
--
--
function job_pet_change(pet, gain)
    update_pet_mode()
end
function job_tick()
	if check_repair() then return true end
	if check_auto_pet() then return true end
	if check_maneuver() then return true end

	if state.PetWSGear.value and pet.isvalid and pet.tp and pet.tp ~= lastpettp then
		if (pet.tp > 999 and lastpettp < 1000) or (pet.tp < 1000 and lastpettp > 999) then
			windower.send_command('gs c update')
		end
		lastpettp = pet.tp
	end

	return false
end
function update_pet_mode()
	if pet.isvalid and state.AutoPetMode.value then
		state.PetMode:set(get_pet_mode())
	end
	
	update_custom_groups()
end
function get_pet_mode()
	if pet.frame == 'Sharpshot Frame' then
		if pet.head == 'Valoredge Head' or pet.head == 'Harlequin Head' then
			return 'HybridRanged'
		else
			return 'Ranged'
		end
	elseif pet.frame == 'Valoredge Frame' then
		if pet.head == 'Soulsoother Head' then
			return 'Tank'
		else
			return 'Melee'
		end
	elseif pet.head == 'Sharpshot Head' or pet.head == 'Stormwaker Head' then
		return 'Magic'
	elseif pet.head == 'Spiritreaver Head' then
		return 'Nuke'
	elseif pet.frame == 'Harlequin Frame' then
		if pet.head == 'Harlequin Head' then
			return 'Melee'
		else
			return 'LightTank'
		end
	else
			if pet.head == 'Soulsoother Head' then
				return 'Heal'
			elseif pet.head == 'Valoredge Head' then
				return 'Melee'
			else
				return 'Magic'
			end
	end
end
function update_custom_groups()
    classes.CustomIdleGroups:clear()
    if pet.isvalid then
        classes.CustomIdleGroups:append(state.PetMode.value)
    end
end
function display_pet_status()
    if pet.isvalid then
        local petInfoString = pet.name..' ['..pet.head..']['..pet.frame..']('..state.PetMode.Value..'): '..tostring(pet.status)..'  TP='..tostring(pet.tp)..'  HP%='..tostring(pet.hpp)

        if magicPetModes:contains(state.PetMode.value) then
            petInfoString = petInfoString..'  MP%='..tostring(pet.mpp)
        end

        add_to_chat(122,petInfoString)
    end
end

function update_melee_groups()
	if player.equipment.main then
		classes.CustomMeleeGroups:clear()

		if player.equipment.main == "Kenkonken" and state.Buff['Aftermath: Lv.3'] then
				classes.CustomMeleeGroups:append('AM')
		end
	end
end

function check_auto_pet()
	if state.AutoBuffMode.value then 
		if not state.AutoPuppetMode.value then return false end

		local abil_recasts = windower.ffxi.get_ability_recasts()

		if not pet.isvalid then

			if abil_recasts[205] < latency then
				windower.chat.input('/ja "Activate" <me>')
				tickdelay = os.clock() + 1.1
				return true
			elseif abil_recasts[115] < latency then
				windower.chat.input('/ja "Deus Ex Automata" <me>')
				tickdelay = os.clock() + 1.1
				return true
			end

		elseif pet.status == "Idle" then
			if pet.max_mp > 50 and pet.mpp < 10 and pet.hpp >= deactivatehpp and abil_recasts[208] < latency then
				windower.chat.input('/pet "Deactivate" <me>')
				tickdelay = os.clock() + 1.1
				return true
			elseif player.target.type == "MONSTER" and abil_recasts[207] < latency then
				windower.chat.input('/pet "Deploy" <t>')
				tickdelay = os.clock() + 1.1
				return true
			end
		end
	end
	return false
end

function check_repair()

	if state.AutoRepairMode.value and pet.isvalid and pet.hpp < repairhpp then
		local abil_recasts = windower.ffxi.get_ability_recasts()

		if abil_recasts[206] < latency and item_available('Automat. Oil +3') then
			windower.chat.input('/ja "Repair" <me>')
			tickdelay = os.clock() + 1.1
			return true
		end
	end

	return false
end
function check_maneuver()
     if state.AutoBuffMode.value and pet.isvalid and windower.ffxi.get_ability_recasts()[210] < latency then
        for i = 1,8 do
			local maneuver
			if state.AutoManeuvers.value == 'Default' then
				maneuver = defaultManeuvers[state.PetMode.Value][i]
			else
				maneuver = defaultManeuvers[state.AutoManeuvers.value][i]
			end
            if maneuver then
                local maneuversActive = buffactive[maneuver.Name] or 0
                if maneuversActive < maneuver.Amount then
                    windower.chat.input('/pet "'..maneuver.Name..'" <me>')
                    tickdelay = os.clock() + 1.1
                    return true
                end
			else
				return false
            end
        end
    end

	return false
end
----------------------------------
--	Command Section for Warping	--
----------------------------------
function user_job_self_command(commandArgs, eventArgs) 
	include('commands')
end