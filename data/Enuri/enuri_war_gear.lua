include('augments.lua')
----------------------
--	Field/Town Idle	--
----------------------
	sets.idle = {
		ammo="Sihirik",
        head="Hjarrandi helm",
        body="Sacro breastplate",
		hands="Leyline gloves",
		legs=Odyssean.Legs.PDT,
        feet="Amm greaves",
		neck="Loricate torque +1",
        ear1="Telos earring",
		ear2="Cessance earring",
        ring1="Defending ring",
        ring2="Gelatinous ring +1",
        back=Cich.TP,
		waist="Flume belt"
	}
	sets.Kiting = {
		feet="Hermes' sandals"
	}
	sets.Kiting.night = {
		feet="Hermes' sandals"
	}
	sets.idle.MagicEva = {
		ammo="Sihirik",
        head="Hjarrandi helm",
        body="Sacro breastplate",
		hands="Leyline gloves",
		legs=Odyssean.Legs.PDT,
        feet="Amm greaves",
		neck="Loricate torque +1",
        ear1="Telos earring",
		ear2="Cessance earring",
        ring1="Defending ring",
        ring2="Gelatinous ring +1",
        back=Cich.TP,
		waist="Flume belt"
	}
	sets.weapons.Lycurgos = { 
		main="Lycurgos",
		sub="Utu Grip"
	}
	sets.weapons.Ukonvasara = { 
		main="Mercurial Sword",
		sub="Utu grip"
	}
	sets.weapons.Ragnarok = { 
		main="Ragnarok",
		sub="Utu Grip"
	}
	sets.weapons.Chango = { 
		main="Quint Spear",
		sub="Utu Grip"
	}
	sets.weapons.Conqueror = { 
		main="Autarch's axe",
		sub="Utu Grip"
	}
	sets.weapons.Bravura = { 
		main="Bravura",
		sub="Utu Grip"
	}
----------------------------------
--		Job Ability sets		--
----------------------------------
	sets.precast.JA['Aggressor '] = {
		body="Agoge lorica"
	}
    sets.precast.JA['Blood Rage']  = {
		legs="Bale Flanchard +2"
	}
    sets.precast.JA['Warcry ']    = {
		head="Fallen's burgeonet"
	}
    sets.precast.JA['Berserk']    = {
		body="Pumm. Lorica +2"
	}
    sets.precast.JA['Blood Weapon'] = {
		body="Fallen's Cuirass +1"
	}
--------------------------------------
--		Casting Gear sets			--
--------------------------------------
	sets.precast.FC = {
--[[ Fast Cast 33%	]]
		ammo="Impatiens",			
		head="Carmine Mask +1",
		body=Odyssean.Body.FC,
		hands=Leyline.FC,
		legs="Enif cosciales",
		feet=Odyssean.Feet.FC,
		ring2="Kishar ring", 
		neck="Voltsurge torque",
		ear1="Etiolation earring",
		ear2="Loquacious earring",
		waist="Chuq'aba belt",
	}
------------------------------
--		Enmity Section		--
------------------------------
	sets.Enmity = {
		ammo="Paeapua",
        head="Despair Helm",
		neck="Invidia Torque",
        body="Odyssean chestplate",
		ring1="Odium Ring",
		ring2="Petrov ring",
		ear2="Friomisi earring",
		waist="Goading Belt",
		legs="Odyssean cuirass",
		feet="Dornen schuhs"
	}
