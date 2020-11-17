include('augments.lua')
----------------------
--  Field/Town Idle --
----------------------
	sets.idle = { 
	--Refresh, Regen, and DT
		ammo="Staunch Tathlum",
		head="Viti. Chapeau +1",
		body="Gendewitha bliaut +1",
		hands=Leyline.FC,
		legs="Lengo pants",
		feet="Lethargy houseaux +1",
		neck="Loricate torque +1",
		waist="Flume belt",
		ear1="Etiolation Earring",
		ear2="Eabani Earring",
		ring1="Gelatinous ring +1",
		ring2="Defending Ring",
		back=Suc.TP,
	}
	sets.idle.MagicEva = {
		ammo="Ginsen",
		head=Chir.Head.Acc,
		body="Ayanmo Corazza +2",
		hands="Atrophy Gloves +2",
		legs="Aya. Cosciales +2",
		feet="Carmine Greaves +1", 
		neck="Combatant's Torque",
		waist="Reiki Yotai",
		ear1="Sherida Earring",
		ear2="Eabani Earring",
		ring1="Fortified Ring",
		ring2="Defending Ring",
		back=Suc.MDT,
	}
	sets.Kiting = {
		legs="Carmine Cuisses +1"
	}
	sets.latent_refresh = {
		waist="Fucho-no-obi"
	}
--------------------------------------
-- 	Pre-cast Job Ability Gear-sets 	--	
--------------------------------------
	sets.precast.JA['Chainspell'] = {body="Viti. Tabard +1"}
	sets.precast.Waltz = {}
	sets.precast.Waltz['Healing Waltz'] = {}
----------------------------------
-- 	Pre-cast Magic Gear-sets 	--	
----------------------------------
	sets.precast.FC = { -- /SCH +10
		head="Carmine mask +1",
		body=Taeon.Body.FC, 
		hands=Leyline.FC,
		legs="",
		--feet="Carmine Greaves +1",
		neck="Voltsurge torque",
		ring1="Kishar Ring",
		ring2="Weather. Ring",
		ear1="Etiolation earring",
		ear2="Loquacious earring",
		waist="Phos belt",
		
	}
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {
		head=empty,
		body="Twilight Cloak"
	})
----------------------
-- 	Buff Gear-sets 	--	
----------------------	
	sets.buff.ComposureOther = {-- Composure set when casting on others
		head="Lethargy Chappel +1",
		body="Lethargy Sayon +1",
		hands="Atrophy Gloves +2",
		legs="Lethargy Fuseau +1",
		feet="Lethargy Houseaux +1",
	}
	-- Used to force duration onto Haste
	sets.buff.Saboteur = {hands="Lethargy Gantherots +1"}
