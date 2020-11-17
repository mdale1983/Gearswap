include('augments.lua')
info.ExtraSongInstrument = 'Daurdabla'
----------------------
--  Field/Town Idle --
----------------------
	sets.idle={
		--main="Kaja knife",
		--sub="Taming Sari",
		range="Linos",
		head="Inyanga tiara +2",
		--neck="Loricate torque +1",
		neck="Bard\'s Charm +1",
		ear1="Infused Earring",
		ear2="Genmei Earring",
		body="Bihu jstcorps. +3",
		hands="Inyanga dastanas +2",
		ring1="Ayanmo Ring",
		ring2="Vocane ring",
		back=Intara.FC,
		waist="Flume Belt",
		legs="Brioso cannions +2",
		feet="Inyanga crackows +2"
	}
	sets.idle.PDT = set_combine(sets.idle, {
		head="Aya. zucchetto +2",
		--neck="Dampener's torque",
		ear1="Infused Earring",
		ear2="Genmei Earring",
		--body="Ayanmo corazza +2",
		hands="Gende. Gages +1",
		ring1="Ayanmo Ring",
		ring2="Vocane ring",
		back=Intara.FC,
		waist="Flume Belt",
		--legs="Ayanmo cosciales +1",
		feet="Inyanga crackows +2"
	})
	sets.idle.MagicEva = set_combine(sets.idle, { 
		head="Inyanga tiara +2",
		--neck="Bard's charm +1",
		ear1="Infused Earring",
		ear2="Genmei Earring",
		--body="Inyanga jubbah +2",
		hands="Inyanga dastanas +2",
		--ring1="Ayanmo Ring",
		--ring2="Vocane ring",
		back=Intara.FC,
		waist="Flume Belt",
		--legs="Inyanga Shalwar +2",
		feet="Inyanga crackows +2"
	})
	sets.Kiting = {
		feet="Fili cothurnes +1"
	}
--------------------------------------
-- 	Pre-cast Job Ability Gear-sets 	--	
--------------------------------------
	sets.precast.JA.Nightingale = {feet="Bihu Slippers +1"}
    sets.precast.JA.Troubadour = {body="Bihu justaucorps +3"}
    sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions +1"}
----------------------------------
-- 	Pre-cast Magic Gear-sets 	--	
----------------------------------
	sets.precast.FC={	
		head="Vanya Hood",
		neck="Voltsurge Torque",
		ear1="Loquacious earring",
		ear2="Enchntr. Earring +1",
		body="Shango Robe",
		hands="Gende. Gages +1",
		ring1="Kishar Ring",
		ring2="Weather. Ring",
		back="Intarabus's Cape",
		waist="Witful Belt",
	}

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {
		back="Pahtli Cape",
		legs="Doyen Pants"
	})

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC, {
		head="Umuthi Hat",
		legs="Doyen Pants"
	})

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
		waist="Witful Belt"
	})
	
	sets.precast.FC['Honor March'] = set_combine(sets.precast.FC.BardSong,{
		--main="Kali",
		----sub="Kali",
		range="Marsyas",
		body="Inyanga jubbah +2",
        head="Fili Calot +1",
		neck="Aoidos' Matinee",
		ear1="Aoidos' Earring",
		ear2="Loquac. Earring",
        hands="Gendewitha Gages +1",
		ring1="Kishar Ring",
		ring2="Prolix Ring",
        back=Intara.FC,
		waist="Channeler's stone",
		legs="Doyen Pants",
		feet=Telc.Feet.FC,
	})
	
    sets.precast.FC.BardSong = {
    	--main="Kali",
		----sub="Kali",
		body="Inyanga jubbah +2",
        head="Fili Calot +1",
		neck="Aoidos' Matinee",
		ear1="Aoidos' Earring",
		ear2="Loquac. Earring",
        hands="Gendewitha Gages +1",
		ring1="Kishar Ring",
		ring2="Prolix Ring",
        back=Intara.FC,
		waist="Channeler's stone",
		legs="Doyen Pants",
		feet=Telc.Feet.FC,
	}
    sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {
		range=info.ExtraSongInstrument
	})
