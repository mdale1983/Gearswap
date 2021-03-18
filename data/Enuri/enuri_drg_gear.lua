include('augments.lua')
----------------------
--  Field/Town Idle --
----------------------
	sets.idle = {
		ammo="Staunch tathlum",
        head="Hjarrandi helm",
        body="Sacro breastplate",
		hands="Leyline gloves",
		legs="" ,
        feet="Amm greaves",
		neck="Loricate torque +1",
        ear1="Etiolation earring",
		ear2="Odnowa earring +1",
        ring1="Moonbeam ring",
        ring2="Moonbeam ring",
        back=Brig.ACC,
		waist="Flume belt"
	}
	sets.idle.MagicEva = { 
		ammo="Staunch tathlum",
        head="Hjarrandi helm",
        body="Sacro breastplate",
		hands="Leyline gloves",
		legs="" ,
        feet="Amm greaves",
		neck="Loricate torque +1",
        ear1="Etiolation earring",
		ear2="Odnowa earring +1",
        ring1="Defending ring",
        ring2="Gelatinous ring +1",
        back=Brig.ACC,
		waist="Flume belt"
	}
	sets.idle.Reraise = set_combine(sets.idle, {
		head="Twilight helm",
		body="Twilight mail"
	})
	sets.Kiting = {
		legs="Carmine cuisses +1"
	}
	sets.Kiting.night = {
		legs="Carmine cuisses +1"
	}
	sets.weapons.Rhomphaia = { 
		main="Quint spear",
		sub="Utu Grip"
	}
	sets.weapons.Gungnir = { 
		main="Gungnir",
		sub="Utu grip"
	}
	sets.weapons.Rhongomiant = { 
		main="Rhongomiant",
		sub="Utu Grip"
	}
	sets.weapons.Trishula = { 
		main="Trishula",
		sub="Utu Grip"
	}
	sets.weapons.Ryunohige = { 
		main="Ryunohige",
		sub="Utu Grip"
	}
	sets.weapons.ShiningOne = { 
		main="ShiningOne",
		sub="Utu Grip"
	}
--------------------------------------
-- 	Pre-cast Job Ability Gear-sets 	--	
--------------------------------------
	sets.precast.JA.Angon = {
		ammo="Angon",
		hands="Ptero. Fin. G. +1"
	} 
	sets.precast.JA.Jump = {
		ammo="Ginsen",
		head="Flamma zucchetto +2",
		body="Vishap mail +1",
		hands="Vishap finger gauntlets +2",
		legs="Pteroslaver brais +2",
		feet="Flamma gambieras +2",
		ear1="Telos Earring",
		ear2="Sherida earring",
		neck="Anu torque",
        ring1="Chirich ring +1",
        ring2="Chirich Ring +1",
        back=Brig.ACC,
        waist="Kentarch belt +1",
	}
	sets.precast.JA['Ancient Circle'] = {
		legs="Vishap Brais +1"
	} 
	sets.precast.JA['High Jump'] = {
		ammo="Ginsen",
		head="Flamma zucchetto +2",
		body="Vishap mail +1",
		hands="Vishap finger gauntlets +2",
		legs="Pteroslaver brais +2",
		feet="Flamma gambieras +2",
		ear1="Telos Earring",
		ear2="Sherida earring",
		neck="Anu torque",
        ring1="Chirich ring +1",
        ring2="Chirich Ring +1",
        back=Brig.ACC,
        waist="Kentarch belt +1",
	}
	sets.precast.JA['Soul Jump'] = {
		ammo="Ginsen",
		head="Flamma zucchetto +2",
		body="Vishap mail +1",
		hands="Vishap finger gauntlets +2",
		legs="Pteroslaver brais +2",
		feet="Flamma gambieras +2",
		ear1="Telos Earring",
		ear2="Sherida earring",
		neck="Anu torque",
        ring1="Chirich ring +1",
        ring2="Chirich Ring +1",
        back=Brig.ACC,
        waist="Kentarch belt +1",
	}
	sets.precast.JA['Spirit Jump'] = {
		ammo="Ginsen",
		head="Flamma zucchetto +2",
		body="Vishap mail +1",
		hands="Vishap finger gauntlets +2",
		legs="Pteroslaver brais +2",
		feet="Peltast's schynbalds +1",
		ear1="Telos Earring",
		ear2="Sherida earring",
		neck="Anu torque",
        ring1="Chirich ring +1",
        ring2="Chirich Ring +1",
        back=Brig.ACC,
        waist="Kentarch belt +1",
	}
	sets.precast.JA['Super Jump'] = {}
	sets.precast.JA['Spirit Link'] = {
		head="Vishap Armet +1",
		hands="Peltast's vambraces +1"
	} 
	sets.precast.JA['Call Wyvern'] = {
		body="Pteroslaver Mail +1"
	} 
	sets.precast.JA['Deep Breathing'] = {
		hands="Ptero. Armet +1"
	} 
	sets.precast.JA['Spirit Surge'] = {
		body="Ptero. Mail +1"
	} 
	sets.precast.JA['Steady Wing'] = {}
	sets.precast.JA['Restoring Breath'] = {
		back="Brigantia's Mantle"
	}
	sets.precast.JA['Smiting Breath'] = {
		back="Brigantia's Mantle"
	}
	sets.HealingBreath = {
		back="Brigantia's Mantle"
	}
