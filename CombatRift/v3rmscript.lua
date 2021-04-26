shared.Settings = {
    Autofarm = {
        PrioritizeStrongestMobs = true,
        RangeReduction = 0.5 -- Make this higher if you are not able to hit mobs (not recommended to go below 0.5, the higher you make this the more you will get hit)
    },

    Autosell = {
        Enabled = false, 

        KeepLocked = true,

        KeepRarities = {
            "Rare",
            "Legendary",
            "Exotic",
            "Mythic",
            "Celestial"
        },

        KeepItems = {
            "Corrupted Red-Diamond Sickle"
        }
    },

    AutoEquip = {
        Enabled = true
    },

    AutoHatch = {
        Enabled = false, 

        Sell = {
            Enabled = true,

            KeepLocked = true,

            KeepRarities = {
                "Rare",
                "Legendary",
                "Exotic",
                "Mythic",
                "Celestial"
            }
        },

        Equip = {
            Enabled = true
        },

        Evolve = {
            Enabled = true
        },
    },

    LagReduce = {
        BadGraphics = true,
        CleanScreen = true
    },

    Misc = {
        AutoUpgradeSoulStorage = false,
        AutoRank = false,
        AutoEvolveSwords = true
    }
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/Introvert1337/SpooderScripts/main/CombatRift/MainScript.lua"))()
