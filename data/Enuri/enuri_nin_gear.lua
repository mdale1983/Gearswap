include('augments.lua')
----------------------
--  Field/Town Idle --
----------------------
	sets.idle = { 
		ammo="Date Shuriken",
        head="Malignance Chapeau",
		neck="Loricate Torque +1",
		ear1="Etiolation Earring",
		ear2="Odnowa earring +1",
        body="Ryuo domaru +1",
		hands="Malignance Gloves",
		ring1="Defending Ring",
		ring2="Warden's ring",
        back="Moonlight Cape",
		waist="Flume Belt",
		legs="Ryuo hakama",
		feet=Herc.Feet.PDT
	}
	sets.idle.MagicEva = {
		ammo="Date Shuriken",
		head="Dampening Tam",
		neck="Warder's Charm +1",
		ear1="Etiolation Earring",
		ear2="Sanare Earring",
		body="Mekosu. Harness",
		hands="Leyline Gloves",
		ring1="Vengeful Ring",
		Ring2="Purity Ring",
		back="Toro Cape",
		waist="Engraved Belt",
		legs="Samnuha Tights",
		feet="Ahosi Leggings"
	}
	sets.Kiting = {
		feet="Danzo Sune-Ate"
	}
	sets.Kiting.night = {
		feet="Hachiya Kyahan +1"
	}
	sets.weapons.Kannagi = { 
		main="Kannagi",
		sub="Shuhansadamune"
	}
	sets.weapons.Kikoku = { 
		main="Kikoku",
		sub="Kanaria"
	}
	sets.weapons.HeishiShorinken = { 
		main="Heishi Shorinken",
		sub="Shuhansadamune"
	}
	sets.weapons.Nagi = { 
		main="Nagi",
		sub="Shuhansadamune"
	}
	sets.weapons.Kanaria = { 
		main="Kanaria",
		sub="Shuhansadamune"
	}
----------------------
-- 	Enmity Gear set --
----------------------
	sets.Enmity = {
		ammo="Date Shuriken",
		head="Mochi. Hatsuburi +3",
		body="Mochi. Chainmail +3",
		hands="Mochizuki Tekko +3",
		legs="Mochi. Hakama +3",
		feet="Mochi. Kyahan +3",
		neck="Magoraga Beads",
		waist="Goading Belt",
		ear1="Friomisi Earring",
		ear2="Cryptic Earring",
		ring1="Vexer Ring",
		ring2="Vengeful Ring",
		back=Andar.TP,
	}
