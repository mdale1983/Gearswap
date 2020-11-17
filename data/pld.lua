--[[ Generic file
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
end 
------------------------------------------
-- Initialization of the various job 		--
-- Binds for the differnt modes					--
------------------------------------------
function job_binds()
--[[ F9-F12 keybinds ]]
	send_command('bind f9 gs c cycle IdleMode')
	send_command('bind f10 gs c cycle OffenseMode')
	send_command('bind f11 gs c cycle HybridMode')
	send_command('bind f12 gs c cycle DefenseMode')
--[[ AltF9-AltF12 keybinds ]]
	send_command('bind !f9 gs c toggle AutoBuffMode')
	send_command('bind !f10 gs c toggle AutoTankMode')
	send_command('bind !f11 gs c toggle AutoWSMode')
	send_command('bind !f12 gs c toggle Stance')
	send_command('bind != gs c toggle CapacityMode')
	send_command('bind !` input /ma "Geist Wall" <t>')
	send_command('bind !q input /ma "Soporific" <t>')
--[[ CtrlF9-CtrlF12 keybinds ]]
	send_command('bind ^f9 gs c cycle AutoSambaMode')
	send_command('bind ^f10 gs c cycle empty')
	send_command('bind ^f11 gs c cycle empty')
	send_command('bind ^f12 gs c cycle Empty')
	send_command('bind ^` input /ma "Jettatura" <t>')
	send_command('bind ^q input /ma "Cocoon" <me>')
--[[ WindowsF9-WindowsF12 keybinds ]]
	send_command('bind @f9 gs c set subWeapon Ochain')
	send_command('bind @f10 gs c set subWeapon Aegis')
	send_command('bind @f11 gs c set mainWeapon Almace')
	send_command('bind @f12 gs c set mainWeapon Burtgang')
	send_command('bind @` input /ma "Blank Gaze" <t>')
	send_command('bind @q input empty')
end 
--------------------------
--  Job Setup Section   --
--------------------------
function job_setup()
	state.mainWeapon = M{'None', 'Burtgang', 'Excalibur', 'Almace'}
	state.subWeapon = M{'None', 'Aegis', 'Ochain'}
	shieldList = S{'Aegis', 'Ochain'}
	gsList = S{'Caladbolg', 'Ragnarok'}
  	swordList = S{'Burtgang', 'Excalibur', 'Almace'}
	custom_timers = {}
--[[ Moonshade earring and Gav. Helmet ]]
	moonshade_WS = S{
		"Resolution", "Torcleaver", "Atonement", "Savage Blade", 
		"Vorpal Blade", "Requiescat", 'Sanguine Blade', 'Chant du Cygne'
	}
	gav_ws = S{
		"Resolution", "Torcleaver", "Atonement", "Savage Blade", 
		"Vorpal Blade", "Requiescat", 'Sanguine Blade', 'Chant du Cygne'
	}
	state.Buff['Aftermath: Lv.3'] = buffactive['Aftermath: Lv.3'] or false
    state.Buff.Sentinel = buffactive.Sentinel or false
    state.Buff.Cover = buffactive.Cover or false
	state.AutoEmblem = M(true, 'Auto Emblem')
	autows = 'Atonement'
	autosamba = 'Haste Samba'
	autofood = 'Sublime Sushi'
	init_job_states({
		"Capacity","AutoRuneMode","AutoTrustMode","AutoWSMode","AutoShadowMode",
		"AutoFoodMode","AutoBuffMode"
		},{
		"AutoSambaMode","Weapons","OffenseMode","WeaponskillMode"
	})
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
	BlueMagic = {}
    blue_magic_maps = {}
	blue_magic_maps.Physical = S {
		'Bludgeon', 'Body Slam', 'Feather Storm', 'Mandibular Bite', 
		'Queasyshroom', 'Power Attack', 'Screwdriver', 'Sickle Slash', 
		'Smite of Rage', 'Terror Touch', 'Battle Dance', 'Claw Cyclone',
		'Foot Kick', 'Grand Slam', 'Sprout Smack', 'Helldive', 'Jet Stream',
		'Pinecone Bomb', 'Wild Oats', 'Uppercut'
	}		
	blue_magic_maps.Buff = S {
		'Refueling', 'Cocoon'
	}
	blue_magic_maps.Healing = S {
		'Healing Breeze', 'Pollen', 'Wild Carrot'
	}
	blue_magic_maps.Enmity = S { 
		'Blank Gaze', 'Jettatura', 'Geist Wall', 
		'Sheep Song', 'Soporific', 'Stinking Gas'
	}
end 
--------------------------
--  User Setup Section  --
--------------------------
function user_setup()
	state.IdleMode:options('Tanking')
	state.DefenseMode:options('None', 'Physical')
  	state.HybridMode:options('Normal', 'Reraise')
  	state.OffenseMode:options('Normal', 'TankHyb')
--[[ User Created states ]]
  	state.SouleaterMode = M(false, 'Soul Eater Mode')
	state.LastResortMode = M(false, 'Last Resort Mode')
	state.CapacityMode = M(false, 'Capacity Point Mantle')
	state.Runes = M{['description']='Rune', 
		"Ignis", 
		"Gelus", 
		"Flabra", 
		"Tellus", 
		"Sulpor", 
		"Unda", 
		"Lux", 
		"Tenebrae"
	}
	state.Rune = M{['description']='which', 
		"Fire Dmg | Ice Resist: Paralyze, Bind, Frost", 
		"Ice Dmg | Wind Resist: Choke, Gravity, Silence", 
		"Wind dmg | Earth Resist: Slow, Petrify, Rasp", 
		"Earth dmg | Lightning Resist: Stun, Shock", 
		"Lightning Dmg | Water Resist: Poison, Drown", 
		"Water dmg | Fire Resist: Addle, Burn, Plague, Amnesia", 
		"Light Dmg | Dark Resist's: Blind, Bio, Sleep", 
		"Dark Dmg | Light Resist's: Repose, Dia, Charm"
	}
	state.Rune2 = M{['description']='which', 
		"Fire", 
		"Ice", 
		"Wind", 
		"Earth", 
		"Lightning", 
		"Water", 
		"Light", 
		"Dark"
		}
--[[ Organizer stuff ]]
	organizer_items = {
		echos="Echo Drops",
		holyWater="Holy Water",	
	}		
 --[[ Loading of various functions ]]
  	-- job_update()
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
		--send_command('gs c set mainWeapon Burtgang')
		state.mainWeapon:set('Burtgang')
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
-----------------------------------------------------------
--  Rune Fencer Rune section for displaying rune info    --
-----------------------------------------------------------
function define_rune_info()
	rune_info = {
		["Ignis"]   = {damage="Fire", resistance="Ice"},
		["Gelus"]   = {damage="Ice", resistance="Wind"},
		["Flabra"]  = {damage="Wind", resistance="Earth"},
		["Tellus"]  = {damage="Earth", resistance="Lightning"},
		["Sulpor"]  = {damage="Lightning", resistance="Water"},
		["Unda"]    = {damage="Water", resistance="Fire"},
		["Lux"]     = {damage="Light", resistance="Darkness"},
		["Tenebrae"]= {damage="Darkness", resistance="Light"},
	}
end
function display_rune_info(spell)
	runeinfo = rune_info[spell.english]
	if runeinfo then
		add_to_chat(122, '*'..spell.english..' is '..runeinfo.damage..'-based dmg. and '..runeinfo.resistance..' resistance*')
	end
end
function useRunes(cmdParams, eventArgs)
	if cmdParams[1] == 'buffWatcher' then
		buffWatch(cmdParams[2])
	end
	if cmdParams[1] == 'stopBuffWatcher' then
		stopBuffWatcher()
	end
	if cmdParams[1]:lower() == 'rune' then
		send_command('@input /ja '..state.Runes.value..' <me>')
	end
end
---------------------------
--  Custom Idle Gear set --
---------------------------	
function job_customize_idle_set(idleSet)
	if state.IdleMode.value == 'Tanking' then 
		idleSet = set_combine(idleSet, sets.idle.PDT)
	end 
	if state.DefenseMode.value == 'Physical' then 
		idleSet = set_combine(idleSet, sets.idle.Turtle)
	end 
	if state.HybridMode.value == 'Reraise' then 
		idleSet = set_combine(idleSet, sets.Reraise)
	end
	if state.Buff.Doom then
		idleSet = set_combine(idleSet, sets.buff.Doom)
	end
	 
	if state.CapacityMode.value then 
		idleSet = set_combine(idleSet, sets.CapacityMantle)
	end
	return idleSet
end 
-------------------------------
--  Custom Melee Gear set    --
-------------------------------
function job_customize_melee_set(meleeSet)
	if state.Buff.Doom then
		meleeSet = set_combine(meleeSet, sets.buff.Doom)
	end
	if state.CapacityMode.value then 
		meleeSet = set_combine(meleeSet, sets.CapacityMantle)
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
	update_melee_group()
end 
function job_status_change(newStatus, oldStatus, eventArgs)
	if newStatus == "Engaged" then 
	-- handle weapon sets
	end 
	if player.sub_job == 'DNC' or player.sub_job == 'NIN' then
		state.CombatForm:set("DW")
	else
		state.CombatForm:reset()
	end
end 
function get_combat_weapon()
	if state.subWeapon.value == "Ochain" then 
		equip({sub="Ochain"})
	elseif state.subWeapon.value == "Aegis" then 
		equip({sub="Aegis"})
	end	
	if state.mainWeapon.value == 'Burtgang' then 
		equip({main="Burtgang"})
		set_macro_page(1, 8)
	end 
	return get_combat_weapon
end 
function job_state_change() 
	
end 
function update_melee_group()
--[[ Can use this to create your own custom Template ]]
	--[[ Can use this to create your own custom Template ]]
	
	-- mythic AM	
	if player.equipment.main == 'Burtgang' then
		if buffactive['Aftermath: Lv.2'] then
		classes.CustomMeleeGroups:append('AM')
			-- add_to_chat(8, '*** Burtgang AM Active: Roughly getting Acc. +69 Atk. +99 ***')
		end 
	end 
	if player.equipment.main == 'Burtgang' then
		if buffactive['Aftermath: Lv.1'] then
			classes.CustomMeleeGroups:append('AM')
			-- add_to_chat(8, '*** Burtgang AM Active: Acc. +49 ***')
		end
	end 
	if player.equipment.main == 'Excalibur' then 
		if buffactive['Aftermath'] then 
			classes.CustomMeleeGroups:append('AM')
			add_to_chat(8, '*** Excalibur AM Active: Regen +30 Refresh +3 ***')
		end 
	end 
	if player.equipment.main == 'Almace' then 
		if buffactive['Aftermath'] then 
			classes.CustomMeleeGroups:append('AM')
			add_to_chat(8, '*** Almace AM Active: 50% Triple damage ***')
		end 
	end
	if player.equipment.main == "Caladbolg" then 
		if buffactive['Aftermath'] then 
			classes.CustomMeleeGroups:append('AM')
			add_to_chat(7,'*** Caladbolg AM active: 50% Triple damage ***')
		end 
	end 
	if player.equipment.main == "Ragnarok" then 
		if buffactive['Aftermath'] then 
			classes.CustomMeleeGroups:append('AM')
			add_to_chat(7,'*** Ragnarok AM active: Acc 15 Crit Hit Rate 10% ***')
		end 
	end
	if buffactive['Samurai Roll'] then
		classes.CustomRangedGroups:append('SamRoll')
	end
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
	if spell.skill == 'Blue Magic' then
        for category,spell_list in pairs(blue_magic_maps) do
            if spell_list:contains(spell.english) then
                return category
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
function job_filter_precast(spell, spellMap, eventArgs)
	if spell.english == 'Rayke' [119] then 
		send_command('@input /p Rayke used lowering enemies '..state.Rune2.value..' resistance'  )
	end
	if spell.english == 'Gambit' [116]then 
		send_command('@input /p Gambit used lowering enemies '..state.Rune2.value..' defense'  )
	end 
end
function job_precast(spell, action, spellMap, eventArgs)
	if spell.type=="Ninjutsu" then 
		check_tools(spell) 
	end 
end 
function job_post_precast(spell, action, spellMap, eventArgs)
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
	if spell.name == 'Rayke' and not spell.interrupted then
        send_command('@timers c "Rayke ['..spell.target.name..']" '..rayke_duration..' down spells/00136.png')
        send_command('wait '..rayke_duration..';input /p ***Rayke: OFF***')
    elseif spell.name == 'Gambit' and not spell.interrupted then
        send_command('@timers c "Gambit ['..spell.target.name..']" '..gambit_duration..' down spells/00136.png')
		send_command('wait '..gambit_duration..';input /p ***Gambit: OFF***')
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
        if player.equipment.main == 'Burtgang' then
            classes.CustomMeleeGroups:clear()

            if (buff == "Aftermath: Lv.3" and gain) or buffactive['Aftermath: Lv.3'] then
                classes.CustomMeleeGroups:append('AM3')
                add_to_chat(8, '*** Burtgang AM3 active: Increased Acc. and Atk. 40%-DA 20%-TA ***')
				send_command('timers create "Aftermath: Lv. 3" 180 down')
				send_command('gs c autows savage blade')
            elseif (buff == "Aftermath: Lv.2" and gain) then
                add_to_chat(8, '*** Burtgang AM2 active: Increased Acc. and Atk. ***')
				send_command('timers create "Aftermath: Lv. 2" 120 down')
			elseif (buff == "Aftermath: Lv.1" and gain) then
                add_to_chat(8, '*** Burtgang AM1 active: Increased Acc. ***')
				send_command('timers create "Aftermath: Lv. 1" 60 down')
			else 
				send_command('gs c autows Atonement')
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
	if state.LastResortMode.value == true then 
		send_command('@wait 1; cancel Last Resort')
	end 
	if state.SouleaterMode.value == true then 
		send_command('@wait 1; cancel Souleater')
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
	set_macro_page(1, 8)
	send_command('wait 4; input //gs org get')
end
function set_lockstyle()
	send_command('wait 4; input /lockstyleset 2')
end
--
--
--
function job_self_command(commandArgs, eventArgs)

	if commandArgs[1] == 'RuneElement' then
		send_command('input /ja "'..state.RuneElement.value..'" <me>')

	elseif commandArgs[1] == 'SubJobEnmity' then
		if not buffactive[394] then 
			local abil_recasts = windower.ffxi.get_ability_recasts()
			if abil_recasts[150] < latency then 
				send_command('input /ja "Majesty" <me>')
			end 
		end 
		if player.sub_job == 'RUN' then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			if abil_recasts[24] < latency then
				send_command('input /ja "Swordplay" <me>')
			end

		elseif player.sub_job == 'BLU' and not moving then
			local spell_recasts = windower.ffxi.get_spell_recasts()
					
			if player.target.type ~= "MONSTER" then
				add_to_chat(123,'Abort: You are not targeting a monster.')
				return
			elseif spell_recasts[584] < spell_latency then
				send_command('input /ma "Sheep Song" <t>')
			elseif spell_recasts[598] < spell_latency then
				windower.chat.input('/ma "Soporific" <t>')
			elseif spell_recasts[605] < spell_latency then
				windower.chat.input('/ma "Geist Wall" <t>')
			elseif spell_recasts[575] < spell_latency then
				windower.chat.input('/ma "Jettatura" <t>')
			elseif spell_recasts[592] < spell_latency then
				windower.chat.input('/ma "Blank Gaze" <t>')
			elseif not check_auto_tank_ws() then
				if not state.AutoTankMode.value then add_to_chat(123,'All Enmity Blue Magic on cooldown.') 
				end
				tickdelay = os.clock() + 5
			end
					
		elseif player.sub_job == 'WAR' then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			
			if state.HybridMode.value:contains('DD') then
				if buffactive['Defender'] then send_command('cancel defender') end
			elseif state.HybridMode.value ~= 'Normal' and not state.HybridMode.value:contains('DD') then
				if buffactive['Berserk'] then send_command('cancel berserk') end
			end
			
			if abil_recasts[5] < latency and player.target.type == "MONSTER" then
				send_command('input /ja "Provoke" <t>')
			elseif abil_recasts[2] < latency then
				send_command('input /ja "Warcry" <me>')
			elseif abil_recasts[3] < latency then
				send_command('input /ja "Defender" <me>')
			elseif not check_auto_tank_ws() then
				if not state.AutoTankMode.value then add_to_chat(123,'All Enmity Warrior Job Abilities on cooldown.') end
			end
			
		elseif player.sub_job == 'DNC' then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			local under3FMs = not buffactive['Finishing Move 3'] and not buffactive['Finishing Move 4'] and not buffactive['Finishing Move 5']
        
			if under3FMs then
				if abil_recasts[220] < latency then
				send_command('@input /ja "'..state.CurrentStep.value..'" <t>')
				return
				end
			elseif abil_recasts[221] < latency then
				send_command('input /ja "Animated Flourish" <t>')
				return
			elseif abil_recasts[220] < latency and not buffactive['Finishing Move 5'] then
				send_command('@input /ja "'..state.CurrentStep.value..'" <t>')
				return
			elseif not check_auto_tank_ws() then
				if not state.AutoTankMode.value then add_to_chat(123,'Dancer job abilities not needed.') end
			end
		end

	end

end
function job_tick()
	if check_buff() then return true end
	if check_buffup() then return true end
	if state.AutoTankMode.value and player.in_combat and player.target.type == "MONSTER" and not moving then
		--[[if check_flash() then return true
		else 
			windower.send_command('gs c SubJobEnmity')
			tickdelay = os.clock() + 1
			return true
		end]]
	end
	return false
end
--[[function check_flash()
	local spell_recasts = windower.ffxi.get_spell_recasts()
	
	if spell_recasts[112] < spell_latency then
		send_command('input /ma "Flash" <t>')
		tickdelay = os.clock() + 2
		return true
	else
		return false
	end
end]]
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
		{Name='Crusade',	Buff='Enmity Boost',	SpellID=476,	When='Always'},
		{Name='Cocoon',		Buff='Defense Boost',	SpellID=547,	When='Always'},
		{Name='Phalanx',	Buff='Phalanx',			SpellID=106,	When='Always'},
		{Name='Reprisal',	Buff='Reprisal',		SpellID=97,		When='Combat'},
		{Name='Enlight II',	Buff='Enlight',			SpellID=855,	When='Engaged'},
		
	},

	Default = {
		{Name='Crusade',	Buff='Enmity Boost',	SpellID=476,	Reapply=false},
		{Name='Temper',		Buff='Multi Strikes',	SpellID=493,	Reapply=false},
		{Name='Haste',		Buff='Haste',			SpellID=57,		Reapply=false},
		{Name='Refresh',	Buff='Refresh',			SpellID=109,	Reapply=false},
		{Name='Phalanx',	Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Enlight II',	Buff='Enlight',			SpellID=855,	Reapply=false},
	},
	
	Full = {
		{Name='Crusade',	Buff='Enmity Boost',	SpellID=476,	Reapply=false},
		{Name='Phalanx',	Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Enlight II',	Buff='Enlight',			SpellID=855,	Reapply=false},
	},
}
----------------------------------
--	Command Section for Warping	--
----------------------------------
function user_job_self_command(commandArgs, eventArgs) 
	include('commands')
end