-------------------------
-- Dummy Songs Section --
-------------------------
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
		back="Intarabus's Cape",
		waist="Witful Belt",
	}
    -- Gear to enhance certain classes of songs. 
    sets.midcast.Ballad = {
		range="Gjallarhorn",
		legs="Fili Rhingrave +1"
	}
	sets.midcast.Prelude = {
		back="Intarabus's Cape",
	}
    sets.midcast.Minne = {range="Daurdabla"}
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
		--main="Kali",
		----sub="Kali",
		range="Gjallarhorn",
        head="Fili Calot +1",
		body="Fili Hongreline +1",
		neck="Moonbow Whistle +1",
		ear1="Aoidos' Earring",
		ear2="Loquac. Earring",
        hands="Fili Manchettes +1",
		ring1="Weather. Ring",
		ring2="Stikini Ring",
        back="Intarabus's Cape",
		waist="Dynamic Belt",
		legs="Inyanga Shalwar +2",
		feet="Brioso Slippers +3",
	}
	sets.midcast.March = { 
	   --main="Kali",
		----sub="Kali",
		range="Gjallarhorn",
        head="Fili Calot +1",
		body="Fili Hongreline +1",
		neck="Moonbow Whistle +1",
		ear1="Aoidos' Earring",
		ear2="Loquac. Earring",
        hands="Fili Manchettes +1",
		ring1="Weather. Ring",
		ring2="Stikini Ring",
        back="Intarabus's Cape",
		waist="Dynamic Belt",
		legs="Inyanga Shalwar +2",
		feet="Brioso Slippers +3",
	}
	sets.midcast["Honor March"] = set_combine(sets.midcast.SongEffect,{
		--main="Kali",
		----sub="Kali",
		range="Marsyas",
		head="Fili Calot +1",
		body="Fili Hongreline +1",
		neck="Moonbow Whistle +1",
		ear1="Aoidos' Earring",
		ear2="Loquac. Earring",
        hands="Fili Manchettes +1",
		ring1="Weather. Ring",
		ring2="Stikini Ring",
        back="Intarabus's Cape",
		waist="Dynamic Belt",
		legs="Inyanga Shalwar +2",
		feet="Brioso Slippers +3",
	})
	sets.midcast.Minuet = {
		--main="Kali",
		----sub="Kali",
		range="Gjallarhorn",
        head="Fili Calot +1",
		body="Fili Hongreline +1",
		neck="Moonbow Whistle +1",
		ear1="Aoidos' Earring",
		ear2="Loquac. Earring",
        hands="Fili Manchettes +1",
		ring1="Weather. Ring",
		ring2="Stikini Ring",
        back="Intarabus's Cape",
		waist="Dynamic Belt",
		legs="Inyanga Shalwar +2",
		feet="Brioso Slippers +3",
	}
	sets.midcast.Madrigal = { 
		--main="Kali",
		----sub="Kali",
		range="Gjallarhorn",
        head="Fili Calot +1",
		body="Fili Hongreline +1",
		neck="Moonbow Whistle +1",
		ear1="Aoidos' Earring",
		ear2="Loquac. Earring",
        hands="Fili Manchettes +1",
		ring1="Weather. Ring",
		ring2="Stikini Ring",
        back="Intarabus's Cape",
		waist="Dynamic Belt",
		legs="Inyanga Shalwar +2",
		feet="Brioso Slippers +3",
	}
	sets.midcast['Goddess\'s Hymnus'] = { 
		range="Gjallarhorn",
        head="Fili Calot +1",
		body="Fili Hongreline +1",
		neck="Moonbow Whistle +1",
		ear1="Aoidos' Earring",
		ear2="Loquac. Earring",
        hands="Fili Manchettes +1",
		ring1="Weather. Ring",
		ring2="Stikini Ring",
        back="Intarabus's Cape",
		waist="Dynamic Belt",
		legs="Inyanga Shalwar +2",
		feet="Brioso Slippers +3",
	}
    -- For song defbuffs (duration primary, accuracy secondary)
    sets.midcast.SongDebuff = {
	    --main="Kali",
		--sub="Kali",
		range="Gjallarhorn",
        head="Brioso roundlet +2",
		neck="Moonbow Whistle +1",
		ear1="Gwati Earring",
		ear2="Lempo Earring",
        body="Brioso Justau. +2",
		hands="Inyanga dastanas +2",
		ring1="Stikini Ring",
		ring2="Kishar Ring",
        back=Intara.MACC,
		waist="Eschan stone",
		legs="Brioso cannions +2",
		feet="Brioso Slippers +3"
	}
    sets.midcast['Horde Lullaby II']= set_combine(sets.midcast.SongDebuff, {
		range="Blurred harp +1",
		--hands="Brioso Cuffs +3"
	})
    -- For song defbuffs (accuracy primary, duration secondary)
    sets.midcast.ResistantSongDebuff = {
		--main="Kali",
		----sub="Kali",
		range="Gjallarhorn",
        head="Inyanga tiara +2",
		neck="Moonbow Whistle +1",
		ear1="Regal Earring",
		ear2="Enchntr. Earring +1",
        body="Inyanga jubbah",
		hands="Inyanga dastanas +2",
		ring1="Stikini Ring",
		ring2="Weather. Ring",
        back="Intarabus's Cape",
		waist="Luminary Sash",
		legs="Inyanga Shalwar +2",
		feet="Brioso Slippers +2"
	}
	
		
	sets.midcast.LullabyFull = set_combine(sets.midcast.SongDebuff, sets.midcast.Lullaby)
	sets.midcast.LullabyFull.ResistantSongDebuff = set_combine(sets.midcast.ResistantSongDebuff, sets.midcast.Lullaby)

    -- Song-specific recast reduction
    sets.midcast.SongRecast = {
		ear2="Loquacious Earring",
		ring1="Kishar Ring",
		legs="Fili Rhingrave +1"
	} 

    sets.midcast.Daurdabla = set_combine(sets.midcast.FastRecast, sets.midcast.SongRecast, {range=info.ExtraSongInstrument})

    -- Cast spell with normal gear, except using Daurdabla instead
    sets.midcast.Terpander = {range=info.ExtraSongInstrument}

    -- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
    sets.midcast.DaurdablaDummy = {
        ------sub="Taming Sari",
		range=info.ExtraSongInstrument,
        head="Fili Calot +1",
		neck="Aoidos' Matinee",
		ear1="Aoidos' Earring",
		ear2="Loquac. Earring",
        hands="Gendewitha Gages +1",
		ring1="Kishar Ring",
		ring2="Weather. Ring",
        back="Intarabus's Cape",
		waist="Witful Belt",
		legs="Doyen Pants",
		feet="Bihu Slippers",
	}

    -- Other general spells and classes.
    sets.midcast.Cure = {
        head="Vanya Hood",
		neck="Loricate Torque +1",
		ear1="Loquacious earring",
		ear2="Enchntr. Earring +1",
		body="Chironic Doublet",
		hands="Telchine Gloves",
		ring1="Dark Ring",
		ring2="Defending ring",
		back="Intarabus's Cape",
		waist="Fucho-no-obi",
		legs="Gyve Trousers",
		feet="Vanya Clogs"
	}        
    sets.midcast.Curaga = sets.midcast.Cure
    sets.midcast.Cursna = sets.midcast.Cure
	sets.midcast['Enhancing Magic'] = {
		------sub="Ammurapi Shield",
		ammo="Staunch Tathlum",
		head={ name="Telchine Cap", augments={'Mag. Evasion+21','Enemy crit. hit rate -3','Enh. Mag. eff. dur. +10',}},
		body={ name="Telchine Chas.", augments={'Mag. Evasion+24','Enemy crit. hit rate -4','Enh. Mag. eff. dur. +8',}},
		hands={ name="Telchine Gloves", augments={'Mag. Evasion+25','"------subtle Blow"+6','Enh. Mag. eff. dur. +9',}},
		legs={ name="Telchine Braconi", augments={'Mag. Evasion+24','Enemy crit. hit rate -4','Enh. Mag. eff. dur. +9',}},
		feet={ name="Telchine Pigaches", augments={'Mag. Evasion+25','"------subtle Blow"+6','Enh. Mag. eff. dur. +10',}},
		neck="Incanter's Torque",
		waist="Rumination Sash",
		ear1="Loquacious Earring",
		ear2="Enchntr. Earring +1",
		ring1="Stikini Ring",
		ring2="Evanescence Ring",
		back="Perimede Cape",
	}
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})
    
	sets.midcast.RefreshRecieved = set_combine(sets.midcast['Enhancing Magic'], {back="Grapevine Cape",waist="Gishdubar Sash"})