--------------------------------------
--		Pre-cast Gear sets			--
--------------------------------------
	--------------------------------------
	-- 	Pre-cast Job Ability Gear-sets 	--	
	--------------------------------------
		sets.precast.JA['Mijin Gakure'] = {} --legs="Mochizuki Hakama",--main="Nagi"
		sets.precast.JA['Futae'] = {
			hands="Hattori Tekko +1"
		}
		sets.precast.JA['Sange'] = {
			--legs="Mochizuki Chainmail +3"
		}
		sets.precast.JA['Provoke'] = sets.Enmity
		sets.precast.JA['Warcry'] = sets.Enmity
		sets.precast.JA['Innin'] = {
			head="Hattori zukin +1"
		}
		sets.precast.JA['Yonin'] = {
			head=""
		}
		sets.precast.Waltz = {
			ammo="Date Shuriken",
			head="Mummu Bonnet +2",
			neck="Unmoving Collar +1",
			ear1="Enchntr. Earring +1",
			ear2="Handler's Earring +1",
			body="",
			hands="",
			ring1="Defending Ring",
			ring2="Valseur's Ring",
			back="Moonlight Cape",
			waist="Chaac Belt",
			legs="Dashing Subligar",
			feet=gear.herculean_waltz_feet
		}
		sets.precast.Waltz['Healing Waltz'] = {
		
		}
		-- Set for acc on steps, since Yonin drops acc a fair bit
		sets.precast.Step = {
			ammo="Date Shuriken",
			head="Dampening Tam",
			neck="Moonbeam Nodowa",
			ear1="Mache Earring +1",
			ear2="Telos Earring",
			body="Mummu Jacket +2",
			hands="Adhemar Wrist. +1",
			ring1="Ramuh Ring +1",
			ring2="Ramuh Ring +1",
			back="Andartia's Mantle",
			waist="Olseni Belt",
			legs="Mummu Kecks +2",
			feet="Malignance Boots"
		}
		sets.precast.Flourish1 = {
			ammo="Date Shuriken",
			head="Dampening Tam",
			neck="Moonbeam Nodowa",
			ear1="Gwati Earring",
			ear2="Digni. Earring",
			body="Mekosu. Harness",
			hands="Adhemar Wrist. +1",
			ring1="Ramuh Ring +1",
			ring2="Ramuh Ring +1",
			back="Andartia's Mantle",
			waist="Olseni Belt",
			legs="Hattori Hakama +1",
			feet="Malignance Boots"
		}
	----------------------------------
	-- 	Pre-cast Magic Gear-sets 	--	
	----------------------------------
		sets.precast.FC = { 
			ammo="Date Shuriken",
			head=Herc.Head.FC,
			body="Mochi. Chainmail +3",
			hands="Mochizuki tekko +1",
			legs="Hiza. Hizayoroi +2",
			feet="Hattori Kyahan +1",
			neck="Magoraga Beads",
			waist="Gosha Sarashi",
			ear1="Loquac. Earring",
			ear2="Etiolation Earring",
			ring1="Kishar Ring",
			ring2="Defending Ring",
			back=Andar.TP,
		}
		sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {
			ammo="Date Shuriken",
			head=Herc.Head.FC,
			body="Mochi. Chainmail +1",
			hands="Mochizuki tekko +1",
			legs="Hiza. Hizayoroi +2",
			feet="Hattori Kyahan +1",
			neck="Magoraga Beads",
			waist="Gosha Sarashi",
			ear1="Loquac. Earring",
			ear2="Etiolation Earring",
			ring1="Kishar Ring",
			ring2="Defending Ring",
			back=Andar.TP,
		})
		sets.precast.FC.Shadows = set_combine(sets.precast.FC.Utsusemi, {
			ammo="Date Shuriken",
			ring1="Kishar Ring"
		})
------------------------------
-- 	Precast RA Gear-sets 	--	
------------------------------	
	sets.precast.RA = {
		ammo="Date Shuriken",
		head=Taeon.Head.SS,
        body="Mummu jacket +2",
		hands="Malignance gloves",
        legs="Adhemar kecks +1",
        feet="Adhemar gamashes +1",
		neck="Iskur gorget",
        waist="Yemaya belt",
	}
----------------------------------
-- 	Mid-cast Magic Gear-Sets 	--
----------------------------------
	sets.midcast.Utsusemi = { -- Capped gear haste and fill with fastcast.
		ammo="Date Shuriken",
		head="Atrophy Chapeau +1",
		body="Mochi. Chainmail +1",
		hands="Mochizuki tekko +1",
		legs="Aya. Cosciales +2",
		feet="Hattori Kyahan +1",
		neck="Magoraga Beads",
		waist="Witful Belt",
		ear1="Loquac. Earring",
		ear2="Etiolation Earring",
		ring1="Defending Ring",
		ring2="Weather. Ring",
		back="Solemnity Cape",
	}
    sets.midcast.FastRecast = {
        ammo="Date Shuriken",
		head="Atrophy Chapeau +1",
		body="Mochi. Chainmail +1",
		hands="Mochizuki tekko +1",
		legs="Aya. Cosciales +2",
		feet="Hattori Kyahan +1",
		neck="Magoraga Beads",
		waist="Witful Belt",
		ear1="Loquac. Earring",
		ear2="Etiolation Earring",
		ring1="Defending Ring",
		ring2="Weather. Ring",
		back="Solemnity Cape",
	}
    sets.midcast.ElementalNinjutsu = {
		ammo="Date Shuriken",
		head=Herc.Head.MAB,
		body="Samnuha coat",
		hands=Herc.Hands.MAB,
		legs=Herc.Legs.MAB,
		feet=Herc.Feet.MAB,
		neck="Ninja nodowa +1",
		waist="Eschan stone",
		ear1="Friomisi earring",
		ear2="Hecate's Earring",
		ring1="Ilabrat Ring",
		ring2="Regal Ring",
		back=Andar.TP,
	}
	sets.midcast.ElementalNinjutsu.Proc = sets.midcast.FastRecast
    sets.midcast.ElementalNinjutsu.Resistant = set_combine(sets.midcast.ElementalNinjutsu, {})
	sets.MagicBurst = {
		ring1="Mujin Band",
		ring2="Locus Ring"
	}
    sets.midcast.NinjutsuDebuff = {
		ammo="Date Shuriken",
		head="Date Hatsu. +3",
		body="Mochi. Chainmail +3",
		hands="Mochizuki Tekko +3",
		legs="Mochi. Hakama +3",
		feet="Mochi. Kyahan +3",
		neck="Deviant necklace",
		waist="Eschan Stone",
		ear1="Loquac. Earring",
		ear2="Etiolation Earring",
		ring1="Kishar Ring",
		ring2="Stikini Ring",
		back=Andar.TP,
	}
    sets.midcast.NinjutsuBuff = set_combine(sets.midcast.FastRecast, {
		back="Mujin Mantle"
	})
    sets.midcast.Utsusemi = set_combine(sets.midcast.NinjutsuBuff, {
		back="Andartia's Mantle",
		feet="Hattori Kyahan +1"
	})
    sets.midcast.RA = {
        head="Ryuo somen +1",
		neck="Iskur Gorget",
		ear1="Enervating Earring",
		ear2="Telos Earring",
        body="Mummu jacket +2",
		hands="Malignance Gloves",
		ring1="Chirich ring +!",
		ring2="Chirich ring +1",
        back="",
		waist="Yemaya belt",
		legs="Adhemar kecks +1",
		feet="Adhemar gamashes +1"
	}
    sets.midcast.RA.Acc = {
        head="Ryuo somen +1",
		neck="Iskur Gorget",
		ear1="Enervating Earring",
		ear2="Telos Earring",
        body="Mummu jacket +2",
		hands="Malignance Gloves",
		ring1="Chirich ring +!",
		ring2="Chirich ring +1",
        back="",
		waist="Yemaya belt",
		legs="Adhemar kecks +1",
		feet="Adhemar gamashes +1"
	}
