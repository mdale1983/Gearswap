include('augments.lua')
----------------------
--	Field/Town Idle	--
----------------------
	sets.idle = {
		main="Solstice",
		sub="Genmei shield",
		range="Dunna",
		head="Befouled crown",
		body="Hagondes coat +1",
		hands="Bagua Mitaines +1",
		legs="Assiduity pants +1",
		feet="Bagua sandals +2",
		neck="Loricate torque +1",
		waist="Gishdubar Sash",
		ear1="Ethereal Earring",
		ear2="Moonshade Earring", 
		ring1="Yacuruna ring",
		ring2="Yacuruna ring", 
		back=Nant.PDT
	}
	sets.idle.MagicEva = {
		main="Solstice",
		sub="Genmei Shield",
		range="Dunna",
		head="Azimuth Hood +1",
		body="Ea houppelande",
		hands="Geomancy Mitaines +2",
		legs=Telc.Legs.Pet,
		feet="Angantyr boots",
		neck="Bagua Charm +1",
		waist="Gishdubar Sash",
		ear1="Handler's Earring",
		ear2="Handler's earring +1",
		ring1="Yacuruna ring",
		ring2="Yacuruna Ring",
		back=Nant.Pet
	}
	sets.Kiting = {
		feet="Geomancy sandals +2"
	}
----------------------------------
--		Job Ability sets		--
----------------------------------
	sets.precast.JA.Bolster = {
		body="Bagua Tunic +3 +1"
	}
    sets.precast.JA['Life cycle'] = {
		body="Geomancy Tunic +2",
		back="Nantosuelta's cape"
	}
	sets.precast.JA['Curative Recantation'] = {
		hands="Bagua mitaines +1"
	}
	sets.precast.JA['Full Circle'] = {
		head="Azimuth Hood +1 +1"
	}
    sets.precast.JA['Mending Halation'] = {
		legs="Bagua pants"
	}
