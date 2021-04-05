include('augments.lua')
----------------------
--	Field/Town Idle	--
----------------------
	sets.idle = {
		ammo="Staunch Tathlum",
        head="Souveran schaller +1",
        body="Rev. Surcoat +2",
		hands="Souv. Handsch. +1",
		legs="Chev. Cuisses +1",
        feet="Souveran schuhs +1",
		neck="Warder's charm +1",
		ear1="Odnowa earring",
		ear2="Odnowa Earring +1",
        ring1="Moonbeam ring",
        ring2="Moonbeam ring",
        back=Rudian.FC,
		waist="Carrier's sash"
	}
	sets.idle.PDT = set_combine(sets.idle, {
		legs="Chevalier's cuisses +1",
		hands="Souv. Handsch. +1",
		neck="Creed collar",
	})
	sets.idle.Turtle = set_combine(sets.idle, {
		body="Souveran cuirass +1",
		legs="Souveran diechlings +1",
		neck="Loricate torque +1"
	})
	sets.idle.Weak = {}
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
	sets.weapons.Excalibur = { 
		main="Excalibur",
	}
	sets.weapons.Burtgang = { 
		main="Burtgang",
	}
	sets.weapons.Almace = { 
		main="Almace",
	}
	sets.Shields.Aegis = { 
		sub="Aegis"
	}
	sets.Shields.Ochain = { 
		sub="Ochain"
	}
	sets.Shields.Priwen = { 
		sub="Priwen"
	}
----------------------
-- 	Enmity Gear set --
----------------------
	sets.Enmity = {
		head="Souveran schaller +1",
		body="Souveran cuirass +1",
		hands="Yorium gauntlets",
		legs=Odyssean.Legs.Enm,
		feet="Eschite Greaves",
		neck="Unmoving Collar",
		ring1="Apeile ring",
		ring2="Apeile ring +1",
		ear1="Cryptic earring",
		ear2="Pluto's pearl",
		back=Rudian.Enm,
		waist="Creed baudrier",
		ammo="Paeapua"
	}
--------------------------------------
--		Pre-cast Gear sets			--
--------------------------------------
	----------------------------------
	--		Job Ability sets		--
	----------------------------------
		sets.precast.JA['Shield Bash'] = set_combine(sets.Enmity, {
			hands="Cab. Gauntlets +1",
			ring1="Fenian ring"
		})
		sets.precast.JA['Divine Emblem'] = set_combine(sets.Enmity, {
			feet="Chevalier's Sabatons +1"
		})
		sets.precast.JA['Sentinel'] = set_combine(sets.Enmity, {
			feet="Cab. Leggings +3"
		})
		sets.precast.JA['Fealty'] = set_combine(sets.Enmity, {
			body="Cab. Surcoat +3"
		})
		sets.precast.JA['Holy Circle'] = set_combine(sets.Enmity, {
			feet="Reverence leggings +2"
		})
		sets.precast.JA['Rampart'] = set_combine(sets.Enmity, {
			head="Valor coronet"
		})
		sets.precast.JA['Cover'] = set_combine(sets.Enmity, {
			body="Cab. Surcoat +3"
		})
		sets.precast.JA['Provoke'] = sets.Enmity
		sets.precast.JA['Majesty'] = sets.Enmity
		sets.precast.JA['Chivalry'] = set_combine(sets.Enmity, {
			hands="Cab. Gauntlets +1",
			ring1="Fenian ring"
		})
	--------------------------------------
	--		Fastcast Gear sets			--
	--------------------------------------	
	sets.precast.FC = {--66% Fast Cast
		head="Carmine mask +1",			--14
		body="Sacro breastplate",			--11	
		hands="Leyline gloves",			--7
		legs="Souveran diechlings +1",	
		feet="Carmine greaves +1",		--08
		waist="Creed baudrier",
		ring1="Kishar ring", 			--04
		ring2="Moonbeam ring",
		neck="Voltsurge torque",		--04
		ear1="Loquac. earring",			--02
		ear2="Odnowa earring +1",			
		back=Rudian.FC					--10
	}	
	sets.precast.FC.Phalanx = set_combine(sets.precast.FC , {
		waist="Siegel Sash",
	})
	sets.precast.FC.Enlight = sets.precast.FC.Phalanx
	sets.precast.FC['Enlight II'] = sets.precast.FC.Phalanx
	sets.precast.FC.Protect = sets.precast.FC.Phalanx
	sets.precast.FC.Shell = sets.precast.FC.Phalanx
	sets.precast.FC.Crusade = sets.precast.FC.Phalanx   
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {
		neck="Diemer gorget",
		ear1="Nourishing earring",
	})