---------------
-- Buff sets --
---------------

--------------------------------------
--		Casting Gear sets			--
--------------------------------------
	----------------------
	--	Precast Section	--
	----------------------
	sets.precast.FC = {
		ammo="Impatiens",
		head="Carmine Mask +1",
		neck="Voltsurge Torque",
		ear1="Enchntr. Earring +1",
		ear2="Loquac. Earring",
		body="Taeon Tabard",
		hands="Leyline Gloves",
		ring1="Lebeche Ring",
		ring2="Prolix Ring",
		back="Moonlight Cape",
		waist="Flume Belt +1",
		legs="Enif cosciales",
		feet="Carmine Greaves +1"
	}
	----------------------
	--	Midcast Section	--
	----------------------
	sets.midcast.FastRecast = {
		ammo="Staunch Tathlum +1",
		head="Carmine Mask +1",
		neck="Voltsurge Torque",
		ear1="Enchntr. Earring +1",
		ear2="Loquac. Earring",
		body="Taeon Tabard",
		hands="Leyline Gloves",
		ring1="Lebeche Ring",
		ring2="Prolix Ring",
		back="Moonlight Cape",
		waist="Tempus Fugit",
		legs="Enif cosciales",
		feet="Carmine Greaves +1"
	}	
	--[[ Put HP+ gear and the AF head to make healing breath trigger more easily with this set. ]]
	sets.midcast.HB_Trigger = set_combine(sets.midcast.FastRecast, {
		head="Vishap Armet +1"
	})
----------------------------------
--		Engaged sets			--
----------------------------------	
	sets.engaged = {
		ammo="Ginsen",
		head="Flamma zucchetto +2",
		body=Valor.Body.TP,
		hands="Flamma manopolas +2",
		legs="Pteroslaver brais +2",
		feet="Flamma gambieras +2",
		ear1="Telos Earring",
		ear2="Cessance earring",
		neck="Dgn. collar +1",
        ring1="Chirich ring +1",
        ring2="Chirich Ring +1",
        back=Brig.ACC,
        waist="Ioskeha belt +1",
	}
	sets.engaged.MagicEva = { 
		ammo="Staunch tathlum",
        head="Hjarrandi helm",
        body="Sacro breastplate",
		hands="Leyline gloves",
		legs="" ,
        feet="Founder's greaves",
		neck="Loricate torque +1",
        ear1="Telos Earring",
		ear2="Cessance earring",
        ring1="Defending ring",
        ring2="Moonbeam ring",
        back=Brig.ACC,
		waist="Flume belt"
	}
