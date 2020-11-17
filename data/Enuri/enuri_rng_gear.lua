include('augments.lua')
------------------
-- 	Bullets 	--
------------------
	WeaponType =  {
		['Yoichinoyumi'] = 	"Bow",
		['Gandiva'] = 		"Bow",
        ['Fail-Not'] = 		"Bow",
        ['Accipiter'] = 	"Bow",
        ['Annihilator'] = 	"Gun",
        ['Armageddon'] = 	"Gun",
        ['Fomalhaut'] = 	"Gun",
		['Ataktos'] = 		"Gun",
        ['Gastraphetes'] = 	"Crossbow",
	}
	DefaultAmmo = {
		['Bow']  = {
			['Default'] = "Chrono Arrow",
			['WS'] = "Chrono Arrow",
			['Acc'] = "Chrono Arrow",
			['Magic'] = "Chrono Arrow",
			['MagicAcc'] = "Chrono Arrow",
			['Unlimited'] = "Hauksbok Arrow",
			['MagicUnlimited'] ="Hauksbok Arrow",
			['MagicAccUnlimited'] ="Hauksbok Arrow"
		},
		['Gun']  = {
			['Default'] = "Eradicating Bullet",
			['WS'] = "Chrono Bullet",
			['Acc'] = "Eradicating Bullet",
			['Magic'] = "Devastating Bullet",
			['MagicAcc'] = "Devastating Bullet",
			['Unlimited'] = "Hauksbok Bullet",
			['MagicUnlimited'] = "Hauksbok Bullet",
			['MagicAccUnlimited'] ="Animikii Bullet"
		},					
		['Crossbow'] = {
			['Default'] = "Quelling Bolt",
			['WS'] = "Quelling Bolt",
			['Acc'] = "Quelling Bolt",
			['Magic'] = "Quelling Bolt",
			['MagicAcc'] = "Quelling Bolt",
			['Unlimited'] = "Quelling Bolt",
			['MagicUnlimited'] = "Quelling Bolt",
			['MagicAccUnlimited'] ="Quelling Bolt"
		}
	}
----------------------
--	Field/Town Idle	--
----------------------
	sets.idle = {
        head="Meghanada visor +1",
		neck="Loricate torque +1",
        body="Meghanada cuirie +2",
        hands="Malignance gloves",
		legs="Arcadian braccae +3",
        feet=Herc.Feet.PDT,
        ear1="Odnowa earring +1",
        ear2="Etiolation Earring",
        ring1="Defending ring",
        ring2="Fortified ring",
        waist="Flume Belt",
    	back=Bele.MagicEva
    }
	sets.idle.MagicEva = set_combine(sets.idle,{ 
		ring1="Vengeful ring",
		ear2="Etiolation earring",
	})
	sets.Kiting = {
		legs="Carmine cuisses +1"
	}
------------------
--	Weapon sets	--
------------------
	sets.weapons.Fomalhaut = {
		main="Perun +1",
		sub="Nusku shield",
		range="Fomalhaut",
		ammo="Eradicating bullet",
		waist="Chrono bullet pouch"
	}
	sets.weapons.Gastraphetes = {
		main="Malevolence",
		sub="Malevolence",
		range="Gastraphetes",
		ammo="Quelling bolt",
		waist="Quelling bolt quiver"
	}
	sets.weapons.Annihilator = {
		main="Perun +1",
		sub="Nusku shield",
		range="Annihilator",
		ammo="Eradicating bullet",
		waist="Chrono bullet pouch"
	}
	sets.Items = {
		
	}
----------------------------------
--		Job Ability sets		--
----------------------------------
	sets.precast.JA['Eagle Eye Shot'] = {legs="Arc. Braccae +3"}
    -- sets.precast.JA['Bounty Shot'] = {hands="Amini Glvltt. +1"}
    sets.precast.JA['Camouflage'] = {body="Orion Jerkin +2"}
    sets.precast.JA['Scavenge'] = {feet="Orion Socks +2"}
    sets.precast.JA['Shadowbind'] = {hands="Orion Bracers +2"}
    sets.precast.JA['Sharpshot'] = {legs="Orion Braccae +2"}
	sets.precast.JA['Barrage'] = {hands="Orion bracers +2"}
	sets.precast.JA['Velocity Shot'] = {
		body="Amini caban +1", 
		back="Belenus's cape"
	}
