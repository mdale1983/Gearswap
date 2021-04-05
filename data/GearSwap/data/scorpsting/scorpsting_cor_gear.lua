include('augments.lua')
------------------
-- 	Bullets 	--
------------------
WeaponType =  {
        ['Death Penalty'] = 	"Gun",
        ['Armageddon'] = 		"Gun",
        ['Fomalhaut'] = 		"Gun",
		['Anarchy +3'] = 		"Gun",
		['Compensator'] = 		"Gun",
		['Molybdosis'] = 		"Gun",
		['Doomsday'] = 			"Gun",
	}
	DefaultAmmo = {
		['Gun']  = {
			['Default'] = 		"Decimating Bullet",
			['WS'] = 			"Decimating Bullet",
			['MagicWS'] =		"Orichalc. Bullet",
			['Acc'] = 			"Decimating Bullet",
			['Magic'] = 		"Decimating Bullet",
			['MagicAcc'] = 		"Decimating Bullet",
			['CorsairShot'] = 	"Decimating Bullet"
		}
	}
----------------------
--	Field/Town Idle	--
----------------------
	sets.idle = {
        head="Meghanada visor +1",
        body="Meghanada cuirie +1",
        hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
        ring1="Defending ring",
        ring2="Gelatinous ring +1",
        neck="Loricate torque +1",
        ear1="Odnowa earring",
        ear2="Odnowa earring",
    	back="Solemnity Cape",
        waist="Flume Belt",
    }
	sets.idle.MagicEva = set_combine(sets.idle,{ 	
        head="Meghanada visor +1",
        body="Meghanada cuirie +1",
        hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
        ring1="Defending ring",
        ring2="Gelatinous ring +1",
        neck="Loricate torque +1",
        ear1="Odnowa earring",
        ear2="Odnowa earring",
    	back="Solemnity Cape",
        waist="Flume Belt",
	})
	sets.Kiting = {
		legs="Carmine Cuisses +1"
	}
	sets.Kiting.night = {
		legs="Carmine Cuisses +1"
	}
------------------
--	Weapon sets	--
------------------
	sets.weapons.Fomalhaut = {
		main="Naegling",
		sub="Tauret",
		range="Fomalhaut",
		ammo=DefaultAmmo.Gun.Default,
		waist="Chrono bullet pouch"
	}
	sets.weapons.DP = {
		main="Naegling",
		sub="Tauret",
		range="Death Penalty",
		ammo=DefaultAmmo.Gun.Default,
		waist="Quelling B. quiver"
	}
	sets.weapons.Anarchy = {
		main="Naegling",
		sub="Tauret",
		range="Anarchy +3",
		ammo=DefaultAmmo.Gun.Default,
		waist="Chrono bullet pouch"
	}
	sets.weapons.Armageddon = { 
		main="Naegling",
		sub="Tauret",
		range="Armageddon",
		ammo=DefaultAmmo.Gun.Default,
	}
	sets.weapons.Molybdosis = { 
		main="Naegling",
		sub="Tauret",
		range="Molybdosis",
		ammo=DefaultAmmo.Gun.Default,
	}
	sets.weapons.Doomsday = { 
		main="Naegling",
		sub="Tauret",
		range="Doomsday",
		ammo=DefaultAmmo.Gun.Default,
	}
----------------------------------
--		Job Ability sets		--
----------------------------------
	sets.precast.JA['Triple Shot'] = {
		body="Navarch's Frac +2"
	}
	--[[sets.precast.JA['Snake Eye'] = {
		legs="Commodore Culottes +1"
	}]]
	sets.precast.JA['Wild Card'] = {
		feet="Lanun Bottes +2"
	}
	sets.precast.JA['Random Deal'] = {
		body="Lanun Frac"
	}
	sets.precast.JA['Quick Draw'] = {
        head="Carmine Mask",
        neck="Sanctity Necklace",
        ear1="Friomisi Earring",
        ear2="Crematio Earring",
        body="Samnuha coat",
        hands="Leyline Gloves",
        ring1="Acumen Ring",
        ring2="Garuda Ring",
        back="Gunslinger's Cape",
        waist="Eschan Stone",
        legs="Shneddick Tights +1",
        feet="Lanun Bottes"
	}
	--[[sets.precast.JA['Fold'] = {
		hands="Commodore Gants +2"
	}}]]
	sets.precast.CorsairRoll = {
        range="Compensator",
		head="Lanun Tricorne +1",
        hands="Chasseur's Gants +1",
        body="Lanun Frac +1",
		neck="Regal Necklace",
        back="Camulus's mantle",
        feet="Lanun Bottes"
    }
	sets.precast.CorsairRoll.idle = set_combine(sets.precast.CorsairRoll, { 
		range="Fomalhaut"
	})
	sets.precast.CorsairRoll["Samurai Roll"] = set_combine(sets.precast.CorsairRoll, {
		--legs="Navarch's Culottes +1"
	})
	sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {
		feet="Navarch's Bottes +2"
	})
	--[[sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {
		--head="Navarch's Tricorne +1"
	})]]
	sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {
		body="Chasseur's Frac"
	})
	sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {
		hands="Navarch's Gants +2"
	})
	sets.precast.LuzafRing = {
		ring2="Luzaf's Ring"
	}
    --[[sets.precast.FoldDoubleBust = {
		hands="Lanun Gants"
	}]]
