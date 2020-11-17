include('augments.lua')
----------------------
--	Field/Town Idle	--
----------------------
	sets.idle = {
		main="Bolelabunga",
		sub="Genbu's Shield",
		range="Dunna",
		head="Befouled crown",
		body="Geomancy tunic +1",
		hands="Bagua Mitaines +1",
		legs="Assiduity pants +1",
		feet="Geomancy sandals +2",
		neck="Loricate torque +1",
		waist="Gishdubar Sash",
		ear1="Flashward Earring",
		ear2="Eitolation earring", 
		ring1="Gelatinous ring",
		ring2="Renaye ring", 
		back="Solemnity Cape"
	}
----------------------------------
--		Job Ability sets		--
----------------------------------
	sets.precast.JA.Bolster = {
		body="Bagua Tunic +1"
	}
    sets.precast.JA['Life cycle'] = {
		body="Geomancy Tunic",
		back="Nantosuelta's cape"
	}
	sets.precast.JA['Curative Recantation'] = {
		hands="Bagua mitaines +1"
	}
	sets.precast.JA['Full Circle'] = {
		head="Azimuth hood +1"
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
				sub="Genbu's Shield",
				range="Dunna",
				head="Azimuth hood",
				body="Geomancy tunic +1",
				hands="Bagua Mitaines +1",
				legs=Telc.Legs.Pet,
				feet=Telc.Feet.Pet,
				neck="Bagua charm +1",
				waist="Isa belt",
				ear1="Ethereal Earring",
				ear2="Eitolation earring",
				ring1="Vocane ring",
				ring2="Gelatinous Ring",
				back=Nant.Pet
			}
			sets.idle.PDT = {}
			sets.idle.PDT.Pet = {
				main="Terra's staff",
				sub="Mensch strap",
				range="Dunna",
				head="Kaabnax hat",
				neck="Twilight torque",
				ear1="Ethereal earring",
				ear2="",
				body="Jhakri robe",
				hands="Geomancy mitaines +1",
				ring1="Vocane ring",
				ring2="Dark Ring",
				back="Lifestream cape",
				waist="Isa belt",
				legs="Psycloth lappas",
				feet="Azimuth gaiters"
			}
			sets.idle.Indi = set_combine(sets.idle, {legs=""})
			sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {legs=""})
			sets.idle.PDT.Indi = set_combine(sets.idle.PDT, {legs=""})
			sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet, {legs=""})
	------------------
	-- Precast Sets --
	------------------
		sets.precast.FC = {
			main="Solstice",
			sub="Sors Shield",
			ammo="Dunna",
			head="Vanya hood",
			body="Shango Robe",
			hands="Helios gloves",
			legs="Geomancy pants +1",
			feet="Merlinic crackows",
			neck="Orunmila's Torque",
			waist="Channeler's stone",
			ear2="Loquac. Earring",
			ring1="Kishar Ring",
			ring2="Lebeche Ring",
			back=Nant.FC
		}
		sets.precast.FC.Cure = set_combine(sets.precast.FC, {
			sub="Sors Shield",
			ear1="Mendicant's earring",
			body="Heka's kalasiris",
			back="Pahtli Cape"
		})
		sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
			waist="Siegel Sash"
		})
		sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {
			head="Haruspex hat",
			hands="Carapacho cuffs",
			legs="Doyen pants"
		})
		sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {
			hands="Bagua mitaines +1",
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
			head="Azimuth Hood",
			body="Bagua Tunic +1",
			hands="Geo. Mitaines +2",
			legs="Bagua pants +1",
			feet="Azimuth gaiters +1",
			neck="Incanter's Torque",
			waist="Austerity Belt",
			ear1="Halasz Earring",
			ear2="Gifted Earring",
			ring1="Dark ring",
			ring2="Renaye ring",
			back="Lifestream Cape"
		}
		sets.midcast.Geomancy.Indi = {
			main="Solstice",
			range="Dunna",
			head="Azimuth Hood",
			body="Bagua Tunic +1",
			hands="Geo. Mitaines +2",
			legs="Bagua pants +1",
			feet="Azimuth gaiters +1",
			neck="Incanter's Torque",
			waist="Austerity Belt",
			ear1="Halasz Earring",
			ear2="Gifted Earring",
			ring1="Dark ring",
			ring2="Renaye ring",
			back="Lifestream Cape"
		}
	------------------
	-- Midcast Sets --
	------------------
		sets.midcast.FastRecast = {
			main="Malevolence",
			sub="Genbu's Shield",
			ammo="Clarus Stone",
			head="Nahtirah Hat",
			body="Helios Jacket",
			hands="Psycloth Manillas",
			legs="Geo. Pants +1",
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
			sub="Sors Shield",
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
			sub="Enki strap",
			ammo="Witchstone",
			head="Jhakri Coronal +1",
			body="Jhakri robe",
			hands="Amalric gages",
			legs="Merlinic shalwar",
			feet="Merlinic crackows",
			neck="Mizukage-no-Kubikazari",
			waist="Yamabuki-no-obi",
			ear1="Barkaro. Earring",
			ear2="Friomisi Earring",
			ring1="Mujin band",
			ring2="Strendu Ring",
			back="Nantosuelta's cape"
		}
		sets.midcast['Dark Magic'] = {
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
			back="Nantosuelta's Cape", 
		}
		sets.midcast.MndEnfeebles = {    
			main="Gada",
			sub="Genbu's Shield",
			range="Dunna",
			head="Jhakri coronal +1", 
			body="Vanya Robe",
			hands="Mallquis cuffs +1",
			legs="Merlinic shalwar",
			feet="Jhakri pigaches +1",
			neck="Erra pendant",
			waist="Luminary Sash",
			ear1="Hermetic Earring",
			ear2="Gwati Earring",
			ring1="Etana Ring",
			ring2="Strendu Ring",
			back="Nantosuelta's Cape", 
		}
		sets.midcast.IntEnfeebles = {    
			main="Gada",
			sub="Genbu's Shield",
			range="Dunna",
			head="Jhakri coronal +1", 
			body="Vanya Robe",
			hands="Mallquis cuffs +1",
			legs="Merlinic shalwar",
			feet="Jhakri pigaches +1",
			neck="Erra pendant",
			waist="Luminary Sash",
			ear1="Hermetic Earring",
			ear2="Gwati Earring",
			ring1="Etana Ring",
			ring2="Strendu Ring",
			back="Nantosuelta's Cape", 
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
		sets.Night = set_combine(sets.idle, {
			hands="Serpentes cuffs"
		})
		
		sets.Day = set_combine(sets.idle, {
			feet="Serpentes sabots"
		})