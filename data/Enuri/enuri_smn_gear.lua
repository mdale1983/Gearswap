include('augments.lua')
----------------------
--  Field/Town Idle --
----------------------
	 -- Resting sets
    sets.resting = {
	
	}
    -- Idle sets
    sets.idle = {
	main="Bolelabunga",
	sub={ name="Genbu's Shield", augments={'"Cure" potency +4%','"Cure" spellcasting time -7%','Mag. Acc.+4',}},
	ammo="Seraphicaller",
	head="Beckoner's Horn +1",
	body="Shomonjijoe +1",
	hands="Asteria Mitts +1",
	legs="Assid. Pants +1",
	feet="Inyan. Crackows +2",
	neck="Twilight Torque",
	waist="Lucidity Sash",
	left_ear="Andoaa Earring",
	right_ear="Evans Earring",
	left_ring="Defending Ring",
	right_ring="Inyanga Ring",
	back="Moonbeam Cape",
	}
    sets.idle.Avatar = {
	 main="Bolelabunga",
    sub={ name="Genbu's Shield", augments={'"Cure" potency +4%','"Cure" spellcasting time -7%','Mag. Acc.+4',}},
    ammo="Seraphicaller",
    head="Beckoner's Horn +1",
    body="Shomonjijoe +1",
    hands="Asteria Mitts +1",
    legs="Assid. Pants +1",
    feet={ name="Apogee Pumps", augments={'MP+60','Summoning magic skill +15','Blood Pact Dmg.+7',}},
    neck="Caller's Pendant",
    waist="Lucidity Sash",
    left_ear="Andoaa Earring",
    right_ear="Evans Earring",
    left_ring="Stikini Ring",
    right_ring="Evoker's Ring",
    back="Mecisto. Mantle",
	}
    -- Favor uses Caller's Horn instead of Convoker's Horn for refresh
    sets.idle.Avatar.Favor = {
	 main="Bolelabunga",
    sub={ name="Genbu's Shield", augments={'"Cure" potency +4%','"Cure" spellcasting time -7%','Mag. Acc.+4',}},
    ammo="Seraphicaller",
    head="Beckoner's Horn +1",
    body="Shomonjijoe +1",
    hands="Asteria Mitts +1",
    legs="Assid. Pants +1",
    feet={ name="Apogee Pumps", augments={'MP+60','Summoning magic skill +15','Blood Pact Dmg.+7',}},
    neck="Caller's Pendant",
    waist="Lucidity Sash",
    left_ear="Andoaa Earring",
    right_ear="Evans Earring",
    left_ring="Stikini Ring",
    right_ring="Evoker's Ring",
    back="Mecisto. Mantle",
	}
    sets.idle.Avatar.Melee = {
		main="Gridarvor",
		sub="Oneiros Grip",
		ammo="Seraphicaller",
		head="Beckoner's Horn +1",
		body="Shomonjijoe +1",
		hands="Asteria Mitts +1",
		legs="Assid. Pants +1",
		feet={ name="Apogee Pumps", augments={'MP+60','Summoning magic skill +15','Blood Pact Dmg.+7',}},
		neck="Caller's Pendant",
		waist="Lucidity Sash",
		left_ear="Andoaa Earring",
		right_ear="Evans Earring",
		left_ring="Evoker's Ring",
		right_ring="Stikini Ring",
		back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Accuracy+3 Pet: Rng. Acc.+3','Pet: Haste+10',}},
	} 
    -- Defense sets
    sets.defense.PDT = { }
	sets.defense.MDT = {
		ammo="Seraphicaller",
		head="Inyanga Tiara +2",
		body="Inyanga Jubbah +2",
		hands="Inyan. Dastanas +2",
		legs="Inyanga Shalwar +2",
		feet="Inyan. Crackows +2",
		neck="Warder's Charm",
		waist="Carrier's Sash",
		left_ear="Eabani Earring",
		right_ear="Lugalbanda Earring",
		left_ring="Defending Ring",
		right_ring="Shadow Ring",
		back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Accuracy+3 Pet: Rng. Acc.+3','Pet: Haste+10',}},
	}
    sets.Kiting = {feet="Herald's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
--------------------------------------
-- 	Pre-cast Job Ability Gear-sets 	--	
--------------------------------------
	sets.precast.JA['Astral Flow'] = {head="Glyphic Horn"}
    sets.precast.JA['Elemental Siphon'] = {
		main={ name="Espiritus", augments={'Summoning magic skill +15','Pet: Mag. Acc.+30','Pet: Damage taken -4%',}},
		sub="Vox Grip",
		ammo="Seraphicaller",
		head="Beckoner's Horn +1",
		body="Caller's Doublet +1",
		hands="Lamassu Mitts +1",
		legs="Beckoner's Spats",
		feet={ name="Apogee Pumps", augments={'MP+60','Summoning magic skill +15','Blood Pact Dmg.+7',}},
		neck="Caller's Pendant",
		waist="Lucidity Sash",
		left_ear="Andoaa Earring",
		right_ear="Gelos Earring",
		left_ring="Evoker's Ring",
		right_ring="Globidonta Ring",
		back="Conveyance Cape",
	}
    sets.precast.JA['Mana Cede'] = {hands="Caller's Bracers +2"}
    -- Pact delay reduction gear
    sets.precast.BloodPactWard = {
		main={ name="Espiritus", augments={'Summoning magic skill +15','Pet: Mag. Acc.+30','Pet: Damage taken -4%',}},
		sub="Vox Grip",
		ammo="Seraphicaller",
		head="Beckoner's Horn +1",
		body="Con. Doublet +3",
		hands={ name="Glyphic Bracers +1", augments={'Inc. Sp. "Blood Pact" magic burst dmg.',}},
		legs="Beckoner's Spats",
		feet={ name="Apogee Pumps", augments={'MP+60','Summoning magic skill +15','Blood Pact Dmg.+7',}},
		neck="Caller's Pendant",
		waist="Lucidity Sash",
		left_ear="Andoaa Earring",
		right_ear="Evans Earring",
		left_ring="Evoker's Ring",
		right_ring="Stikini Ring",
		back="Conveyance Cape",
	}
    sets.precast.BloodPactRage = sets.precast.BloodPactWard
----------------------------------
-- 	Pre-cast Magic Gear-sets 	--	
----------------------------------
	sets.precast.FC = {
		main={ name="Grioavolr", augments={'Blood Pact Dmg.+10','Pet: Mag. Acc.+1','Pet: "Mag.Atk.Bns."+16','DMG:+7',}},
		sub="Clerisy Strap",
		ammo="Sapience Orb", --2
		head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}}, --10
		body="Inyanga Jubbah +2", --14
		hands={ name="Merlinic Dastanas", augments={'"Fast Cast"+6','STR+2','"Mag.Atk.Bns."+14',}},
		legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}}, --7
		feet="Merlinic Crackows", --10
		neck="Baetyl Pendant", --4
		waist="Channeler's Stone", --2 
		left_ear="Etiolation Earring", --1
		right_ear="Loquacious Earring", --2
		left_ring="Prolix Ring", --2
		right_ring="Kishar Ring", --4
		 back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Mag. Acc+20 /Mag. Dmg.+20','Pet: Magic Damage+7','"Fast Cast"+10',}}, --10
	}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC)
