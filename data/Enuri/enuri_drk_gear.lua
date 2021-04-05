include('augments.lua')
----------------------
--	Field/Town Idle	--
----------------------
	sets.idle = {
		ammo="Staunch tathlum",
        head="Hjarrandi helm",
        body="Sacro breastplate",
		hands="Leyline gloves",
		legs=Odyssean.Legs.PDT ,
        feet="Amm greaves",
		neck="Loricate torque +1",
        ear1="Telos earring",
		ear2="Cessance earring",
        ring1="Moonbeam ring",
        ring2="Moonbeam ring",
        back=Ankou.TP,
		waist="Flume belt"
	}
	sets.idle.MagicEva = {
		ammo="Staunch tathlum",
        head="Hjarrandi helm",
        body="Sacro breastplate",
		hands="Leyline gloves",
		legs=Odyssean.Legs.PDT ,
        feet="Amm greaves",
		neck="Loricate torque +1",
        ear1="Etiolation earring",
		ear2="Odnowa earring +1",
        ring1="Defending ring",
        ring2="Gelatinous ring +1",
        back=Ankou.TP,
		waist="Flume belt"
	}
	sets.Kiting = {
		legs="Carmine cuisses +1"
	}
	sets.Kiting.night = {
		legs="Carmine cuisses +1"
	}
	sets.weapons.Liberator = { 
		main="Liberator",
		sub="Utu Grip"
	}
	sets.weapons.Redemption = { 
		main="Redemption",
		sub="Utu grip"
	}
	sets.weapons.Apocalypse = { 
		main="Apocalypse",
		sub="Utu Grip"
	}
	sets.weapons.Ragnarok = { 
		main="Ragnarok",
		sub="Utu Grip"
	}
	sets.weapons.Caladbolg = { 
		main="Caladbolg",
		sub="Utu Grip"
	}
	sets.weapons.Anguta = { 
		main="Anguta",
		sub="Utu Grip"
	}
--------------------------------------
-- 	Pre-cast Job Ability Gear-sets 	--	
--------------------------------------
	sets.precast.JA['Diabolic Eye'] = {
		hands="Fall. Fin. Gaunt. +3"
	}
    sets.precast.JA['Nether Void']  = {
		legs="Heathen's flanchard +1"
	}
    sets.precast.JA['Dark Seal']    = {
		head="Fallen's burgeonet +1"
	}
    sets.precast.JA['Souleater']    = {
		head="Ig. burgonet +2"
	}
    sets.precast.JA['Blood Weapon '] = {
		--body="Fallen's Cuirass +1"
	}
    sets.precast.JA['Last Resort']  = {
		back="Ankou's mantle"
	}
	sets.precast.JA['Weapon Bash'] = {
		hands="Ignominy gauntlets +2"
	}
---------------
-- Buff sets --
---------------

