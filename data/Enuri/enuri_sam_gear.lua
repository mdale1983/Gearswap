include('augments.lua')
----------------------
--  Field/Town Idle --
----------------------
	sets.idle = {
		head="Ken. Jinpachi",
		body="Wakido domaru +3",
		hands="Wakido kote +3",
		legs="Ryuo hakama",
		feet="Danzo Sune-Ate",
		neck="Loricate Torque +1",
		waist="Flume Belt",
		ear1="Cessance Earring",
		ear2="Telos Earring",
		ring1="Defending Ring",
		ring2="Gelatinous ring +1",
		back=Smert.TP,
		ammo="Staunch Tathlum"
	}
	sets.idle.MagicEva = { 
		ammo="Staunch tathlum",
		head="Ken. Jinpachi",
		body="Wakido domaru +3",
		hands="Wakido kote +3",
		legs="Ken. hakama",
		feet="Ken. sune-ate",
		neck="Loricate torque +1",
		waist="Flume Belt",
		ear1="Cessance Earring",
		ear2="Telos Earring",
		Ring1="Defending Ring",
		ring2="Gelatinous ring +1",
		back=Smert.TP
	}
	sets.idle.PDT = set_combine(sets.idle, { 
		feet="Amm greaves"
	})
--------------------------------------
-- 	Pre-cast Job Ability Gear-sets 	--	
--------------------------------------
	sets.precast.JA.Meditate = set_combine(sets.precast.JA, {
			back="Smertrios's Mantle",
			hands="Saotome Kote",
			head="Myochin Kabuto"
		})
	sets.precast.JA['Warding Circle'] = set_combine(sets.precast.JA, {head="Wakido Kabuto +3"})
	sets.precast.JA['Sekkanoki'] = set_combine(sets.precast.JA, {})
	sets.precast.JA['Konzen-ittai'] = set_combine(sets.precast.JA, {})
	sets.precast.JA['Blade Bash'] = set_combine(sets.precast.JA, {hands="Sakonji Kote +2"})
	sets.precast.JA['Meikyo Shisui'] = set_combine(sets.precast.JA, {})
	sets.precast.JA['Hasso'] = set_combine(sets.precast.JA, {
		hands = "Wakido kote +3",
		legs = "Kasuga haidate +1"
	})
	sets.precast.JA['Sengikori'] = set_combine(sets.precast.JA, {})
---------------
-- Buff sets --
---------------
	sets.buff.Sekkanoki = {hands="Unkai Kote +2"}
    sets.buff.Sengikori = {feet="Unkai Sune-ate +2"}
    sets.buff['Meikyo Shisui'] = {feet="Sakonji Sune-ate"}
	
	sets.precast.FC = {
		head="Ken. Jinpachi",
		body="Wakido domaru +3",
		hands="Leyline gloves",
		legs="Ken. hakama",
		feet="Ken. sune-ate",
		ammo="Impatiens",
		neck="Voltsurge torque",
		ear1="Etiolation earring",
		ear2="Loquacious earring",
		ring1="Prolix ring",
		ring2="Kishar ring",
		back=Ogma.FC,
		waist="Resolute belt"
	}
	sets.precast.FC['Utsusemi: Ichi'] = sets.precast.FC
    sets.precast.FC['Utsusemi: Ni'] = sets.precast.FC
--------------------------
-- 	engaged gear-sets 	--
--------------------------
	sets.engaged = {
		ammo="Ginsen",
		head="Flam. Zucchetto +2",
		body=Valor.Body.TP,
		hands="Wakido kote +3",
		legs="Ken. hakama",
		feet="Flamma gambieras +2",
		neck="Sam. nodowa +1",
		waist="Ioskeha Belt",
		ear1="Cessance Earring",
		ear2="Telos Earring",
		ring1="Chirich ring +1",
		ring2="Chirich ring +1",
		back=Smert.TP
	}
	sets.engaged.MagicEva = { 
		ammo="Staunch tathlum",
		head="Ken. Jinpachi",
		body="Wakido domaru +3",
		hands="Wakido kote +3",
		legs="Ken. hakama",
		feet="Ken. sune-ate",
		neck="Loricate torque +1",
		waist="Flume Belt",
		ear1="Cessance Earring",
		ear2="Telos Earring",
		Ring1="Defending Ring",
		ring2="Gelatinous ring +1",
		back=Smert.TP
	}
	sets.engaged.Mid = {
	    ammo="Ginsen",
		head="Flam. Zucchetto +2",
		body="Wakido domaru +3",
		hands="Wakido kote +3",
		legs="Wakido Haidate +3",
		feet="Flamma gambieras +2",
		neck="Sam. nodowa +1",
		waist="Ioskeha Belt",
		ear1="Cessance Earring",
		ear2="Telos Earring",
		Ring1="Flamma Ring",
		ring2="Chirich ring",
		back=Smert.TP
	}
	sets.engaged.Acc = {
	    head="Flamma zucchetto +2",
		body="Wakido domaru +3",
		hands="Wakido kote +3",
		legs="Ken. hakama",
		feet="Ken. Sune-Ate",
		neck="Sam. nodowa +1",
		waist="Ioskeha Belt",
		ear1="Cessance Earring",
		ear2="Telos Earring",
		ring1="Niqmaddu Ring",
		ring2="Regal Ring",
		back=Smert.TP,
	}
	sets.engaged.Reraise = set_combine(sets.engaged,{
		body="Twilight Mail",head="Twilight Helm"
	})
