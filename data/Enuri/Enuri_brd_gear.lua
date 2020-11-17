include('augments.lua')
info.ExtraSongInstrument = 'Terpander'
info.ExtraSongs = 3
----------------------
--  Field/Town Idle --
----------------------
	sets.idle={
		main="Sangoma",
		sub="Genmei Shield",
		head="Aya. Zucchetto +1",
		body="Ayanmo corazza +2",
		hands="Aya. Manopolas +1",
		neck="Loricate Torque",
		ear1="Hearty Earring",
		ear2="Halasz Earring",
		ring1="Warp Ring",
		ring2="Defending ring",
		back="Solemnity Cape",
		waist="Flume Belt",
		legs="Aya. cosciales +1",
		feet="Fili Cothurnes +1"
	}
	sets.idle.PDT = {
		main="Mafic Cudgel",
		sub="Genmei Shield",
		head="Gende. Caubeen +1",
		neck="Loricate Torque +1",
		ear1="Odnowa Earring +1",
		ear2="Genmei Earring",
		body={ name="Gende. Bilaut +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -4%','"Cure" potency +4%',}},
		hands="Gende. Gages +1",
		ring1="Dark Ring",
		ring2="Defending ring",
		back="Solemnity Cape",
		waist="Flume Belt +1",
		legs="Assiduity Pants +1",
		feet="Fili Cothurnes +1"
	}
--------------------------------------
-- 	Pre-cast Job Ability Gear-sets 	--	
--------------------------------------
	sets.precast.JA.Nightingale = {feet="Bihu Slippers"}
    sets.precast.JA.Troubadour = {body="Bihu Justaucorps"}
    sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions"}
----------------------------------
-- 	Pre-cast Magic Gear-sets 	--	
----------------------------------
	sets.precast.FastCast={	
		head="Vanya Hood",
		neck="Voltsurge Torque",
		ear1="Loquacious earring",
		ear2="Enchntr. Earring +1",
		body="Shango Robe",
		hands="Gende. Gages +1",
		ring1="Kishar Ring",
		ring2="Weather. Ring",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
		waist="Witful Belt",
	}

    sets.precast.FastCast.Cure = set_combine(sets.precast.FastCast, {
		back="Pahtli Cape",
		legs="Doyen Pants"
	})

    sets.precast.FastCast.Stoneskin = set_combine(sets.precast.FastCast, {
		head="Umuthi Hat",
		legs="Doyen Pants"
	})

    sets.precast.FastCast['Enhancing Magic'] = set_combine(sets.precast.FastCast, {
		waist="Witful Belt"
	})

    sets.precast.FastCast.BardSong = {
    	main="Kali",
		sub="Ammurapi Shield",
		--range="Gjallarhorn",
		range="Eminent flute",
		body="Brioso Justau. +3",
        head="Fili Calot +1",
		neck="Aoidos' Matinee",
		ear1="Aoidos' Earring",
		ear2="Loquac. Earring",
        hands="Gendewitha Gages +1",
		ring1="Kishar Ring",
		ring2="Weather. Ring",
        back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
		waist="Witful Belt",
		legs="Doyen Pants",
		feet="Bihu Slippers",
	}
    sets.precast.FastCast.Daurdabla = set_combine(sets.precast.FastCast.BardSong, {
		range=info.ExtraSongInstrument
	})
----------------------------------
-- 	Mid-cast Magic Gear-Sets 	--
----------------------------------
	 sets.midcast.FastRecast = {    
		head="Vanya Hood",
		neck="Voltsurge Torque",
		ear1="Loquacious earring",
		ear2="Enchntr. Earring +1",
		body="Shango Robe",
		hands="Gende. Gages +1",
		ring1="Kishar Ring",
		ring2="Weather. Ring",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
		waist="Witful Belt",
	}
        
    -- Gear to enhance certain classes of songs. 
    sets.midcast.Ballad = {
		legs="Fili Rhingrave +1"
	}
    sets.midcast.Lullaby = {
		hands="Brioso Cuffs +3"
	}
    sets.midcast.Madrigal = {
		head="Fili Calot +1",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
	}
	sets.midcast.Prelude = {
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}}
	}
    sets.midcast.March = {
		hands="Fili Manchettes +1"
	}
	sets.midcast.HonorMarch = {
		hands="Fili Manchettes +1",
		range="Marsyas"
	}
    sets.midcast.Minuet = {
		body="Fili Hongreline +1"
	}
    sets.midcast.Minne = {}
    sets.midcast.Paeon = {
		head="Brioso Roundlet +3"
	}
    sets.midcast.Carol = {
		hands="Mousai Gages"
	}
    sets.midcast["Sentinel's Scherzo"] = {
		feet="Fili Cothurnes +1"
	}
    sets.midcast['Magic Finale'] = {
		neck="Sanctity Necklace",
		waist="Luminary Sash",
		legs="Fili Rhingrave +1"
	}
    sets.midcast.Mazurka = {}
    -- For song buffs (duration and AF3 set bonus)
    sets.midcast.SongEffect = {
		main="Kali", 
		Sub="Ammurapi Shield",
		--range="Gjallarhorn",
		range="Eminent flute",
        head="Fili Calot +1",
		body="Fili Hongreline +1",
		neck="Moonbow Whistle",
		ear1="Aoidos' Earring",
		ear2="Loquac. Earring",
        hands="Fili Manchettes +1",
		ring1="Stikini Ring",
		ring2="Weather. Ring",
        back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
		waist="Witful Belt",
		legs="Inyanga Shalwar +2",
		feet="Brioso Slippers +3",
	}

    -- For song defbuffs (duration primary, accuracy secondary)
    sets.midcast.SongDebuff = {
	    main={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
		Sub="Ammurapi Shield",
		range="Gjallarhorn",
        head="Brioso Roundlet +3",
		neck="Moonbow Whistle",
		ear1="Regal Earring",
		ear2="Enchntr. Earring +1",
        body="Fili Hongreline +1",
		hands="Fili Manchettes +1",
		ring1="Stikini Ring",
		ring2="Weather. Ring",
        back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
		waist="Luminary Sash",
		legs="Inyanga Shalwar +2",
		feet="Brioso Slippers +3"
	}

    -- For song defbuffs (accuracy primary, duration secondary)
    sets.midcast.ResistantSongDebuff = {
	    main={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
		sub="Ammurapi Shield",
		range="Gjallarhorn",
		head="Brioso Roundlet +3",
		body="Brioso Justau. +3",
		hands="Brioso Cuffs +3",
		legs="Brioso Cannions +3",
		feet="Brioso Slippers +3",
		neck="Moonbow Whistle",
		waist="Luminary Sash",
		left_ear="Regal Earring",
		right_ear="Enchntr. Earring +1",
		left_ring="Stikini Ring",
		right_ring="Weather. Ring",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
	}
	
		
	sets.midcast.LullabyFull = set_combine(sets.midcast.SongDebuff, sets.midcast.Lullaby)
	sets.midcast.LullabyFull.ResistantSongDebuff = set_combine(sets.midcast.ResistantSongDebuff, sets.midcast.Lullaby)

    -- Song-specific recast reduction
    sets.midcast.SongRecast = {ear2="Loquacious Earring",ring1="Kishar Ring",legs="Fili Rhingrave +1"} --back="Harmony Cape",waist="Corvax Sash",

    sets.midcast.Daurdabla = set_combine(sets.midcast.FastRecast, sets.midcast.SongRecast, {range=info.ExtraSongInstrument})

    -- Cast spell with normal gear, except using Daurdabla instead
    sets.midcast.Terpander = {range=info.ExtraSongInstrument}

    -- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
    sets.midcast.DaurdablaDummy = {
        main={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
		Sub="Ammurapi Shield",
		range=info.ExtraSongInstrument,
        head="Fili Calot +1",
		neck="Aoidos' Matinee",
		ear1="Aoidos' Earring",
		ear2="Loquac. Earring",
        hands="Gendewitha Gages +1",
		ring1="Kishar Ring",
		ring2="Weather. Ring",
        back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
		waist="Witful Belt",
		legs="Doyen Pants",
		feet="Bihu Slippers",
	}

    -- Other general spells and classes.
    sets.midcast.Cure = {
        head="Vanya Hood",
		neck="Loricate Torque +1",ear1="Loquacious earring",ear2="Enchntr. Earring +1",
		body="Chironic Doublet",hands="Telchine Gloves",ring1="Dark Ring",ring2="Defending ring",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},waist="Fucho-no-obi",legs="Gyve Trousers",feet="Vanya Clogs"}
        
    sets.midcast.Curaga = sets.midcast.Cure
        
        
    sets.midcast.Cursna = sets.midcast.Cure

    
	sets.midcast['Enhancing Magic'] = {
		sub="Ammurapi Shield",
		ammo="Staunch Tathlum",
		head={ name="Telchine Cap", augments={'Mag. Evasion+21','Enemy crit. hit rate -3','Enh. Mag. eff. dur. +10',}},
		body={ name="Telchine Chas.", augments={'Mag. Evasion+24','Enemy crit. hit rate -4','Enh. Mag. eff. dur. +8',}},
		hands={ name="Telchine Gloves", augments={'Mag. Evasion+25','"Subtle Blow"+6','Enh. Mag. eff. dur. +9',}},
		legs={ name="Telchine Braconi", augments={'Mag. Evasion+24','Enemy crit. hit rate -4','Enh. Mag. eff. dur. +9',}},
		feet={ name="Telchine Pigaches", augments={'Mag. Evasion+25','"Subtle Blow"+6','Enh. Mag. eff. dur. +10',}},
		neck="Incanter's Torque",
		waist="Rumination Sash",
		left_ear="Loquacious Earring",
		right_ear="Enchntr. Earring +1",
		left_ring="Stikini Ring",
		right_ring="Evanescence Ring",
		back="Perimede Cape",
	}
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})
    
	sets.midcast.RefreshRecieved = set_combine(sets.midcast['Enhancing Magic'], {back="Grapevine Cape",waist="Gishdubar Sash"})