------------------------------------------
--		Normal base Engaged sets		--
------------------------------------------	
	sets.engaged = {
        ammo="Ginsen",
		head="Flamma zucchetto +2",
        body=Valor.Body.TP,
		hands="Flamma Manopolas +2",
		legs=Odyssean.Legs.TP,
        feet="Flamma gambieras +2",
		neck="Lissome necklace",
        ear1="Telos earring",
		ear2="Cessance earring",
        ring1="Chirich Ring +1",
        ring2="Chirich Ring +1",
        back=Cich.TP,
        waist="Ioskeha belt +1",
    }
	sets.engaged.MagicEva = { 
		ammo="Staunch tathlum",
        head="Hjarrandi helm",
        body="Sacro breastplate",
		hands="Leyline gloves",
		legs=Odyssean.Legs.PDT ,
        feet="Founder's greaves",
		neck="Loricate torque +1",
        ear1="Telos Earring",
		ear2="Cessance earring",
        ring1="Defending ring",
        ring2="Moonbeam ring",
        back=Ankou.TP,
		waist="Flume belt"
	}
	------------------------------
	--	Great Axe Engaged Gear 	--
	------------------------------
		----------------------
		--	 1170 Accuracy 	--
		----------------------
	sets.engaged.GreatAxe = set_combine(sets.engaged, { 
		head="Flamma zucchetto +2",
		body=Valor.Body.TP,
		hands="Sulevia's gauntlets +2",
		legs="Pummeler's cuisses +2",
		feet="Pummeler's calligae +2",
		ring2="Niqmaddu ring",
	})
	sets.engaged.Chango = set_combine(sets.engaged, { 
		
	})
--------------------------
-- AfterMath Gearsets	--
--------------------------
	--------------------------
	--		AM Gear			--
	-- Removes some haste	--
	--------------------------

------------------------------------------
--		Greatsword Engaged sets			--
------------------------------------------	
	sets.engaged.GreatSword = set_combine(sets.engaged, {
--[[ This set has +34 sTP for 5 Hit	]]
		head="Argosy celata +1",
		hands=Valor.Hands.TP,
		legs=Valor.Legs.TP,
		feet=Valor.Feet.TP,
		ear1="Telos Earring",
		ear2="Cessance earring",
		neck="Clotharius torque",
        ring1="Rajas ring",
        ring2="Petrov Ring",
        back=Cich.TP,
        waist="Ioskeha belt +1",
    })
	sets.engaged.Ragnarok = set_combine(sets.engaged.GreatSword, {
		head="Flamma zucchetto +2",
		hands="Flamma manopolas +2",
		legs=Odyssean.Legs.TP,
		feet="Flamma gambieras +2",
		neck="Lissome necklace",
		ear1="Telos Earring",
		ear2="Cessance earring",
		ring1="Flamma ring",
		ring2="Chirich ring"
	})
