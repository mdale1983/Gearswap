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
		send_command('bind f12 gs c cycle CastingMode')
	--[[ AltF9-AltF12 keybinds ]]
		send_command('bind !f9 gs c cycle stance')
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
		send_command('bind @f9 gs c set mainWeapon Masamune')
		send_command('bind @f10 gs c set mainWeapon Empty')
		send_command('bind @f11 gs c set mainWeapon Amanomurakumo')
		send_command('bind @f12 gs c set mainWeapon Norifusa')
  end 
--------------------------
--  Job Setup Section   --
--------------------------
	function job_setup()
		state.mainWeapon = M{'None', 'Masamune', 'Dojikiri Yasutsuna', 'Norifusa', 'Amanomurakumo'}
		oneHandList = S{'replace with your weapons'}
		gktList = S{'Umaru', 'Kurikaranotachi'}
		bowList = S{'Hangaku-no-Yumi', 'Yoichinoyumi', 'Fail-Not'}
  --[[ Moonshade earring and Gav. Helmet ]]
		moonshade_WS = S{
			"Tachi: Fudo", "Tachi: Rana", "Tachi: Kasha", "Tachi: Gekko", "Tachi: Jinpu"
		}
		gav_ws = S{
			"Tachi: Fudo","Tachi: Kasha","Tachi: Gekko"
		}
	state.Buff.Sekkanoki = buffactive.Sekkanoki or false
    state.Buff.Sengikori = buffactive.Sengikori or false
    state.Buff['Meikyo Shisui'] = buffactive['Meikyo Shisui'] or false
	state.Buff['Aftermath: Lv.3'] = buffactive['Aftermath: Lv.3'] or false
	state.Buff['Third Eye'] = buffactive['Third Eye'] or false
    state.Buff.Hasso = buffactive.Hasso or false
    state.Buff.Seigan = buffactive.Seigan or false
	state.Stance = M{['description']='Stance','Hasso','Seigan'}

	autows = 'Tachi: Fudo'
	rangedautows = "Apex Arrow"
	autofood = 'Soy Ramen'
	
	state.Stance = M{['description']='Stance','Hasso','Seigan','None'}
	init_job_states({"Capacity","AutoWSMode","AutoFoodMode","AutoBuffMode",},{"AutoSambaMode","Weapons","Stance",})
	end 
