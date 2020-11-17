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
	send_command('bind !f9 gs c cycle Empty')
	send_command('bind !f10 gs c cycle DarkSealMode')
	send_command('bind !f11 gs c toggle LastResortMode')
	send_command('bind !f12 gs c toggle SouleaterMode')
	send_command('bind != gs c toggle CapacityMode')
	send_command('bind !` input /ma "Utsusemi: Ni" <me>')
	send_command('bind !q input /ma "Utsusemi: Ichi" <me>')
--[[ CtrlF9-CtrlF12 keybinds ]]
	send_command('bind ^f9 gs c cycle Empty')
	send_command('bind ^f10 gs c cycle Empty')
	send_command('bind ^f11 gs c cycle Empty')
	send_command('bind ^f12 gs c cycle Empty')
	send_command('bind ^` input /ma "Tonko: Ni" <me>')
	send_command('bind ^q input /ma "Monomi: Ichi" <me>')
--[[ WindowsF9-WindowsF12 keybinds ]]
	send_command('bind @f9 gs c set rangeWeapon Anarchy')
	send_command('bind @f10 gs c set rangeWeapon Fomalhaut')
	send_command('bind @f11 gs c set mainWeapon Ragnarok')
	send_command('bind @f12 gs c set mainWeapon Caladbolg')
	send_command('bind @` input /ma "Aquaveil" <me>')
	send_command('bind @q input /ma "Sheep Song" <t>')
end
--------------------------
--  Job Setup Section   --
--------------------------
function job_setup()
	state.mainWeapon = M{'None', 'Anarchy', 'Fomalhaut', 'Ragnarok', 'Anguta'}
	state.rangeWeapon = M{'None', 'Anarchy', 'Fomalhaut'}
	autows = "Torcleaver"
	autowstp = 1200
	autofood = 'Pear Crepe'
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
	state.warned = M(false)
	state.crafting = M(false)
	options.ammo_warning_limit = 10
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
	if S{"Eastern Adoulin","Western Adoulin"}:contains(world.area) then
		idleSet = set_combine(idleSet,{body="Councilor's Garb"})
	end
	if state.mainWeapon.value == "Fomalhaut" then 
		equip({main="Naegling", sub="Fettering blade", range="Fomalhaut"})
	elseif state.mainWeapon.value == "Anarchy" then 
		equip({main="Naegling", sub="Blurred knife +1", range="Anarchy +3"})
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
	if state.rangeWeapon.value == "Fomalhaut" then 
		equip({main="Naegling", sub="Fettering blade", range="Fomalhaut"})
	elseif state.rangeWeapon.value == "Anarchy" then 
		equip({main="Naegling", sub="Blurred knife +1", range="Anarchy +3"})
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
end 
function get_combat_weapon()
	if state.rangeWeapon.value == "Fomalhaut" then 
		equip({range="Fomalhaut"})
	elseif state.rangeWeapon.value == "Anarchy" then 
		equip({range="Anarchy +3"})
	end
	if state.WeaponskillMode.value == "Physical" then 
		equip({main="Naegling" sub="Blurred knife +1"})
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
	if player.equipment.main == 'Liberator' then
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
	--[[no spell maps for drk]]
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
	if spell.type=="Ninjutsu" then 
		check_tools(spell) 
	end 
	if spell.action_type == 'Ranged Attack' or
        (spell.type == 'WeaponSkill' and (spell.skill == 'Marksmanship' or spell.skill == 'Archery')) then
        check_ammo(spell, action, spellMap, eventArgs)
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
	if spell.type == 'WeaponSkill' then
		if spell.english == 'Trueflight' then
			if world.weather_element == 'Light' or world.day_element == 'Light' then
				equip({waist="Hachirin-no-Obi"})
			end
		elseif spell.english == 'Wildfire' and (world.weather_element == 'Fire' or world.day_element == 'Fire') then
			equip({waist="Hachirin-no-Obi"})
		end
	end
	if spell.action_type == 'Ranged Attack' then
		if spell.action_type == 'Ranged Attack' then
			if flurry == 2 then
				equip(sets.precast.RA.Flurry2)
			elseif flurry == 1 then
				equip(sets.precast.RA.Flurry1)
			end
		end
	end
