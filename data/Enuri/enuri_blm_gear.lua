include('augments.lua')
----------------------
--  Field/Town Idle --
----------------------
	sets.idle = {
		main="Lathi",
		sub="Enki strap",
		ammo="Clarus Stone",
		head="Befouled crown",
		body="Amalric doublet +1",
		hands="Mallquis cuffs +1",
		legs="Lengo pants",
		feet="Mallquis clogs +1",
		neck="Loricate Torque +1",
		waist="Fucho-no-Obi",
		ear1="Etiolation Earring",
		ear2="Hearty Earring",
		ring1="Defending Ring",
		ring2="Gelatinous Ring +1",
		back=Tara.FC,
	}
--------------------------------------
-- 	Pre-cast Job Ability Gear-sets 	--	
--------------------------------------
	sets.precast.JA['Mana Wall'] = {
		back=Tara.FC,
		feet="Wicce Sabots +1"
	}
    sets.precast.JA.Manafont = {
		body="Sorcerer's Coat +2"
	} 
--------------------
-- Buff Gear Sets --
--------------------

----------------------------------
-- 	Pre-cast Magic Gear-sets 	--	
----------------------------------
	sets.precast.FC = {
		main="Grioavolr",
		sub="Enki Strap",
		ammo="Impatiens",
		head="Welkin crown",
		body="Vrikodara jupon",
		hands=Merl.Hands.FC,
		legs="Psycloth Lappas",
		feet="Amalric nails +1",
		neck="Voltsurge Torque",
		waist="Channeler's stone",
		ear1="Etiolation Earring",
		ear2="Loquac. Earring",
		ring1="Kishar Ring",
		ring2="Prolix Ring",
		back=Tara.FC,
	}
	sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {
		neck="Stoicheion Medal",
		head="Mallquis chapeau +2",
		legs="Mallquis trews +2",
		ear1="Barkarole Earring",
		
	})
	sets.precast.FC.Death = {
		main="Lehbrailg +2",
		sub="Mephitis Grip",
		ammo="Dosis Tathlum",
        head=empty,
		neck="Eddy necklace",
		ear1="Barkarole Earring",
		ear2="Gwati Earring",
        body="Twilight Cloak",
		hands=gear.macc_hagondes,
		ring1="Icesoul Ring",
		ring2="Sangoma Ring",
        back="Toro Cape",
		waist="Demonry Sash",
		legs="Hagondes Pants",
		feet="Bokwus Boots"
	}