----------------------------------------------
--			Weaponskill Gearsets			--
----------------------------------------------
	sets.precast.WS = {
		ammo="Knobkierrie",
		head="Flam. Zucchetto +2",
		neck="Fotia Gorget",
		ear1="Moonshade Earring",
		ear2="Sherida Earring",
		body="",
		hands="Sulev. Gauntlets +2",
		ring1="Regal Ring",
		ring2="Niqmaddu Ring",
		back="Brigantia's Mantle",
		waist="Fotia Belt",
		legs="Sulev. Cuisses +1",
		feet="Flam. Gambieras +2"
	}
	sets.precast.WS['Stardiver'] = {
		ammo="Knobkierrie",
		head="Hjarrandi helm",
		body="Hjarrandi breastplate",
		hands="Sulev. Gauntlets +2",
		legs="Sulevia's Cuisses +1",
		feet="Flamma gambieras +2",
		neck="Dgn. collar +1",
		ear1="Sherida earring",
		ear2="Brutal earring",
		ring1="Niqmaddu ring",
		ring2="Regal Ring",
		waist="Fotia belt",
		back=Brig.ACC,
	}
	sets.precast.WS['Drakesbane'] = {
		ammo="Knobkierrie",
		head="Hjarrandi helm",
		body="Hjarrandi breastplate",
		hands="Sulev. Gauntlets +2",
		legs="Peltast's cuissots +1",
		feet="Flamma gambieras +2",
		neck="Dgn. collar +1",
		ear1="Sherida earring",
		ear2="Brutal earring",
		ring1="Niqmaddu ring",
		ring2="Regal Ring",
		waist="Kentarch belt +1",
		back=Brig.ACC,
	}
	sets.precast.WS['Impulse Drive'] = {
		ammo="Knobkierrie",
		head="Lustratio cap +1",
		body="Hjarrandi breastplate",
		hands="Sulev. Gauntlets +2",
		legs="Sulevia's Cuisses +1",
		feet="Lustra. Leggings +1",
		neck="Dgn. collar +1",
		ear1="Sherida earring",
		ear2="Brutal earring",
		ring1="Niqmaddu ring",
		ring2="Regal Ring",
		waist="Fotia belt",
		back=Brig.ACC,
	}
	sets.precast.WS['Camlann\'s torment'] = {
		ammo="Knobkierrie",
		head=Valor.Head.WS,
		body="Hjarrandi breastplate",
		hands=Valor.Hands.WS,
		legs="Sulevia's Cuisses +1",
		feet="Sulevia's leggings +2",
		neck="Dgn. collar +1",
		ear1="Ishvara Earring",
		ear2="Sherida Earring",
		ring1="Regal Ring",
		ring2="Niqmaddu Ring",
		waist="Fotia Belt",
		back="Brigantia's Mantle",
	}
	sets.precast.WS['Sonic Thrust'] = {
		ammo="Knobkierrie",
		head="Lustratio cap +1",
		body="Hjarrandi breastplate",
		hands="Sulev. Gauntlets +2",
		legs="Sulevia's Cuisses +1",
		feet="Lustra. Leggings +1",
		neck="Fotia gorget ",
		ear1="Sherida earring",
		ear2="Brutal earring",
		ring1="Niqmaddu ring",
		ring2="Regal Ring",
		waist="Fotia belt",
		back=Brig.ACC,
	}
	sets.precast.WS['Geirskogul'] = {
		ammo="Knobkierrie",
		head=Valor.Head.WS,
		body="Hjarrandi breastplate",
		hands=Valor.Hands.WS,
		legs="Vishap brais +2",
		feet="Sulevia's leggings +2",
		neck="Dgn. collar +1",
		ear1="Ishvara Earring",
		ear2="Sherida Earring",
		ring1="Regal Ring",
		ring2="Niqmaddu Ring",
		waist="Fotia Belt",
		back="Brigantia's Mantle",
	}
--------------------------------------
--			Misc. Gearsets			--
--------------------------------------
	sets.DT = set_combine(sets.idle, {
		ammo="Staunch tathlum",
        head="Hjarrandi helm",
        body="Sacro breastplate",
		hands="Leyline gloves",
		legs="" ,
        feet="Amm greaves",
		neck="Loricate torque +1",
        ear1="Telos Earring",
		ear2="Cessance earring",
        ring1="Defending ring",
        ring2="Moonbeam ring",
        back=Brig.ACC,
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