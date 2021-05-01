repeat wait() until game:IsLoaded()

getgenv().EquipEggs = function(ClientData, Logic, GetFromIndex, MarketplaceEvents, PetsModule, Evolutions) -- removed it from obfuscation since lag for people with a lot of pets
        local PetsList = ClientData:Get("Pets")
        local Pets = PetsList.Owned()
        local HighestMultiplier = 0
        local EquipAllowed = PetsList.EquipAllowed
        local BestPets = {}
        local EquippedPets
        
        for Index = 1, EquipAllowed do
            HighestMultiplier = 0
            EquippedPets = ClientData:Get("Pets").Equipped()
            
            for IndexPet, Pet in next, Pets do 
                local PetData = Pet()
                
                if not table.find(BestPets, IndexPet) then
                    local Multiplier = Logic.CalculatePetMultiplier(PetsModule[PetData.ID].Multipliers.Coins, 1, Evolutions[PetData.Evolution].Multiplier, PetData.Enchant)

                    if Multiplier > HighestMultiplier then 
                        BestPet = IndexPet
                        HighestMultiplier = Multiplier
                    end
                end
            end

            table.insert(BestPets, BestPet)
        end

        for Index = 1, #BestPets do 
            if GetFromIndex(EquippedPets, Index) then
                local FoundIndex, FoundValue = GetFromIndex(EquippedPets, Index) 

                if EquippedPets[FoundIndex] and not table.find(BestPets, FoundIndex) then
                    MarketplaceEvents.UnequipPet(FoundIndex)
                end
            end
        end

        EquippedPets = ClientData:Get("Pets").Equipped()

        for Index = 1, #BestPets do 
            local BestPet = BestPets[Index]

            if not EquippedPets[BestPet] then
                MarketplaceEvents.EquipPet(BestPet)
            end
        end
    end

return game:GetService("Players").LocalPlayer:Kick("Script Disabled")