----------------------------------
-- 	Mid-cast Magic Gear-Sets 	--
----------------------------------
	sets.midcast.Utsusemi = { -- Capped gear haste and fill with fastcast.
		ammo="Staunch Tathlum",
		head="Atrophy Chapeau +1",
		body="Viti. Tabard +1", 
		hands=Leyline.FC,
		legs="Aya. Cosciales +2",
		feet=Merl.Feet.Burst,
		neck="Magoraga Beads",
		waist="Witful Belt",
		ear1="Loquac. Earring",
		ear2="Etiolation Earring",
		ring1="Defending Ring",
		ring2="Weather. Ring",
		back="Solemnity Cape",
	}
    sets.midcast.Cure = { -- Cure potency is capped at 50%, Recieved at 30%
		ammo="Regal Gem",
		head="",
		body="",
		hands="",
		legs="Gyve Trousers",
		feet="",
		neck="Nodens Gorget",
		waist="Bishop's Sash",
		ear1="Mendi. Earring",
		ear2="Beatific Earring",
		ring1="Sirona's Ring",
		ring2="Haoma's Ring",
		back="Tempered Cape +1",
	}
    sets.midcast.Curaga = sets.midcast.Cure
    sets.midcast.CureSelf = { -- Included are example pieces
		ammo="Regal Gem",
		head="",
		body="",
		hands="",
		legs="Gyve Trousers",
		feet="",
		neck="Nodens Gorget",
		waist="Gishdubar Sash",
		ear1="Mendi. Earring",
		ear2="Beatific Earring",
		ring1="Kunaji Ring",
		ring2="Asklepian Ring",
		back="Tempered Cape +1",
	}
    sets.midcast.Cursna = { -- Cursna+ > Healing Magic
		ammo="Regal Gem",
		head="",
		body="Viti. Tabard +1",
		hands="",
		legs="Atrophy Tights +1",
		feet="",
		neck="Malison Medallion",
		waist="Gishdubar Sash",
		ear1="Beatific Earring",
		ear2="Etiolation Earring",
		ring1="Haoma's Ring",
		ring2="Ephedra Ring",
		back="Oretan. Cape +1",
	}	
    sets.midcast['Enhancing Magic'] = { -- Enh. Ma. Skill > Conserve MP
		head="Befouled Crown",
		body="Viti. Tabard +1",
		hands="Viti. Gloves +2", 
		legs="Atrophy Tights +1",
		feet="Leth. Houseaux +1",
		neck="Incanter's Torque",
		waist="Olympus Sash",
		ear1="Andoaa Earring",
		ear2="Augment. Earring",
		ring1="Stikini Ring",
		ring2="Stikini Ring",
		back=Suc.Macc,
	}
    sets.midcast.Duration = set_combine(sets.midcast['Enhancing Magic'],{ -- Enh. Ma. Dur. (exclusivly for set_combine, nothing will directly call this set)
		--head=Telc.Head.EncDur,
		--body=Telc.Body.EncDur,
		hands="Atrophy Gloves +2",
		--legs=Telc.Legs.EncDur,
	})
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})
    sets.midcast['Enhancing Magic'].EnSpells = {-- Enspell Specific set
		main="Pukulatmuj +1",
		sub="Pukulatmuj",
		ammo="Regal Gem",
		head="Carmine mask +1",
		body="Viti. Tabard +1",
		hands="Viti. Gloves +2", 
		legs="Atrophy tights +1",
		feet="Leth. Houseaux +1",
		neck="Incanter's Torque",
		waist="Olympus Sash",
		ear1="Etiolation Earring",
		ear2="Andoaa Earring",
		ring1="Stikini Ring",
		ring2="Stikini Ring",
		back=Suc.Macc,
	}
    sets.midcast['Enhancing Magic'].GainSpells = {-- Gainspell Specific set
		ammo="Regal Gem",
		head="Befouled Crown",
		body="Viti. Tabard +1",
		hands="Viti. Gloves +2",
		legs="Atrophy Tights +1",
		feet="Leth. Houseaux +1",
		neck="Incanter's Torque",
		waist="Olympus Sash",
		ear2="Andoaa Earring",
		ring1="Stikini Ring",
		ring2="Stikini Ring",
		back=Suc.Macc,
	}
	sets.midcast.Haste = set_combine(sets.midcast.Duration,{
		-- Fill slots not used in Duration set with Haste > Fastcast
	})
	sets.midcast.Aquaveil = set_combine(sets.midcast.Duration, { -- Aquaveil Set
		head="Amalric Coif",
		hands="Regal Cuffs",
	})
	sets.midcast.Refresh = set_combine(sets.midcast.Duration, { -- Refresh Set
		head="Amalric Coif",
		body="Atrophy Tabard +1",
		hands="Atrophy Gloves +2",
		legs="Lethargy fuseau +1",
		feet="Inspirited boots",
		waist="Gishdubar sash",
	})
	sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'], {
		head="Carmine mask +1",
		body="Taeon tabard",
		hands="Taeon gloves",
		legs="Taeon tights",
		feet=Taeon.Feet.Phalanx
	})
	sets.midcast.Storm = set_combine(sets.midcast.Duration, { 
		-- Storm Set
	})
    sets.midcast.Regen = set_combine(sets.midcast.Duration,{ 
		-- Fill with Regen Potency
	})
	sets.midcast.Protect = set_combine(sets.midcast.Duration, { 
	--Protect/Shell set
		ear2="Brachyura earring",
		})
	sets.midcast.Protectra = sets.midcast.Protect
	sets.midcast.Shell = sets.midcast.Protect
	sets.midcast.Shellra = sets.midcast.Protect
	----------------------
	-- Enfeebling Magic	--
	----------------------
    sets.midcast['Enfeebling Magic'] = { 
	-- Potency > Enfeebling Magic > Magic Accuracy > INT = MND
		main="Raetic staff",
		sub="Enki strap",
		ammo="Hydrocera",
		head="Viti. Chapeau +1",
		body="Atrophy tabard +2",
		hands="Lethargy gantherots +1",
		legs="Chironic hose",
		feet="Vitiation boots +2",
		neck="Incanter's Torque",
		waist="Eschan stone",
		ear1="Enfeebling Earring",
		ear2="Gwati Earring",
		ring1="Stikini Ring",
		ring2="Weatherspoon Ring",
		back=Suc.Macc,
	}
    sets.midcast['Enfeebling Magic'].Resistant = set_combine(sets.midcast['Enfeebling Magic'], { -- Enfeebling Magic > Magic Accuracy > INT = MND
		main="Raetic staff",
		sub="Enki strap",
		ammo="Regal Gem",
		head="Atrophy Chapeau +1",
		body="Atrophy Tabard +1",
		hands="",
		legs=Chir.Legs.MAC,
		feet="Vitiation boots +2",
		neck="Erra Pendant",
		waist="Luminary Sash",
		ear1="Digni. Earring",
		ear2="Regal Earring",
		ring1="Stikini Ring",
		ring2="Stikini Ring",
		back=Suc.MndMAC,
	})
	sets.midcast.Dispel = set_combine(sets.midcast['Enfeebling Magic'], {
		neck="Duelist's torque",
	})
    sets.midcast['Dia III'] = set_combine(sets.midcast['Enfeebling Magic'], {
		head="Viti. Chapeau +1"
	})
    sets.midcast['Slow II'] = set_combine(sets.midcast['Enfeebling Magic'], {
		head="Viti. Chapeau +1"
	})
	--Making a single nuke set for bursts as I don't see RDM nuking a whole lot
    sets.midcast['Elemental Magic'] = {--Magic Burst Damage(40%) > MAB > INT > M.Acc
		ammo="Pemphredo Tathlum",
		head="Ea Hat",
		body="Ea Houppelande",
		hands="Ea Cuffs",
		legs="Ea Slops",
		feet="Jhakri Pigaches +2",
		neck="Incanter's torque",
		waist="Refoccilation Stone",
		ear1="Friomisi Earring",
		ear2="Regal Earring",
		ring1="Mujin Band",
		ring2="Shiva Ring +1",
		back=Suc.MAB,
	}
	sets.midcast['Elemental Magic'].Burst = {
		--Magic Burst Damage(40%) > MAB > INT > M.Acc
		ammo="Pemphredo Tathlum",
		head="Ea Hat",
		body="Ea Houppelande",
		hands="Ea Cuffs",
		legs="Ea Slops",
		feet="Jhakri Pigaches +2",
		neck="Mizu. Kubikazari",
		waist="Refoccilation Stone",
		ear1="Friomisi Earring",
		ring1="Mujin Band",
		ring2="Shiva Ring +1",
		back=Suc.MAB,
	}
    sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {
		head=empty,
		body="Twilight Cloak"
	}) -- No touchy
	sets.midcast['Dark Magic'] = { -- Dark Magic > INT > Magic Accuracy
		main="Raetic staff",
		sub="Enki strap",
		ammo="Regal Gem",
		head="Pixie hairpin +1",
		body="Atrophy Tabard +1",
		hands="Regal Cuffs",
		legs="Jhakri Slops +2",
		feet="Jhakri Pigaches +2",
		neck="Erra Pendant",
		waist="Fucho-no-Obi",
		ear1="Digni. Earring",
		ear2="Gwati Earring",
		ring1="Archon Ring",
		ring2="Evanescence Ring",
		back=Suc.MAB,
	}
	sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], { 
	-- Drain/Aspir Potency set
		head="Pixie Hairpin +1",
		body="Jhakri Robe +2",
		waist="Fucho-no-obi",
		ring1="Archon Ring",
		ring2="Evanescence Ring",
	})
	sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Stun = set_combine(sets.midcast['Dark Magic'], {	
	-- Stun set, Use this to swap out Drain/Aspir Potency from your Dark
		head="Atrophy Chapeau +1",
		hands="Jhakri Cuffs +2",
		waist="Luminary Sash",
		ear1="Digni. Earring",
		ear2="Regal Earring",
		ring1="Stikini Ring",
		ring2="Evanescence Ring",
	})
 	sets.midcast.Trust = sets.precast.FC -- Calls Trusts in Fastcast sets
	----------------------------------
	--	Custom Spell Gear Section	--
	----------------------------------
	sets.midcast.MndEnfeebles = {
        main="Raetic staff",
		sub="Enki strap",
		ammo="Hydrocera",
        head="Vitiation Chapeau +1",
        body="Lethargy Sayon +1",
        hands="Lethargy gantherots +1",
        legs="Chironic Hose",
        feet="Vitiation boots +2",
        neck="Dls. Torque",
        ear1="Hermetic Earring",
        ear2="Gwati Earring",
        ring1="Stikini Ring",
        ring2="Stikini Ring",
        back=Suc.Macc,
        waist="Luminary Sash",
        }

    sets.midcast.MndEnfeeblesAcc = set_combine(sets.midcast.MndEnfeebles, {
        head="Atrophy Chapeau +1",
        body="Atrophy Tabard +1",
        feet="Jhakri Pigaches +2",
        ring1="Stikini Ring +1",
		back="Solemnity cape"
        })

    sets.midcast.IntEnfeebles = set_combine(sets.midcast.MndEnfeebles, {
        main="Raetic staff",
		sub="Enki strap",
		ammo="Hydrocera",
        head="Atrophy Chapeau +1",
        body="Lethargy Sayon +1",
        hands="Lethargy gantherots +1",
        legs="Chironic Hose",
        feet="Vitiation boots +2",
        neck="Dls. Torque",
        ear1="Hermetic Earring",
        ear2="Gwati Earring",
        ring1="Stikini Ring",
        ring2="Stikini Ring",
        back=Suc.Macc,
        waist="Luminary Sash",
        })

    sets.midcast.IntEnfeeblesAcc = set_combine(sets.midcast.IntEnfeebles, {
        body="Atrophy Tabard +1",
        ring2="Weather. Ring +1",
		feet="Taeon boots"
        })

    sets.midcast.SkillEnfeebles = {
        head="Viti. Chapeau +1",
        body="Atrophy Tabard +1",
        hands="Leth. Gantherots +1",
        neck="Incanter's Torque",
        ring1="Stikini Ring +1",
        ring2="Stikini Ring +1",
        ear1="Enfeebling Earring",
        waist="Rumination Sash",
        }

    sets.midcast.EffectEnfeebles = {
        ammo="Regal Gem",
        body="Lethargy Sayon +1",
        feet="Uk'uxkaj Boots",
        back=gear.RDM_MND_Cape,
        }

    sets.midcast.ElementalEnfeeble = sets.midcast.IntEnfeebles