----------------------------------------------
--			Weaponskill Gearsets			--
----------------------------------------------
	sets.precast.WS = {
		ammo="Seething bomblet",
		head=Valor.Head.WS,
		body="Ignominy cuirass +3",
		hands=Odyssean.Hands.WS,
		legs=Odyssean.Legs.VitWS,
		feet="Sulev. leggings +2",
		neck="Fotia gorget",
		ear1="Telos Earring",
		ear2="Bale earring",
		ring1="Ifrit ring",
		ring2="Karieyh ring",
		waist="Fotia belt",
		back=Cich.WS
	}
	sets.WSDayBonus = {head="Gavialis Helm"}
	--------------------------------------
	--		Greataxe Weaponskill		--
	--------------------------------------		
	sets.precast.WS['Upheaval'] = set_combine(sets.precast.WS, { --VIT 73% | 76% | 79% | 82% | 85%
		ammo="Knobkierrie",
		head="Hjarrandi helm",
		body="Hjarrandi breastplate",
		hands=Odyssean.Hands.VitWS,
		legs=Odyssean.Legs.VitWS,
		feet="Sulev. Leggings +2", 
		ear1="Telos earring",
		ring1="Regal ring",
		ring2="Niqmaddu ring",
		back=Cich.VitWS
	})
	sets.precast.WS['Ukko\'s Fury'] = set_combine(sets.precast.WS, { --STR 80%
		ammo="Knobkierrie",
		head="Lustratio cap +1",
		body="Hjarrandi breastplate",
		hands=Valor.Hands.WS,
		legs="Argosy breeches +1",
		feet="Lustratio leggings +1", 
		ear1="Telos earring",
		ring1="Regal ring",
		ring2="Niqmaddu ring",
		back=Cich.WS
	})
	sets.precast.WS['King\'s Justice'] = set_combine(sets.precast.WS, { --STR 50%
		ammo="Knobkierrie",
		head="Lustratio cap +1",
		body="Hjarrandi breastplate",
		hands=Valor.Hands.WS,
		legs="Argosy breeches +1",
		feet="Lustratio leggings +1", 
		ear1="Telos earring",
		ring1="Regal ring",
		ring2="Niqmaddu ring",
		back=Cich.WS
	})
	sets.precast.WS['Raging Rush'] = set_combine(sets.precast.WS, { --STR 50%
		ammo="Knobkierrie",
		head="Lustratio cap +1",
		body="Hjarrandi breastplate",
		hands=Valor.Hands.WS,
		legs="Argosy breeches +1",
		feet="Lustratio leggings +1", 
		ear1="Telos earring",
		ring1="Regal ring",
		ring2="Niqmaddu ring",
		back=Cich.WS
	})
	sets.precast.WS['Steel Cyclone'] = set_combine(sets.precast.WS, { --STR 60% | VIT60%
		ammo="Knobkierrie",
		head="Lustratio cap +1",
		body="Pumm. Lorica +2",
		hands=Valor.Hands.WS,
		legs="Argosy breeches +1",
		feet="Lustratio leggings +1", 
		ear1="Telos earring",
		ring1="Regal ring",
		ring2="Niqmaddu ring",
		back=Cich.WS
	})
	--------------------------------------
	--		Greatsword Weaponskill		--
	--------------------------------------
	sets.precast.WS['Scourge'] = set_combine(sets.precast.WS, { --STR 40% | VIT 40%
		ammo="Knobkierrie",
		head=Odyssean.Helm.VitWS,
		body="Pumm. Lorica +2",
		hands=Odyssean.Hands.VitWS,
		legs=Odyssean.Legs.VitWS,
		feet="Sulev. Leggings +2", 
		ear1="Ishvara earring",
		ring1="Regal ring",
		ring2="Karieyh ring",
		back=Cich.VitWS
	})
	sets.precast.WS['Resolution'] = set_combine(sets.precast.WS, { --STR 73% | 76% | 79% | 82% | 85%
		ammo="Knobkierrie",
		head="Argosy celata +1",	
		body="Argosy hauberk +1",
		hands="Argosy mufflers +1",	
		legs="Argosy breeches +1",		
		feet="Argosy sollerets +1",
		ring1="Regal ring",
		ring2="Niqmaddu ring",
		ear1="Brutal earring",
		ear2="Ishvara earring",
		back=Cich.WS
	})   					
	sets.precast.WS['Resolution'].Mid = set_combine(sets.precast.WS['Resolution'], {
		ear1="Zennaroi earring",
	})
	sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS['Resolution'].Mid, {
		ear2="Mache earring",
		ring1="Begrudging ring"
	})
--------------------------------------
--			Misc. Gearsets			--
--------------------------------------
	sets.DT = set_combine(sets.idle, {
		head="Sulevia's mask +1",
		body="Sulevia's Plate. +2",
		ammo="Staunch tathlum",
		hands="Sulevia's gauntlets +2",
		legs="Sulevia's cuisses +1",
        feet="Sulevia's leggings +2",
		neck="Loricate torque +1",
		ear1="Static Earring",
        ear2="Hearty earring",
        ring1="Defending ring",
        ring2="Gelatinous ring +1",
        back="Mubvum. mantle",
		waist="Asklepian belt"
	})
	sets.PhysicalDefense = {}
	sets.PhysicalDefense.DT = sets.DT
	sets.Asleep = set_combine(sets.DT, {
		head="Frenzy sallet"
	})
	sets.buff.Doom = {
		ring1="Purity Ring",
		ring2="Saida Ring",
		waist="Gishdubar sash",
	}
	sets.Reraise = set_combine(sets.DT, {
		head="Twilight helm",
		body="Twilight mail",
        back="Solemnity cape",
		waist="Nierenschutz"
	})
	sets.CapacityMantle = {
		back="Mecisto. Mantle"
	}
	sets.Reive = {
		neck="Ygna's Resolve +1"
	}