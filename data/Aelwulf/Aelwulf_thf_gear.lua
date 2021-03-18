include('augments.lua')
----------------------
--	Field/Town Idle	--
----------------------
 sets.idle = {
		ammo="Staunch Tathlum",
		head="Meghanada visor +1",
		neck="Twilight torque",
		ear1="Odnowa Earring",
		ear2="Odnowa Earring +1",
		body="Meghanada Cuirie +2",
		hands="Malignance gloves",
		ring1="Defending Ring",
		ring2="Vocane ring",
		back="Solemnity Cape",
		waist="Flume Belt",
		legs="Meghanada Chausses +1",
		feet="",
	}
    sets.idle.MagicEva = set_combine(sets.idle, {
		hands="Malignance gloves",
	})
    sets.idle.Regen = set_combine(sets.idle, {
		head="Ocelomeh Headpiece +1",
		neck="Wiglen Gorget",
		ring1="Sheltered Ring",
		ring2="Paguroidea Ring"
	})
	sets.Weapons = {
		main="Sandung",
		sub="Skinflayer",
	}
------------------------------------------
--	 Special sets (required by rules)	--
------------------------------------------
    sets.TreasureHunter = {
		hands="Plunderer's Armlets", 
		feet="Skulker's Poulaines", 
		--waist="Chaac Belt"
	}
    sets.ExtraRegen = {
		head="Ocelomeh Headpiece +1",
		neck="Wiglen Gorget",
		ring1="Sheltered Ring",
		ring2="Paguroidea Ring"
	}
    sets.Kiting = {
		feet="Fajin Boots"
	}
    sets.buff['Sneak Attack'] = {
		ammo="Yetshila",
        head="Adhemar Bonnet +1",
		neck="Caro Necklace",
		ear1="Brutal Earring",
		ear2="Cessance Earring",
        body="Abnoba Kaftan",
		hands="Plunderer's Armlets +1",
		ring1="Ramuh Ring +1",
		ring2="Epona's Ring",
        back=thf_crit,
		waist="Chaac Belt",
		legs="Pillager's Culottes +3",
		feet="Skulker's Poulaines +1"
	}
    sets.buff['Trick Attack'] = set_combine(sets.buff['Sneak Attack'], {
		ring1="Garuda Ring"
	})
------------------------------------------
-- 	Actions we want to use to tag TH.	--
------------------------------------------
    sets.precast.Step = set_combine(sets.TreasureHunter, {})
    sets.precast.Flourish1 = set_combine(sets.TreasureHunter, {})
    sets.precast.JA.Provoke = set_combine(sets.TreasureHunter, {})
--------------------------
--	Precast Gearsets	--
--------------------------
	sets.precast.JA['Collaborator'] = {
		head="Skulker's Bonnet +1"
	}
    sets.precast.JA['Accomplice'] = {
		head="Skulker's Bonnet +1"
	}
    sets.precast.JA['Assassins Charge'] = {
		feet="Plunderer's Poulaines +1"
	}
    sets.precast.JA['Ambush'] = {}
    sets.precast.JA['Flee'] = {
		feet="Pillager's Poulaines +1"
	}
    sets.precast.JA['Hide'] = {
		body="Pillager's Vest +2"
	}
    sets.precast.JA['Conspirator'] = {
		body="Skulker's Vest"
	}
    sets.precast.JA['Steal'] = {
		hands="Pillager's Armlets +1",
		legs="Pillager's Culottes +3",
		feet="Pillager's Poulaines +1"
	}
    sets.precast.JA['Despoil'] = {
		feet="Skulker's Poulaines +1"
	}
    sets.precast.JA['Perfect Dodge'] = {
		hands="Plunderer's Armlets +1"
	}
    sets.precast.JA['Feint'] = {
		legs="Plunderer's Culottes +1"
	}
    sets.precast.JA['Sneak Attack'] = set_combine(sets.buff['Sneak Attack'])
    sets.precast.JA['Trick Attack'] = set_combine(sets.buff['Trick Attack'])
    sets.precast.JA['Mug'] = set_combine(sets.precast.WS, {
		ammo="Jukukik Feather",
		head="Adhemar Bonnet +1",
		ear1="Suppanomimi",
		ear2="Sherida Earring",
        waist="Grunfeld Rope",
	})
    organizer_items = {
        "Taming Sari",
        "Raider's Boomerang",
        "Aeneas",
        "Oneiros Knife"
	}
    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
		waist="Gishdubar Sash"
		--ring1="Kunaji Ring",
	}
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
    -- Fast cast sets for spells
    sets.precast.FC = {
		ammo="Impatiens",
		neck="Orunmila's Torque",
		ear1="Enchanter Earring +1",
		ear2="Loquacious Earring",
		body="Dread Jupon",
		hands="Leyline Gloves",
		ring1="Kishar Ring",
		ring2="Veneficium Ring"
	}
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {
		neck="Magoraga Beads"
	})
    -- Ranged snapshot gear
    sets.precast.RA = {}
