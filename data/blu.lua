--[[
	Generic file
	Creator: Enuri
	Server:	 Asura
	Funcitons: 
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
	send_command('bind !f9 gs c cycle Empty')
	send_command('bind !f10 gs c cycle DarkSealMode')
	send_command('bind !f11 gs c toggle LastResortMode')
	send_command('bind !f12 gs c toggle SouleaterMode')
	send_command('bind != gs c toggle CapacityMode')
	send_command('bind !` input /ma "Geist Wall" <t>')
	send_command('bind !q input /ma "Soporific" <t>')
--[[ CtrlF9-CtrlF12 keybinds ]]
	send_command('bind ^f9 gs c cycle Empty')
	send_command('bind ^f10 gs c cycle Empty')
	send_command('bind ^f11 gs c cycle Empty')
	send_command('bind ^f12 gs c cycle Empty')
	send_command('bind ^` input /ma "Blink" <me>')
	send_command('bind ^q input /ma "Temper" <me>')
--[[ WindowsF9-WindowsF12 keybinds ]]
	send_command('bind @f9 gs c set mainWeapon Colada')
	send_command('bind @f10 gs c set mainWeapon Vampirism')
	send_command('bind @f11 gs c set mainWeapon Naegling')
	send_command('bind @f12 gs c set mainWeapon Empty')
	send_command('bind @` input /ma "Aquaveil" <me>')
	send_command('bind @q input /ma "Sheep Song" <t>')
end
--------------------------
--  Job Setup Section   --
--------------------------
function job_setup()
	state.Buff['Burst Affinity'] = buffactive['Burst Affinity'] or false
    state.Buff['Chain Affinity'] = buffactive['Chain Affinity'] or false
	state.Buff['Azure Lore'] = buffactive['Azure Lore'] or false
    state.Buff.Convergence = buffactive.Convergence or false
    state.Buff.Diffusion = buffactive.Diffusion or false
    state.Buff.Efflux = buffactive.Efflux or false
    state.Buff['Aftermath: Lv.3'] = buffactive['Aftermath: Lv.3'] or false
    state.Buff['Unbridled Learning'] = buffactive['Unbridled Learning'] or false
	state.Buff['Unbridled Wisdom'] = buffactive['Unbridled Wisdom'] or false
	autows = 'Chant Du Cygne'
	autofood = 'Soy Ramen'
	init_job_states({
		"Capacity","AutoRuneMode","AutoTrustMode","AutoTankMode",
		"AutoWSMode","AutoShadowMode","AutoFoodMode","AutoNukeMode",
		"AutoStunMode","AutoDefenseMode","AutoBuffMode",
		},{
		"AutoSambaMode","Weapons","OffenseMode","WeaponskillMode",
	})
	state.mainWeapon = M{'None', 'Colada', 'Vampirism', 'Naegling', 'Empty'}
	oneHandList = S{'replace with your weapons'}
  	gsList = S{'Macbain', 'Crobaci +1'}
  	scytheList = S{'Cronus', 'Raetic Scythe'}
	bowList = S{'Bow1', 'Bow2'}
	gunList = S{'Doomsday', 'Holliday', 'Lionsquall'}
	state.rangedWeapon = M{'None', 'Fomalhaut', 'Annihilator', 'Yoichinoyumi', 'Gandiva'}
--[[Correction to errors in Mote Libs]]
  	BlueMagic = {}
    blue_magic_maps = {}
--[[
Mappings for gear sets to use for various blue magic spells. While Str isn't listed for each, it's generally assumed as being at least moderately signficant, even for spells with other mods.
]]
    blue_magic_maps.Physical = S{
        'Bilgestorm'
    }
    -- Spells with heavy accuracy penalties, that need to prioritize accuracy first.
    blue_magic_maps.PhysicalAcc = S{
        'Heavy Strike',
    }
    -- Physical spells with Str stat mod
    blue_magic_maps.PhysicalStr = S{
        'Battle Dance','Bloodrake','Death Scissors','Dimensional Death',
        'Empty Thrash','Quadrastrike','Sinker Drill','Spinal Cleave',
        'Uppercut','Vertical Cleave'
    }   
    -- Physical spells with Dex stat mod
    blue_magic_maps.PhysicalDex = S{
        'Amorphic Spikes','Asuran Claws','Barbed Crescent','Claw Cyclone',
		'Disseverment','Foot Kick','Frenetic Rip','Goblin Rush',
		'Hysteric Barrage','Paralyzing Triad','Seedspray',
		'Sickle Slash','Smite of Rage','Terror Touch','Thrashing Assault',
        'Vanity Dive'
    }   
    -- Physical spells with Vit stat mod
    blue_magic_maps.PhysicalVit = S{
        'Body Slam','Cannonball','Delta Thrust','Glutinous Dart',
		'Grand Slam','Power Attack','Quad. Continuum',
		'Sprout Smack','Sub-zero Smash'
    }   
    -- Physical spells with Agi stat mod
    blue_magic_maps.PhysicalAgi = S{
        'Benthic Typhoon','Feather Storm','Helldive','Hydro Shot',
		'Jet Stream','Pinecone Bomb','Spiral Spin','Wild Oats'
    }
    -- Physical spells with Int stat mod
    blue_magic_maps.PhysicalInt = S{
        'Mandibular Bite','Queasyshroom'
    }
    -- Physical spells with Mnd stat mod
    blue_magic_maps.PhysicalMnd = S{
        'Ram Charge','Screwdriver','Tourbillion'
    }
    -- Physical spells with Chr stat mod
    blue_magic_maps.PhysicalChr = S{
        'Bludgeon'
    }
    -- Physical spells with HP stat mod
    blue_magic_maps.PhysicalHP = S{
        'Final Sting'
    }
--[[ 
Magical Spells 
Magical spells with the typical Int mod
]]
    blue_magic_maps.Magical = S{
        'Blastbomb','Blazing Bound','Bomb Toss','Cursed Sphere',
		'Dark Orb','Death Ray','Diffusion Ray','Droning Whirlwind',
		'Embalming Earth','Firespit','Foul Waters','Ice Break',
		'Leafstorm','Maelstrom','Rail Cannon','Regurgitation',
		'Rending Deluge','Retinal Glare','Tem. Upheaval','Tearing Gust',
		'Molting Plumage','Nectarous Deluge','Silent Storm','Palling Salvo',
		'Water Bomb','Spectral Floe','Tenebral Crush','Entomb','Subduction',
		'Anvil Lightning', 'Blinding Fulgor', 'Searing Tempest', 'Scouring Spate'
    }
    -- Magical spells with a primary Mnd mod
    blue_magic_maps.MagicalMnd = S{
        'Acrid Stream','Evryone. Grudge','Magic Hammer','Mind Blast'
    }
    -- Magical spells with a primary Chr mod
    blue_magic_maps.MagicalChr = S{
        'Eyes On Me','Mysterious Light'
    }
    -- Magical spells with a Vit stat mod (on top of Int)
    blue_magic_maps.MagicalVit = S{
        'Thermal Pulse'
    }
    -- Magical spells with a Dex stat mod (on top of Int)
    blue_magic_maps.MagicalDex = S{
        'Charged Whisker','Gates of Hades'
    }           
    -- Magical spells (generally debuffs) that we want to focus on magic accuracy over damage.
    -- Add Int for damage where available, though.
    blue_magic_maps.MagicAccuracy = S{
        '1000 Needles','Absolute Terror','Actinic Burst','Auroral Drape',
		'Awful Eye','Blank Gaze','Blistering Roar','Blood Drain',
		'Blood Saber','Chaotic Eye','Cimicine Discharge','Cold Wave',
		'Corrosive Ooze','Demoralizing Roar','Digest','Dream Flower',
		'Enervation','Feather Tickle','Filamented Hold','Frightful Roar',
		'Geist Wall','Hecatomb Wave','Infrasonics','Jettatura',
		'Light of Penance','Lowing','Mind Blast','Mortal Ray',
		'MP Drainkiss','Osmosis','Reaving Wind','Sandspin',
		'Sandspray','Sheep Song','Soporific','Sound Blast','Stinking Gas',
        'Sub-zero Smash','Venom Shell','Voracious Trunk','Yawn'
    }       
    -- Breath-based spells
    blue_magic_maps.Breath = S{
        'Bad Breath','Flying Hip Press','Frost Breath','Heat Breath',
        'Hecatomb Wave','Magnetite Cloud','Poison Breath','Radiant Breath',
		'Self-Destruct','Thunder Breath','Vapor Spray','Wind Breath'
    }
    -- Stun spells
    blue_magic_maps.Stun = S{
        'Blitzstrahl','Frypan','Head Butt','Sudden Lunge','Tail slap',
		'Temporal Shift','Thunderbolt','Whirl of Rage'
    }        
    -- Healing spells
    blue_magic_maps.Healing = S{
        'Healing Breeze','Magic Fruit','Plenilune Embrace','Pollen',
		'Restoral','White Wind','Wild Carrot'
    }  
    -- Buffs that depend on blue magic skill
    blue_magic_maps.SkillBasedBuff = S{
        'Barrier Tusk','Diamondhide','Magic Barrier','Metallic Body',
		'Plasma Charge','Pyric Bulwark','Reactor Cool'
    }
    -- Other general buffs
    blue_magic_maps.Buff = S{
        'Amplification','Animating Wail','Battery Charge',
		'Carcharian Verve','Cocoon','Erratic Flutter','Exuviation',
		'Fantod','Feather Barrier','Harden Shell','Memento Mori',
		'Nat. Meditation','Occultation','Orcish Counterstance','Refueling',
        'Regeneration','Saline Coat','Triumphant Roar','Warm-Up',
		'Zephyr Mantle'
    }   
--[[
Spells that require Unbridled Learning to cast. 
]]
    unbridled_spells = S{
        'Absolute Terror','Bilgestorm','Blistering Roar','Bloodrake',
		'Carcharian Verve','Crashing Thunder','Droning Whirlwind',
		'Gates of Hades','Harden Shell','Polar Roar',
        'Pyric Bulwark','Thunderbolt','Tourbillion','Uproot','Mighty Guard'
	}
  --[[ Moonshade earring and Gav. Helmet ]]
	moonshade_WS = S{
		"Savage Blade", "Vorpal Blade", 
        "Requiescat", 'Sanguine Blade', "Chant du Cygne"
	}
	gav_ws = S{
		"Torcleaver","Resolution","Catastrophe",
		"Scourge","Cross Reaper"
	}
end 
--------------------------
--  User Setup Section  --
--------------------------
function user_setup()
	state.IdleMode:options('Normal', 'Cleaving')
  	state.OffenseMode:options('Normal', 'Learning')
  	state.HybridMode:options('Normal', 'MagicEva')
  	state.WeaponskillMode:options('Normal', 'Mid', 'Acc')
  	state.CastingMode:options('Normal', 'Acc')
  --[[ User Created states ]]
	state.CapacityMode = M(false, 'Capacity Point Mantle')
--[[ Organizer stuff ]]
	organizer_items = {
		echos="Echo Drops",
		shihei="Shihei",	
		main="Vampirism",
		sub="Vampirism",
		food="Sublime Sushi",
	}	
  --[[ Loading of various functions ]]
  	job_update()
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
		send_command('gs c set mainWeapon Colada')
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
	if state.IdleMode.value == "Cleaving" then 
		idleSet = set_combine(idleSet, sets.PDT)
	elseif state.IdleMode.value == "Normal" then 
		idleSet = set_combine(idleSet, sets.idle)
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
	if state.mainWeapon.value == "Colada" then 
		equip({main="Colada", sub="Vampirism"})
	elseif state.mainWeapon.value == "Vampirism" then 
		equip({main="Vampirism", sub="Vampirism"})
	elseif state.mainWeapon.value == "Naegling" then 
		equip({main="Naegling", sub="Vampirism"})
	end	
	return idleSet
end 
-------------------------------
--  Custom Melee Gear set    --
-------------------------------
function customize_melee_set(meleeSet)
	local abil_recasts = windower.ffxi.get_ability_recasts()
	if state.OffenseMode.value == "Acc" then 
		state.WeaponskillMode:set("Acc")
	elseif state.OffenseMode.value == "Normal" then  
		state.WeaponskillMode:reset()
	end		
	if state.HybridMode.value == "MagicEva" then 
		meleeSet = set_combine(meleeSet, sets.MagicEva)
	elseif state.HybridMode.value == "DT" then 
		meleeSet = set_combine(meleeSet, sets.DT)
	end
	if state.CapacityMode.value then 
		meleeSet = set_combine(meleeSet, sets.CapacityMantle)
	end 
	if state.Buff.Doom then
		meleeSet = set_combine(meleeSet, sets.buff.Doom)
	end
	if state.mainWeapon.value == "Colada" then 
		equip({main="Colada", sub="Vampirism"})
	elseif state.mainWeapon.value == "Vampirism" then 
		equip({main="Vampirism", sub="Vampirism"})
	elseif state.mainWeapon.value == "Naegling" then 
		equip({main="Naegling", sub="Vampirism"})
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
		state.CombatForm:set("DW")
	else
		state.CombatForm:reset()
	end 
	if player.sub_job == 'WAR' or player.status == 'Engaged' then
		state.CombatForm:set("DW")
	else
		state.CombatForm:reset()
	end
end 
function get_combat_weapon()
	if state.mainWeapon.value == "Colada" then 
		equip({main="Colada", sub="Vampirism"})
	elseif state.mainWeapon.value == "Vampirism" then 
		equip({main="Vampirism", sub="Vampirism"})
	elseif state.mainWeapon.value == "Naegling" then 
		equip({main="Naegling", sub="Vampirism"})
	end	
	return get_combat_weapon
end 
function job_state_change() 
	if stateField == 'Offense Mode' then
		if newValue == 'Melee' then
			enable('range')
		else
			disable('range')
		end
	end	
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
	if unbridled_spells:contains(spell.english) and not state.Buff['Unbridled Learning'] then
        eventArgs.cancel = true
        windower.send_command('@input /ja "Unbridled Learning" <me>; wait 1.5; input /ma "'..spell.name..'" '..spell.target.name)
    end
	if spell.english == 'Chant du Cygne' and world.area == "Bhaflau Remnants" and player.hpp < 60 then
		cancel_spell()
		send_command('@ input /ws "Sanguine Blade" <t>')
	end
	if spell.english == 'Chant du Cygne' and world.area == "Bhaflau Remnants" then
		if (player.tp >= 3000) then
			cancel_spell()
			send_command('@ input /ws "Savage Blade" <t>')
			equip({waist="Chaac belt"})
		end 
	end 
	if world.area == "Bhaflau Remnants" then
		equip({waist="Chaac belt"})
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
  -- Add enhancement gear for Chain Affinity, etc.
    if spell.skill == 'Blue Magic' then
        for buff,active in pairs(state.Buff) do
            if active and sets.buff[buff] then
                equip(sets.buff[buff])
            end
        end
        if spellMap == 'Healing' and spell.target.type == 'SELF' and sets.self_healing then
            equip(sets.self_healing)
        end
    end
    -- If in learning mode, keep on gear intended to help with that, regardless of action.
    if state.OffenseMode.value == 'Learning' then
        equip(sets.Learning)
    end
end
-------------------------
--  after-cast Section --
-------------------------
function job_aftercast(spell, spellMap, eventArgs)
	
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
--[[ Haste Buffs Rules	]]	
	if S{'haste', 'march', 'mighty guard', 'embrava', 'haste samba', 'geo-haste', 'indi-haste'}:contains(buff:lower()) then
        if not midaction() then
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
	send_command('wait 4; input //gs org get')
	if player.sub_job == 'RDM' then
        set_macro_page(1, 7)
    else
        set_macro_page(1, 7)
    end
end
function set_lockstyle()
	send_command('wait 4; input /lockstyleset 4')
end
----------------------------------
--	Command Section for Warping	--
----------------------------------
function user_job_self_command(commandArgs, eventArgs) 
	include('commands')
end