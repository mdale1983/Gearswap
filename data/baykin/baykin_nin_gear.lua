--include('augments.lua')
----------------------
--  Field/Town Idle --
----------------------
	sets.idle = { 
		ammo="Staunch Tathlum +1",
        head="Malignance Chapeau",
		neck="Loricate Torque +1",
		ear1="Etiolation Earring",
		ear2="Sanare Earring",
        body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Defending Ring",
		ring2="Dark Ring",
        back="Moonlight Cape",
		waist="Flume Belt +1",
		legs="Malignance Tights",
		feet="Malignance Boots"
	}
	sets.idle.MagicEva = {
		ammo="Yamarang",
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
	sets.weapons.Kannagi = { 
		main="Kannagi",
		sub="Shuhansadamune"
	}
	sets.weapons.Kikoku = { 
		main="Kikoku",
		sub="Shuhansadamune"
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
		ammo="Staunch Tathlum +1",
		head={ name="Mochi. Hatsuburi +3", augments={'Enhances "Yonin" and "Innin" effect',}},
		body={ name="Mochi. Chainmail +3", augments={'Enhances "Sange" effect',}},
		hands={ name="Mochizuki Tekko +3", augments={'Enh. "Ninja Tool Expertise" effect',}},
		legs={ name="Mochi. Hakama +3", augments={'Enhances "Mijin Gakure" effect',}},
		feet={ name="Mochi. Kyahan +3", augments={'Enh. Ninj. Mag. Acc/Cast Time Red.',}},
		neck="Magoraga Beads",
		waist="Goading Belt",
		ear1="Friomisi Earring",
		ear2="Cryptic Earring",
		ring1="Vexer Ring",
		ring2="Vengeful Ring",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
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
			head="Rawhide mask"
		}
		sets.precast.JA['Yonin'] = {
			head="Rawhide mask"
		}
		sets.precast.Waltz = {
			ammo="Yamarang",
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
			ammo="Togakushi Shuriken",
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
			ammo="Togakushi Shuriken",
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
			ammo="Staunch Tathlum +1",
			head={ name="Herculean Helm", augments={'Attack+26','Weapon skill damage +3%','AGI+15',}},
			body={ name="Mochi. Chainmail +3", augments={'Enhances "Sange" effect',}},
			hands={ name="Mochizuki Tekko +3", augments={'Enh. "Ninja Tool Expertise" effect',}},
			legs="Hiza. Hizayoroi +2",
			feet="Hattori Kyahan +1",
			neck="Magoraga Beads",
			waist="Gosha Sarashi",
			ear1="Loquac. Earring",
			ear2="Etiolation Earring",
			ring1="Kishar Ring",
			ring2="Defending Ring",
			back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
		}
		sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {
			ammo="Staunch Tathlum +1",
			head={ name="Herculean Helm", augments={'Attack+26','Weapon skill damage +3%','AGI+15',}},
			body={ name="Mochi. Chainmail +3", augments={'Enhances "Sange" effect',}},
			hands={ name="Mochizuki Tekko +3", augments={'Enh. "Ninja Tool Expertise" effect',}},
			legs="Hiza. Hizayoroi +2",
			feet="Hattori Kyahan +1",
			neck="Magoraga Beads",
			waist="Gosha Sarashi",
			ear1="Loquac. Earring",
			ear2="Etiolation Earring",
			ring1="Kishar Ring",
			ring2="Defending Ring",
			back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
		})
		sets.precast.FC.Shadows = set_combine(sets.precast.FC.Utsusemi, {
			ammo="Staunch Tathlum +1",
			ring1="Kishar Ring"
		})
------------------------------
-- 	Precast RA Gear-sets 	--	
------------------------------	
	sets.precast.RA = {
	
	}