--------------------------
-- 	engaged gear=sets 	--
--------------------------
	sets.engaged = {
		range="Linos",
		head="Aya. Zucchetto",
		body="Ayanmo corazza +1",
		hands="Chironic gloves",
		legs="Chironic Hose",
		feet="Ayanmo gambieras +1",
		neck="Clotharius torque",
		waist="Dynamic Belt",
		ear1="Mache Earring",
		ear2="Brutal Earring",
		ring1="Chirich Ring",
		ring2="Chirich Ring",
		back="Solemnity cape",
	}	
	sets.engaged.DW = {
		range="Linos",
		head="Aya. Zucchetto +2",
		body="Bihu justaucorps +3",
		hands="Chironic gloves",
		legs="Chironic Hose",
		feet="Ayanmo gambieras +2",
		neck="Bard's Charm +1",
		waist="Reiki yotai",
		ear1="Eabani Earring",
		ear2="Mache Earring",
		ring1="Chirich ring",
		ring2="Chirich ring",
		back=Intara.ACC,
	}
	sets.engaged.MagicEva = { 
		head="Inyanga tiara +2",
		neck="Bard's charm +1",
		ear1="Infused Earring",
		ear2="Genmei Earring",
		body="Inyanga jubbah +2",
		hands="Inyanga dastanas +2",
		ring1="Ayanmo Ring",
		ring2="Vocane ring",
		back="Solemnity Cape",
		waist="Flume Belt",
		legs="Inyanga Shalwar +2",
		feet="Inyanga crackows +2"
	}
