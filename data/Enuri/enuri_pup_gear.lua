include('augments.lua')
	defaultManeuvers = {
		Melee = {
			{Name='Fire Maneuver', 	  Amount=1},
			{Name='Thunder Maneuver', Amount=1},
			{Name='Wind Maneuver', 	  Amount=1},
			{Name='Light Maneuver',	  Amount=0},
		},
		Ranged = {
			{Name='Wind Maneuver', 	  Amount=3},
			{Name='Fire Maneuver',	  Amount=0},
			{Name='Light Maneuver',	  Amount=0},
			{Name='Thunder Maneuver', Amount=0},
		},
		HybridRanged = {
			{Name='Wind Maneuver', 	  Amount=1},
			{Name='Fire Maneuver',	  Amount=1},
			{Name='Light Maneuver',	  Amount=1},
			{Name='Thunder Maneuver', Amount=0},
		},
		Tank = {
			{Name='Earth Maneuver',	  Amount=1},
			{Name='Fire Maneuver',	  Amount=1},
			{Name='Light Maneuver',	  Amount=1},
			{Name='Dark Maneuver',	  Amount=0},
		},
		Btank = { 
			{Name='Water Maneuver',	  Amount=0},
			{Name='Light Maneuver',	  Amount=1},
			{Name='Fire Maneuver',	  Amount=2},
		},
		Skillup = { 
			{Name='Water Maneuver',	  Amount=2},
			{Name='Light Maneuver',	  Amount=0},
			{Name='Fire Maneuver',	  Amount=1},
		},
		Lilith = {
			{Name='Earth Maneuver',	  Amount=0},
			{Name='Fire Maneuver',	  Amount=1},
			{Name='Light Maneuver',	  Amount=2},
			{Name='Dark Maneuver',	  Amount=0},
		},
		LightTank = {
			{Name='Earth Maneuver',	  Amount=1},
			{Name='Fire Maneuver',	  Amount=1},
			{Name='Light Maneuver',	  Amount=1},
			{Name='Dark Maneuver',	  Amount=0},
		},
		Magic = {
			{Name='Light Maneuver',	  Amount=1},
			{Name='Ice Maneuver',	  Amount=1},
			{Name='Dark Maneuver',	  Amount=1},
			{Name='Earth Maneuver',	  Amount=0},
		},
		Heal = {
			{Name='Light Maneuver',	  Amount=2},
			{Name='Dark Maneuver',	  Amount=1},
			{Name='Water Maneuver',	  Amount=0},
			{Name='Earth Maneuver',	  Amount=0},
		},
		Nuke = {
			{Name='Ice Maneuver',	  Amount=2},
			{Name='Dark Maneuver',	  Amount=1},
			{Name='Water Maneuver',	  Amount=0},
			{Name='Earth Maneuver',	  Amount=0},
		},
	}
----------------------
--  Field/Town Idle --
----------------------
	sets.idle = {
		range="Magneto",
		ammo="Automat. Oil +3",
        head="Rawhide Mask",
		neck="Loricate Torque +1",
		ear1="Etiolation Earring",
		ear2="Odnowa Earring +1",
        body="Vrikodara jupon",
		hands="Malignance Gloves",
		ring1="Defending Ring",
		ring2="Gelatinous ring +1",
        back="Solemnity cape",
		waist="Fucho-no-Obi",
		legs="Ryuo hakama",
		feet=Herc.Feet.PDT
	}	
	sets.idle.Refresh = {
        head="Rawhide Mask",
		neck="Loricate Torque +1",
		ear1="Etiolation Earring",
		ear2="Sanare Earring",
        body="Vrikodara Jupon",
		hands="",
		ring1="Defending Ring",
		ring2="Dark Ring",
        back="Moonlight Cape",
		waist="Fucho-no-Obi",
		legs="Rawhide Trousers",
		feet="Hippo. Socks +1"
	}	
	sets.Kiting = {
		feet="Hermes' sandals"
	}
	--------------------------------------------------------------
    -- Pet Sets for idle while pet is out (eg: pet regen gear)	--
	--------------------------------------------------------------
    sets.idle.Pet = {
        main="Midnights",
		head="Anwig Salade",
        body="Tali'ah manteel +1",
		hands="Rao kote +1",
		waist="Isa Belt",
		legs="Rao haidate +1",
		feet="Rao sune-ate +1",
		neck="Empath necklace",
		ear1="Handler's earring",
		ear2="Handler's earring +1",
		ring1="Defending ring",
		ring2="Gelatinous ring +1",
		back="Visucius's mantle"
	}
    -- Idle sets to wear while pet is engaged
    sets.idle.Pet.Engaged = {
		main="Ohtas",
		head="Anwig Salade",
        body="Tali'ah manteel +1",
		hands="Rao kote +1",
		waist="Isa Belt",
		legs="Rao haidate +1",
		feet="Rao sune-ate +1",
		neck="Loricate Torque +1",
		ear1="Handler's earring",
		ear2="Handler's earring +1",
		ring1="Defending ring",
		ring2="Gelatinous ring +1",
		back="Visucius's mantle"
	}
    sets.idle.Pet.Engaged.Ranged = set_combine(sets.idle.Pet.Engaged, {})
	sets.idle.Pet.Engaged.Melee = set_combine(sets.idle.Pet.Engaged, {})
	sets.idle.Pet.Engaged.Tank = set_combine(sets.idle.Pet.Engaged, {
		waist="Isa Belt",
		ear2="Handler's Earring +1"
	})
	sets.idle.Pet.Engaged.Btank = set_combine(sets.idle.Pet.Engaged, {
		waist="Isa Belt",
		ear2="Handler's Earring +1"
	})
	sets.idle.Pet.Engaged.LightTank = set_combine(sets.idle.Pet.Engaged, {
		waist="Isa Belt",
		ear2="Handler's Earring +1"
	})
    sets.idle.Pet.Engaged.Magic = set_combine(sets.idle.Pet.Engaged, {})
	sets.idle.Pet.Engaged.Heal = sets.idle.Pet.Engaged.Magic
	sets.idle.Pet.Engaged.Nuke = sets.idle.Pet.Engaged.Magic