--------------------------------------
--		Pre-Cast Gear sets			--
--------------------------------------
	sets.precast.FC = {
		head="Carmine mask +1",
		body=Taeon.Body.FC,
		hands="Leyline gloves",
		-- legs="Rawhide Trousers",
		feet="Carmine greaves +1",
		neck="Voltsurge torque",
		ear1="Loquacious earring",
		ear2="Etiolation earring",
		ring1="Prolix ring",
		ring2="Weather. ring",
		back=Bele.FC,
		-- waist="Resolute belt"
	}
	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {
        --body="Passion Jacket",
        neck="Magoraga Beads",
        --ring2="Lebeche Ring",
    })
	sets.precast.RA = {-- (60% snapshot needed)
		head=Taeon.Head.SS,
        body="Oshosi vest",
		hands="Carmine Fin. Ga. +1",
        legs="Orion Braccae +2",
        feet="Adhemar gamashes +1",
		neck="Scout's gorget +1",
        waist="Impulse Belt",
		back=Bele.MagicEva
    }
	sets.precast.RA.Gastraphetes = set_combine(sets.precast.RA, {--(50% Snapshot needed)
		head="Orion beret +3"
	})
	sets.precast.RA.Flurry1 = {-- (45% snapshot needed)
		head="Arcadian beret +3",
        body="Oshosi vest",
		hands="Carmine Fin. Ga. +1",
		legs="Orion braccae +2",
        feet="Arcadian socks +3",
		neck="Scout's gorget +1",
        waist="Impulse Belt",
		back=Bele.MagicEva
    }
	sets.precast.RA.Flurry2 = {-- (30% Snapshot needed)
		head="Arcadian beret +3",
        body="Arcadian jerkin +3",
		hands="Carmine Fin. Ga. +1",
        legs="Adhemar Kecks +1",
        feet="Arcadian socks +3",
		neck="Scout's gorget +1",
        waist="Impulse Belt",
		back=Bele.MagicEva
    }
	sets.precast.RA.Gastraphetes.Flurry1 = {-- (45% snapshot needed)
		head="Arcadian beret +3",
        body="Oshosi vest",
		hands="Carmine Fin. Ga. +1",
		legs="Pursuer's pants",
        feet="Arcadian socks +3",
		neck="Scout's gorget +1",
        waist="Impulse Belt",
		back=Bele.MagicEva
    }
	sets.precast.RA.Gastraphetes.Flurry2 = {-- (45% snapshot needed)
		head="Arcadian beret +3",
        body="Oshosi vest",
		hands="Carmine Fin. Ga. +1",
		legs="Pursuer's pants",
        feet="Arcadian socks +3",
		neck="Scout's gorget +1",
        waist="Impulse Belt",
		back=Bele.MagicEva
    }
--------------------------
--	Midcast Gear Sets 	--
--------------------------
	sets.midcast.FastRecast = sets.precast.FC
	sets.midcast.Utsusemi = sets.midcast.FastRecast
	
	------------------
	-- Ranged gear 	--
	------------------
		sets.midcast.RA = {
		-- 17sTP from weapons/Shield
			head="Orion beret +3",
			neck="Scout's gorget +1",		--4sTP
			body="Oshosi vest",				--6sTP
			hands="Malignance gloves",		--12sTP
			legs="Adhemar kecks +1",		--7sTP
			feet="Adhemar gamashes +1",		--7sTP
			ear1="Dedition Earring",		--sTP
			ear2="Telos Earring",			--5sTP
			ring1="Regal Ring",				--5sTP
			ring2="Ilabrat Ring",			--5sTP
			waist="Yemaya belt",			--
			back=Bele.RA,					--10sTP
		}
		sets.midcast.RA.Gastraphetes = {
		-- 17sTP from weapons/Shield
			head="Arcadian beret +3",
			neck="Scout's gorget +1",		--4sTP
			body="Oshosi vest",				--6sTP
			hands="Malignance gloves",		--6sTP
			legs="Adhemar kecks +1",		--7sTP
			feet="Adhemar gamashes +1",		--7sTP
			ear1="Dedition Earring",		--sTP
			ear2="Telos Earring",			--5sTP
			ring1="Chirich ring +1",		--5sTP
			ring2="Ilabrat Ring",			--5sTP
			waist="Yemaya belt",			--
			back=Bele.RA,					--10sTP
		}-- +52 sTP
	----------------------------------
	--		Custom Buff sets		--
	----------------------------------
		sets.midcast.Barrage = {
			head="Orion beret +3",
			neck="Iskur gorget",			--
			body="Orion jerkin +2",			
			hands="Orion Bracers +2",		--6sTP
			legs="Adhemar kecks +1",		--7sTP
			feet="Arcadian socks +3",
			ear1="Enervating Earring",		--sTP
			ear2="Telos Earring",			--5sTP
			ring1="Regal Ring",				--5sTP
			ring2="Ilabrat Ring",			--5sTP
			waist="Yemaya belt",			--4sTP
			back=Bele.RA,					--10sTP
		}
		sets.midcast.DoubleShot = set_combine(sets.midcast.RA, { 
			head="Arcadian beret +3",
			body="Arc. jerkin +3",
			hands="Oshosi gloves",
			legs="Oshosi trousers",
			feet="Oshosi leggings",
		})