----------------------------------
-- 	Mid-cast Magic Gear-Sets 	--
----------------------------------
	sets.midcast.Utsusemi = { -- Capped gear haste and fill with fastcast.
		ammo="Staunch Tathlum",
		head="Atrophy Chapeau +1",
		body="Viti. Tabard +1", 
		hands="",
		legs="Aya. Cosciales +2",
		feet="",
		neck="Magoraga Beads",
		waist="Witful Belt",
		ear1="Loquac. Earring",
		ear2="Etiolation Earring",
		ring1="Defending Ring",
		ring2="Weather. Ring",
		back="Solemnity Cape",
	}
    sets.midcast.FastRecast = {
        head="",
		neck="Voltsurge Torque",
		ear1="Enchntr. Earring +1",
		ear2="Loquac. Earring",
        body="Dread Jupon",
		hands="Mochizuki Tekko +1",
		ring1="Defending Ring",
		ring2="Kishar Ring",
        legs="Rawhide Trousers",
		feet="Malignance Boots"
	}
    sets.midcast.ElementalNinjutsu = {
		ammo="Pemphredo Tathlum",
		head={ name="Mochi. Hatsuburi +3", augments={'Enhances "Yonin" and "Innin" effect',}},
		body={ name="Samnuha Coat", augments={'Mag. Acc.+11','"Mag.Atk.Bns."+10','"Fast Cast"+3',}},
		hands="Hattori Tekko +1",
		legs={ name="Herculean Trousers", augments={'Weapon Skill Acc.+3','DEX+11','Accuracy+19 Attack+19','Mag. Acc.+4 "Mag.Atk.Bns."+4',}},
		feet={ name="Mochi. Kyahan +3", augments={'Enh. Ninj. Mag. Acc/Cast Time Red.',}},
		neck="Deviant Necklace",
		waist="Eschan Stone",
		ear1="Friomisi Earring",
		ear2="Hecate's Earring",
		ring1="Kishar Ring",
		ring2="Stikini Ring",
		back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','"Mag.Atk.Bns."+10',}},
	}
	sets.midcast.ElementalNinjutsu.Proc = sets.midcast.FastRecast
    sets.midcast.ElementalNinjutsu.Resistant = set_combine(sets.midcast.ElementalNinjutsu, {})
	sets.MagicBurst = {
		ring1="Mujin Band",
		ring2="Locus Ring"
	}
    sets.midcast.NinjutsuDebuff = {
		ammo="Pemphredo Tathlum",
		head="Hachiya Hatsu. +3",
		body={ name="Mochi. Chainmail +3", augments={'Enhances "Sange" effect',}},
		hands={ name="Mochizuki Tekko +3", augments={'Enh. "Ninja Tool Expertise" effect',}},
		legs={ name="Mochi. Hakama +3", augments={'Enhances "Mijin Gakure" effect',}},
		feet={ name="Mochi. Kyahan +3", augments={'Enh. Ninj. Mag. Acc/Cast Time Red.',}},
		neck="Deviant Necklace",
		waist="Eschan Stone",
		ear1="Loquac. Earring",
		ear2="Etiolation Earring",
		ring1="Kishar Ring",
		ring2="Stikini Ring",
		back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','"Mag.Atk.Bns."+10',}},
	}
    sets.midcast.NinjutsuBuff = set_combine(sets.midcast.FastRecast, {
		back="Mujin Mantle"
	})
    sets.midcast.Utsusemi = set_combine(sets.midcast.NinjutsuBuff, {
		back="Andartia's Mantle",
		feet="Hattori Kyahan +1"
	})
    sets.midcast.RA = {
        head="Malignance Chapeau",
		neck="Iskur Gorget",
		ear1="Enervating Earring",
		ear2="Telos Earring",
        body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Apate Ring",
		ring2="Regal Ring",
        back="",
		waist="Chaac Belt",
		legs="Malignance Tights",
		feet="Malignance Boots"
	}
    sets.midcast.RA.Acc = {
        head="Malignance Chapeau",
		neck="Iskur Gorget",
		ear1="Enervating Earring",
		ear2="Telos Earring",
        body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Apate Ring",
		ring2="Regal Ring",
        back="",
		waist="Chaac Belt",
		legs="Malignance Tights",
		feet="Malignance Boots"
	}
--------------------------
-- 	engaged gear=sets 	--
--------------------------
	sets.engaged = { 
		ammo="Suppa Shuriken",
		head="Adhemar Bonnet +1",
		body="Ken. Samue +1",
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet={ name="Herculean Boots", augments={'Crit. hit damage +1%','Pet: CHR+1','Quadruple Attack +2','Accuracy+11 Attack+11',}},
		neck="Ninja Nodowa +2",
		waist="Windbuffet Belt +1",
		ear1="Brutal Earring",
		ear2="Telos Earring",
		ring1="Mummu Ring",
		ring2="Epona's Ring",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
	}
--[[ (Delay1 + Delay2) ? (1 - Dual Wield %) ? 2 = New Delay per Hand ]]
	sets.engaged.DW = set_combine(sets.engaged, { -- No Magic Haste 
		body="Adhemar jacket +1",	--6
		ear1="Suppanomimi",			--5
		ear2="Eabani earring",		--4
		feet="Taeon boots",			--4
		waist="Reiki yotai",		--7
    })-- 39% DW Needed
	sets.engaged.DW.Haste_30 = set_combine(sets.engaged, { -- This is the same as your standard TP set
		body="Adhemar jacket +1",	--6
		ear1="Suppanomimi",			--5
		ear2="Eabani earring",		--4
		feet="Taeon boots",			--4
		waist="Reiki yotai",		--7
	})-- +32 DW is needed to cap
	sets.engaged.DW.Haste_43 = set_combine(sets.engaged,  { -- 45% Magic Haste 
		ear1="Cessance earring"
	}) -- 1% DW Needed