end 
-----------------------
--  Mid-cast Section --
-----------------------
function job_midcast(spell, spellMap, eventArgs)
	if spell.type == 'CorsairShot' or spell.action_type == 'Ranged Attack' then
		if state.CapacityMode.value then
			equip(sets.CapacityMantle)
		end
	end
end
function job_post_midcast(spell, spellMap, eventArgs)
	if spell.action_type == 'Ranged Attack' then
		if buffactive['Double Shot'] then
			equip(sets.DoubleShot)
		end
		if state.Buff.Barrage then
			equip(sets.buff.Barrage)
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
	if spell.english == "Shadowbind" then
		send_command('@timers c "Shadowbind ['..spell.target.name..']" 42 down abilities/00122.png')
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
--------------------------
-- Define Roll Values	--
--------------------------
	function define_roll_values()
		rolls = {
			["Corsair's Roll"]   = {lucky=5, unlucky=9, bonus="Experience Points"},
			["Ninja Roll"]       = {lucky=4, unlucky=8, bonus="Evasion"},
			["Hunter's Roll"]    = {lucky=4, unlucky=8, bonus="Accuracy"},
			["Chaos Roll"]       = {lucky=4, unlucky=8, bonus="Attack"},
			["Magus's Roll"]     = {lucky=2, unlucky=6, bonus="Magic Defense"},
			["Healer's Roll"]    = {lucky=3, unlucky=7, bonus="Cure Potency Received"},
			["Puppet Roll"]      = {lucky=4, unlucky=8, bonus="Pet Magic Accuracy/Attack"},
			["Choral Roll"]      = {lucky=2, unlucky=6, bonus="Spell Interruption Rate"},
			["Monk's Roll"]      = {lucky=3, unlucky=7, bonus="Subtle Blow"},
			["Beast Roll"]       = {lucky=4, unlucky=8, bonus="Pet Attack"},
			["Samurai Roll"]     = {lucky=2, unlucky=6, bonus="Store TP"},
			["Evoker's Roll"]    = {lucky=5, unlucky=9, bonus="Refresh"},
			["Rogue's Roll"]     = {lucky=5, unlucky=9, bonus="Critical Hit Rate"},
			["Warlock's Roll"]   = {lucky=4, unlucky=8, bonus="Magic Accuracy"},
			["Fighter's Roll"]   = {lucky=5, unlucky=9, bonus="Double Attack Rate"},
			["Drachen Roll"]     = {lucky=3, unlucky=7, bonus="Pet Accuracy"},
			["Gallant's Roll"]   = {lucky=3, unlucky=7, bonus="Defense"},
			["Wizard's Roll"]    = {lucky=5, unlucky=9, bonus="Magic Attack"},
			["Dancer's Roll"]    = {lucky=3, unlucky=7, bonus="Regen"},
			["Scholar's Roll"]   = {lucky=2, unlucky=6, bonus="Conserve MP"},
			["Bolter's Roll"]    = {lucky=3, unlucky=9, bonus="Movement Speed"},
			["Caster's Roll"]    = {lucky=2, unlucky=7, bonus="Fast Cast"},
			["Courser's Roll"]   = {lucky=3, unlucky=9, bonus="Snapshot"},
			["Blitzer's Roll"]   = {lucky=4, unlucky=9, bonus="Attack Delay"},
			["Tactician's Roll"] = {lucky=5, unlucky=8, bonus="Regain"},
			["Allies's Roll"]    = {lucky=3, unlucky=10, bonus="Skillchain Damage"},
			["Miser's Roll"]     = {lucky=5, unlucky=7, bonus="Save TP"},
			["Companion's Roll"] = {lucky=2, unlucky=10, bonus="Pet Regain and Regen"},
			["Avenger's Roll"]   = {lucky=4, unlucky=8, bonus="Counter Rate"},
		}
	end
	function display_roll_info(spell)
		rollinfo = rolls[spell.english]
		local rollsize = 'Small'
		if state.LuzafRing then
			rollsize = 'Large'
		end
		if rollinfo then
			add_to_chat(36, spell.english..' provides a bonus to '..rollinfo.bonus..'.  Roll size: '..rollsize)
			add_to_chat(217, 'Lucky roll is '..tostring(rollinfo.lucky)..', Unlucky roll is '..tostring(rollinfo.unlucky)..'.')
		end
	end