--------------------------
--  User Setup Section  --
--------------------------
	function user_setup()
		state.IdleMode:options('Normal', 'MagicEva')
		state.OffenseMode:options('Normal', 'Reraise')
		state.HybridMode:options('Normal', 'MagicEva')
		state.WeaponskillMode:options('Normal', 'Mid', 'Acc')
		state.CastingMode:options('Normal', 'Resistant', 'Enmity')
	  --[[ User Created states ]]
		state.Buff.Sekkanoki = buffactive.Sekkanoki or false
		state.Buff.Sengikori = buffactive.Sengikori or false
		state.Buff['Meikyo Shisui'] = buffactive['Meikyo Shisui'] or false
		state.CapacityMode = M(false, 'Capacity Point Mantle')
	  --[[ Loading of various functions ]]
		job_update()
		select_default_macro_book()
		set_lockstyle()
		get_player_name()
		job_binds()
	end 
	function get_player_name()
  	if windower.ffxi.get_player() then 
    	self = windower.ffxi.get_player().name
    	roll = windower.ffxi.get_player().main_job_full
    	windower.add_to_chat(7, 'Hello '..self..' your '..roll..' LUA is now loaded')
    	windower.add_to_chat(7, 'The gerbils are fetching your '..roll..' Lockstyle!')
		state.mainWeapon:set('Masamune')
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
	--[[ CtrlF9-CtrlF12 unbind's ]]
		send_command('unbind ^f9')
		send_command('unbind ^f10')
		send_command('unbind ^f11')
		send_command('unbind ^f12')
	--[[ WindowsF9-WindowsF12 unbind's ]]
		send_command('unbind @f9')
		send_command('unbind @f10')
		send_command('unbind @f11')
		send_command('unbind @f12')
  end 
----------------------------------------------
--  This tells Gear swap what sets to fetch  --
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
		if player.hpp < 80 then 
			idleSet = set_combine(idleSet, sets.regen)
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
		if state.IdleMode.value == "MagicEva" then 
			meleeSet = set_combine(meleeSet, sets.idle.MagicEva)
		end 
		if state.OffenseMode.value == "Reraise" then 
			meleeSet = set_combine(meleeSet, sets.Reraise)
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
			if gktList:contains(player.equipment.main) then
				state.CombatWeapon:set('GreatSword')
			elseif bowList:contains(player.equipment.main) then
				state.CombatWeapon:set('Engaged')
			elseif player.equipment.main == 'Masamune' then
				state.CombatWeapon:set('Masamune')
				set_macro_page(1, 5)
			elseif player.equipment.main == 'Amanomurakumo' then
				state.CombatWeapon:set('Amanomurakumo')
				set_macro_page(1, 5)
			elseif player.equipment.main == 'Dojikiri Yasutsuna' then
				state.CombatWeapon:set('Dojikiri Yasutsuna')
				set_macro_page(1, 5)
			elseif player.equipment.main == 'Norifusa' then
				state.CombatWeapon:set('Norifusa')
				set_macro_page(1, 5)
			end
		end 
	end 
	function get_combat_form()
if CombatForm == 'DW' then 
		classes.CustomMeleeGroups:clear()
	-- Haste (white magic) 15%  [33]
	-- Haste Samba (Sub) 5%		[370]
	-- Mighty Guard - 15%		[604]
	-- Victory March +3/+4/+5     14%/15.6%/17.1%
	-- Advancing March +3/+4/+5   10.9%/12.5%/14%
	-- Embrava 25%
		if (buffactive[604] and buffactive[33]) or buffactive.march == 2 then
			classes.CustomMeleeGroups:append('Haste_43')
			add_to_chat(8, '------------43% Haste Detected, equipping 11 DW to cap------------')
		elseif buffactive.embrava and buffactive.haste then
			classes.CustomMeleeGroups:append('Haste_40')
			add_to_chat(8, '-------------40% Haste Detected, equipping 27DW to cap-------------')
		elseif buffactive.haste then
			classes.CustomMeleeGroups:append('Haste_30')
			add_to_chat(8, '-------------30% Haste Detected, equipping 31DW to cap--------------')
		else 
			classes.CustomMeleeGroups:append('DW')
			add_to_chat(8, '-------------No Haste Detected, equipping 49DW to cap--------------')
		end
	end 
	end 
	function get_combat_weapon()
		if state.mainWeapon.value == "Masamune" then 
			equip({main="Masamune", sub="Utu grip"})
				set_macro_page(1, 5)
		elseif state.mainWeapon.value == "Amanomurakumo" then 
			equip({main="Ragnarok", sub="Utu grip"})
				set_macro_page(1, 5)
		elseif state.mainWeapon.value == "Dojikiri Yasutsuna" then 
			equip({main="Dojikiri Yasutsuna", sub="Utu grip"})
				set_macro_page(1, 5)
		elseif state.mainWeapon.value == "Norifusa" then 
			equip({main="Norifusa", sub="Utu grip"}) 
				set_macro_page(1, 5)
		end
		if gktList:contains(player.equipment.main) then
			state.CombatWeapon:set("GKT")
		--[[elseif bowList:contains(player.equipment.main) then
			state.CombatWeapon:set("RA")]]
		elseif player.equipment.main == 'Masamune' then
			state.CombatWeapon:set('Masamune')
		elseif player.equipment.main == 'Amanomurakumo' then
			state.CombatWeapon:set('Amanomurakumo')
		elseif player.equipment.main == 'Norifusa' then
			state.CombatWeapon:set('Norifusa')
		elseif player.equipment.main == "Dojikiri Yasutsuna" then 
			state.CombatWeapon:set("Dojikiri Yasutsuna")
		end	
		return get_combat_weapon
	end 
	function job_state_change() 
		
	end 
	function update_melee_group()
	--[[ Can use this to create your own custom Template ]]
		classes.CustomMeleeGroups:clear()
		-- mythic AM	
		if player.equipment.main == 'Kogarasumaru' then
			if buffactive['Aftermath: Lv.3'] then
				classes.CustomMeleeGroups:append('AM3')
			end
		elseif buffactive['Aftermath'] then
			classes.CustomMeleeGroups:append('AM')
		end
		if player.equipment.main == 'Masamune' then 
			if buffactive['Aftermath: Lv.3'] then 
				classes.CustomMeleeGroups:append('AM3')
				add_to_chat(8, '***Masamune AM active. 50% Triple Damage***')
			end
		elseif buffactive['Aftermath'] then
			classes.CustomMeleeGroups:append('AM')
		end
		if player.equipment.main == 'Dojikiri Yasutsuna' then 
			if buffactive['Aftermath: Lv.3'] then 
				classes.CustomMeleeGroups:append('AM3')
				add_to_chat(8, '***Dojikiri Yasutsuna AM active. Ultimate SC Available***')
			end
		elseif buffactive['Aftermath'] then
			classes.CustomMeleeGroups:append('AM')
		end
		if player.equipment.main == 'Amanomurakumo' then 
			if buffactive['Aftermath: Lv.3'] then 
				classes.CustomMeleeGroups:append('AM3')
				add_to_chat(8, '***Amanomurakumo AM active. sTP+10 Zanshin +10***')
			end
		elseif buffactive['Aftermath'] then
			classes.CustomMeleeGroups:append('AM')
		end		
		if buffactive['Samurai Roll'] then
			classes.CustomRangedGroups:append('SamRoll')
		end
	end
-------------------------------------
--  Creating a custom spellMap,    --
-------------------------------------
	function job_get_spell_map(spell, default_spell_map)
		--[[no spell maps for sam]] 
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
	function job_precast(spell, action, spellMap, eventArgs)
		if spell.type=="Ninjutsu" then 
			check_tools(spell) 
		end 
	end 
	function job_post_precast(spell, spellMap, eventArgs)
		if spell.type == 'WeaponSkill' then
			if world.time >= 17*60 or world.time < 7*60 then -- Dusk to Dawn time.
				equip({ear2="Lugra Earring +1", ear1="Lugra Earring"})
			end
		end
		if spell.action_type=="Magic" and buffactive.Silence then
			eventArgs.cancel = true
			send_command('input /item "Echo Drops" <me>')
		end
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
		if spell.type:lower() == 'weaponskill' then
			if state.Buff.Sekkanoki then
				equip(sets.buff.Sekkanoki)
			end
			if state.Buff.Sengikori then
				equip(sets.buff.Sengikori)
			end
			if state.Buff['Meikyo Shisui'] then
				equip(sets.buff['Meikyo Shisui'])
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
		if state.HybridMode.value == 'Reraise' or
			(state.HybridMode.value == 'Physical' and state.ReraiseMode.value == 'Reraise') then
			equip(sets.Reraise)
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
	--[[ Job Specific Buff handling ]]
		if buff == "Seigan" and player.status == 'Engaged' then
            if gain then
                send_command('@wait 1.0;input /ja "Third Eye" <me>')
            elseif not midaction() then
                send_command('@wait 1.0;input /ja "Hasso" <me>')
            end
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
			set_macro_page(1, 5)
		elseif player.sub_job == 'DRK' then 
			set_macro_page(3, 5)
		elseif player.sub_job == 'DNC' then
			set_macro_page(1, 5)
		elseif player.sub_job == 'NIN' then
			set_macro_page(1, 5)
		else
			set_macro_page(1, 5)
		end
	end
	function set_lockstyle()
		send_command('wait 4; input /lockstyleset 12')
	end	
--
--
--
function job_tick()
	if check_hasso() then return true end
	if check_buff() then return true end
	return false
end
function check_hasso()
	if not (state.Stance.value == 'None' or state.Buff.Hasso or state.Buff.Seigan) and player.in_combat then
		
		local abil_recasts = windower.ffxi.get_ability_recasts()
		
		if state.Stance.value == 'Hasso' and abil_recasts[138] < latency then
			windower.chat.input('/ja "Hasso" <me>')
			tickdelay = os.clock() + 1.8
			return true
		elseif state.Stance.value == 'Seigan' and abil_recasts[139] < latency then
			windower.chat.input('/ja "Seigan" <me>')
			tickdelay = os.clock() + 1.8
			return true
		else
			return false
		end
	end

	return false
end
function check_buff()
	if state.AutoBuffMode.value and player.in_combat then
		
		local abil_recasts = windower.ffxi.get_ability_recasts()

		if player.sub_job == 'DRK' and not buffactive['Last Resort'] and abil_recasts[87] < latency then
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
		
	return false
end
----------------------------------
--	Command Section for Warping	--
----------------------------------
function user_job_self_command(commandArgs, eventArgs) 
	include('commands')
end