----------------------------------
-- 	Mid-cast Magic Gear-Sets 	--
----------------------------------
	sets.midcast.FastRecast = {
		main={ name="Grioavolr", augments={'Blood Pact Dmg.+10','Pet: Mag. Acc.+1','Pet: "Mag.Atk.Bns."+16','DMG:+7',}},
		sub="Clerisy Strap",
		ammo="Impatiens",
		head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
		body="Inyanga Jubbah +2",
		hands={ name="Merlinic Dastanas", augments={'"Fast Cast"+6','STR+2','"Mag.Atk.Bns."+14',}},
		legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
		feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+28','"Fast Cast"+5','Mag. Acc.+5',}},
		neck="Orunmila's Torque",
		waist="Witful Belt",
		left_ear="Etiolation Earring",
		right_ear="Loquacious Earring",
		left_ring="Prolix Ring",
		right_ring="Kishar Ring",
		 back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Mag. Acc+20 /Mag. Dmg.+20','Pet: Magic Damage+7','"Fast Cast"+10',}},
	}
    sets.midcast.Cure = {
		head="Vanya Hood",
		body="Merlinic Jubbah",
		hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
		legs="Gyve Trousers",
		feet="Medium's Sabots",
		neck="Incanter's Torque",
		waist="Goading Belt",
		left_ear="Mendicant's earring",
		left_ring="Ephedra Ring",
		right_ring="Stikini Ring",
		back="Solemnity Cape",
	}
	 sets.midcast.Duration = {-- Enh. Ma. Dur. (exclusivly for set_combine, nothing will directly call this set)
		--main={ name="Gada", augments={'Enh. Mag. eff. dur. +5','Mag. Acc.+14','"Mag.Atk.Bns."+8',}},
		sub="Ammurapi Shield",
		 head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
		body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
		hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
		legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +9',}},
		feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
    }
	 sets.midcast.Haste = set_combine(sets.midcast.Duration,{-- Fill slots not used in Duration set with Haste > Fastcast
		neck="Baetyl Pendant",
		waist="Goading Belt",
		left_ear="Loquac. Earring",
		right_ear="Etiolation Earring",
		left_ring="Prolix ring",
		right_ring="Kishar Ring",
		 back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Mag. Acc+20 /Mag. Dmg.+20','Pet: Magic Damage+7','"Fast Cast"+10',}},
	})
     sets.midcast.Stoneskin = set_combine(sets.midcast.Duration, {
		neck="Nodens Gorget",
		waist="Siegel Sash",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
	})
	 sets.midcast.Blink = set_combine(sets.midcast.Duration, {
	})
	 sets.midcast.Sneak = set_combine(sets.midcast.Duration, {
	})
	sets.midcast.Invisible = set_combine(sets.midcast.Duration, {
	})
	sets.midcast.Haste = set_combine(sets.midcast.Duration, {
	}) 
	sets.midcast.Flurry = set_combine(sets.midcast.Duration, {
	})
	sets.midcast.Aquaveil = set_combine(sets.midcast.Duration, { -- Aquaveil Set
	--head="Amalric Coif"
	})
	sets.midcast.Refresh = set_combine(sets.midcast.Duration, { -- Refresh Set
		head="Amalric Coif",
		waist="Gishdubar Sash"
	})
	sets.midcast.Phalanx = set_combine(sets.midcast.Duration, { -- Balance potency/duration how you choose, Formula is: F = 28 + Floor( (Enhancing Magic Skill - 300.5) / 28.5)
	})
    sets.midcast['Elemental Magic'] = { }
    sets.midcast['Dark Magic'] = { }


    -- Avatar pact sets.  All pacts are Ability type.
    
    sets.midcast.Pet.BloodPactWard = {
		main={ name="Espiritus", augments={'Summoning magic skill +15','Pet: Mag. Acc.+30','Pet: Damage taken -4%',}},
		sub="Vox Grip",
		ammo="Seraphicaller",
		head="Beckoner's Horn +1",
		body="Caller's Doublet +1",
		hands="Lamassu Mitts +1",
		legs="Beckoner's Spats",
		feet="Apogee Pumps", 
		neck="Caller's Pendant",
		waist="Lucidity Sash",
		left_ear="Andoaa Earring",
		right_ear="Gelos Earring",
		left_ring="Evoker's Ring",
		right_ring="Stikini Ring",
		back="Conveyance Cape",
	}
	
    sets.midcast.Pet.DebuffBloodPactWard = {
		main={ name="Espiritus", augments={'Summoning magic skill +15','Pet: Mag. Acc.+30','Pet: Damage taken -4%',}},
		sub="Vox Grip",
		ammo="Seraphicaller",
		head="Beckoner's Horn +1",
		body="Con. Doublet +3",
		hands="Lamassu Mitts +1",
		legs="Beckoner's Spats",
		feet="Apogee Pumps", 
		neck="Caller's Pendant",
		waist="Lucidity Sash",
		left_ear="Andoaa Earring",
		right_ear="Gelos Earring",
		left_ring="Evoker's Ring",
		right_ring="Stikini Ring",
		back="Conveyance Cape",
	}
        
    sets.midcast.Pet.DebuffBloodPactWard.Acc = set_combine(sets.midcast.Pet.DebuffBloodPactWard, {
	
	})
    
    sets.midcast.Pet.PhysicalBloodPactRage = {
		main="Gridarvor",
		sub="Elan Strap",
		ammo="Seraphicaller",
		head="Apogee Crown",
		body="Con. Doublet +3",
		hands="Convo. Bracers +3",
		legs="Apogee Slacks",
		feet="Convo. Pigaches +3",
		neck="Shulmanu Collar",
		waist="Incarnation Sash",
		left_ear="Lugalbanda Earring",
		right_ear="Gelos Earring",
		left_ring="Varar Ring",
		right_ring="Varar Ring",
		back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Accuracy+3 Pet: Rng. Acc.+3','Pet: Haste+10',}},
	}
	sets.midcast.Pet.PhysicalBloodPactRage.Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {
		hands="Convo. Bracers +3",	
	})
    sets.midcast.Pet.MagicalBloodPactRage = {
		main={ name="Espiritus", augments={'MP+50','Pet: "Mag.Atk.Bns."+20','Pet: Mag. Acc.+20',}},
		sub="Elan Strap",
		ammo="Seraphicaller",
		head="Apogee Crown +1",
		body="Con. Doublet +3",
		hands={ name="Merlinic Dastanas", augments={'Pet: "Mag.Atk.Bns."+28','Blood Pact Dmg.+10',}},
		legs="Enticer's Pants",
		feet="Convo. Pigaches +3",
		neck="Adad Amulet",
		waist="Regal Belt",
		left_ear="Lugalbanda Earring",
		right_ear="Gelos Earring",
		left_ring="Varar Ring",
		right_ring="Varar Ring",
		back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Mag. Acc+20 /Mag. Dmg.+20','Pet: Magic Damage+7','"Fast Cast"+10',}},
	}
    sets.midcast.Pet.MagicalBloodPactRage.Acc = set_combine(sets.midcast.Pet.MagicalBloodPactRage, {
	
	})
	sets.midcast.Pet.HybridBloodPactRage = {
		main="Gridarvor",
		sub="Elan Strap",
		ammo="Seraphicaller",
		head="Apogee Crown +1",
		body="Con. Doublet +3",
		hands={ name="Merlinic Dastanas", augments={'Pet: "Mag.Atk.Bns."+28','Blood Pact Dmg.+10',}},
		legs="Apogee Slacks +1",
		feet={ name="Apogee Pumps", augments={'MP+60','Pet: "Mag.Atk.Bns."+30','Blood Pact Dmg.+7',}},
		neck="Adad Amulet",
		waist="Regal Belt",
		left_ear="Lugalbanda Earring",
		right_ear="Gelos Earring",
		left_ring="Varar Ring",
		right_ring="Varar Ring",
		back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Mag. Acc+20 /Mag. Dmg.+20','Pet: Magic Damage+7','"Fast Cast"+10',}},
	}
	sets.midcast.Pet.HybridBloodPactRage.Acc = set_combine(sets.midcast.Pet.HybridBloodPactRage, {
		feet="Convo. Pigaches +2",
		 back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Mag. Acc+20 /Mag. Dmg.+20','Pet: Magic Damage+7','"Fast Cast"+10',}},
	})
	sets.midcast.Pet.EnticersBloodPactWard = set_combine(sets.midcast.Pet.BloodPactWard, {
		legs="Enticer's Pants"
	})
	sets.midcast.Pet.PhysicalEnticersBloodPactRage = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {
		legs="Enticer's Pants"
	})
    sets.midcast.Pet.PhysicalEnticersBloodPactRage.Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {
		legs="Enticer's Pants"
	})
	sets.midcast.Pet.MagicalEnticersBloodPactRage = set_combine(sets.midcast.Pet.MagicalBloodPactRage, {
		legs="Enticer's Pants"
	})
    sets.midcast.Pet.MagicalEnticersBloodPactRage.Acc = set_combine(sets.midcast.Pet.MagicalBloodPactRage.Acc, {
		legs="Enticer's Pants"
	})	
    -- Spirits cast magic spells, which can be identified in standard ways.
    
    sets.midcast.Pet.WhiteMagic = {legs="Summoner's Spats"}
    sets.midcast.Pet['Elemental Magic'] = set_combine(sets.midcast.Pet.BloodPactRage, {
		legs="Summoner's Spats"
	})
    sets.midcast.Pet['Elemental Magic'].Resistant = {}