--------------------------
-- 	engaged gear=sets 	--
--------------------------
--[[ 
	[*] Variations for TP weapon and (optional) offense/defense modes.  Code will 
		fall back on previous
    [*] sets if more refined versions aren't defined.
    [*] If you create a set with both offense and defense modes, the offense mode 
		should be first.
    [*]	EG: sets.engaged.Dagger.Accuracy.Evasion
 	[*] Normal melee group
	[*] /DNC DW is 15%(DW2) and /NIN DW is 25%(DW3) All Further calculations will 
		assume DW3 is active,
	[*] Capped Gear Haste (26%), and Haste II
 ]]
	------------------------------------------------
	----------DO NOT OVERGEAR Dual Wield------------
	------------------------------------------------
	sets.engaged = { -- Self hasted Melee TP Set - 31% DW to cap
		ammo="Ginsen",
		head="Carmine mask +1",
		body="Ayanmo Corazza +2",
		hands="Ayanmo manopolas +2",
		legs="Carmine Cuisses +1",
		--feet="Carmine greaves +1",
		neck="Lissome necklace",
		waist="Kentarch belt +1",
		--ear1="Cessance earring",
		--ear2="Telos Earring",
		--ring1="Petrov Ring",
		--ring2="Ilabrat Ring",
		--back=Suc.TP,
	}
	sets.engaged.DW = set_combine(sets.engaged, {
	-- No Magic Haste 
		--body="Adhemar jacket +1",	--5
		ear1="Suppanomimi",			--5
		legs="Carmine Cuisses +1",	--6
		--feet=Taeon.Feet.DW,			--9
		--back=gear.RNG_DW_Cape, 		--10
    })-- 49% DW Needed
	sets.engaged.DW.Haste_43 = set_combine(sets.engaged,  {
	-- 45% Magic Haste 
		legs="Carmine cuisses +1",
		ear1="Suppanomimi"
	}) -- 11% DW Needed
