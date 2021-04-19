include('augments.lua')
----------------------
--	Field/Town Idle	--
----------------------
	sets.idle = {
		ammo={ name="Staunch tathlum",  priority=1},
		head={ name="Souveran schaller +1",  priority=14},	--280HP+
        body={ name="Reverence surcoat +2",  priority=15},	--+244HP
		hands={ name="Souv. Handsch. +1",  priority=12},		--+199HP
		legs={ name="Chev. Cuisses +1",  priority=10},		--+107HP
        feet={ name="Souveran schuhs +1",  priority=13},	--+227HP
		neck={ name="Warder's charm +1",  priority=1},		
		ear1={ name="Odnowa earring",  priority=9},			--+100HP
		ear2={ name="Odnowa Earring +1",  priority=11},		--+110HP
        ring1={ name="Moonbeam ring",  priority=8},			--+100HP
        ring2={ name="Moonbeam ring",  priority=7},			--+100HP
		waist={ name="Flume belt", priority=1},		--+40HP
		back=Rudian.FC,										--+60HP			
	}
	sets.idle.Breath = { 
		hands={ name="Souv. Handsch. +1",  priority=12},
		legs={ name="Chev. Cuisses +1",  priority=10},
		neck={ name="Loricate torque +1", priority=1},
	}
	sets.idle.Reraise = set_combine(sets.idle, {
		head={ name="Twilight helm",priority=1},
		body={ name="Twilight mail", priority=1},
	})
------------------
--	Kiting Sets	--
------------------
	sets.Kiting = {
		legs={ name="Carmine cuisses +1", priority=1}
	}
	sets.Kiting.night = { 
		legs={ name="Carmine cuisses +1", priority=1}
	}
------------------
--	Weapon Sets	--
------------------
	sets.weapons.Excalibur = { 
		main={ name="Excalibur", priority=1}
	}
	sets.weapons.Burtgang = { 
		main={ name="Burtgang", priority=1}
	}
	sets.weapons.Almace = { 
		main={ name="Almace", priority=1}
	}
	sets.Shields.Aegis = { 
		sub={ name="Aegis", priority=1}
	}
	sets.Shields.Ochain = { 
		sub={ name="Ochain", priority=1}
	}
	sets.Shields.Priwen = { 
		sub={ name="Priwen", priority=1}
	}
	sets.Shields.Srivatsa = { 
		sub={ name="Srivatsa", priority=1}
	}
----------------------
-- 	Enmity Gear set --
----------------------
	sets.Enmity = {
		ammo={ name="Sapience Orb", priority=1},
		head={ name="Souveran schaller +1",  priority=14},
		body={ name="Souveran cuirass +1", priority=13},
		hands={ name="Souv. Handsch. +1",  priority=12},
		legs={ name="Souveran diechlings +1",  priority=10},
		feet={ name="Eschite Greaves", priority=12},
		neck={ name="Moonlight necklace", priority=1},
		ring1={ name="Supershear ring", priority=4},
		ring2={ name="Eihwaz ring", priority=7},
		ear1={ name="Cryptic earring", priority=5},
		ear2={ name="Pluto's pearl", priority=1},
		back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10','Spell interruption rate down-10%'}, priority=11},
		waist={ name="Creed baudrier", priority=6},
	}