--------------------------
-- 	engaged gear=sets 	--
--------------------------
	 sets.engaged = {
		main="Nirvana",
		sub="Elan Strap",
		ammo="Seraphicaller",
		head="Tali'ah Turban +2",
		body="Con. Doublet +3",
		hands="Convo. Bracers +3",
		legs="Tali'ah Sera. +2",
		feet="Convo. Pigaches +2",
		neck="Shulmanu Collar",
		waist="Eschan Stone",
		left_ear="Telos Earring",
		right_ear="Digni. Earring",
		left_ring="Cacoethic Ring +1",
		right_ring="Cacoethic Ring",
		back={ name="Campestres's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
	}
------------------------------
-- 	Weaponskill Gear-Sets 	--
------------------------------
   sets.precast.WS = {
		main="Nirvana",
		sub="Elan Strap",
		ammo="Pemphredo Tathlum",
		head="Tali'ah Turban +2",
		body="Zendik Robe",
		hands={ name="Merlinic Dastanas", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Phys. dmg. taken -3%','Mag. Acc.+10','"Mag.Atk.Bns."+14',}},
		legs="Tali'ah Sera. +2",
		feet="Tali'ah Crackows +1",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Hermetic Earring",
		right_ear="Digni. Earring",
		left_ring="Tali'ah Ring",
		right_ring="Etana Ring",
		back={ name="Campestres's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
	}
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Myrkr'] = {
	
	}	
----------------------
-- 	Misc Gear-sets 	--
----------------------
	sets.Reive = {
		neck="Ygna's resolve +1"
	}
	sets.buff.Doom = {
		
	}
	sets.Asleep = set_combine(sets.engaged.PDT, {
		head="Frenzy Sallet"
	})
	sets.CapacityMantle = {
		back="Mecisto. Mantle"
	}
	sets.NirvanaLock = {
		main="Nirvana",
		sub="Elan Strap",
	}
	sets.weapons.Gridarvor = {main="Gridarvor", sub="Elan Strap +1"}
	sets.weapons.Khatvanga = {main="Khatvanga",sub="Bloodrain Strap"}