--------------------------
-- 	engaged gear=sets 	--
--------------------------
	sets.engaged = { 
		ammo="Date Shuriken",
		head="Ken. jinpachi",
		body="Ken. samue +1",
		hands="Adhemar Wrist. +1",
		legs="Samnuha Tights",
		feet=Herc.Feet.WS, 
		neck="Moonbeam nodowa",
		waist="Kentarch belt +1",
		ear1="Brutal Earring",
		ear2="Telos Earring",
		ring1="Chirich ring +1",
		ring2="Epona's Ring",
		back=Andar.TP,
	}
--[[ (Delay1 + Delay2) × (1 - Dual Wield %) ÷ 2 = New Delay per Hand ]]
	sets.engaged.DW = set_combine(sets.engaged, { -- No Magic Haste 
		head="Ryuo somen +1",		--9
		body="Adhemar jacket +1",	--6
		ear1="Suppanomimi",			--5
		ear2="Eabani earring",		--4
		feet="Hiza. sune-ate +1",	--7
		waist="Reiki yotai",		--7
    })-- 39% DW Needed
	sets.engaged.DW.Haste_15 = set_combine(sets.engaged, { 
		head="Ryuo somen +1",		--9
		ear1="Suppanomimi",			--5
		ear2="Eabani earring",		--4
		feet="Hiza. sune-ate +1",	--7
		waist="Reiki yotai",		--7
	})-- +32 DW is needed to cap
	sets.engaged.DW.Haste_30 = set_combine(sets.engaged, { 
		head="Ryuo somen +1",		--9
		ear1="Suppanomimi",			--5
		waist="Reiki yotai",		--7
	})-- +21 DW is needed to cap
	sets.engaged.DW.Haste_43 = set_combine(sets.engaged,  { -- 45% Magic Haste 
		ear1="Cessance earring"
	}) -- 1% DW Needed