------------------------------
-- 	Weaponskill Gear-Sets 	--
------------------------------
	sets.precast.WS = { --main, sub, and range will be excluded
		ammo="Suppa Shuriken",
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body="Ken. Samue +1",
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet={ name="Herculean Boots", augments={'Crit. hit damage +1%','Pet: CHR+1','Quadruple Attack +2','Accuracy+11 Attack+11',}},
		neck="Ninja Nodowa +2",
		waist="Windbuffet Belt +1",
		ear1="Brutal Earring",
		ear2="Telos Earring",
		ring1="Mummu Ring",
		ring2="Epona's Ring",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
	}
	sets.precast.WS['Blade: Jin'] = set_combine(sets.precast.WS, { 
		ammo="Yetshila +1",
		head="Adhemar Bonnet +1",
		ammo="Yetshila +1",
		head="Adhemar Bonnet +1",
		body="Abnoba Kaftan",
		hands="Ryuo Tekko",
		ring1="Begrudging Ring",
		waist="Grunfeld Rope",
		legs="Mummu Kecks +2",
		feet="Mummu Gamash. +2"
	})
	sets.precast.WS['Blade: Hi'] = set_combine(sets.precast.WS, {
		ammo="Focal Orb",
		head="Hachiya Hatsu. +3",
		body="Ken. Samue +1",
		hands="Mummu Wrists +2",
		legs={ name="Mochi. Hakama +3", augments={'Enhances "Mijin Gakure" effect',}},
		feet={ name="Herculean Boots", augments={'Crit. hit damage +1%','Pet: CHR+1','Quadruple Attack +2','Accuracy+11 Attack+11',}},
		neck="Ninja Nodowa +2",
		waist="Windbuffet Belt +1",
		ear1={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		ear2="Odr Earring",
		ring1="Mummu Ring",
		ring2="Epona's Ring",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
	})
	sets.precast.WS['Blade: Shun'] = set_combine(sets.precast.WS, {
		ammo="Focal Orb",
		head="Hachiya Hatsu. +3",
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands={ name="Herculean Gloves", augments={'Accuracy+22','Weapon skill damage +2%','DEX+14','Attack+13',}},
		legs={ name="Mochi. Hakama +3", augments={'Enhances "Mijin Gakure" effect',}},
		feet={ name="Herculean Boots", augments={'Accuracy+30','Weapon skill damage +2%','DEX+5',}},
		neck="Ninja Nodowa +2",
		waist="Windbuffet Belt +1",
		ear1={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		ear2="Odr Earring",
		ring1="Rajas Ring",
		ring2="Epona's Ring",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
	})
	sets.precast.WS['Blade: Ten'] = set_combine(sets.precast.WS, {
		ammo="Focal Orb",
		head="Hachiya Hatsu. +3",
		body={ name="Herculean Vest", augments={'Weapon skill damage +4%','STR+13','Accuracy+12',}},
		hands={ name="Ryuo Tekko +1", augments={'STR+12','DEX+12','Accuracy+20',}},
		legs={ name="Mochi. Hakama +3", augments={'Enhances "Mijin Gakure" effect',}},
		feet={ name="Herculean Boots", augments={'Accuracy+19','Weapon skill damage +4%','STR+7','Attack+5',}},
		neck="Ninja Nodowa +2",
		waist="Windbuffet Belt +1",
		ear1={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		ear2="Odr Earring",
		ring1="Ifrit Ring",
		ring2="Epona's Ring",
		back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	})
	sets.precast.WS['Blade: Metsu'] = set_combine(sets.precast.WS, {
		ammo="Focal Orb",
		head="Hachiya Hatsu. +3",
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands={ name="Herculean Gloves", augments={'Accuracy+22','Weapon skill damage +2%','DEX+14','Attack+13',}},
		legs={ name="Mochi. Hakama +3", augments={'Enhances "Mijin Gakure" effect',}},
		feet={ name="Herculean Boots", augments={'Accuracy+30','Weapon skill damage +2%','DEX+5',}},
		neck="Ninja Nodowa +2",
		waist="Windbuffet Belt +1",
		ear1={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		ear2="Odr Earring",
		ring1="Rajas Ring",
		ring2="Epona's Ring",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
	})
	sets.precast.WS['Aeolian Edge'] = {
		ammo="Dosis Tathlum",
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