--------------------------------------
--		Casting Gear sets			--
--------------------------------------
	sets.precast.FC = {
--[[ Fast Cast 33%	]]
		ammo="Impatiens",			
		head="Carmine Mask +1",
		body="Sacro breastplate",
		hands=Leyline.FC,
		legs="Eschite cuisses",
		feet=Odyssean.Feet.FC,
		ring1="Weather. ring",
		ring2="Kishar ring", 
		neck="Voltsurge torque",
		ear1="Etiolation earring",
		ear2="Loquacious earring",
		waist="Ioskeha belt +1",
		back=Ankou.FC
	}
	sets.midcast.FastRecast = {
        ammo="Impatiens",
        head="Carmine mask +1",
        body=Odyssean.Body.FC,
		hands=Odyssean.Hands.FC,
		ear2="Loquacious earring",
        feet="Carmine Greaves +1"
    }
	sets.midcast['Dark Magic'] = set_combine(sets.precast.FC, {
		ammo="Hydrocera",
		--[[head="Ignominy burgeonet +2",]]
		neck="Erra Pendant",
		body="Lugra cloak +1",
		hands="Fallen's finger gauntlets +3",
		legs="Eschite cuisses",
		feet="Flamma gambieras +2",
		ring1="Etana ring",
		ring2="Evanescence ring",
		ear1="Hermetic earring",
		ear2="Gwati earring",
		waist="Eschan stone",
		back=Niht.DarkMagic
	})
	sets.midcast.Absorb = set_combine(sets.midcast['Dark Magic'], { 
		head="Ig. Burgonet +2",
		body="Carmine scale mail +1",
		hands="Fallen's finger gauntlets +3",
		feet="Ratri sollerets",
		back=Ankou.FC
	})
	sets.midcast['Dread Spikes'] = set_combine(sets.precast.FC, {
		head="Ratri Sallet",
		neck="Dualism Collar +1",
		body="Heath. Cuirass +1",
		hands="Ratri Gadlings",
		legs="Ratri Cuisses",
		feet="Amm greaves",
		waist="Carrier's sash",		
		ring1="Moonbeam Ring",
		ring2="Moonbeam Ring",
		ear1="Odnowa Earring",
		ear2="Odnowa Earring +1",
	})
	sets.midcast.Absorb.Resistant = set_combine(sets.midcast.Absorb, { 
		head="Carmine Mask +1"
	})
	sets.midcast['Absorb-TP'] = set_combine(sets.midcast.Absorb,{
		hands="Heath. gauntlets +1",
	})
	sets.midcast['Stun'] = set_combine(sets.midcast['Dark Magic'], {
	
	})
	sets.midcast['Endark II'] = {
        head="Ignominy Burgonet +2",
        neck="Erra Pendant",
        ear1="Loquacious Earring",
        body="Carmine Scale Mail +1",
        hands="Fallen's finger gauntlets +3",
        ring1="Stikini Ring",
        ring2="Evanescence Ring",
        waist="Phos belt",
        legs="Eschite cuisses",
        feet=Odyssean.Feet.FC,
        back="Niht Mantle",
	}
	sets.midcast.Drain = set_combine(sets.midcast.Absorb, {
		--ammo="Pemphredo Tathlum",
		body="Lugra cloak +1",
		hands="Fallen's finger gauntlets +3",
		legs="Eschite cuisses",
		feet="Founder's greaves",
		neck="Erra pendant",
		ear1="Gwati earring",
		ear2="Hirudinea earring",
		ring1="Kishar ring",
		ring2="Evanescence ring",
		waist="Eschan stone",
		back=Niht.DarkMagic
	})
	sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast['Elemental Magic'] = {}
	sets.midcast['Enfeebling Magic'] = {}
------------------------------
--		Enmity Section		--
------------------------------
	sets.Enmity = {
		ammo="Paeapua",
		neck="Unmoving collar",
        body="Odyssean chestplate",
		ring1="Begrudging Ring",
		ring2="Petrov ring",
		ear2="Friomisi earring",
		waist="Goading Belt",
		legs="Odyssean Cuisses",
	}
	sets.midcast.Stun.Enmity = set_combine(sets.Enmity, {})
	sets.midcast.Absorb.Enmity = set_combine(sets.Enmity, {})
    sets.midcast['Absorb-TP'].Enmity = set_combine(sets.Enmity, {})
    sets.midcast['Elemental Magic'].Enmity = set_combine(sets.Enmity, {})
    sets.midcast['Enfeebling Magic'].Enmity = set_combine(sets.Enmity, {})