--------------------------------------
--		Casting Gear sets			--
--------------------------------------
		----------------------
		-- Luopan idle sets --
		----------------------
			sets.idle.Pet = {
				main="Solstice",
				sub="Genmei Shield",
				range="Dunna",
				head="Azimuth Hood +1",
				body="Mallquis saio +2",
				hands="Geomancy Mitaines +2",
				legs="Assiduity pants +1",
				feet="Bagua sandals +2",
				neck="Bagua Charm +1",
				waist="Isa Belt",
				ear1="Moonshade Earring",
				ear2="Handler's earring +1",
				ring1="Yacuruna ring",
				ring2="Yacuruna Ring",
				back=Nant.Pet
			}
			sets.idle.PDT = {}
			sets.idle.PDT.Pet = {
				main="Solstice",
				sub="Genmei Shield",
				range="Dunna",
				head="Azimuth Hood +1",
				body="Geomancy Tunic +2",
				hands="Geomancy Mitaines +2",
				legs=Telc.Legs.Pet,
				feet=Telc.Feet.Pet,
				neck="Bagua Charm +1",
				waist="Isa Belt",
				ear1="Handler's Earring",
				ear2="Handler's earring +1",
				ring1="Yacuruna ring",
				ring2="Yacuruna Ring",
				back="Lifestream cape"
			}
			sets.idle.Indi = set_combine(sets.idle)
			sets.idle.Pet.Indi = set_combine(sets.idle.Pet)
			sets.idle.PDT.Indi = set_combine(sets.idle.PDT)
			sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet)
	------------------
	-- Precast Sets --
	------------------
		sets.precast.FC = {
			main="Solstice",
			sub="Genmei shield",
			range="Dunna",
			head="Vanya hood",
			body="Shango robe",
			hands="Merlinic dastanas",
			legs="Geomancy pants +2",
			feet="Merlinic crackows",
			neck="Baetyl pendant",
			waist="Channeler's stone",
			ear2="Loquac. Earring",
			ring1="Prolix Ring",
			ring2="Lebeche Ring",
			back=Nant.FC
		}
		sets.precast.FC.Cure = set_combine(sets.precast.FC, {
			sub="Genmei shield",
			ear1="Mendicant's earring",
			body="Heka's kalasiris",
			back="Pahtli Cape"
		})
		sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
			waist="Siegel Sash"
		})
		sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {
			head="Mallquis chapeau +1",
			body="Mallquis saio +2",
			hands="Bagua mitaines +1",
			legs="Mallquis trews +1",
			neck="Stoicheion Medal",
			ear1="Barkaro. Earring",
			feet="Mallquis clogs +1"
		})
	--------------------------
	-- Geomancy + Indi Sets --
	--------------------------
	    sets.midcast.Geomancy = {
			main="Solstice",
			range="Dunna",
			head="Azimuth hood +!",
			body="Bagua tunic +3",
			hands="Geomancy mitaines +@",
			legs="Merlinic shalwar",
			feet="Umbani boots",
			neck="Bagua Charm +1",
			waist="Austerity Belt",
			ear1="Halasz Earring",
			ear2="Gifted Earring",
			ring1="Stikini ring",
			ring2="Stikini ring",
			back="Lifestream Cape"
		}
		sets.midcast.Geomancy.Indi = {
			main="Solstice",
			range="Dunna",
			head="Azimuth hood +!",
			body="Bagua tunic +3",
			hands="Geomancy mitaines +@",
			legs="Bagua pants +3",
			feet="Umbani boots",
			neck="Bagua Charm +1",
			waist="Austerity Belt",
			ear1="Halasz Earring",
			ear2="Gifted Earring",
			ring1="Stikini ring",
			ring2="Stikini ring",
			back="Lifestream Cape"
		}
	------------------
	-- Midcast Sets --
	------------------
		sets.midcast.FastRecast = {
			main="Malevolence",
			sub="Genmei Shield",
			ammo="Clarus Stone",
			head="Nahtirah Hat",
			body="Helios Jacket",
			hands="Psycloth Manillas",
			legs="Geomancy pants +2",
			feet="Regal pumps +1",
			neck="Orunmila's Torque",
			waist="Ninurta's Sash",
			ear1="Gifted Earring",
			ear2="Loquac. Earring",
			ring1="Prolix Ring",
			back="Swith Cape"
		}
		sets.midcast.Cure = {
			main="Tamaxchi", 
			sub="Genmei shield",
			range="Dunna",
			head="Vanya Hood",
			body="Amalric Doublet", 
			hands="Bokwus Gloves",
			legs="Lengo Pants",
			feet="Medium's Sabots", 
			neck="Orunmila's Torque",
			waist="Light Belt",
			ear1="Gifted Earring",
			ear2="Loquac. Earring",
			ring1="Sirona's Ring",
			ring2="Haoma's Ring",
			back="Thauma. Cape"
		}
		sets.midcast['Elemental Magic'] =  {
			main="Marin staff +1",
			sub="Niobid strap",
			ammo="Ghastly tathlum +1",
			head="Bagua galero +3",
			body="Bagua Tunic +3",
			hands="Amalric gages +1",
			legs="Bagua pants +3",
			feet="Bagua sandals +2",
			neck="Sanctity necklace",
			waist="Eschan stone",
			ear1="Barkarole Earring",
			ear2="Friomisi Earring",
			ring1="Shiva ring +1",
			ring2="Shiva ring",
			back=Nant.Macc
		}
		sets.midcast['Elemental Magic'].Burst = { 
			main="Marin staff +1",
			sub="Niobid strap",
			ammo="Ghastly tathlum +1",
			head="Ea hat",
			body="Ea houppelande",
			hands="Ea cuffs",
			legs="Ea slops",
			feet="Bagua sandals +2",
			neck="Mizu. Kubikazari",
			waist="Eschan stone",
			ear1="Barkarole Earring",
			ear2="Friomisi Earring",
			ring1="Locus ring",
			ring2="Mujin band",
			back=Nant.Macc
		}
		sets.midcast.LowTierNuke = set_combine(sets.midcast['Elemental Magic'],{ 
			hands="Mallquis cuffs +1",
			feet="Mallquis clogs +1"
		})
		sets.midcast['Stoneskin'] = set_combine(sets.precast.FC['Enhancing Magic'], {
			head="Umuthi hat",
			hands="Carapacho cuffs",
			legs="Doyen pants"
		})
		sets.midcast['Dark Magic'] = {
			main="Marin staff +1",
			sub="Niobid strap",
			range="Dunna",
			head="Jhakri coronal +1", 
			body="Psycloth vest",
			hands="Mallquis cuffs +1",
			legs="Merlinic shalwar",
			feet="Jhakri pigaches +1",
			neck="Erra pendant",
			waist="Fucho-no-obi",
			ear1="Hermetic Earring",
			ear2="Gwati Earring",
			ring1="Etana Ring",
			ring2="Evanescence Ring",
			back=Nant.Macc
		}
		sets.midcast.MndEnfeebles = {    
			main="Marin staff +1",
			sub="Niobid strap",
			ammo="Hydrocera",
			head="Bagua galero +3",
			body="Geomancy tunic +2",
			hands="Geomancy mitaines +2",
			legs="Geomancy pants +2",
			feet="Geomancy sandals +2",
			neck="Bagua charm +1",
			waist="Eschan stone",
			ear1="Barkarole Earring",
			ear2="Gwati Earring",
			ring1="Stikini ring",
			ring2="Stikini ring",
			back=Nant.FC
		}
		sets.midcast.IntEnfeebles = {    
			main="Marin staff +1",
			sub="Niobid strap",
			ammo="Hydrocera",
			head="Bagua galero +3",
			body="Geomancy tunic +2",
			hands="Geomancy mitaines +2",
			legs="Geomancy pants +2",
			feet="Geomancy sandals +2",
			neck="Bagua charm +1",
			waist="Eschan stone",
			ear1="Barkarole Earring",
			ear2="Gwati Earring",
			ring1="Stikini ring",
			ring2="Stikini ring",
			back=Nant.FC
		}
