--[[
	Runefencer v2.1.3
	Creator: Enuri
	Server:	 Asura
	Funcitons: 
		Ability to swap weapons on the fly Currently setup for REMA only
		Cycle through Runes and what resistance each one gives
		Ability to cancel a JA that is on CD and use alternative ability
			IE Valiance is on CD you use Valiance GS forces Vallation to be used
		AutoTankMode
		AutoBuffMode
		
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
	send_command('bind f12 gs c cycle DefenseMode')
--[[ AltF9-AltF12 keybinds ]]
	send_command('bind !f9 gs c cycle AutoRuneMode')
	send_command('bind !f10 gs c cycle AutoBuffMode')
	send_command('bind !f11 gs c toggle autowsmode')
	send_command('bind !f12 gs c toggle SouleaterMode')
	send_command('bind != gs c toggle CapacityMode')
	send_command('bind !` input /ma "Geist Wall" <t>')
	send_command('bind !q input /ma "Soporific" <t>')
--[[ CtrlF9-CtrlF12 keybinds ]]
	send_command('bind ^f9 gs c cycle AutoTankMode')
	send_command('bind ^f10 gs c cycle Empty')
	send_command('bind ^f11 gs c cycle Empty')
	send_command('bind ^f12 gs c cycle Empty')
	send_command('bind ^` input //sat youtarget aelwulf; wait 1 //send aelwulf /attack')
	send_command('bind ^q input /ma "Temper" <me>')
--[[ WindowsF9-WindowsF12 keybinds ]]
	send_command('bind @f9 gs c set mainWeapon Lionheart')
	send_command('bind @f10 gs c set mainWeapon Aettir')
	send_command('bind @f11 gs c set mainWeapon Epeolatry')
	send_command('bind @f12 gs c set mainWeapon Empty')
	send_command('bind @` input /ma "Aquaveil" <me>')
	send_command('bind @q input /ma "Sheep Song" <t>')
end
--------------------------
--  Job Setup Section   --
--------------------------
function job_setup()
	state.Buff['Aftermath: Lv.3'] = buffactive['Aftermath: Lv.3'] or false
	state.Buff['Valiance'] = buffactive['Valiance'] or false
	state.Buff['Vallation'] = buffactive['Vallation'] or false
	state.Buff['Embolden'] = buffactive['Embolden'] or false
    state.Buff.Hasso = buffactive.Hasso or false
    state.Buff.Seigan = buffactive.Seigan or false
	state.Stance = M{['description']='Stance','Hasso','Seigan','None'}
	autows = 'Resolution'
	autofood = 'Miso Ramen'
	--update_melee_groups()
	init_job_states({
		"Capacity","AutoRuneMode","AutoTrustMode","AutoTankMode",
		"AutoWSMode","AutoShadowMode","AutoFoodMode","AutoNukeMode",
		"AutoStunMode","AutoDefenseMode","AutoBuffMode",
		},{
		"AutoSambaMode","Weapons","OffenseMode","WeaponskillMode",
		"Stance","IdleMode","Passive","RuneElement","PhysicalDefenseMode",
		"MagicalDefenseMode","ResistDefenseMode","TreasureMode",
	})
	state.mainWeapon = M{'None', 'Lionheart', 'Aettir', 'Epeolatry', 'Empty'}
	oneHandList = S{'replace with your weapons'}
  	gsList = S{'Macbain', 'Crobaci +1'}
  	scytheList = S{'Cronus', 'Raetic Scythe'}
	bowList = S{'Bow1', 'Bow2'}
	gunList = S{'Doomsday', 'Holliday', 'Lionsquall'}
	state.rangedWeapon = M{'None', 'Fomalhaut', 'Annihilator', 'Yoichinoyumi', 'Gandiva'}
	  --[[Correction to errors in Mote Libs]]
  	absorbs = S{ 
			'Absorb-STR', 'Absorb-DEX', 'Absorb-VIT', 
			'Absorb-AGI', 'Absorb-INT', 'Absorb-MND', 
			'Absorb-CHR', 'Absorb-ACC', 'Absorb-TP',
			'Absorb-Attri'
		}
  --[[ Moonshade earring and Gav. Helmet ]]
		moonshade_WS = S{
			"Resolution", "Dimidiation", 
			"Savage Blade", "Vorpal Blade", 
			"Requiescat", "Sanguine Blade"
		}
		gav_ws = S{
			"Torcleaver","Resolution","Catastrophe",
			"Scourge","Cross Reaper"
		}
  --[[ Nuking sets ]]
		LowTierNuke = S{
			'Stone', 'Stone II', 'Stone III', 
			'Stonega', 'Stonega II',
			'Water', 'Water II', 'Water III', 
			'Waterga', 'Waterga II',
			'Aero', 'Aero II', 'Aero III', 
			'Aeroga', 'Aeroga II',
			'Fire', 'Fire II', 'Fire III', 
			'Firaga', 'Firaga II',
			'Blizzard', 'Blizzard II', 'Blizzard III', 
			'Blizzaga', 'Blizzaga II',
			'Thunder', 'Thunder II', 'Thunder III', 
			'Thundaga', 'Thundaga II'
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
		RUNMagic_Enmity = S {
			'Flash', 'Stun', 'Sleepga', 'Foil'
		}
		buffList = S { 
			'Temper', 'Crusade', 'Phalanx', 'Shell V'
		}
		rayke_duration = 35
		gambit_duration = 96
end 
--------------------------
--  User Setup Section  --
--------------------------
function user_setup()
	state.IdleMode:options('PDT')
  	state.OffenseMode:options('TankHyb', 'Normal')
  	state.HybridMode:options('Normal', 'MagicEva')
	state.DefenseMode:options('None', 'Physical')
  	state.WeaponskillMode:options('Normal', 'Mid', 'Acc')
  	state.CastingMode:options('Normal', 'Resistant', 'Enmity')
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
 --[[ Loading of various functions ]]
  	job_update(cmdParams, eventArgs)
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
		send_command('gs c set mainWeapon Lionheart')
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
	if state.IdleMode.value == "PDT" then 
		idleSet = set_combine(idleSet, sets.idle.PDT)
	end
	if state.DefenseMode.value == 'Physical' then 
		idleSet = set_combine(idleSet, sets.Tanking)
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
	if state.OffenseMode.value == "TankHyb" then 
		meleeSet = set_combine(meleeSet, sets.engaged.TankHyb)
	end 
	if state.HybridMode.value == "MagicEva" then 
		meleeSet = set_combine(meleeSet, sets.MagicEva)
	end
	if state.DefenseMode.value == 'Physical' then 
		meleeSet = set_combine(meleeSet, sets.Tanking)
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
		elseif player.equipment.main == 'Lionheart' then
			state.CombatWeapon:set('Lionheart')
		elseif player.equipment.main == 'Aettir' then
			state.CombatWeapon:set('Aettir')
		elseif player.equipment.main == 'Caladbolg' then
			state.CombatWeapon:set('Caladbolg')
		end
	end 
end 
function get_combat_weapon()
	if state.mainWeapon.value == "Aettir" then 
		equip({main="Aettir", sub="Refined grip +1"})
		set_macro_page(1, 9)
	elseif state.mainWeapon.value == "Lionheart" then 
		equip({main="Lionheart", sub="Utu grip"})
		set_macro_page(1, 9)
	elseif state.mainWeapon.value == "Epeolatry" then 
		equip({main="Epeolatry", sub="Utu grip"})
		set_macro_page(1, 9)
	end	
	return get_combat_weapon
end 
function job_state_change(spell, spellMap, eventArgs) 
	
end 
function update_melee_group()
--[[ Can use this to create your own custom Template ]]
	classes.CustomMeleeGroups:clear()
	-- mythic AM	
	if player.equipment.main == 'Liberator' then
		if buffactive['Aftermath: Lv.3'] then
			classes.CustomMeleeGroups:append('AM3')
		end
	elseif buffactive['Aftermath'] then
		classes.CustomMeleeGroups:append('AM')
	end
	if player.equipment.main == 'Apocalypse' then 
		if buffactive['Aftermath'] then 
			classes.CustomMeleeGroups:append('AM')
			add_to_chat(8, '***Apocalypse haste is active. Switching to AM set***')
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
	if spell.skill == 'Dark Magic' and absorbs:contains(spell.english) then
		return 'Absorb'
	end
	if spell.skill == 'Elemental Magic' and LowTierNuke:contains(spell.english) then 
		return 'MA'
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
	if spell.english == 'Valiance' then
		local abil_recasts = windower.ffxi.get_ability_recasts()
		if abil_recasts[113] > 0 and abil_recasts[23] < latency then
			eventArgs.cancel = true
			send_command('@input /ja "Vallation" <me>')
		end
	end
	if spell.english == "Lunge" then 
		local abil_recasts = windower.ffxi.get_ability_recasts()
		if abil_recasts[25] > 0 and abil_recasts[241] < latency then
			eventArgs.cancel = true
			send_command('input /jobability "Swipe" <t>')
			add_to_chat(122, '*Lunge Aborted: Timer on Cooldown -- Downgrading to Swipe.*')
		end
	end 
	if spell.english == "Pflug" then 
		local abil_recasts = windower.ffxi.get_ability_recasts()
		if abil_recasts[59] > 0 and abil_recasts[117] < latency then
			eventArgs.cancel = true
			send_command('input /jobability "Liement" <me>')
			add_to_chat(122, '*Pflug Aborted: Timer on Cooldown -- Downgrading to Liement.*')
		end
	end 
	if spell.english == "Gambit" then 
		local abil_recasts = windower.ffxi.get_ability_recasts()
		if abil_recasts[116] > 0 and abil_recasts[119] < latency then
			eventArgs.cancel = true
			send_command('input /jobability "Rayke" <t>')
			add_to_chat(122, '*Gambit Aborted: Timer on Cooldown -- Downgrading to Rayke.*')
		end
	end 
end
function job_precast(spell, action, spellMap, eventArgs)
	if spell.type=="Ninjutsu" then 
		check_tools(spell) 
	end 
		if spell.type:endswith('Magic') and buffactive.silence then
		eventArgs.cancel = true
		send_command('input /item "Echo Drops" <me>')
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
    if spell.skill == 'Enhancing Magic' and state.Buff.Embolden and sets.buff.Embolden then
        equip(sets.buff.Embolden)
    end
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
	-- Default macro set/book
	if player.sub_job == 'WAR' then 
		set_macro_page(1, 9)
	elseif player.sub_job == 'BLU' then 
		set_macro_page(1, 9)
	elseif player.sub_job == 'SAM' then 
		set_macro_page(1, 9)
	else 
		set_macro_page(1, 9)
	end 
end
function set_lockstyle()
	send_command('wait 4; input /lockstyleset 3')
end
--
--
--
function job_self_command(commandArgs, eventArgs)
	if commandArgs[1]:lower() == 'rune' then
			send_command('@input /ja '..state.Runes.value..' <me>')
		end 
	if commandArgs[1]:lower() == 'subjobenmity' then

		if player.target.type ~= "MONSTER" then
			add_to_chat(123,'Abort: You are not targeting a monster.')
			return
	
		elseif player.sub_job == 'BLU' then
			local spell_recasts = windower.ffxi.get_spell_recasts()
					
			if spell_recasts[584] < spell_latency then
				windower.chat.input('/ma "Sheep Song" <t>')
			elseif spell_recasts[598] < spell_latency then
				windower.chat.input('/ma "Soporific" <t>')
			elseif spell_recasts[605] < spell_latency then
				windower.chat.input('/ma "Geist Wall" <t>')
			elseif spell_recasts[575] < spell_latency then
				windower.chat.input('/ma "Jettatura" <t>')
			elseif spell_recasts[592] < spell_latency then
				windower.chat.input('/ma "Blank Gaze" <t>')
			elseif not check_auto_tank_ws() then
				if not state.AutoTankMode.value then add_to_chat(123,'All Enmity Blue Magic on cooldown.') end
			end
		elseif player.sub_job == 'DRK' then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			local spell_recasts = windower.ffxi.get_spell_recasts()
			if (state.HybridMode.value ~= 'Normal' or state.DefenseMode.value ~= 'None')  and buffactive['Souleater'] then
				send_command('cancel souleater')
			end
			if (state.HybridMode.value ~= 'Normal' or state.DefenseMode.value ~= 'None')  and buffactive['Last Resort'] then
				send_command('cancel last resort')
			end
			if spell_recasts[252] < spell_latency and not silent_check_silence() then
				windower.chat.input('/ma "Stun" <t>')
			elseif abil_recasts[85] < latency then
				windower.chat.input('/ja "Souleater" <me>')
			--elseif abil_recasts[87] < latency then
				--windower.chat.input('/ja "Last Resort" <me>')
			elseif abil_recasts[88] < latency then
				windower.chat.input('/ja "Weapon Bash" <t>')
			elseif abil_recasts[86] < latency then
				windower.chat.input('/ja "Arcane Circle" <me>')
			elseif not check_auto_tank_ws() then
				if not state.AutoTankMode.value then add_to_chat(123,'All Enmity Dark Knight abillities on cooldown.') end
			end
		elseif player.sub_job == 'WAR' then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			
			if (state.HybridMode.value ~= 'Normal' or state.DefenseMode.value ~= 'None')  and buffactive['Berserk'] then
				send_command('cancel berserk')
			end
			
			if abil_recasts[5] < latency then
				windower.chat.input('/ja "Provoke" <t>')
			elseif abil_recasts[2] < latency then
				windower.chat.input('/ja "Warcry" <me>')
			elseif abil_recasts[3] < latency then
				windower.chat.input('/ja "Defender" <me>')
			elseif abil_recasts[4] < latency then
				windower.chat.input('/ja "Aggressor" <me>')
			elseif abil_recasts[1] < latency then
				windower.chat.input('/ja "Berserk" <me>')
			elseif not check_auto_tank_ws() then
				if not state.AutoTankMode.value then add_to_chat(123,'All Enmity Warrior Job Abilities on cooldown.') end
			end
		end
	end
end
function job_tick()
	--if check_hasso() then return true end
	if check_buff() then return true end
	if check_buffup() then return true end
	if state.AutoTankMode.value and player.in_combat and player.target.type == "MONSTER" and not moving then
		if check_flash_foil() then return true end
		windower.send_command('gs c SubJobEnmity')
		tickdelay = os.clock() + 1.5
		return true
	end
	return false
end
function check_flash_foil()
	if silent_check_silence() then return false end
	local spell_recasts = windower.ffxi.get_spell_recasts()
	
	if not buffactive['Enmity Boost'] and spell_recasts[476] < spell_latency then
		windower.chat.input('/ma "Crusade" <me>')
		tickdelay = os.clock() + 2
		return true
	elseif spell_recasts[112] < spell_latency then
		windower.chat.input('/ma "Flash" <t>')
		tickdelay = os.clock() + 2
		return true
	elseif spell_recasts[840] < spell_latency then
		windower.chat.input('/ma "Foil" <me>')
		tickdelay = os.clock() + 2
		return true
	else
		return false
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
		
		if player.in_combat then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			
			if not buffactive['Swordplay'] and abil_recasts[24] < latency then
				windower.chat.input('/ja "Swordplay" <me>')
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
			elseif player.sub_job == 'WAR' and not buffactive.Aggressor and abil_recasts[4] < latency then
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

buff_spell_lists = {
	Auto = {--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
		{Name='Crusade',	Buff='Enmity Boost',	SpellID=476,	When='Always'},
		--{Name='Cocoon',		Buff='Defense Boost',	SpellID=547,	When='Combat'},
		{Name='Temper',		Buff='Multi Strikes',	SpellID=493,	When='Engaged'},
		{Name='Phalanx',	Buff='Phalanx',			SpellID=106,	When='Always'},
		{Name='Refresh',	Buff='Refresh',			SpellID=109,	When='Idle'},
		--{Name='Aquaveil',	Buff='Aquaveil',		SpellID=55,		When='Idle'},
		--{Name='Stoneskin',	Buff='Stoneskin',		SpellID=54,		When='Idle'},
		--{Name='Blink',		Buff='Blink',			SpellID=53,		When='Idle'},
	},

	Default = {
		{Name='Crusade',	Buff='Enmity Boost',	SpellID=476,	Reapply=false},
		{Name='Temper',		Buff='Multi Strikes',	SpellID=493,	Reapply=false},
		{Name='Haste',		Buff='Haste',			SpellID=57,		Reapply=false},
		{Name='Refresh',	Buff='Refresh',			SpellID=109,	Reapply=false},
		{Name='Phalanx',	Buff='Phalanx',			SpellID=106,	Reapply=false},
	},
	
	Full = {
		{Name='Crusade',	Buff='Enmity Boost',	SpellID=476,	Reapply=false},
		{Name='Temper',		Buff='Multi Strikes',	SpellID=493,	Reapply=false},
		{Name='Haste',		Buff='Haste',			SpellID=57,		Reapply=false},
		{Name='Refresh',	Buff='Refresh',			SpellID=109,	Reapply=false},
		{Name='Aquaveil',	Buff='Aquaveil',		SpellID=55,		Reapply=false},
		{Name='Stoneskin',	Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Blink',		Buff='Blink',			SpellID=53,		Reapply=false},
		{Name='Regen IV',	Buff='Regen',			SpellID=477,	Reapply=false},
		{Name='Phalanx',	Buff='Phalanx',			SpellID=106,	Reapply=false},
	},
}
----------------------------------
--	Command Section for Warping	--
----------------------------------
function user_job_self_command(commandArgs, eventArgs) 
	include('commands')
end