------------------
--	Weapon sets	--
------------------
	sets.weapons.PetWeapons = {
		main="Ohtas",
		range="Animator P +1"
	}
	sets.weapons.Godhands = {
		main="Midnights",
		range="Animator P +1"
	}
	sets.weapons.Tokko = {
		main="Godhands",
		range="Animator P +1"
	}
	sets.weapons.Kenkonken = {
		main="Kenkonken",
		range="Animator P +1"
	}
--------------------------------------
-- 	Pre-cast Job Ability Gear-sets 	--	
--------------------------------------
	sets.precast.JA['Tactical Switch'] = {feet="Cirque Scarpe +2"}
    sets.precast.JA['Repair'] = {
		ammo="Automat. Oil +3",
		feet="Foire Babouches",
		ear1="",
	}
	sets.precast.JA['Activate'] = {
		back="Visucius's mantle"
	}
	sets.precast.JA['Maintenance'] = {
		ammo="Automat. Oil +3"
	}
	sets.precast.JA['Maneuver'] = {
		main="Midnights",
		neck="Buffoon's collar",
		body="Taeon tabard",
		hands="Foire Dastanas",
		back="Dispersal Mantle"
	}
----------------------------------
-- 	Pre-cast Magic Gear-sets 	--	
----------------------------------
	sets.precast.FC = {
		head="",
		neck="Voltsurge Torque",
		ear1="Enchntr. Earring +1",
		ear2="Loquac. Earring",
		body="Zendik Robe",
		hands="Malignance Gloves",
		ring1="Lebeche Ring",
		ring2="Prolix Ring",
		back="Perimede Cape",
		waist="Isa Belt",
		legs="Rawhide Trousers",
		feet="Regal Pumps +1"
	}
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})
----------------------------------
-- 	Mid-cast Magic Gear-Sets 	--
----------------------------------
	sets.midcast.FastRecast = {
		head="",
		neck="Voltsurge Torque",
		ear1="Enchntr. Earring +1",
		ear2="Loquac. Earring",
		body="Zendik Robe",
		hands="Malignance Gloves",
		ring1="Lebeche Ring",
		ring2="Prolix Ring",
		back="Perimede Cape",
		waist="Isa Belt",
		legs="Rawhide Trousers",
		feet="Regal Pumps +1"
	}
	sets.midcast.Dia = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	
    -- Midcast sets for pet actions
    sets.midcast.Pet.Cure = {}
	sets.midcast.Pet['Enfeebling Magic'] = {
		neck="Adad Amulet",
		ear1="Enmerkar Earring",
		ear2="Handler's Earring +1",
		body="",
		hands="Regimen Mittens",
		ring1="Varar Ring +1",
		ring2="Varar Ring +1",
		waist="Incarnation Sash",
		legs="Tali'ah Sera. +2"
	}
    sets.midcast.Pet['Elemental Magic'] = {
		neck="Adad Amulet",
		ear1="Enmerkar Earring",
		ear2="Handler's Earring +1",
		body="",
		hands="Regimen Mittens",
		ring1="Varar Ring +1",
		ring2="Varar Ring +1",
		waist="Incarnation Sash",
		legs="Tali'ah Sera. +2"
	}