--------------------------------------
--		Pre-Cast Gear sets			--
--------------------------------------
	sets.precast.FC = {
		head="Carmine mask +1",
		body="Taeon tabard",
		hands="Leyline gloves",
		legs="Ayanmo cosciales +2",
		feet="Carmine greaves +1",
		neck="Voltsurge torque",
		ear1="Etiolation earring",
		ear2="Loquacious earring",
		ring1="Prolix ring",
		ring2="Kishar ring",
		back="",
		waist="Resolute belt"
	}
	sets.precast.CorsairShot = {}
	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {
        --body="Passion Jacket",
        neck="Magoraga Beads",
        --ring2="Lebeche Ring",
    })
	sets.precast.RA = {
		head="Taeon chapeau",
        body="Laksa. Frac +2",
		hands="Carmine Fin. Ga. +1",
        waist="Impulse Belt",
        legs="Adhemar Kecks +1",
        feet="Meg. jam. +1",
		back=""
    }
	sets.precast.RA.Flurry1 = {-- (45% snapshot needed)
		head="Pursuer's beret",
        body="Oshosi vest",
		hands="Carmine Fin. Ga. +1",
		legs="Orion braccae +2",
        feet="Arcadian socks +3",
		neck="Scout's gorget +1",
        waist="Impulse Belt",
    }
	sets.precast.RA.Flurry2 = {-- (30% Snapshot needed)
		head="Orion beret +3",
        body="Arcadian jerkin +3",
		hands="Carmine Fin. Ga. +1",
        legs="Adhemar Kecks +1",
        feet="Arcadian socks +3",
		neck="Scout's gorget +1",
        waist="Impulse Belt",
    }
--------------------------
--	Midcast Gear Sets 	--
--------------------------
	sets.midcast.FastRecast = {
		head="Carmine mask +1",
		body="Taeon tabard",
		hands="Leyline gloves",
		legs="Ayanmo cosciales +2",
		feet="Carmine greaves +1",
		neck="Voltsurge torque",
		ear1="Etiolation earring",
		ear2="Loquacious earring",
		ring1="Prolix ring",
		ring2="Kishar ring",
		back=Cam.RA,
		waist="Resolute belt",
    }
	sets.midcast.Utsusemi = sets.midcast.FastRecast
	sets.midcast.CorsairShot = {
        head="Carmine Mask",
        neck="Sanctity Necklace",
        ear1="Friomisi Earring",
        ear2="Crematio Earring",
        body="Samnuha coat",
        hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
        ring1="Acumen Ring",
        ring2="Garuda Ring",
        back="Gunslinger's Cape",
        waist="Eschan Stone",
    }
	sets.midcast.CorsairShot.Acc = set_combine(sets.midcast.CorsairShot, {
        head="Carmine Mask +1",
        neck="Sanctity Necklace",
        ear1="Friomisi Earring",
        ear2="Crematio Earring",
        body="Samnuha coat",
        ear1="Lifestorm Earring",
        ear2="Psystorm Earring",
        ring1="Perception Ring",
        ring2="Sangoma Ring",
        feet="Navarch's Bottes +2"
    })
    sets.midcast.CorsairShot['Light Shot'] = sets.midcast.CorsairShot.Acc
	sets.midcast.CorsairShot['Dark Shot'] = sets.midcast.CorsairShot['Light Shot']
	------------------
	-- Ranged gear 	--
	------------------
		sets.midcast.RA = { 
			head="Meghanada visor +1",
			body="Oshosi vest",
			hands="Malignance Gloves",
			legs="Adhemar kecks +1",
			feet="Adhemar gamashes +1",
			neck="Iskur gorget",
			ear1="Enervating Earring",
			ear2="Telos Earring",
			ring1="Regal Ring",
			ring2="Ilabrat Ring",
			back="",
			waist="Yemaya belt",
		}
		sets.midcast.RA.Gun = set_combine(sets.midcast.RA, {
			
		})
		sets.midcast.TripleShot = set_combine(sets.midcast.RA, { 
			head="",
			body="Oshosi Vest",
			hands="Oshosi gloves",
			legs="Oshosi trousers",
			feet="Oshosi leggings",
		})
