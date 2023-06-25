-- Setup
local PlantNurseryAndGardenCenter = {};

-- Initialize
PlantNurseryAndGardenCenter.Init = function()
	-- Create dictionary to store plants
	PlantNurseryAndGardenCenter.plants = {};

	-- Generate a unique ID for each plant
	PlantNurseryAndGardenCenter.nextPlantId = 0;
end

-- Add a new plant
PlantNurseryAndGardenCenter.addPlant = function(name, description)
	-- Generate new ID
	local id = PlantNurseryAndGardenCenter.nextPlantId;
	PlantNurseryAndGardenCenter.nextPlantId = PlantNurseryAndGardenCenter.nextPlantId + 1;

	-- Add to the list
	PlantNurseryAndGardenCenter.plants[id] = {
		name = name,
		description = description
	};

	-- Return the ID to use
	return id;
end

-- Get a plant
PlantNurseryAndGardenCenter.getPlant = function(id)
	return PlantNurseryAndGardenCenter.plants[id];
end

-- Update a plant
PlantNurseryAndGardenCenter.updatePlant = function(id, updates)
	local plant = PlantNurseryAndGardenCenter.getPlant(id);

	if plant then
		-- Update the plant
		for k, v in pairs(updates) do
			plant[k] = v;
		end
	end
end

-- Delete a plant
PlantNurseryAndGardenCenter.deletePlant = function(id)
	PlantNurseryAndGardenCenter.plants[id] = nil;
end

-- Filter plants
PlantNurseryAndGardenCenter.filterPlants = function(filter)
	local filteredPlants = {};

	for _, plant in pairs(PlantNurseryAndGardenCenter.plants) do
		local match = true;
		for key, value in pairs(filter) do
			if plant[key] ~= value then
				match = false;
				break;
			end
		end

		if match then
			table.insert(filteredPlants, plant);
		end
	end

	return filteredPlants;
end

-- Get all plants
PlantNurseryAndGardenCenter.getAllPlants = function()
	local allPlants = {};

	for _, plant in pairs(PlantNurseryAndGardenCenter.plants) do
		table.insert(allPlants, plant);
	end

	return allPlants;
end

-- Initialize if needed
if not PlantNurseryAndGardenCenter.plants then
	PlantNurseryAndGardenCenter.Init();
end

return PlantNurseryAndGardenCenter;