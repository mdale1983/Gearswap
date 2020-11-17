include('augments.lua')
----------------------
--  Field/Town Idle --
----------------------
	sets.idle = {
		main="Bolelabunga",
		sub="Genmei shield",
		ammo="Clarus Stone",
		head="Befouled crown",
		body="Arbatel gown +1",
		hands="Gende. gages +1",
		legs="Assid. pants +1",
		feet="Gende. galosh. +1",
		neck="Loricate Torque +1",
		waist="Fucho-no-Obi",
		ear1="Etiolation Earring",
		ear2="Moonshade Earring",
		ring1="Renaye Ring",
		ring2="Fortified Ring",
		back="Lugh's Cape",
	}
--------------------------------------
-- 	Pre-cast Job Ability Gear-sets 	--	
--------------------------------------
	sets.precast.JA['Tabula Rasa'] = {
		legs="Pedagogy Pants +1"
	}
	sets.precast.JA['Parsimony'] = {
		legs="Arbatel Pants +1"
	}
	sets.precast.JA['Penury'] = {
		legs="Arbatel Pants +1"
	}
	sets.precast.JA['Perpetuance'] = {
		hands="Arbatel Bracers +2"
	}
	sets.precast.JA['Sublimation'] = {
		main="Bolelabunga",
		ammo="Ghastly Tathlum +1",
		head="Acad. Mortarboard +1",
		body="Peda. Gown +1", 
		legs="Telchine Braconi", 
		feet="Telchine Pigaches", 
		neck="Sanctity necklace",
		waist="Eschan Stone",
		ear1="Terminus Earring",
		ear2="Odnowa Earring",
		ring1="Provocare Ring",
		ring2="Kunaji Ring",
		back="Swith Cape",
	}
	sets.precast.JA['Rapture'] = {
		head="Arbatel Bonnet +1"
	}
	sets.precast.JA['Ebullience'] = {
		head="Arbatel Bonnet +1"
	}
--------------------
-- Buff Gear Sets --
--------------------
	sets.buff['Ebullience'] = {head="Arbatel Bonnet +1"}
    sets.buff['Rapture'] = {head="Arbatel Bonnet +1"}
    sets.buff['Perpetuance'] = {hands="Arbatel Bracers +2"}
    sets.buff['Penury'] = {legs="Arbatel Pants +1"}
    sets.buff['Parsimony'] = {legs="Arbatel Pants +1"}
    sets.buff['Celerity'] = {feet="Pedagogy Loafers +1"}
    sets.buff['Alacrity'] = {feet="Pedagogy Loafers +1"}
    sets.buff['Klimaform'] = {feet="Arbatel Loafers"}
    sets.buff.FullSublimation = {
		head="Academic's Mortarboard",
		ear1="Savant's Earring",
		body="Pedagogy Gown +1",
		main="Siriti",
	}
    sets.buff.PDTSublimation = {
		head="Academic's Mortarboard",
		ear1="Savant's Earring"
	}