------------------------
-- Mid cast Gear Sets --
------------------------
	sets.midcast.SIR = {
		ammo="Staunch Tathlum",
		feet=Odyssean.Feet.FC,
		ear1="Halasz earring",
		waist="Resolute Belt",
	}
	sets.midcast['Blue Magic'] = {}
	sets.midcast.Cure = set_combine(sets.idle.PDT, {
		head="Souveran schaller +1",
		body="Souveran cuirass +1",
		hands="Souveran handschuhs +1",
		legs="Souveran diechlings +1",
		feet="Souveran schuhs +1",
		neck="Diemer gorget",
		waist="Gishdubar belt",
		ear1="Odnowa earring",
		ear2="Odnowa earring +1",
		ring1="Defending ring",
		ring2="Moonbeam ring",
		
		
	})
	sets.midcast['Flash'] = set_combine(sets.Enmity, {
		ammo="Sapience Orb"
	})
	sets.midcast.EnhancingDuration = set_combine(sets.midcast.SIR, {
		head="Carmine mask +1",
		body="Shabti cuirass",
		hands="Regal gauntlets",
		legs="Carmine cuisses +1",
		neck="Incanter's torque"		
	})
	sets.midcast['Phalanx'] = set_combine(sets.midcast.EnhancingDuration, {
		ammo="Impatiens",
		hands="Souveran handschuhs +1",
		feet="Souveran schuhs +1",
		back="Weard mantle",
		ear1="Halasz earring",
		waist="Siegel sash",
	})
	sets.midcast['Blue Magic'].Buffs = set_combine(sets.midcast.SIR, {
		ammo="Staunch Tathlum",
		feet=Odyssean.Feet.FC,
		ear1="Halasz earring",
		waist="Resolute Belt",
	})
	sets.midcast['Protect V'] = set_combine(sets.midcast.SIR, {
		ammo="Staunch Tathlum",
		feet=Odyssean.Feet.FC,
		ear1="Halasz earring",
		waist="Resolute Belt",
	})
	sets.midcast['Shell IV'] = set_combine(sets.midcast.SIR, {
		ammo="Staunch Tathlum",
		feet=Odyssean.Feet.FC,
		ear1="Halasz earring",
		waist="Resolute Belt",
	})
	sets.midcast['Blue Magic'].Enmity = set_combine(sets.Enmity, {
	
	})
	sets.midcast['Reprisal'] = {
		ammo="Staunch Tathlum",
        head="Souveran schaller +1",
        body="Rev. Surcoat +2",
		hands="Souv. Handsch. +1",
		legs="Souveran diechlings +1",
        feet="Souveran schuhs +1",
		neck="Sanctity necklace",
		ear1="Odnowa earring",
		ear2="Odnowa Earring +1",
        ring1="Moonbeam ring",
        ring2="Moonbeam ring",
        back=Rudian.FC,
		waist="Creed baudrier"
	}
-----------------------
-- Engaged Gear Sets --
-----------------------	
	sets.engaged = {
		head="Hjarrandi helm",
		body="Hjarrandi breastplate",
		hands="Souveran handschuhs +1",
		legs="Souveran diechlings +1",
		feet="Reverence leggings +2",
		neck="Lissome necklace",
		ring1="Moonbeam ring",
		ring2="Moonbeam ring",
		ear1="Cessance earring",
		ear2="Telos earring",
		waist="Phos belt",
		back=Rudian.DA,
	}
	sets.engaged.Ochain = set_combine(sets.idle.PDT, {
		head="Souveran schaller +1",
		body="Sulevia's breastplate +2",
		hands="Souv. Handsch. +1"
		
	})
	sets.engaged.Caladbolg = set_combine(sets.engaged.Ochain, { 
		ammo="Ginsen",
		head="Flam. Zucchetto +2",
		body="Souveran cuirass",
		hands="Flam. manopolas +2",
		legs=Odyssean.Legs.TP,
		feet="Flam. gambieras +2",
		neck="Lissome necklace",
		ear1="Telos earring",
		ear2="Cessance earring",
		ring1="Flamma ring",
        ring2="Chirich Ring",
	})
	sets.engaged.Dynamis = set_combine(sets.idle.PDT, {
		hands="Souv. Handsch. +1"
	})