----------------------------------
-- 	Mid-cast Magic Gear-Sets 	--
----------------------------------
	sets.midcast.FastRecast = {
		ammo="Incantor Stone",
        head="Merlinic Hood",
		ear2="Loquacious Earring",
		neck="Voltsurge Torque",
        body="Anhur Robe",
		hands="Gendewitha Gages",
		ring1="Weatherspoon Ring",
		ring2="Lebeche Ring",
        back="Swith Cape +1",
		waist="Goading Belt",
		legs="Artsieq Hose",
		feet="Vanya clogs"
	}
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
		waist="Siegel Sash"
	})
    sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'], {
		feet="Pedagogy Loafers +1"
	})
    sets.midcast.Protect = {
		ring1="Sheltered Ring"
	}
    sets.midcast.Protectra = sets.midcast.Protect
    sets.midcast.Shell = {
		ring1="Sheltered Ring"
	}
    sets.midcast.Shellra = sets.midcast.Shell
	--------------------------
	-- Custom Spell Classes --
	--------------------------
	sets.midcast['Enfeebling Magic'] = {
		main="Lathi",
		sub="Enki strap",
		ammo="Hydrocera",
        head="Archmage's petasos +3",
		neck="Incantor's torque",
		ear1="Barkarole Earring",
		ear2="Gwati Earring",
        body="Mallquis saio +2",
		hands="Mallquis cuffs +1",
		ring1="Kishar Ring",
		ring2="Etana Ring",
        back=Tara.FC,
		waist="Eschan stone",
		legs=Merl.Legs.Burst,
		feet="Mallquis clogs +1"
	}
	sets.midcast.IntEnfeebles = set_combine( sets.midcast['Enfeebling Magic'], {
		main="Lathi",
		sub="Enki strap",
		ammo="Hydrocera",
        head="Archmage's petasos +3",
		neck="Incantor's torque",
		ear1="Barkarole Earring",
		ear2="Gwati Earring",
        body="Mallquis saio +2",
		hands="Mallquis cuffs +1",
		ring1="Kishar Ring",
		ring2="Etana Ring",
        back=Tara.FC,
		waist="Eschan stone",
		legs=Merl.Legs.Burst,
		feet="Mallquis clogs +1"
	})
	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast['Dark Magic'] = {
		main="Lathi", 
		sub="Enki Strap",
		ammo="Ghastly Tathlum +1",
		head="Pixie Hairpin +1",
		body="Jhakri robe +2",
		hands="Mallquis Cuffs +1",
		legs=Merl.Legs.Burst, 
		feet=Merl.Feet.Burst, 
		neck="Erra pendant",
		waist="Fucho-no-Obi",
		ear1="Barkarole Earring",
		ear2="Hirudinea Earring",
		ring1="Evanescence Ring",
		ring2="Etana Ring",
		back=Tara.FC,
	}
	sets.midcast.Drain = {
		main="Lathi", 
		sub="Enki Strap",
		ammo="Ghastly Tathlum +1",
		head="Pixie Hairpin +1",
		body="Jhakri robe +2",
		hands="Mallquis Cuffs +1",
		legs=Merl.Legs.Burst, 
		feet=Merl.Feet.Burst, 
		neck="Erra pendant",
		waist="Fucho-no-Obi",
		ear1="Barkarole Earring",
		ear2="Hirudinea Earring",
		ring1="Evanescence Ring",
		ring2="Etana Ring",
		back=Tara.FC,
	}
    sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Death = {
		main="Lathi",
		sub="Niobid strap",
		ammo="Dosis Tathlum",
        head=empty,
		neck="Eddy necklace",
		ear1="Barkarole Earring",
		ear2="Gwati Earring",
        body="Twilight Cloak",
		hands=gear.macc_hagondes,
		ring1="Icesoul Ring",
		ring2="Sangoma Ring",
        back="Toro Cape",
		waist="Demonry Sash",
		legs="Hagondes Pants",
		feet="Bokwus Boots"
	}
    sets.midcast.Stun = {
		main="Grioavolr", 
		sub="Enki Strap",
		ammo="Ghastly Tathlum +1",
		head="Befouled crown",
		body="Shango Robe",
		hands="Jhakri Cuffs +1",
		legs="Chironic Hose", 
		feet="Merlinic Crackows", 
		neck="Sanctity necklace",
		waist="Aswang Sash",
		ear1="Gwati Earring",
		ear2="Barkarole Earring",
		ring1="Mediator's Ring",
		ring2="Perception Ring",
		back="Altruistic Cape",
	}
    sets.midcast.Stun.Resistant = set_combine(sets.midcast.Stun, {})
    -- Elemental Magic sets are default for handling low-tier nukes.
    sets.midcast['Elemental Magic'] = {
		main="Lathi",
		sub="Niobid Strap",
		ammo="Ghastly Tathlum +1",
		neck="Saevus pendant +1",
		waist="Hachirin-no-Obi",
		ear1="Malignance Earring",
		ear2="Barkarole Earring",
		ring1="Shiva ring",
		ring2="Shiva ring +1",
		back=Tara.MAB,
	}
    sets.midcast['Elemental Magic'].Burst = { 
		main="Lathi",
		sub="Niobid Strap",
		ammo="Ghastly Tathlum +1",
		neck="Mizu. kubikazari",
		waist="Eschan stone",
		ear1="Static Earring",
		ear2="Barkarole Earring",
		ring1="Mujin band",
		ring2="Shiva ring +1",
		back=Tara.MAB,
	}
	-----------------------------------------------
	-- Custom refinements for certain nuke tiers --
	-----------------------------------------------
	sets.midcast['Elemental Magic'].LowTierNuke = set_combine(sets.midcast['Elemental Magic'], { 
		head="Mallquis chapeau +2",
		body="Mallquis saio +2",
		hands="Mallquis cuffs +1",
		legs="Mallquis trews +2",
		feet="Mallquis clogs +1"
	})
	sets.midcast['Elemental Magic'].MidTierNuke = set_combine(sets.midcast['Elemental Magic'], { 
		head="Jhakri Coronal +1",
		body="Jhakri robe +2",
		hands="Jhakri Cuffs +1",
		legs="Jhakri Slops +1",
		feet="Jhakri Pigaches +1",
	})
    sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {
		sub="Niobid Strap",
		head="Arch. petasos +3",
		body="Amalric doublet +1",
		hands="Amalric gages +1",
		legs="Amalric slops +1",
		feet="Archmage's sabots +3"
	})
	sets.midcast['Elemental Magic'].HighTierNuke.Burst = set_combine(sets.midcast['Elemental Magic'].Burst, {
		head="Ea hat",
		body="Ea houppelande",
		hands="Amalric gages +1",
		legs="Ea slops",
		feet="Arch. sabots +3"
	})
	sets.midcast['Elemental Magic'].OccultAcumen = {
		main="Khatvanga",
		sub="Bloodrain Strap",
		main="Lehbrailg +2",
		sub="Mephitis Grip",
		ammo="Dosis Tathlum",
        head=empty,
		neck="Eddy necklace",
		ear1="Barkarole Earring",
		ear2="Gwati Earring",
        body="Twilight Cloak",
		hands=gear.macc_hagondes,
		ring1="Icesoul Ring",
		ring2="Sangoma Ring",
        back="Toro Cape",
		waist="Demonry Sash",
		legs="Hagondes Pants",
		feet="Bokwus Boots"
	}
    sets.midcast.Impact = {
		main="Lehbrailg +2",
		sub="Mephitis Grip",
		ammo="Dosis Tathlum",
        head=empty,
		neck="Eddy necklace",
		ear1="Barkarole Earring",
		ear2="Gwati Earring",
        body="Twilight Cloak",
		hands=gear.macc_hagondes,
		ring1="Icesoul Ring",
		ring2="Sangoma Ring",
        back="Toro Cape",
		waist="Demonry Sash",
		legs="Hagondes Pants",
		feet="Bokwus Boots"
	}	
--------------------------
-- 	engaged gear-sets 	--
--------------------------
	sets.engaged = {
        head="Jhakri coronal +1",
        body="Jhakri robe +2",
		hands="Jhakri cuffs +1",
		legs="Jhakri slops +1",
		feet="Jhakri pigaches +1",
		neck="Sanctity necklace",
		ring1="Etana ring",
		ring2="Fortified ring",
		waist="Eschan stone"
	}
------------------------------
-- 	Weaponskill Gear-Sets 	--
------------------------------
	sets.precast.WS['Myrkr']  = {
		main="Grioavolr", 
		sub="Enki Strap",
		ammo="Ghastly Tathlum +1",
		head="Pixie Hairpin +1",
		body="Amalric Doublet", 
		legs="Psycloth Lappas", 
		feet="Psycloth Boots", 
		neck="Sanctity necklace",
		waist="Luminary Sash",
		ear1="Loquac. Earring",
		ear2="Moldavite Earring",
		ring1="Mephitas's Ring +1",
		ring2="Mephitas's Ring",
		back="Vates Cape +1",
	}
----------------------
-- 	Misc Gear-sets 	--
----------------------
	sets.Kiting = {feet="Herald's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.CapacityMantle = {
		back="Mecisto. Mantle"
	}