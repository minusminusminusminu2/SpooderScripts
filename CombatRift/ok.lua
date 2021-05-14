getgenv().EquipEggs = function(ClientData, Logic, IsInTable, MarketplaceEvents, PetsModule, Evolutions)
	local PetsList = ClientData:Get("Pets")
	local Pets = PetsList.Owned()
	local Equipped = ClientData:Get("Pets").Equipped()
	local BestPets = {}
	local NewPets = {}

	for Index, Pet in next, Pets do
		local PetData = Pet()

		table.insert(NewPets, {
			Hash = Index,
			Coins = Logic.CalculatePetMultiplier(PetsModule[PetData.ID].Multipliers.Coins, 1, Evolutions[PetData.Evolution].Multiplier, PetData.Enchant)
		})
	end

	table.sort(NewPets, function(a, b)
		return a.Coins < b.Coins
	end)

	local Count = 0
	for Index = 1, PetsList.EquipAllowed do
		table.insert(BestPets, NewPets[#NewPets - Count].Hash)
		Count = Count + 1
	end

	for Index, Value in next, Equipped do
		if not IsInTable(BestPets, Index) then
			MarketplaceEvents.UnequipPet(Index)
		end
	end

	for Index, Value in next, BestPets do
		MarketplaceEvents.EquipPet(Value)
	end
end

getgenv().EvolveSwords = function(ClientData, SwordsInfo, MarketplaceEvents)
    local Swords = ClientData:Get("Swords")
    local SwordsList = Swords.Owned()

    for Index, SwordDataGetter in next, SwordsList do 
        local SwordData = SwordDataGetter()
		
        local Class = SwordsInfo[SwordData.ID].Class
        local Evolution = 2 
        
        if Class >= 5 and Class < 7 then 
            Evolution = 3 
        elseif Class >= 7 then 
            Evolution = 4 
        end

        if SwordData.Evolution < Evolution then 
            local SwordAmount = 0 

            for Index, SwordDataGetter2 in next, SwordsList do 
                local SwordData2 = SwordDataGetter2()

                if SwordData.Name == SwordData2.Name and SwordData.Evolution == SwordData2.Evolution then 
                    SwordAmount = SwordAmount + 1 
                end
            end

            local RequiredAmount = 3

			if SwordData.Evolution == 2 then 
				RequiredAmount = 5 
			elseif SwordData.Evolution == 3 then 
				RequiredAmount = 10 
			end

            if SwordAmount >= RequiredAmount then 
                MarketplaceEvents.EvolveSword(Index)

                wait()
                return EvolveSwords(ClientData, SwordsInfo, MarketplaceEvents)
            end
        end
    end
end 

getgenv().EvolveEggs = function(ClientData, PetsModule, MarketplaceEvents)
    local Pets = ClientData:Get("Pets")
    local PetsList = Pets.Owned()

    for Index, PetDataGetter in next, PetsList do 
        local PetData = PetDataGetter()

		local Class = PetsModule[PetData.ID].Class
        local Evolution = 2 
        
        if Class >= 5 and Class < 7 then 
            Evolution = 3 
        elseif Class >= 7 then 
            Evolution = 4 
        end

        if PetData.Evolution < Evolution then 
            local PetAmount = 0 

            for Index, PetDataGetter2 in next, PetsList do 
                local PetData2 = PetDataGetter2()

                if PetData.Name == PetData2.Name and PetData.Evolution == PetData2.Evolution then 
                    PetAmount = PetAmount + 1 
                end
            end

            local RequiredAmount = 3

			if PetData.Evolution == 2 then 
				RequiredAmount = 5 
			elseif PetData.Evolution == 3 then 
				RequiredAmount = 10 
			end

            if PetAmount >= RequiredAmount then 
                MarketplaceEvents.EvolvePet(Index)

                wait()
                return EvolveEggs(ClientData, PetsModule, MarketplaceEvents)
            end
        end
    end
end 

getgenv().PlaceVersion = 3733
getgenv().Souls = "\226\128\139PurchaseAllSouls"
getgenv().Class = "\226\128\139PurchaseClass"
getgenv().UseSword = "\226\128\139ActivateSword"