----------------------------
--	Bullet Check Function --
----------------------------
function do_bullet_checks(spell, spellMap, eventArgs)
	local bullet_name
	local bullet_min_count = 1
	if spell.type == 'WeaponSkill' then
		if spell.skill == "Marksmanship" then
			if spell.element == 'None' then
				-- physical weaponskills
				bullet_name = gear.WSbullet
			else
				-- magical weaponskills
				bullet_name = gear.MAbullet
			end
		else
-- Ignore non-ranged weaponskills
			return
		end
	elseif spell.type == 'CorsairShot' then
		bullet_name = gear.QDbullet
	elseif spell.action_type == 'Ranged Attack' then
		bullet_name = gear.RAbullet
		if buffactive['Triple Shot'] then
			bullet_min_count = 3
		end
	end
	local available_bullets = player.inventory[bullet_name] or player.wardrobe2[bullet_name]
-- If no ammo is available, give appropriate warning and end.
	if not available_bullets then
		if spell.type == 'CorsairShot' and player.equipment.ammo ~= 'empty' then
			add_to_chat(104, 'No Quick Draw ammo left.  Using what\'s currently equipped ('..player.equipment.ammo..').')
			return
		elseif spell.type == 'WeaponSkill' and player.equipment.ammo == gear.RAbullet then
			add_to_chat(104, 'No weaponskill ammo left.  Using what\'s currently equipped (standard ranged bullets: '..player.equipment.ammo..').')
			return
		else
			add_to_chat(104, 'No ammo ('..tostring(bullet_name)..') available for that action.')
			eventArgs.cancel = true
			return
		end
	end
-- Don't allow shooting or weaponskilling with ammo reserved for quick draw.
	if spell.type ~= 'CorsairShot' and bullet_name == gear.QDbullet and available_bullets.count <= bullet_min_count then
		add_to_chat(104, 'No ammo will be left for Quick Draw.  Cancelling.')
		eventArgs.cancel = true
		return
	end
-- Low ammo warning.
	if spell.type ~= 'CorsairShot' and not state.warned
		and available_bullets.count > 1 and available_bullets.count <= options.ammo_warning_limit then
		local msg = '**** LOW AMMO WARNING: '..bullet_name..' ****'
		local border = ""
		for i = 1, #msg do
			border = border .. "*"
		end
		add_to_chat(104, border)
		add_to_chat(104, msg)
		add_to_chat(104, border)
		state.warned = true
	elseif available_bullets.count > options.ammo_warning_limit and state.warned then
		state.warned = false
	end
end
--------------------------
--	Checking for flurry	--
--------------------------
windower.register_event('action',
function(act)
--check if you are a target of spell
    local actionTargets = act.targets
		playerId = windower.ffxi.get_player().id
		isTarget = false
    for _, target in ipairs(actionTargets) do
        if playerId == target.id then
            isTarget = true
        end
    end
	if isTarget == true then
        if act.category == 4 then
            local param = act.param
            if param == 845 and flurry ~= 2 then
    add_to_chat(122, 'Flurry Status: Flurry I')
                flurry = 1
            elseif param == 846 then
    add_to_chat(122, 'Flurry Status: Flurry II')
                flurry = 2
            end
        end
    end
end)
----------------------------------------
--  Selecting and Setting the default --
--	Macro book and Lock style 		  --
----------------------------------------
function select_default_macro_book()
	set_macro_page(1, 14)
	send_command('wait 4; input //gs org get')
end
function set_lockstyle()
	send_command('wait 4; input /lockstyleset 14')
end
----------------------------------
--	Command Section for Warping	--
----------------------------------
function user_job_self_command(commandArgs, eventArgs) 
	include('commands')
end