--------------------------
-- 	engaged gear=sets 	--
--------------------------
	sets.engaged = {
    	range={ name="Linos", augments={'Accuracy+15','"Store TP"+4','Quadruple Attack +3',}},
		head="Aya. Zucchetto +2",
		body="Ashera Harness",
		hands="Aya. Manopolas +2",
		legs={ name="Chironic Hose", augments={'"Triple Atk."+2','"Mag.Atk.Bns."+21','Accuracy+20 Attack+20',}},
		feet={ name="Chironic Slippers", augments={'Accuracy+17','MND+9','Quadruple Attack +3','Accuracy+7 Attack+7',}},
		neck="Combatant's Torque",
		waist="Dynamic Belt +1",
		left_ear="Telos Earring",
		right_ear="Cessance Earring",
		left_ring="Ilabrat Ring",
		right_ring="Hetairoi Ring",
		back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
	}	
	
	sets.meva = {
		main="Terra's Staff",
		sub="Irenic Strap +1",
		ammo="Staunch Tathlum",
		head={ name="Telchine Cap", augments={'Mag. Evasion+21','Enemy crit. hit rate -3','Enh. Mag. eff. dur. +10',}},
		body={ name="Telchine Chas.", augments={'Mag. Evasion+24','Enemy crit. hit rate -4','Enh. Mag. eff. dur. +8',}},
		hands={ name="Telchine Gloves", augments={'Mag. Evasion+25','"Subtle Blow"+6','Enh. Mag. eff. dur. +9',}},
		legs={ name="Telchine Braconi", augments={'Mag. Evasion+24','Enemy crit. hit rate -4','Enh. Mag. eff. dur. +9',}},
		feet={ name="Telchine Pigaches", augments={'Mag. Evasion+25','"Subtle Blow"+6','Enh. Mag. eff. dur. +10',}},
		neck="Warder's Charm +1",
		waist="Carrier's Sash",
		left_ear="Eabani Earring",
		right_ear="Flashward Earring",
		left_ring="Purity Ring",
		right_ring="Vengeful Ring",
		back="Solemnity Cape"
	}
------------------------------
-- 	Weaponskill Gear-Sets 	--
------------------------------
	sets.precast.WS = {
        range={ name="Linos", augments={'Accuracy+15','"Store TP"+4','Quadruple Attack +3',}},
		head="Aya. Zucchetto +2",
		body="Ashera Harness",
		hands="Aya. Manopolas +2",
		legs="Jokushu Haidate",
		feet="Aya. Gambieras +2",
		neck="Caro Necklace",
		waist="Grunfeld Rope",
		left_ear="Ishvara Earring",
		right_ear={ name="Moonshade Earring", augments={'MP+25','TP Bonus +25',}},
		left_ring="Ilabrat Ring",
		right_ring="Shukuyu Ring",
		back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
	}

		
    
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {neck="Fotia Gorget", waist="Fotia Belt"})
    sets.precast.WS['Rudras Storm'] = set_combine(sets.precast.WS)
    sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {neck="Fotia Gorget", waist="Fotia Belt"})
    sets.precast.WS['Mordant Rime'] = set_combine(sets.precast.WS)
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
	sets.defense.DT = sets.engaged.PDT
	sets.CapacityMantle = {
		back="Mecisto. Mantle"
	}
	sets.Reive = {
		neck="Ygna's resolve +1"
	}