--------------------------
-- 	engaged gear=sets 	--
--------------------------
	sets.engaged = {
        head="Tali'ah Turban +1",
		neck="Shulmanu Collar",
		ear1="Cessance Earring",
		ear2="Telos Earring",
        body="Tali'ah manteel +1",
		hands="Tali'ah gages +1",
		ring1="Chirich ring +1",
		ring2="Chirich ring +1",
        back="Visucius's Mantle",
		waist="Incarnation sash",
		legs="Tali'ah seraweels +1",
		feet="Tali'ah crackows +1"
	}
	sets.engaged.Fodder = {
        head="Tali'ah Turban +1",
		neck="Shulmanu Collar",
		ear1="Cessance Earring",
		ear2="Brutal Earring",
        body="",
		hands="Ryuo Tekko",
		ring1="Niqmaddu Ring",
		ring2="Epona's Ring",
        back="Visucius's Mantle",
		waist="Windbuffet Belt +1",
		legs="Ryuo Hakama",
		feet=""
	}
    sets.engaged.MagicEva = {
        head="Lilitu Headpiece",
		neck="Caro Necklace",
		ear1="Moonshade Earring",
		ear2="Brutal Earring",
        body="",
		hands="Ryuo Tekko",
		ring1="Niqmaddu Ring",
		ring2="Regal Ring",
        back="Visucius's Mantle",
		waist="Grunfeld Rope",
		legs="Hiza. Hizayoroi +2",
		feet=""
	}
    sets.engaged.Fodder.DT = {
        head="Lilitu Headpiece",
		neck="Caro Necklace",
		ear1="Moonshade Earring",
		ear2="Brutal Earring",
        body="",
		hands="Ryuo Tekko",
		ring1="Niqmaddu Ring",
		ring2="Regal Ring",
        back="Visucius's Mantle",
		waist="Grunfeld Rope",
		legs="Hiza. Hizayoroi +2",
		feet=""
	}
    sets.engaged.Pet = {
		main="Ohtas",
        head="Tali'ah Turban +1",
		neck="Shulmanu Collar",
		ear1="Cessance Earring",
		ear2="Telos Earring",
        body="Sayadio's Kaftan",
		hands="Ryuo Tekko",
		ring1="Niqmaddu Ring",
		ring2="Epona's Ring",
        back="Visucius's Mantle",
		waist="Klouskap Sash",
		legs="Ryuo Hakama",
		feet=""
	}
    sets.engaged.Pet.Btank = {
		main="Ohtas",
        head="Tali'ah Turban +1",
		neck="Shulmanu Collar",
		ear1="Cessance Earring",
		ear2="Telos Earring",
        body="Sayadio's Kaftan",
		hands="Ryuo Tekko",
		ring1="Niqmaddu Ring",
		ring2="Epona's Ring",
        back="Visucius's Mantle",
		waist="Klouskap Sash",
		legs="Ryuo Hakama",
		feet=""
	}
------------------------------
-- 	Weaponskill Gear-Sets 	--
------------------------------
	sets.precast.WS = { --main, sub, and range will be excluded
		ammo="Amar Cluster",
		head=Taeon.Head.WS,
		body=Taeon.Body.WS,
		hands=Herc.Hands.WS,
		legs="Hizamaru hizayoroi +2",
		feet=Herc.Feet.WS,
		neck="Sanctity Necklace",
		waist="Kentarch Belt +1",
		ear1="Mache Earring +1",
		ear2="Telos Earring",
		ring1="Regal Ring",
		ring2="Ilabrat Ring",
		back="",
	}
	sets.midcast.Pet.PetEnmityGear = {
		neck="",
		body="Heyoka harness",
		legs="Heyoka subligar",
	}
	sets.midcast.Pet.PetEnmityGear2 = {
		neck="",
		body="Herculean vest",
	}
	sets.midcast.Pet.PetWSGear = {
		head="Tali'ah turban +1",
		body="Tali'ah manteel +1",
		hands="Tali'ah gages +1",
		legs="Tali'ah seraweels +1",
		feet="Tali'ah crackows +1",
		neck="Shulmanu collar",
		ear1="",
		ear2="",
		ring1="Varar ring +1",
		ring2="Varar ring +1",
		waist="Incarnation sash",
		back="Visucius's mantle"
		
	}
	sets.midcast.Pet.PetWSGear.Ranged = set_combine(sets.midcast.Pet.PetWSGear, {})
	sets.midcast.Pet.PetWSGear.Melee = set_combine(sets.midcast.Pet.PetWSGear, {ring2="C. Palug Ring"})
	sets.midcast.Pet.PetWSGear.Tank = set_combine(sets.midcast.Pet.PetWSGear, {})
	sets.midcast.Pet.PetWSGear.LightTank = set_combine(sets.midcast.Pet.PetWSGear, {})
    sets.midcast.Pet.PetWSGear.Magic = set_combine(sets.midcast.Pet.PetWSGear, {})
	sets.midcast.Pet.PetWSGear.Heal = set_combine(sets.midcast.Pet.PetWSGear, {})
	sets.midcast.Pet.PetWSGear.Nuke = set_combine(sets.midcast.Pet.PetWSGear, {})
----------------------
-- 	Misc Gear-sets 	--
----------------------
	sets.buff.Doom = {
		
	}
	sets.Asleep = set_combine(sets.engaged.PDT, {
		head="Frenzy Sallet"
	})
	sets.defense.DT = sets.engaged.PDT
	sets.CapacityMantle = {
		back="Mecisto. Mantle"
	}
	sets.Reive = {
		neck="Ygna's resolve +1"
	}
	sets.Obi = {waist="Hachirin-no-Obi"}