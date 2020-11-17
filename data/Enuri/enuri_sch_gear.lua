include('augments.lua')
----------------------
--  Field/Town Idle --
----------------------
	sets.idle = {
		main={ name="Nibiru Cudgel", augments={'Accuracy+15','Mag. Acc.+15','"Fast Cast"+3',}},
		ammo="Clarus Stone",
		head={ name="Gende. Caubeen", augments={'Phys. dmg. taken -1%',}},
		body={ name="Psycloth Vest", augments={'Elem. magic skill +20','INT+7','Enmity-6',}},
		hands="Yaoyotl Gloves",
		legs="Arbatel Pants",
		feet="Tutyr Sabots",
		neck="Twilight Torque",
		waist="Bishop's Sash",
		left_ear="Beatific Earring",
		right_ear="Divine Earring",
		left_ring="Provocare Ring",
		right_ring="Ephedra Ring",
		back="Pahtli Cape",
	}
--------------------------------------
-- 	Pre-cast Job Ability Gear-sets 	--	
--------------------------------------
	sets.precast.JA['Tabula Rasa'] = {
		legs="Pedagogy Pants"
	}
	sets.precast.JA['Parsimony'] = {
		legs="Arbatel Pants"
	}
	sets.precast.JA['Penury'] = {
		legs="Arbatel Pants"
	}
	sets.precast.JA['Perpetuance'] = {
		hands="Arbatel Bracers +1"
	}
	sets.precast.JA['Sublimation'] = {
		main="Siriti",
		ammo="Ghastly Tathlum +1",
		head="Acad. Mortarboard",
		body={ name="Peda. Gown +1", augments={'Enhances "Enlightenment" effect',}},
		hands={ name="Telchine Gloves", augments={'"Cure" potency +4%','"Regen" potency+3',}},
		legs={ name="Telchine Braconi", augments={'"Regen" potency+3',}},
		feet={ name="Telchine Pigaches", augments={'"Regen" potency+3',}},
		neck="Sanctity Necklace",
		waist="Eschan Stone",
		left_ear="Terminus Earring",
		right_ear="Odnowa Earring",
		left_ring="Provocare Ring",
		right_ring="Kunaji Ring",
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
    sets.buff['Perpetuance'] = {hands="Arbatel Bracers +1"}
    sets.buff['Penury'] = {legs="Arbatel Pants"}
    sets.buff['Parsimony'] = {legs="Arbatel Pants"}
    sets.buff['Celerity'] = {feet="Pedagogy Loafers"}
    sets.buff['Alacrity'] = {feet="Pedagogy Loafers"}
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
		main={ name="Grioavolr", augments={'Magic burst mdg.+5%','MP+100','Mag. Acc.+27','Magic Damage +4',}},
		ammo="Impatiens",
		head="Befouled Crown",
		body="Anhur Robe",
		hands={ name="Merlinic Dastanas", augments={'"Mag.Atk.Bns."+30','"Fast Cast"+7','MND+3',}},
		legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
		feet={ name="Merlinic Crackows", augments={'"Fast Cast"+6','VIT+6','"Mag.Atk.Bns."+12',}},
		neck="Voltsurge Torque",
		waist="Witful Belt",
		left_ear="Beatific Earring",
		right_ear="Loquac. Earring",
		left_ring="Provocare Ring",
		right_ring="Lebeche Ring",
		back={ name="Lugh's Cape", augments={'Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
	}
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
		waist="Siegel Sash"
	})
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {
		neck="Stoicheion Medal"
	})
    sets.precast.FC.Cure = set_combine(sets.precast.FC, {
		body="Heka's Kalasiris",
		back="Pahtli Cape"
	})
    sets.precast.FC.Curaga = sets.precast.FC.Cure
    sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {
		head=empty,
		body="Twilight Cloak"
	})
	sets.precast.FC.Regen = set_combine(sets.precast.FC, {
		back="Lugh's Cape", 
		hands="Arbatel Bracers +1",
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
		feet="Regal Pumps +1"
	}
	sets.midcast.Cure = {
		main={ name="Serenity", augments={'MP+45','Enha.mag. skill +9','"Cure" potency +4%','"Cure" spellcasting time -8%',}},
		sub="Niobid Strap",
		ammo="Hydrocera",
		head={ name="Gende. Caubeen", augments={'Phys. dmg. taken -1%',}},
		body="Heka's Kalasiris",
		hands={ name="Telchine Gloves", augments={'"Cure" potency +4%','"Regen" potency+3',}},
		legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
		feet="Regal Pumps +1",
		neck="Incanter's Torque",
		waist="Bishop's Sash",
		left_ear="Lifestorm Earring",
		right_ear="Loquac. Earring",
		left_ring="Ephedra Ring",
		right_ring="Ephedra Ring",
		back="Pahtli Cape",
	}
    sets.midcast.CureWithLightWeather = {
		main={ name="Serenity", augments={'MP+45','Enha.mag. skill +9','"Cure" potency +4%','"Cure" spellcasting time -8%',}},
		sub="Niobid Strap",
		ammo="Hydrocera",
		head={ name="Gende. Caubeen", augments={'Phys. dmg. taken -1%',}},
		body="Heka's Kalasiris",
		hands={ name="Telchine Gloves", augments={'"Cure" potency +4%','"Regen" potency+3',}},
		legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
		feet="Regal Pumps +1",
		neck="Incanter's Torque",
		waist="Bishop's Sash",
		left_ear="Lifestorm Earring",
		right_ear="Loquac. Earring",
		left_ring="Ephedra Ring",
		right_ring="Ephedra Ring",
		back="Pahtli Cape",
	}
    sets.midcast.Curaga = sets.midcast.Cure
	sets.midcast.Regen = {
		main="Bolelabunga",
		sub="Genmei Shield",
		ammo="Ghastly Tathlum +1",
		head="Arbatel Bonnet +1",
		body={ name="Telchine Chas.", augments={'Mag. Acc.+19','Enh. Mag. eff. dur. +9',}},
		hands="Arbatel Bracers +1",
		legs={ name="Telchine Braconi", augments={'"Regen" potency+3',}},
		feet={ name="Telchine Pigaches", augments={'Mag. Evasion+18','"Fast Cast"+3','Enh. Mag. eff. dur. +9',}},
		neck="Incanter's Torque",
		waist="Hachirin-no-Obi",
		left_ear="Hecate's Earring",
		right_ear="Loquac. Earring",
		left_ring="Warp Ring",
		right_ring="Acumen Ring",
		back={ name="Bookworm's Cape", augments={'INT+2','MND+2','"Regen" potency+9',}},
	}
    sets.midcast.Cursna = {
        neck="Malison Medallion",
        hands="Hieros Mittens",ring1="Ephedra Ring",
		ring2="Ephedra Ring",
        feet="Gendewitha Galoshes"
	}
    sets.midcast['Enhancing Magic'] = {
		main="Bolelabunga",
		sub="Genmei Shield",
		ammo="Ghastly Tathlum +1",
		head="Befouled Crown",
		body={ name="Telchine Chas.", augments={'Mag. Acc.+19','Enh. Mag. eff. dur. +9',}},
		hands="Arbatel Bracers +1",
		legs="Assid. Pants +1",
		feet={ name="Telchine Pigaches", augments={'Mag. Evasion+18','"Fast Cast"+3','Enh. Mag. eff. dur. +9',}},
		neck="Incanter's Torque",
		waist="Siegel Sash",
		left_ear="Hecate's Earring",
		right_ear="Loquac. Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
		back="Perimede Cape",
	}
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
		waist="Siegel Sash"
	})
    sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'], {
		feet="Pedagogy Loafers"
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
		main={ name="Grioavolr", augments={'Magic burst mdg.+5%','MP+100','Mag. Acc.+27','Magic Damage +4',}},
		sub="Niobid Strap",
		ammo="Hydrocera",
		head={ name="Chironic Hat", augments={'Mag. Acc.+30','"Conserve MP"+3','MND+1','"Mag.Atk.Bns."+14',}},
		body="Jhakri Robe +1",
		hands={ name="Chironic Gloves", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','Enmity-2','Mag. Acc.+14',}},
		legs={ name="Chironic Hose", augments={'Mag. Acc.+30','CHR+8',}},
		feet="Jhakri Pigaches +1",
		neck="Sanctity Necklace",
		waist="Luminary Sash",
		left_ear="Lifestorm Earring",
		right_ear="Psystorm Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
		back={ name="Lugh's Cape", augments={'Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
	}
	sets.midcast['Dark Magic'] = {
		main="Lehbrailg +2",
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
		head={ name="Merlinic Hood", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','Magic burst mdg.+8%','"Mag.Atk.Bns."+8',}},
		body="Wretched Coat",
		hands="Amalric Gages",
		legs={ name="Merlinic Shalwar", augments={'"Mag.Atk.Bns."+17','Magic burst mdg.+10%','MND+8','Mag. Acc.+15',}},
		feet="Jhakri Pigaches +1",
		neck="Mizu. Kubikazari",
		waist="Aswang Sash",
		left_ear="Moldavite Earring",
		right_ear="Friomisi Earring",
		left_ring="Mujin Band",
		right_ring="Locus Ring",
		back="Seshaw Cape",
	}
    sets.midcast.Drain = {
		main={ name="Grioavolr", augments={'Magic burst mdg.+5%','MP+100','Mag. Acc.+27','Magic Damage +4',}},
		sub="Niobid Strap",
		ammo="Ghastly Tathlum +1",
		head="Pixie Hairpin +1",
		body="Jhakri Robe +1",
		hands="Jhakri Cuffs +1",
		legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+16 "Mag.Atk.Bns."+16','"Drain" and "Aspir" potency +10','INT+3','"Mag.Atk.Bns."+5',}},
		feet={ name="Chironic Slippers", augments={'Mag. Acc.+5 "Mag.Atk.Bns."+5','"Drain" and "Aspir" potency +10','MND+2','Mag. Acc.+8',}},
		neck="Incanter's Torque",
		waist="Fucho-no-Obi",
		left_ear="Lempo Earring",
		right_ear="Friomisi Earring",
		left_ring="Evanescence Ring",
		right_ring="Archon Ring",
		back="Ogapepo Cape",
	}
    sets.midcast.Aspir = sets.midcast.Drain
    sets.midcast.Stun = {
		main={ name="Grioavolr", augments={'Magic burst mdg.+7%','MP+39','Mag. Acc.+24','"Mag.Atk.Bns."+30',}},
		sub="Niobid Strap",
		ammo="Ghastly Tathlum +1",
		head="Befouled Crown",
		body="Shango Robe",
		hands="Jhakri Cuffs +1",
		legs={ name="Chironic Hose", augments={'Mag. Acc.+30','CHR+8',}},
		feet={ name="Merlinic Crackows", augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15','Magic burst mdg.+5%','"Mag.Atk.Bns."+15',}},
		neck="Sanctity Necklace",
		waist="Aswang Sash",
		left_ear="Lifestorm Earring",
		right_ear="Psystorm Earring",
		left_ring="Mediator's Ring",
		right_ring="Perception Ring",
		back="Altruistic Cape",
	}
    sets.midcast.Stun.Resistant = set_combine(sets.midcast.Stun, {main="Lehbrailg +2"})
    -- Elemental Magic sets are default for handling low-tier nukes.
    sets.midcast['Elemental Magic'] = {
		main={ name="Akademos", augments={'INT+15','"Mag.Atk.Bns."+15','Mag. Acc.+15',}},
		sub="Niobid Strap",
		ammo="Ghastly Tathlum +1",
		head="Jhakri Coronal +1",
		body="Jhakri Robe +1",
		hands="Jhakri Cuffs +1",
		legs="Jhakri Slops +1",
		feet="Jhakri Pigaches +1",
		neck="Sanctity Necklace",
		waist="Hachirin-no-Obi",
		left_ear="Friomisi Earring",
		right_ear="Loquac. Earring",
		left_ring="Fenrir Ring",
		right_ring="Acumen Ring",
		back="Seshaw Cape",
	}
    sets.midcast['Elemental Magic'].Resistant = {
		main={ name="Akademos", augments={'INT+15','"Mag.Atk.Bns."+15','Mag. Acc.+15',}},
		sub="Niobid Strap",
		ammo="Ghastly Tathlum +1",
		head="Jhakri Coronal +1",
		body="Jhakri Robe +1",
		hands="Jhakri Cuffs +1",
		legs="Jhakri Slops +1",
		feet="Jhakri Pigaches +1",
		neck="Sanctity Necklace",
		waist="Hachirin-no-Obi",
		left_ear="Friomisi Earring",
		right_ear="Loquac. Earring",
		left_ring="Fenrir Ring",
		right_ring="Acumen Ring",
		back="Seshaw Cape",
	}
	-----------------------------------------------
	-- Custom refinements for certain nuke tiers --
	-----------------------------------------------
    sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {sub="Wizzan Grip"})
    sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {sub="Wizzan Grip"})
    sets.midcast.Impact = {
		main="Lehbrailg +2",
		sub="Mephitis Grip",
		ammo="Dosis Tathlum",
        head=empty,
		neck="Eddy Necklace",
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
		main={ name="Akademos", augments={'INT+15','"Mag.Atk.Bns."+15','Mag. Acc.+15',}},
		sub="Niobid Strap",
		ammo="Ghastly Tathlum +1",
		head={ name="Merlinic Hood", augments={'Mag. Acc.+26','Magic burst mdg.+5%','"Mag.Atk.Bns."+1',}},
		body="Jhakri Robe +1",
		hands={ name="Amalric Gages", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
		legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic burst mdg.+10%','MND+7','Mag. Acc.+9','"Mag.Atk.Bns."+11',}},
		feet="Arbatel Loafers",
		neck="Mizu. Kubikazari",
		waist="Hachirin-no-Obi",
		left_ear="Moldavite Earring",
		right_ear="Friomisi Earring",
		left_ring="Mujin Band",
		right_ring="Locus Ring",
		back="Seshaw Cape",
	}
	sets.midcast['Elemental Magic'].Helix = {
		main={ name="Akademos", augments={'INT+15','"Mag.Atk.Bns."+15','Mag. Acc.+15',}},
		sub="Niobid Strap",
		ammo="Ghastly Tathlum +1",
		head={ name="Merlinic Hood", augments={'Mag. Acc.+26','Magic burst mdg.+5%','"Mag.Atk.Bns."+1',}},
		body="Jhakri Robe +1",
		hands={ name="Amalric Gages", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
		legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic burst mdg.+10%','MND+7','Mag. Acc.+9','"Mag.Atk.Bns."+11',}},
		feet="Arbatel Loafers",
		neck="Mizu. Kubikazari",
		waist="Refoccilation Stone",
		left_ear="Moldavite Earring",
		right_ear="Friomisi Earring",
		left_ring="Mujin Band",
		right_ring="Locus Ring",
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
		main={ name="Grioavolr", augments={'Magic burst mdg.+5%','MP+100','Mag. Acc.+27','Magic Damage +4',}},
		sub="Niobid Strap",
		ammo="Ghastly Tathlum +1",
		head="Pixie Hairpin +1",
		body={ name="Amalric Doublet", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
		hands={ name="Telchine Gloves", augments={'"Cure" potency +4%','"Regen" potency+3',}},
		legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
		feet={ name="Psycloth Boots", augments={'MP+50','INT+7','"Conserve MP"+6',}},
		neck="Sanctity Necklace",
		waist="Luminary Sash",
		left_ear="Loquac. Earring",
		right_ear="Moldavite Earring",
		left_ring="Mephitas's Ring +1",
		right_ring="Mephitas's Ring",
		back="Vates Cape +1",
	}
----------------------
-- 	Misc Gear-sets 	--
----------------------
	sets.Kiting = {feet="Herald's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}