--[[ Haste 43% ]]
	sets.engaged.Haste_43 = set_combine(sets.engaged, {
	-- Capped Haste TP Set - 11% DW to cap
		ammo="Ginsen",
		head="Carmine mask +1",
		body="Ayanmo Corazza +2",
		hands="Ayanmo manopolas +2",
		legs="Carmine Cuisses +1",
		feet="Atrophy boots +1",
		neck="Lissome necklace",
		waist="Kentarch belt +1",
		ear1="Suppanomimi",
		ear2="Telos Earring",
		ring1="Petrov Ring",
		ring2="Ilabrat Ring",
		back=Suc.TP,
	})
--[[ Haste 40% ]]
	sets.engaged.Haste_40 = set_combine(sets.engaged.Haste_43, { -- 40 Haste TP Set - 16% DW to cap
		ammo="Ginsen",
		--head=Taeon.Head.TP,
		body="Ayanmo Corazza +2",
		--hands=Taeon.Hands.TP,
		--legs=Taeon.Legs.TP,
		--feet=Taeon.Feet.TP,
		neck="Anu Torque",
		waist="Reiki Yotai",
		ear1="Sherida Earring",
		ear2="Cessance Earring",
		ring1="Petrov Ring",
		ring2="Ilabrat Ring",
		--back=Suc.PDT,
	})