----------------------------------
--		Engaged sets			--
----------------------------------	
	sets.engaged = {
        head="Mummu Bonnet +1",
        body="Oshosi Vest",
        hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
        ring1="Regal Ring",
        ring2="Ilabrat Ring",
        neck="Marked Gorget",
        ear1="Cessance Earring",
        ear2="Telos Earring",
		waist="Windbuffet Belt +1",
		back=Cam.TP,
    }
	sets.engaged.MagicEva = { 
        head="Meghanada visor +1",
        neck="Loricate torque +1",
        ear1="Cessance Earring",
		ear2="Etiolation earring",
        body="Emet harness +1",
        hands="",
        ring1="Vengeful Ring",
        ring2="Gelatinous ring +1",
    	back="Solemnity Cape",
        waist="Flume Belt",
        legs="Carmine Cuisses +1",
        feet=""
	}
	sets.engaged.DW = set_combine(sets.engaged, {
	-- No Magic Haste 
		body="Adhemar jacket +1",
		legs="Carmine Cuisses +1",
    })-- 49% DW Needed
	 sets.engaged.DW.Haste_25 = set_combine(sets.engaged,  {
	-- 15% Magic Haste 
		body="Adhemar jacket +1",	--6
		ear2="Suppanomimi",			--5
		legs="Carmine Cuisses +1",	--6
		feet="",			--9
		back="", 		--10
		ear1="Eabani Earring", 		--4
		waist="Grunfeld rope", 		--7
    }) -- 42% DW Needed
    sets.engaged.DW.Haste_30 = set_combine(sets.engaged,  {
	-- 30% Magic Haste 
        body="Adhemar jacket +1",	--06
		feet="",			--09
		back="",	 		--10
		legs="Carmine Cuisses +1"	--06
    }) -- 31% DW Needed
    sets.engaged.DW.Haste_40 = set_combine(sets.engaged,  {
	--40% Magic Haste 
        body="Adhemar jacket +1",	--5
		ear2="Suppanomimi",			--5
		legs="Carmine Cuisses +1",	--6
		feet="",			--9
		back="", 		--10
		ear1="Eabani Earring", 		--4
		waist="Grunfeld rope", 		--7
    }) -- 27% DW Needed
    sets.engaged.DW.Haste_43 = set_combine(sets.engaged,  {
	-- 45% Magic Haste 
        body="Adhemar jacket +1",	--5
		legs="Carmine Cuisses +1",	--6
	}) -- 11% DW Needed
----------------------------------------------
--			Weaponskill Gearsets			--
----------------------------------------------
	sets.precast.WS = {
        head="Meghanada visor +1",
        neck="Fotia Gorget",
        ear1="Flame Pearl",
        ear2="Flame Pearl",
        body="Adhemar jacket",
		hands="Meghanada gloves +1",
        ring1="Karieyh Ring",
        ring2="Regal Ring",
		back="Buquwik Cape",
        waist="Fotia belt",
        legs="Meghanada chausses +1",
        feet="Meghanada jambeaux +1"
    }
	sets.precast.WS['Savage Blade'] = {
		head="Mummu Bonnet +1",
		body=Herc.Body.WS,
		hands="Meghanada gloves +1",
		legs=Herc.Legs.MAB,
		feet=Herc.Feet.WS,
		neck="Fotia Gorget",
		ear1="Ishvara earring",
		ear2="Brutal earring",
		ring1="Ilabrat ring",
		ring2="Regal ring",
		waist="Fotia belt",
		back=Cam.TP
	}
	sets.precast.WS['Detonator'] = set_combine(sets.precast.WS, {
		--ammo=gear.WSbullet,
		hands="Meg. Gloves +1",
		ear1="Ishvara earring",
		ring1="Petrov ring",
		ring2="Karieyh ring",
		back="Gunslinger's cape",
	})
	sets.precast.WS['Last Stand'] = set_combine(sets.precast.WS, {
        --ammo=gear.WSbullet,
		head="",
		body="Laksa. frac +2",
		hands="Meghanada gloves +1",
		legs="",
		feet="",
		neck="Fotia gorget",
		ring1="Dingir ring",
		ring2="Regal ring",
        ear1="Ishvara Earring",
		waist="Fotia belt",
		back=""
    })
	sets.precast.WS['Last Stand'].Acc = set_combine(sets.precast.WS['Last Stand'], {
        --ammo=gear.WSbullet,
        ear1="Enervating Earring",
        ear2="Moonshade Earring",
        ring1="Regal Ring",
        ring2="Karieyh Ring"
    })
	sets.precast.WS['Wildfire'] = {
        --ammo=gear.MAbullet,
        head="",
		body="Carmine scale mail +1",
        hands="Carmine Fin. Ga. +1",
		legs=Herc.Legs.MAB,
        feet="Lanun bottes +2",
        neck="Sanctity Necklace",
        ear1="Friomisi Earring",
		ear2="Hecate's Earring",
        ring1="Shiva Ring +1",
		ring2="Archon Ring",
        waist="Svelt. Gouriz +1",
        back=Cam.MAB,
    }
	sets.precast.WS['Leaden Salute'] = set_combine(sets.precast.WS['Wildfire'], { 
		head="Pixie Hairpin +1",
	})
	sets.precast.WS['Aeolian Edge'] = {
        --ammo=gear.MAbullet,
        head="",
        neck="Sanctity Necklace",
        ear1="Friomisi Earring",
		ear2="Hecate's Earring",
        body="Samnuha Coat",
        hands="Leyline Gloves",
        ring1="Karieyh Ring",
        ring2="Garuda Ring",
        back="Gunslinger's cape",
        waist="Eschan stone",
        legs="Shneddick Tights +1",
        feet="Lanun Bottes"	
	}
	sets.CapacityMantle = {
		back="Mecisto. Mantle"
	}