------------------------------
-- 	Weapon skill Gear-Sets 	--
------------------------------
	sets.precast.WS = {
		head=Odyssean.Helm.VitWS,
		body=Odyssean.Body.WS,
		hands=Odyssean.Hands.WS,
		legs=Odyssean.Legs.StrWS,
		feet="Sulevia's Leggings +2",
		ammo="Ginsen",
		neck="Fotia Gorget",
		ear1="Ishvara earring",
		ear2="Telos earring",
		ring1="Karieyh ring",
		ring2="Apeile ring +1",
		back=Rudian.DA,
		waist="Fotia belt"
	}
	sets.precast.WS['Chant du Cygne'] = {
		head="Lustratio cap +1",
		body=Valor.Body.TP,
		hands=Odyssean.Hands.VitWS,
		legs=Odyssean.Legs.VitWS,
		feet="Lustratio leggings +1",
		ammo="Ginsen",
		neck="Fotia Gorget",
		ear1="Cessance earring",
		ear2="Telos earring",
		ring1="Regal ring",
		ring2="Karieyh ring",
		back=Rudian.DA,
		waist="Fotia belt"
	}
	sets.precast.WS['Atonement'] = { 
		head=Odyssean.Helm.VitWS,
		body=Odyssean.Body.WS,
		hands=Odyssean.Hands.VitWS,
		legs=Odyssean.Legs.VitWS,
		feet="Sulevia's Leggings +2",
		ammo="Paeapua",
		neck="Unmoving collar",
		ear1="Ishvara earring",
		ear2="Cryptic earring",
		ring1="Apeile ring",
		ring2="Apeile ring +1",
		back=Rudian.Enm,
		waist="Creed baudrier"
	}
	sets.precast.WS['Savage Blade'] = {
		head="Hjarrandi helm",
		body="Hjarrandi breastplate",
		hands=Odyssean.Hands.WS,
		legs=Odyssean.Legs.VitWS,
		feet="Sulevia's Leggings +2",
		ammo="Ginsen",
		neck="Fotia gorget",
		ear1="Ishvara earring",
		ear2="Telos earring",
		ring1="Regal ring",
		back=Rudian.Str,
		waist="Fotia belt"
	}
	sets.precast.WS['Sanguine Blade'] = {
		head="Jumalik helm",
		body="Sacro breastplate",
		hands="Leyline gloves",
		legs="Eschite cuisses",
		feet=Odyssean.Feet.FC,
		neck="Sanctity necklace",
		ear1="Hecate's earring",
		ear2="Friomisi earring",
		ring1="Acumen ring",
		ring2="Fenrir ring",
		back="Argocham. mantle",
		waist="Eschan stone"
	}
	sets.precast.WS['Aeolian Edge']={
		ammo="Pemphredo Tathlum",
		head={ name="Jumalik Helm", augments={'MND+10','"Mag.Atk.Bns."+15','Magic burst dmg.+10%','"Refresh"+1',}},
		body={ name="Found. Breastplate", augments={'Accuracy+11','Mag. Acc.+10','Attack+10','"Mag.Atk.Bns."+9',}},
		hands={ name="Founder's Gauntlets", augments={'STR+10','Attack+15','"Mag.Atk.Bns."+15','Phys. dmg. taken -5%',}},
		legs={ name="Odyssean Cuisses", augments={'"Mag.Atk.Bns."+29','Accuracy+24','Accuracy+17 Attack+17','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},
		feet={ name="Founder's Greaves", augments={'VIT+10','Accuracy+15','"Mag.Atk.Bns."+15','Mag. Evasion+15',}},
		neck="Eddy Necklace",
		waist="Eschan Stone",
		left_ear="Crematio Earring",
		right_ear="Friomisi Earring",
		left_ring="Shiva Ring +1",
		right_ring="Shiva Ring +1",
		back={ name="Rudianos's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%',}},
	}
	sets.precast.WS['Requiescat']={
		ammo="Quartz Tathlum +1",
		head={ name="Valorous Mask", augments={'Accuracy+27','"Dbl.Atk."+3','DEX+10',}},
		body={ name="Valorous Mail", augments={'Accuracy+22 Attack+22','Weapon Skill Acc.+10','DEX+3','Accuracy+6',}},
		hands="Sulev. Gauntlets +2",
		legs="Sulev. Cuisses +2",
		feet="Sulev. Leggings +2",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Brutal Earring",
		right_ear="Telos Earring",
		left_ring="Rufescent Ring",
		right_ring="Levia. Ring +1",
		back={ name="Rudianos's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
	}	
	sets.precast.WS['Torcleaver'] = set_combine(sets.precast.WS, {
		ammo="Knobkierrie",
		head=Odyssean.Helm.VitWS,
		body="Nzingha cuirass",
		hands=Odyssean.Hands.VitWS,
		legs=Odyssean.Legs.VitWS,
		feet="Sulev. Leggings +2", 
		ear1="Ishvara earring",
		ring1="Regal ring",
		ring2="Titan ring",
		neck="Fotia gorget",
		waist="Fotia belt",
		back=Ankou.VitWS
	})
-------------------
-- Misc Gearsets --
-------------------
	sets.CurePot = {
		body="Souveran cuirass +1",
		neck="Diemer gorget",
		ear2="Oneiros earring",
		ring2="Vocane ring",
		back="Solemnity cape",
		waist="Gishdubar sash",
		legs="Flamma dirs +1",
		feet=Odyssean.Feet.FC
	}
	sets.buff.Doom = {
		legs="Shabti cuisses",
		ring1="Purity Ring",
		ring2="Eshmun's Ring",
		waist="Gishdubar sash",
	}
	sets.Reraise = set_combine(sets.idle.PDT, {
		head="Twilight Helm",
		body="Twilight Mail",
	})
	sets.idle.Weak.Reraise = set_combine(sets.idle.PDT, sets.Reraise)
	sets.defense.Reraise = set_combine(sets.idle.PDT, sets.Reraise)
	sets.CapacityMantle = {
		back="Mecisto. Mantle"
	}
	sets.Reive = {
		neck="Ygna's Resolve +1"
	}
	sets.Protect = { 
		ring1="Sheltered ring"
	}
	--[[
	sets["PLD_Savage"] = {
    range="Ullr",
    head="Odyssean Helm",
    neck="Kgt. Beads +2",
    ear1="Moonshade Earring",
    ear2="Ishvara Earring",
    body="Valorous Mail",
    hands="Odyssean Gauntlets",
    ring1="Karieyh Ring +1",
    ring2="Regal Ring",
    back="Rudianos's Mantle",
    waist="Prosilio Belt +1",
    legs="Odyssean Cuisses",
    feet="Sulev. Leggings +2"
}
sets["PLD Arke2"] = {
    main="Excalibur",
    sub="Ochain",
    ammo="Staunch Tathlum +1",
    head="Flam. Zucchetto +2",
    neck="Asperity Necklace",
    ear1="Cessance Earring",
    ear2="Dedition Earring",
    body="Arke Corazza +1",
    hands="Ar. Manopolas +1",
    ring1="Moonlight Ring",
    ring2="Flamma Ring",
    back="Rudianos's Mantle",
    waist="Sailfi Belt +1",
    legs="Arke Cosc. +1",
    feet="Flam. Gambieras +2"
}
sets["Pld Savage Blade"] = {
    ammo="Focal Orb",
    head="Odyssean Helm",
    neck="Lacono Neck. +1",
    ear1="Moonshade Earring",
    ear2="Ishvara Earring",
    body="Odyss. Chestplate",
    hands="Odyssean Gauntlets",
    ring1="Karieyh Ring +1",
    ring2="Epaminondas's Ring",
    back="Rudianos's Mantle",
    waist="Prosilio Belt +1",
    legs="Valor. Hose",
    feet="Sulev. Leggings +2"
}
sets["Pld Turtle"] = {
    sub="Aegis",
    ammo="Staunch Tathlum +1",
    head="Souv. Schaller +1",
    neck="Warder's Charm +1",
    ear1="Odnowa Earring +1",
    ear2="Odnowa Earring",
    body="Souv. Cuirass +1",
    hands="Souv. Handsch. +1",
    ring1="Moonlight Ring",
    ring2="Moonlight Ring",
    back="Rudianos's Mantle",
    waist="Gold Mog. Belt",
    legs="Souv. Diechlings +1",
    feet="Souveran Schuhs +1"
}
ets["PLD SIRD 7/31/2018"] = {
    ammo="Staunch Tathlum +1",
    head="Souv. Schaller +1",
    neck="Moonlight Necklace",
    hands="Regal Gauntlets",
    back="Rudianos's Mantle",
    legs="Founder's Hose"
}
	]]