--------------------------------------
--		Scythe Engaged sets			--
--------------------------------------	
--[[ Non-REMA Scythe Set]]
	sets.engaged = {
        ammo="Ginsen",
		head="Flamma zucchetto +2",
        body=Valor.Body.TP,
		hands="Flamma Manopolas +2",
		legs=Odyssean.Legs.TP,
        feet="Flamma gambieras +2",
		neck="Abyssal bead necklace +2",
        ear1="Telos earring",
		ear2="Cessance earring",
        ring1="Chirich ring +1",
        ring2="Chirich Ring +1",
        back=Ankou.TP,
        waist="Ioskeha belt +1",
    }
	----------------------------------
	--	Apocalypse Engaged Gear 	--
	----------------------------------
		----------------------
		--	 1114 Accuracy 	--
		----------------------
	sets.engaged.Apocalypse = set_combine(sets.engaged, { 
		head="Flamma zucchetto +2",
		hands="Sulevia's gauntlets +2",
		body=Valor.Body.TP,
		feet="Flamma gambieras +2"
	})
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
	sets.engaged.MagicEva.Apocalypse = { 
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
--------------------------
-- AfterMath Gearsets	--
--------------------------
	--------------------------
	--		AM Gear			--
	-- Removes some haste	--
	--------------------------
	sets.engaged.Apocalypse.AM = set_combine(sets.engaged.Apocalypse, {
		hands="Sulevia's gauntlets +2",
		legs="Ignominy flanchard +2",
		ammo="Ginsen",
	})
------------------------------------------
--		Greatsword Engaged sets			--
------------------------------------------	
	sets.engaged.GreatSword = set_combine(sets.engaged, {
--[[ This set has +34 sTP for 5 Hit	]]
		head="Argosy celata +1",
		hands="Flamma manopolas +2",
		legs=Odyssean.Legs.TP,
		feet="Flamma gambieras +2",
		ear1="Telos Earring",
		ear2="Cessance earring",
		neck="Lissome torque",
        ring1="Chirich ring +1",
        ring2="Chirich Ring +1",
        back=Ankou.TP,
        waist="Ioskeha belt +1",
    })
	sets.engaged.Caladbolg = set_combine(sets.engaged.GreatSword, { --+54 sTP
		head="Flamma zucchetto +2",
		hands="Flamma manopolas +2",
		legs=Odyssean.Legs.TP,
		feet="Flamma gambieras +2",
		neck="Abyssal bead necklace +2",
		ear1="Telos Earring",
		ear2="Cessance earring",
		ring1="Chirich ring +1",
        ring2="Niqmaddu ring",
	})
	sets.engaged.MagicEva.Caladbolg = { 
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
	sets.engaged.Ragnarok = set_combine(sets.engaged.GreatSword, {
		head="Flamma zucchetto +2",
		hands="Flamma manopolas +2",
		legs=Odyssean.Legs.TP,
		feet="Flamma gambieras +2",
		neck="Abyssal bead necklace +2",
		ear1="Telos Earring",
		ear2="Cessance earring",
		ring1="Chirich ring +1",
        ring2="Chirich Ring +1",
	})
	sets.engaged.MagicEva.Ragnarok = { 
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
----------------------------------------------
--			Weaponskill Gearsets			--
----------------------------------------------
	sets.precast.WS = {
		ammo="Seething bomblet",
		head=Odyssean.Helm.VitWS,
		body="Ignominy cuirass +3",
		hands=Odyssean.Hands.WS,
		legs="Fall. Flanchard +3",
		feet="Sulev. leggings +2",
		neck="Fotia gorget",
		ear1="Telos Earring",
		ring1="Regal ring",
		ring2="Niqmaddu ring",
		waist="Fotia belt",
		back=Ankou.StrWS
	}
	--sets.WSDayBonus = {head="Gavialis Helm"}
	----------------------------------
	--		Scythe Weaponskill		--
	----------------------------------		
--[[	Entropy Weaponskill		]]
	sets.precast.WS['Entropy'] = set_combine(sets.precast.WS, {
		ammo="Knobkierrie",
		head="Ratri Sallet",
		neck="Abyssal Beads +2",
		--ear1="Moonshade Earring",
		ear2="Telos Earring",
		body="Ignominy Cuirass +3",
		hands="Rat. Gadlings",
		ring1="Regal Ring",
		ring2="Niqmaddu Ring",
		--back="Ankou's Mantle",
		waist="Kentarch Belt +1",
		legs="Ig. Flanchard +3",
		feet="Sulev. Leggings +2",
		back=Ankou.TP
	})
	sets.precast.WS['Entropy'].Acc = set_combine(sets.precast.WS['Entropy'].Mid, {
		ear2="Mache earring +1",
		ring1="Begrudging ring"
	})
--[[	Catastrophe Weaponskill		]]
	sets.precast.WS['Catastrophe'] = set_combine(sets.precast.WS, {
		ammo="Knobkierrie",
		head="Ratri Sallet",
		body="Ignominy Cuirass +3",
		hands="Rat. Gadlings",
		legs="Fall. Flanchard +3",
		feet="Sulev. Leggings +2",
		neck="Abyssal Beads +2",
		ear1="Moonshade Earring",
		ear2="Ishvara Earring",
		ring1="Regal Ring",
		ring2="Niqmaddu Ring",
		waist="Fotia Belt",
		back=Ankou.StrWS,
	})
	sets.precast.WS['Catastrophe'].Mid = set_combine(sets.precast.WS, {
		ammo="Knobkierrie",
		head="Ratri sallet",
		body="Ignominy cuirass +3",
		hands="Ratri gadlings",
		legs="Ignominy Flanchard +2",
		feet="Sulev. leggings +2",
		neck="Abyssal bead necklace +2",
		waist="Fotia belt",
		ear1="Ishvara Earring",
		ear2="Brutal earring",
		ring1="Regal ring",
		ring2="Niqmaddu ring",
	})
--[[	Quietus Weaponskill		]]
	sets.precast.WS['Quietus'] = set_combine(sets.precast.WS, {
		ammo="Knobkierrie",
		head="Ratri sallet",
		body="Ignominy cuirass +3",
		hands="Ratri gadlings",
		legs="Ignominy Flanchard +2",
		feet="Sulev. leggings +2",
		neck="Abyssal bead necklace +2",
		waist="Fotia belt",
		ear1="Ishvara Earring",
		ear2="Brutal earring",
		ring1="Regal ring",
		ring2="Niqmaddu ring",
	})
--[[	Insurgency Weaponskill		]]	
	sets.precast.WS['Insurgency'] = set_combine(sets.precast.WS, {
		head="Flamma zucchetto +2",
		body="Ignominy cuirass +3",
		hands="Fallen's finger gauntlets +3",
		legs="Fallen's flanchard +3",
		ammo="Knobkierrie",
		neck="Abyssal bead necklace +2",
		waist="Kentarch belt +1",
		ring1="Regal ring",
		ring2="Niqmaddu ring",
		legs="Fall. Flanchard +3",
		back=Ankou.TP
	})
	sets.precast.WS['Insurgency'].Mid = set_combine(sets.precast.WS['Insurgency'], {
		ear1="Zennaroi earring",
	})
	sets.precast.WS['Insurgency'].Acc = set_combine(sets.precast.WS['Insurgency'].Mid, {
		ear2="Mache earring",
		ring1="Begrudging ring"
	})
--[[	Cross Reaper Weaponskill		]]
	sets.precast.WS['Cross Reaper'] = set_combine(sets.precast.WS, {
		ammo="Knobkierrie",
		head="Ratri sallet",
		body="Ignominy cuirass +3",
		hands="Ratri gadlings",
		legs="Ignominy Flanchard +2",
		feet="Sulev. leggings +2",
		neck="Abyssal bead necklace +2",
		waist="Fotia belt",
		ear1="Ishvara Earring",
		ear2="Brutal earring",
		ring1="Regal ring",
		ring2="Niqmaddu ring",
	})
	sets.precast.WS['Cross Reaper'].Mid = set_combine(sets.precast.WS['Cross Reaper'], 
	{
		ear1="Zennaroi earring",
	})
	sets.precast.WS['Cross Reaper'].Acc = set_combine(sets.precast.WS['Cross Reaper'].Mid, {
		ear2="Mache earring",
		ring1="Begrudging ring"
	})	
--------------------------------------
--		Greatsword Weaponskill		--
--------------------------------------
	sets.precast.WS['Scourge'] = set_combine(sets.precast.WS, {
		ammo="Knobkierrie",
		head=Odyssean.Helm.VitWS,
		body="Ignominy cuirass +3",
		hands=Odyssean.Hands.VitWS,
		legs="Fallen's flanchard +3",
		feet="Sulev. Leggings +2", 
		neck="Abyssal bead necklace +2",
		ear1="Ishvara earring",
		ring1="Regal ring",
		ring2="Niqmaddu ring",
		back=Ankou.VitWS
	})
	sets.precast.WS['Torcleaver'] = set_combine(sets.precast.WS, {
		ammo="Knobkierrie",
		head=Odyssean.Helm.VitWS,
		body="Ignominy cuirass +3",
		hands=Odyssean.Hands.VitWS,
		legs="Fall. flanchard +3",
		feet="Sulev. Leggings +2",
		neck="Abyssal bead necklace +2",		
		ear1="Ishvara earring",
		ring1="Regal ring",
		ring2="Niqmaddu ring",
		back=Ankou.VitWS
	})
	sets.precast.WS['Resolution'] = set_combine(sets.precast.WS, { 
		ammo="Seething bomblet",
		head="Argosy celata +1",	
		body="Argosy hauberk +1",
		hands="Argosy mufflers +1",	
		legs="Argosy breeches +1",		
		feet="Argosy sollerets +1",
		neck="Abyssal bead necklace +2",
		waist="Kentarch belt +1",
		ring1="Regal ring",
		ring2="Niqmaddu ring",
		ear1="Brutal earring",
		back=Ankou.StrWS
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
	})	
	sets.PhysicalDefense = {}
	sets.PhysicalDefense.DT = sets.DT
	sets.Asleep = set_combine(sets.DT, {
		head="Frenzy sallet"
	})
	sets.buff.Doom = {
		ring1="Saida Ring",
		ring2="Eshmun's Ring",
		waist="Gishdubar sash",
	}
	sets.Reraise = set_combine(sets.DT, {
		head="Twilight helm",
		body="Twilight mail",
	})
	sets.CapacityMantle = {
		back="Mecisto. Mantle"
	}