------------------
-- Engaged Sets --
------------------
	sets.engaged = {
		range="Nepote Bell",
        head="Zelus Tiara",
		neck="Peacock Charm",
		ear1="Bladeborn Earring",
		ear2="Steelflash Earring",
        body="Vanir Cotehardie",
		hands="Bokwus Gloves",
		ring1="Rajas Ring",
		ring2="Paguroidea Ring",
        back="Umbra Cape",
		waist="Goading Belt",
		legs="Hagondes Pants",
		feet="Hagondes Sabots"
	}
	----------------------
	-- Weaponskill Sets --
	----------------------
		sets.precast.WS = {
			ammo="Floestone",
			head="Jhakri Coronal +1",
			body="Jhakri robe",
			hands="Bagua Mitaines +1",
			legs="Telchine Braconi",
			feet="Jhakri Pigaches +1",
			neck="Light gorget",
			waist="Windbuffet Belt +1",
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring",
			ring1="Rajas Ring",
			ring2="Vulcan's Ring",
			back="Buquwik Cape"
		}
		sets.precast.WS['Flash Nova'] = {
			ammo="Floestone",
			head="Jhakri Coronal +1",
			body="Jhakri robe",
			hands="Bagua Mitaines +1",
			legs="Telchine Braconi",
			feet="Jhakri Pigaches +1",
			neck="Light gorget",
			waist="Windbuffet Belt +1",
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring",
			ring1="Rajas Ring",
			ring2="Vulcan's Ring",
			back="Buquwik Cape"
		}
		sets.precast.WS['Starlight'] = {
			ear2="Moonshade Earring"
		}
		sets.precast.WS['Moonlight'] = {
			ear2="Moonshade Earring"
		}
	---------------
	-- Misc Gear --
	---------------
		sets.CapacityMantle = {
			back="Mecisto. Mantle"
		}
	sets.MoveSpeed = { 
		feet="Geomancy sandals +2"
	}