--------------------------
--	Midcast Gearsets	--
--------------------------
	sets.midcast.FastRecast = {}
    ---------------------
	-- Specific spells --
	---------------------
    sets.midcast.Utsusemi = {
		ammo="Staunch Tathlum",
		neck="Magoraga Beads",
		ear1="Enchanter Earring +1",
		ear2="Loquacious Earring",
        body="Dread Jupon",
		hands="Leyline Gloves",
		ring1="Kishar Ring",
		ring2="Prolix Ring",
        back="Moonbeam Cape",
		waist="Flume Belt",
		legs="Meghanada Chausses +2",
	}
    -- Ranged gear
    sets.midcast.RA = {}
    sets.midcast.RA.Acc = {}
--------------------------
--	Engaged Gearsets	--
--------------------------
	-- Normal melee group
    -- THF Native DW Trait: 25% DWIII + 5% 550JP Gift
    -- No Haste (Need 44 DW)
    -- (Aeneas/Sari) Accuracy 1080, Attack 1140
    sets.engaged = {
		ammo="Yamarang",
        head="Dampening tam",
		body="Adhemar Jacket +1",
		legs="Samnuha Tights",
		neck="Anu Torque",
		ear1="Telos Earring",
		ear2="Eabani earring",
        ring1="Chirich ring",
		ring2="Epona's Ring",
        back="Toutatis's cape",
		waist="Reiki yotai",
	}
	sets.engaged.Ceremonial = set_combine(sets.engaged, { 
		
		hands="Plun. Armlets",
		
		legs="Samnuha tights",
		feet="Skulk. Poulaines",
		waist="Chaac belt"
		
	})
    sets.engaged.MagicEva = {
		ammo="Yamarang",
        head="Meghanada Visor +1",
		neck="Loricate Torque +1",
		ear1="Telos Earring",
		ear2="Sherida Earring",
        body="Meghanada Cuirie +2",
		hands="Meghanada Gloves +2",
		ring1="Defending Ring",
		ring2="Moonbeam Ring",
		waist="Reiki Yotai",
		legs="Meghanada Chausses +2",
	}
------------------------------
--	Weaponskill Gearsets	--
------------------------------
	sets.precast.WS = {
		ammo="Seething bomblet",
		head="Lustratio cap +1",
		body="Adhemar Jacket +1",
		hands="Meg. Gloves +2",
		legs="Samnuha tights",
		feet="Lustratio leggings +1",
		neck="Fotia Gorget",
		ear1="Ishvara Earring",
		ear2="Moonshade earring",
		waist="Fotia belt",
		back="Kayapa cape"
	}  
    ----------------------
    -- 	Rudra's Storm	--
    ----------------------
    sets.precast.WS['Rudra\'s Storm'] = set_combine(sets.precast.WS, {
		head="Lustratio cap +1",
		body="Bihu justaucorps +3",
		hands="Lustratio mittens +1",
		legs="Lustr. subligar +1",
		feet="Lustratio leggings +1",
		neck="Fotia Gorget",
		waist="Grunfeld Rope",
		ear1="Ishvara Earring",
		ear2="Moonshade Earring", 
		ring1="Apate Ring",
		ring2="Zilant Ring",
	}) 
    ------------------------
    -- 	Evisceration sets --
    ------------------------
    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {
		ammo="Yetshila",
		head="Pillager's Bonnet +3",
		neck="Fotia Gorget",
		ear2="Sherida Earring",
        ring1="Begrudging Ring",
		waist="Fotia Belt",
		legs="Lustratio Subligar +1"
	})