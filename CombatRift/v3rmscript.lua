shared.Settings = {
    Autofarm = {
        PrioritizeStrongestMobs = true
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
        AutoUpgradeSoulStorage = false
    }
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/Introvert1337/SpooderScripts/main/CombatRift/MainScript.lua"))()