----------------------------------
--		Engaged sets			--
----------------------------------	
	sets.engaged = {
        head="Adhemar bonnet +1",
        neck="Lissome necklace",
        ear1="Cessance Earring",
        ear2="Telos Earring",
        body="Adhemar jacket +1",
        hands=Herc.Hands.WS,
        ring1="Regal Ring",
        ring2="Ilabrat Ring",
        back=Bele.TP,
        waist="Grunfeld rope",
        legs="Carmine Cuisses +1",
        feet=Herc.Feet.WS
    }
	sets.engaged.DW = {
        head="Adhemar bonnet +1",
        neck="Lissome necklace",
        ear1="Cessance Earring",
        ear2="Telos Earring",
        body="Adhemar jacket +1",
        hands=Herc.Hands.WS,
        ring1="Regal Ring",
        ring2="Ilabrat Ring",
        back=Bele.TP,
        waist="Grunfeld rope",
        legs="Carmine Cuisses +1",
        feet=Herc.Feet.WS
    }
----------------------------------------------
--			Weaponskill Gearsets			--
----------------------------------------------
	sets.precast.WS = {
        head="Orion beret +3",
        neck="Fotia Gorget",
        ear1="Ishvara earring",
        ear2="Sherida earring",
        body=Herc.Body.WS,
        hands="Meghanada gloves +2",
        ring1="Regal Ring",
        ring2="Ilabrat Ring",
		back=Bele.WS,
        waist="Fotia belt",
        legs="Arcadian braccae +3",
        feet=Herc.Feet.WS
    }
	sets.precast.WS['Detonator'] = set_combine(sets.precast.WS, {
		hands="Meg. Gloves +2",
		ear1="Ishvara earring",
		back=Bele.WS,
	})
	sets.precast.WS['Last Stand'] = set_combine(sets.precast.WS, {
		head="Orion beret +3",
		body=Herc.Body.RWS,
		hands="Meghanada gloves +2",
		legs="Arcadian braccae +3",
		feet=Herc.Feet.RWS,
		neck="Scout's gorget +1",
		ring1="Ilabrat Ring",
		ring2="Regal ring",
        ear1="Ishvara Earring",
		waist="Fotia belt",
		back=Bele.WS
    })
	sets.precast.WS['Coronach'] = set_combine(sets.precast.WS, {
		head="Orion beret +3",
		body=Herc.Body.RWS,
		hands="Meghanada gloves +2",
		legs="Arcadian braccae +3",
		feet=Herc.Feet.RWS,
		neck="Scout's gorget +1",
		ring1="Ilabrat Ring",
		ring2="Regal ring",
        ear1="Ishvara Earring",
		waist="Fotia belt",
		back=Bele.WS
    })
	sets.precast.WS['Last Stand'].Acc = set_combine(sets.precast.WS['Last Stand'], {
        ear1="Enervating Earring",
        ear2="Moonshade Earring",
    })
	sets.precast.WS['Wildfire'] = {
        neck="Scout's gorget +1",
        ear1="Friomisi Earring",
		ear2="Hecate's Earring",
		body="Cohort cloak +1",
        hands="Carmine finger gauntlets +1",
		legs=Herc.Legs.MAB,
        feet=Herc.Feet.MAB,
      	ring1="Weather. Ring",
		ring2="Dingir ring",
        waist="Eschan stone",
        back=Bele.MAB,
    }
	sets.precast.WS['Hot Shot'] = set_combine(sets.precast.WS['Last Stand'], { 
		
	})
	sets.precast.WS['Trueflight'] = set_combine(sets.precast.WS['Wildfire'], { 
		--[[123MAB with 21% wsD]]
		body="Cohort cloak +1",
		ear2="Hecate's earring",
	})
	sets.CapacityMantle = {
		back="Mecisto. Mantle"
	}
	sets.precast.Item['Sublime Sushi'] = {item1="Sublime sushi"}
	sets.precast.Item['Holy Water'] = {}
	sets.precast.Item['Holy Water'] = {}
	sets.precast.Item['Holy Water'] = {}