----------------------------------
-- 	Pre-cast Magic Gear-sets 	--	
----------------------------------
	sets.precast.FC = {
		main="Grioavolr",
		sub="Enki Strap",
		ammo="Impatiens",
		head="Vanya Hood",
		body="Shango Robe",
		hands="Helios gloves",
		legs="Psycloth Lappas",
		feet="Merlinic Crackows",
		neck="Voltsurge Torque",
		waist="Channeler's stone",
		ear1="Eitolation Earring",
		ear2="Loquac. Earring",
		ring1="Kishar Ring",
		ring2="Lebeche Ring",
		back="Lugh's Cape",
	}
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
		waist="Siegel Sash"
	})
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {
		neck="Stoicheion Medal"
	})
    sets.precast.FC.Cure = set_combine(sets.precast.FC, {
		body="Heka's Kalasiris",
		legs="Doyen pants",
		back="Pahtli Cape"
	})
    sets.precast.FC.Curaga = sets.precast.FC.Cure
    sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {
		head=empty,
		body="Twilight Cloak"
	})
	sets.precast.FC.Regen = set_combine(sets.precast.FC, {
		back="Lugh's Cape", 
		hands="Arbatel Bracers +2",
		hands=Telc.Hands.Dur,
		legs=Telc.Legs.Dur,
		feet=Telc.Feet.Dur
	})
	sets.precast.Klimaform = {
		feet="Arbatel Loafers"
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
	sets.midcast.Cure = {
		main="Iridal staff",
		sub="Enki Strap",
		ammo="Hydrocera",
		head="Vanya hood", 
		body="Chironic doublet",
		hands="Pedagogy bracers +2",
		legs="Psycloth lappas",
		feet="Vanya clogs",
		neck="Incanter's Torque",
		waist="Bishop's Sash",
		ear1="Gifted Earring",
		ear2="Halasz Earring",
		ring1="Haoma's Ring",
		ring2="Haoma's Ring",
		back="Vita Cape",
	}
    sets.midcast.CureWithLightWeather = {
		main="Iridal staff",
		sub="Enki Strap",
		ammo="Hydrocera",
		head="Vanya hood", 
		body="Chironic doublet",
		hands="Pedagogy bracers",
		legs="Psycloth Lappas",
		feet="Vanya clogs",
		neck="Incanter's Torque",
		waist="Korin obi",
		ear1="Gifted Earring",
		ear2="Halasz Earring",
		ring1="Haoma's Ring",
		ring2="Haoma's Ring",
		back="Vita Cape",
	}
    sets.midcast.Curaga = sets.midcast.Cure
	sets.midcast.Regen = {
		main="Bolelabunga",
		sub="Genmei Shield",
		ammo="Ghastly Tathlum +1",
		head="Arbatel Bonnet +1",
		body=Telc.Body.Regen,
		hands="Arbatel bracers +1",
		legs=Telc.Legs.Regen,
		feet=Telc.Feet.Dur,
		neck="Incanter's Torque",
		waist="Korin Obi",
		ear1="Andoaa Earring",
		ear2="Gifted Earring",
		ring1="Stikini Ring",
		ring2="Stikini Ring",
		back="Bookworm's Cape",
	}
    sets.midcast.Cursna = {
        neck="Malison Medallion",
        hands="Hieros Mittens",
		ring1="Haoma's Ring",
		ring2="Haoma's Ring",
        feet="Gendewitha Galoshes +1"
	}
    sets.midcast['Enhancing Magic'] = {
		main="Bolelabunga",
		sub="Genmei Shield",
		ammo="Ghastly Tathlum +1",
		head="Befouled Crown",
		body=Telc.Body.Dur,
		hands=Telc.Hands.Dur,
		legs=Telc.Legs.Dur,
		feet=Telc.Feet.Dur,
		neck="Incanter's Torque",
		waist="Siegel Sash",
		ear1="Hecate's Earring",
		ear2="Loquac. Earring",
		ring1="Stikini Ring",
		ring2="Stikini Ring",
		back="Perimede Cape",
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
		main="Grioavolr",
		sub="Niobid Strap",
		ammo="Hydrocera",
		head="Chironic Hat",
		body="Jhakri Robe +1",
		hands="Chironic Gloves",
		legs="Chironic Hose", 
		feet="Jhakri Pigaches +1",
		neck="Sanctity necklace",
		waist="Luminary Sash",
		ear1="Lifestorm Earring",
		ear2="Psystorm Earring",
		ring1="Stikini Ring",
		ring2="Stikini Ring",
		back="Lugh's Cape",
	}
	sets.midcast['Dark Magic'] = {
		main="Akademos",
		sub="Niobid Strap",
		ammo="Incantor Stone",
        head="Nahtirah Hat",
		neck="Aesir Torque",
		ear1="Psystorm Earring",
		ear2="Lifestorm Earring",
        body="Vanir Cotehardie",
		hands="Yaoyotl Gloves",
		ring1="Strendu Ring",
		ring2="Sangoma Ring",
        back="Refraction Cape",
		waist="Goading Belt",
		legs="Bokwus Slops",
		feet="Bokwus Boots"
	}
	sets.midcast.Kaustra = {
		main="Akademos",
		sub="Niobid Strap",
		ammo="Ghastly Tathlum +1",
		head="Merlinic Hood", 
		body="Wretched Coat",
		hands="Amalric Gages",
		legs="Merlinic Shalwar",
		feet="Jhakri Pigaches +1",
		neck="Mizu. Kubikazari",
		waist="Aswang Sash",
		ear1="Moldavite Earring",
		ear2="Friomisi Earring",
		ring1="Mujin Band",
		ring2="Locus Ring",
		back="Seshaw Cape",
	}
    sets.midcast.Drain = {
		main="Grioavolr", 
		sub="Niobid Strap",
		ammo="Ghastly Tathlum +1",
		head="Pixie Hairpin +1",
		body="Jhakri Robe +1",
		hands="Jhakri Cuffs +1",
		legs="Merlinic Shalwar", 
		feet="Chironic Slippers", 
		neck="Incanter's Torque",
		waist="Fucho-no-Obi",
		ear1="Lempo Earring",
		ear2="Friomisi Earring",
		ring1="Evanescence Ring",
		ring2="Archon Ring",
		back="Ogapepo Cape",
	}
    sets.midcast.Aspir = sets.midcast.Drain
    sets.midcast.Stun = {
		main="Grioavolr", 
		sub="Niobid Strap",
		ammo="Ghastly Tathlum +1",
		head="Befouled Crown",
		body="Shango Robe",
		hands="Jhakri Cuffs +1",
		legs="Chironic Hose", 
		feet="Merlinic Crackows", 
		neck="Sanctity necklace",
		waist="Aswang Sash",
		ear1="Lifestorm Earring",
		ear2="Psystorm Earring",
		ring1="Mediator's Ring",
		ring2="Perception Ring",
		back="Altruistic Cape",
	}
    sets.midcast.Stun.Resistant = set_combine(sets.midcast.Stun, {main="Lehbrailg +2"})
    -- Elemental Magic sets are default for handling low-tier nukes.
    sets.midcast['Elemental Magic'] = {
		main="Akademos",
		sub="Niobid Strap",
		ammo="Ghastly Tathlum +1",
		head="Jhakri Coronal +1",
		body="Jhakri Robe +1",
		hands="Jhakri Cuffs +1",
		legs="Jhakri Slops +1",
		feet="Jhakri Pigaches +1",
		neck="Sanctity necklace",
		waist="Hachirin-no-Obi",
		ear1="Friomisi Earring",
		ear2="Loquac. Earring",
		ring1="Fenrir Ring",
		ring2="Acumen Ring",
		back="Seshaw Cape",
	}
    sets.midcast['Elemental Magic'].Resistant = {
		main="Akademos", 
		sub="Niobid Strap",
		ammo="Ghastly Tathlum +1",
		neck="Sanctity necklace",
		waist="Hachirin-no-Obi",
		ear1="Friomisi Earring",
		ear2="Loquac. Earring",
		ring1="Fenrir Ring",
		ring2="Acumen Ring",
		back="Seshaw Cape",
	}
	-----------------------------------------------
	-- Custom refinements for certain nuke tiers --
	-----------------------------------------------
	sets.midcast.LowTierNuke = set_combine(sets.midcast['Elemental Magic'], { 
		head="Mallquis chapeau +1",
		body="Mallquis saio +2",
		hands="Mallquis cuffs +1",
		legs="Mallquis trews +1",
		feet="Mallquis clogs +1"
	})
	sets.midcast.MidTierNuke = set_combine(sets.midcast['Elemental Magic'], { 
		head="Jhakri Coronal +1",
		body="Jhakri Robe +1",
		hands="Jhakri Cuffs +1",
		legs="Jhakri Slops +1",
		feet="Jhakri Pigaches +1",
	})
    sets.midcast.addendumNukes = set_combine(sets.midcast['Elemental Magic'], {
		sub="Enki Strap"
	})
    sets.midcast.Impact = {
		main="Lehbrailg +2",
		sub="Mephitis Grip",
		ammo="Dosis Tathlum",
        head=empty,
		neck="Eddy necklace",
		ear1="Psystorm Earring",
		ear2="Lifestorm Earring",
        body="Twilight Cloak",
		hands=gear.macc_hagondes,
		ring1="Icesoul Ring",
		ring2="Sangoma Ring",
        back="Toro Cape",
		waist="Demonry Sash",
		legs="Hagondes Pants",
		feet="Bokwus Boots"
	}		
	sets.midcast['Elemental Magic'].Burst = {
		main="Akademos", 
		sub="Niobid Strap",
		ammo="Ghastly Tathlum +1",
		head="Merlinic Hood", 
		body="Jhakri Robe +1",
		hands="Merlinic dastanas", 
		legs="Merlinic Shalwar", 
		feet="Arbatel Loafers +1",
		neck="Argute stole +1",
		waist="Refoccilation stone",
		ear1="Moldavite Earring",
		ear2="Friomisi Earring",
		ring1="Mujin Band",
		ring2="Locus Ring",
		back="Seshaw Cape",
	}
	sets.midcast['Elemental Magic'].Helix = {
		main="Akademos", 
		sub="Niobid Strap",
		ammo="Ghastly Tathlum +1",
		head="Merlinic Hood", 
		body="Jhakri Robe +1",
		hands="Amalric Gages", 
		legs="Merlinic Shalwar", 
		feet="Arbatel Loafers",
		neck="Mizu. Kubikazari",
		waist="Refoccilation Stone",
		ear1="Moldavite Earring",
		ear2="Friomisi Earring",
		ring1="Mujin Band",
		ring2="Locus Ring",
		back="Seshaw Cape",
	}
--------------------------
-- 	engaged gear-sets 	--
--------------------------
		sets.engaged = {
        head="Zelus Tiara",
        body="Vanir Cotehardie",hands="Bokwus Gloves",ring1="Rajas Ring",
        waist="Goading Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}
------------------------------
-- 	Weaponskill Gear-Sets 	--
------------------------------
	sets.precast.WS['Myrkr']  = {
		main="Grioavolr", 
		sub="Niobid Strap",
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