------------------------------
-- 	Weaponskill Gear-Sets 	--
------------------------------
	sets.precast.WS = {
		range="Linos",
		head="Lustratio cap +1",
		body="Bihu justaucorps +3",
		hands="Lustratio mittens +1",
		legs="Lustr. subligar +1",
		feet="Lustratio leggings +1",
		neck="Bard's Charm +1",
		waist="Grunfeld Rope",
		ear1="Ishvara Earring",
		ear2="Moonshade Earring", 
		ring1="Apate Ring",
		ring2="Zilant Ring",
		back=Intara.WS
	}

		
    
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {
		body="Ayanmo corazza +2",
		neck="Bard's charm +1", 
		back=Intara.ACC
		--waist="Fotia Belt"
	})
    sets.precast.WS['Rudra\'s Storm'] = {
		range="Linos",
		head="Lustratio cap +1",
		body="Bihu justaucorps +3",
		hands="Lustratio mittens +1",
		legs="Lustr. subligar +1",
		feet="Lustratio leggings +1",
		neck="Bard's Charm +1",
		waist="Grunfeld Rope",
		ear1="Ishvara Earring",
		ear2="Moonshade Earring", 
		ring1="Apate Ring",
		ring2="Zilant Ring",
		back=Intara.WS
	}
    sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {
		neck="Fotia Gorget", 
		waist="Fotia Belt"
	})
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
	sets.MoveSpeed = set_combine(sets.idle,{
		feet="Fili Cothurnes +1"
	})