------------------------------
-- 	Weaponskill Gear-Sets 	--
------------------------------
	sets.precast.WS = {
		ammo="Knobkierrie",
		head=Valor.Head.WS,
		body="Sakonji Domaru +3",
		hands=Valor.Hands.WS,
		legs="Wakido Haidate +3",
		feet=Valor.Feet.TP,
		neck="Fotia gorget",
		waist="Fotia belt",
		ear1="Ishvara earring",
		ear2="Brutal earring",
		ring1="Regal ring",
		ring2="Ilbrat ring",
		back=Smert.WS
	}
	sets.precast.WS.Mid = {
		ammo="Knobkierrie",
		head=Valor.Head.WS,
		body=Valor.Body.TP,
		hands=Valor.Hands.WS,
		legs="Wakido Haidate +3",
		feet=Valor.Feet.TP,
		neck="Sam. nodowa +1",
		waist="Fotia belt",
		ear1="Ishvara earring",
		ear2="Brutal earring",
		ring1="Regal ring",
		ring2="Ilbrat ring",
		back=Smert.WS
	}
	sets.precast.WS['Tachi: Ageha'] = set_combine(sets.precast.WS, { 
	-- Magic Accuracy
		head="Flam. Zucchetto +2",
		body="Flamma Korazin +1",
		hands="Flam. Manopolas +2",
		legs="Flamma Dirs +1",
		feet="Flam. Gambieras +2",
		neck="Sam. nodowa +1",
		waist="Fotia Belt",
		right_ear="Digni. Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
	})
	sets.precast.WS['Tachi: Jinpu'] = {
		--[[ammo="Knobkierrie",
		head=Valor.Head.WS,
		body="Sacro Breastplate",
		hands=Valor.Hands.MAB,
		legs="Wakido haidate +3",
		feet="Founder's greaves",
		neck="Fotia gorget",
		waist="Eschan stone",
		ear1="Friomisi earring",
		ear2="Brutal earring",
		ring1="Regal ring",
		ring2="Ilabrat ring",
		back=Smert.WS	]]	
		ammo="",
		head="",
		body="",
		hands="",
		legs="",
		feet="",
		neck="",
		waist="",
		ear1="",
		ear2="",
		ring1="",
		ring2="",
		back=""
	}
	sets.precast.WS['Tachi: Fudo'] = {
		ammo="Knobkierrie",
		head=Valor.Head.WS,
		body="Sakonji Domaru +3",
		hands=Valor.Hands.WS,
		legs="Wakido haidate +3",
		feet=Valor.Feet.WSD,
		neck="Sam. nodowa +1",
		waist="Fotia belt",
		ear1="Ishvara earring",
		ring1="Regal ring",
		ring2="Ilbrat ring",
		back=Smert.WS
	}
	sets.precast.WS.Mid['Tachi: Fudo'] = {
		ammo="Knobkierrie",
		head=Valor.Head.WS,
		body="Wakido domaru +3",
		hands=Valor.Hands.WS,
		legs="Wakido Haidate +3",
		feet=Valor.Feet.WSD,
		neck="Sam. nodowa +1",
		waist="Fotia belt",
		ear1="Ishvara earring",
		ear2="Brutal earring",
		ring1="Regal ring",
		ring2="Ilbrat ring",
		back=Smert.WS
	}
	sets.precast.WS['Tachi: Shoha'] = sets.precast.WS
	sets.precast.WS.Mid['Tachi: Shoha'] = sets.precast.WS.Mid
	
----------------------
-- 	Misc Gear-sets 	--
----------------------
	sets.DT = set_combine(sets.idle, {
		head="Rabid visor",
		body="Wakido domaru +3",
		ammo="Staunch tathlum",
		hands="Kurys gloves",
		legs="Ryuo hakama",
        feet="Amm Greaves",
		neck="Loricate torque +1",
		ear1="Static Earring",
        ear2="Hearty earring",
        ring1="Defending ring",
        ring2="Gelatinous ring +1",
        back=Smert.TP,
		waist="Flume Belt"
	})
	sets.PhysicalDefense = {}
	sets.PhysicalDefense.DT = sets.DT
	sets.Asleep = set_combine(sets.DT, {
		head="Frenzy sallet"
	})
	sets.Reraise = set_combine(sets.DT, {
		head="Twilight helm",
		body="Twilight mail"
	})
	sets.Reive = {
		neck="Ygna's resolve +1"
	}
	sets.buff.Doom = {
		ring1="Purity Ring",
		ring2="Saida Ring",
		waist="Gishdubar sash",
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