--[[ Haste 30% ]]
	sets.engaged.Haste_30 = set_combine(sets.engaged, { -- This is the same as your standard TP set
		ammo="Ginsen",
		--head=Taeon.Head.TP,
		body="Ayanmo Corazza +2",
		--hands=Taeon.Hands.TP,
		legs="Lengo pants",
		--feet=Taeon.Feet.TP,
		neck="Anu Torque",
		waist="Reiki Yotai",
		ear1="Sherida Earring",
		ear2="Cessance Earring",
		ring1="Petrov Ring",
		ring2="Ilabrat Ring",
		--back=Suc.PDT,
	})
    -- 25
    sets.engaged.Haste_25 = set_combine(sets.engaged.Haste_30, { -- If you see a 25% prompt, then you don't have Haste 2
    })
	sets.engaged.PDT = {
		ring1="Vocane Ring"
	}
------------------------------
-- 	Weaponskill Gear-Sets 	--
------------------------------
	sets.precast.WS = { --main, sub, and range will be excluded
		ammo="Amar Cluster",
		head="Jhakri Coronal +2",
		body="Ayanmo Corazza +2",
		hands="Atrophy Gloves +2",
		legs="Atrophy Tights +1",
		feet="Jhakri Pigaches +2",
		neck="Sanctity Necklace",
		waist="Kentarch Belt +1",
		ear1="Mache Earring +1",
		ear2="Assuage Earring",
		ring1="Chirich Ring",
		ring2="Ilabrat Ring",
		back=Suc.WSD,
	}
	sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast.WS, { 
	--MAB > INT > MND > STR
		--ammo="",
		--head="",
		--body="",
		--hands="",
		--legs="",
		--feet="",
		--neck="",
		--waist="",
		--ear1="",
		--ear2="",
		--ring1="",
		--ring2="",
		--back=Suc.Macc,
	})
    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, { -- Fotia > MND > Att > Multihit
		ammo="Amar Cluster",
		head="",
		body="Ayanmo Corazza +2",
		hands="Jhakri Cuffs +2",
		legs="Jhakri Slops +2",
		feet="",
		neck="Fotia Gorget",
		waist="Windbuffet Belt +1",
		ear1="Brutal Earring",
		ear2="Sherida Earring",
		ring1="Hetairoi Ring",
		ring2="Rufescent Ring",
		--back=Suc.PDT,
	})     
    sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS, { -- MAB > M. Acc > INT = DEX
		--ammo="",
		--head="",
		--body="",
		--hands="",
		--legs="",
		--feet="",
		--neck="",
		--waist="",
		--ear1=-",
		--ear2="",
		--ring1="",
		--ring2="",
		--back=Suc.Macc,
	})
    sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {-- Bonus TP > WSD > STR > MND
		ammo="Amar Cluster",
		head=Taeon.Head.WS,
		body=Taeon.Body.WS,
		hands="Atrophy gloves +2",
		legs="Jhakri Slops +2",
		feet=Taeon.Feet.WS,
		neck="Caro Necklace",
		waist="Caudata belt",
		ear1="Ishvara Earring",
		ear2="Moonshade Earring",
		ring1="Rufescent Ring",
		ring2="Ilabrat ring",
		back=Suc.WS,
	})
    sets.precast.WS['Knights of Round'] = set_combine(sets.precast.WS['Savage Blade'], {
	-- Shares mods with Savage Blade, leave alone
	})		 
    sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, { 
	-- Fotia > CHC(50%) > DEX > Multihit > CHD
		ammo="Yetshila +1",
		head=Taeon.Head.WS,
		body=Taeon.Body.WS,
		hands="Aya. Manopolas +2",
		--legs=Taeon.Legs.Crit,
		feet=Taeon.Feet.WS,
		neck="Fotia Gorget",
		waist="Fotia Belt",
		ear1="Mache Earring +1",
		ear2="Sherida Earring",
		ring1="Begrudging Ring",
		ring2="Ilabrat Ring",
		back=Suc.TP,
	})
    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS['Chant du Cygne'], { 
	-- Shares mods with CDC, leave alone
	})     
    sets.precast.WS['Death Blossom'] = set_combine(sets.precast.WS, {-- Fotia > STR > MND > Multihit
		ammo="Amar Cluster",
		head=Taeon.Head.WS,
		body=Taeon.Body.WS,
		hands="Atrophy gloves +2",
		legs="Jhakri Slops +2",
		feet=Taeon.Feet.WS,
		neck="Caro Necklace",
		waist="Caudata belt",
		ear1="Brutal Earring",
		ear2="Moonshade Earring",
		ring1="Rufescent Ring",
		ring2="Ilabrat ring",
		back=Suc.WS,
		})
----------------------
-- 	Misc Gear-sets 	--
----------------------
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
	sets.Obi = {waist="Hachirin-no-Obi"}