------------------------------
-- 	Weaponskill Gear-Sets 	--
------------------------------
	sets.precast.WS = { --main, sub, and range will be excluded
		ammo="Date Shuriken",
		head="Adhemar Bonnet +1",
		body="Ken. Samue +1",
		hands="Adhemar Wrist. +1",
		legs="Samnuha Tights",
		feet="Herculean Boots",
		neck="Ninja Nodowa +2",
		waist="Windbuffet Belt +1",
		ear1="Brutal Earring",
		ear2="Telos Earring",
		ring1="Mummu Ring",
		ring2="Epona's Ring",
		back=Andar.TP,
	}
	sets.precast.WS['Blade: Chi'] = set_combine(sets.precast.WS, { 
		ammo="Date Shuriken",
		head=Herc.Head.MAB,
		body="Samnuha coat",
		hands=Herc.Hands.MAB,
		legs=Herc.Legs.MAB,
		feet=Herc.Feet.MAB,
		neck="Ninja nodowa +1",
		waist="Eschan stone",
		ear1="Friomisi earring",
		ear2="Hecate's Earring",
		ring1="Ilabrat Ring",
		ring2="Regal Ring",
		back=Andar.TP,
	})
	sets.precast.WS['Blade: Yu'] = sets.precast.WS['Blade: Chi']
	sets.precast.WS['Blade: Ei'] = sets.precast.WS['Blade: Chi']
	sets.precast.WS['Blade: Teki'] = sets.precast.WS['Blade: Chi']
	sets.precast.WS['Blade: To'] = sets.precast.WS['Blade: Chi']
	sets.precast.WS['Blade: Jin'] = set_combine(sets.precast.WS, { 
		ammo="Date Shuriken",
		head="Ken. jinpachi",
		body="Adhemar Jacket +1",
		hands="Mummu wrists +2",
		legs="Hiza. hizayoroi +2",
		feet="Mummu gamashes +1",
		neck="Ninja nodowa +1",
		waist="Kentarch belt +1",
		ear1="Ishvara earring",
		ear2="Odr Earring",
		ring1="Ilabrat Ring",
		ring2="Regal Ring",
		back=Andar.TP,
	})
	sets.precast.WS['Blade: Hi'] = set_combine(sets.precast.WS, {
		ammo="Date Shuriken",
		head="Ken. jinpachi",
		body="Adhemar Jacket +1",
		hands="Mummu wrists +2",
		legs="Hiza. hizayoroi +2",
		feet="Mummu gamashes +1",
		neck="Ninja nodowa +1",
		waist="Kentarch belt +1",
		ear1="Ishvara earring",
		ear2="Odr Earring",
		ring1="Ilabrat Ring",
		ring2="Regal Ring",
		back=Andar.TP,
	})
	sets.precast.WS['Blade: Shun'] = set_combine(sets.precast.WS, {
		ammo="Date Shuriken",
		head="Ken. jinpachi",
		body="Adhemar Jacket +1",
		hands="Ryuo tekko +1",
		legs="Ken. hakama",
		feet="Ken. sune-ate",
		neck="Ninja nodowa +1",
		waist="Kentarch belt +1",
		ear1="Mache earring +1",
		ear2="Brutal Earring",
		ring1="Ilabrat Ring",
		ring2="Regal Ring",
		back=Andar.TP,
	})
	sets.precast.WS['Blade: Ten'] = set_combine(sets.precast.WS, {
		ammo="Date Shuriken",
		head="Date Hatsu. +3",
		body="Herculean Vest",
		hands="Ryuo Tekko +1",
		legs="Mochi. Hakama +3",
		feet="Herculean Boots",
		neck="Ninja Nodowa +1",
		waist="Windbuffet Belt +1",
		ear1="Moonshade Earring",
		ear2="Odr Earring",
		ring1="Ifrit Ring",
		ring2="Epona's Ring",
		back=Andar.TP,
	})
	sets.precast.WS['Blade: Metsu'] = set_combine(sets.precast.WS, {
		ammo="Date Shuriken",
		head="Adhemar bonnet +1",
		body="Adhemar Jacket +1",
		hands=Herc.Hands.StrWS,
		--legs="Hiza. hizayoroi +2",
		legs="Jokushu Haidate",
		feet=Herc.Feet.WS,
		neck="Ninja nodowa +1",
		waist="Kentarch belt +1",
		ear1="Ishvara earring",
		ear2="Odr Earring",
		ring1="Ilabrat Ring",
		ring2="Epona's Ring",
		back=Andar.TP,
	})
	sets.precast.WS['Aeolian Edge'] = {
		ammo="Date Shuriken",
        head="Dampening Tam",
		neck="Baetyl Pendant",
		ear1="Friomisi Earring",
		ear2="Crematio Earring",
        body="Adhemar Jacket +1",
		hands="Adhemar Wrist. +1",
		ring1="Shiva Ring +1",
		ring2="Metamor. Ring +1",
        back="Toro Cape",
		waist="Chaac Belt",
		legs="",
		feet="Malignance Boots"
	}
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