--------------------------------------
--		Pre-cast Gear sets			--
--------------------------------------
	----------------------------------
	--		Job Ability sets		--
	----------------------------------
	
	--------------------------------------
	--		Fastcast Gear sets			--
	--------------------------------------
	sets.precast.FC = {--66% Fast Cast
		ammo={ name="Sapience Orb", priority=1},
		head={ name="Carmine mask +1",	priority=7},
		body={ name="Reverence surcoat +2",  priority=15},	
		hands={ name="Souv. Handsch. +1",  priority=14},
		legs={ name="Souveran diechlings +1", priority=13},
		feet={ name="Carmine greaves +1", priority=7},
		waist={ name="Creed baudrier", priority=6},
		ring1={ name="Moonbeam ring", priority=8}, 
		ring2={ name="Moonbeam ring", priority=9},
		neck={ name="Voltsurge torque", priority=1},	
		ear1={ name="Odnowa earring", priority=11},	
		ear2={ name="Odnowa earring +1", priority=12} ,			
		back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}, priority=6}		
	}	
	------------------------
	-- Mid cast Gear Sets --
	------------------------
	sets.midcast.SIRD = { 
		ammo={ name="Staunch Tathlum",  priority=1},
		neck={ name="Moonlight necklace",  priority=1},
		body={ name="Reverence surcoat +2",  priority=15},	--+244HP
		legs={ name="Carmine cuisses +1",  priority=6},
		feet={ name="Odyssean Greaves",augments={'"Fast Cast"+4','Mag. Acc.+15'},  priority=5},
		ear1={ name="Knightly earring",  priority=1},
	}
	sets.midcast['Blue Magic'] = set_combine(sets.Enmity, {
		ammo={ name="Staunch Tathlum",  priority=1},
		body={ name="Reverence surcoat +2",  priority=15},	--+244HP
		legs={ name="Carmine cuisses +1",  priority=6},
		feet={ name="Odyssean Greaves",augments={'"Fast Cast"+4','Mag. Acc.+15'},  priority=5},
		ear1={ name="Knightly earring",  priority=1},
	})
	sets.midcast.Cure = set_combine(sets.idle.PDT, {
		head={ name="Souveran schaller +1",  priority=14},
		body={ name="Reverence surcoat +2", priority=15},
		hands={ name="Souv. Handsch. +1",  priority=12},
		legs={ name="Carmine suisses +1",  priority=7},
		feet={ name="Odyssean greaves",  priority=5},
		neck={ name="Moonlight necklace", priority=1},
		waist={ name="Creed baudrier", priority=6},
		ear1={ name="Knightly earring", priority=1},
		ear2={ name="Odnowa earring +1", priority=11},
		ring1={ name="Moonbeam ring", priority=10},
		ring2={ name="Moonbeam ring", priority=9},
		back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10','Spell interruption rate down-10%'}, priority=8},
	})
	sets.midcast['Flash'] = set_combine(sets.Enmity, {
		ammo={ name="Sapience Orb", priority=1},
		ear2={ name="Etiolation earring", priority=5},
		ring1={ name="Weatherspoon ring", priority=3},
		ring2={ name="Eihwaz ring", priority=7},
		neck={ name="Voltsurge torque", priority=2},
		back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}, priority=6}
	})
	sets.midcast['Phalanx'] = {
		ammo={ name="Impatiens",priority=3},
		body={ name="Yorium cuirass",priority=13},
		hands={ name="Souveran handschuhs +1", priority=15},
		legs={ name="Yorium cuisses", priority=12},
		feet={ name="Souveran schuhs +1", priority=14},
		back={ name="Weard mantle",priority=11},
		ear1={ name="Halasz earring",priority=2},
		waist={ name="Siegel sash",priority=1},
	}
	sets.midcast['Reprisal'] = {
		ammo="Staunch Tathlum",
        head={ name="Souveran schaller +1",  priority=14},
        body={ name="Rev. Surcoat +2", priority=15},
		hands={ name="Souv. Handsch. +1",  priority=12},
		legs={ name="Souveran diechlings +1",  priority=11},
		feet={ name="Souveran schuhs +1",  priority=13},
		neck={ name="Unmoving collar +1",  priority=6},
		ear1={ name="Odnowa earring", priority=8},
		ear2={ name="Odnowa earring +1", priority=9},
		ring1={ name="Moonbeam ring", priority=6},
		ring2={ name="Moonbeam ring", priority=7},
        back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}, priority=5},
		waist={ name="Creed baudrier", priority=4},
	}
	sets.midcast['Enlight II'] = { 
		
	}
	sets.midcast['Blue Magic'].Enmity = set_combine(sets.Enmity, { })
	sets.midcast.Flash.SIRD = set_combine(sets.Enmity.SIRD, {})
    sets.midcast.Stun = set_combine(sets.Enmity, {})
	sets.midcast.Stun.SIRD = set_combine(sets.Enmity.SIRD, {})
	sets.midcast['Blue Magic'].SIRD = set_combine(sets.Enmity.SIRD, {})
	sets.midcast.Cocoon = set_combine(sets.Enmity.SIRD, {})
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
		ear1="Thureous earring",
		ear2="Odnowa earring +1",
		waist="Tempus fugit",
		back=Rudian.DA,
	}
	sets.engaged.MagicEva = { 
	
	}
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
	sets.precast.WS['Atonement'] = set_combine(sets.Enmity, { })
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