local S
if minetest.get_modpath("intllib") then
    S = intllib.Getter()
else
    S = function(s,a,...)a={a,...}return s:gsub("@(%d+)",function(n)return a[tonumber(n)]end)end
end

advtrains.register_wagon("moretrains_draisine", {
	mesh="moretrains_draisine.b3d",
	textures = {"moretrains_vintage.png"},
	drives_on={default=true},
	max_speed=3,
	seats = {
		{
			name=S("Driver stand"),
			attach_offset={x=0, y=-2, z=13},
			view_offset={x=0, y=1.5, z=0},
			group="dstand",
		},
		{
			name="1",
			attach_offset={x=-4, y=-2, z=0},
			view_offset={x=0, y=-2, z=0},
			group="pass",
		},
		{
			name="2",
			attach_offset={x=4, y=-2, z=0},
			view_offset={x=0, y=-2, z=0},
			group="pass",
		},
		{
			name="3",
			attach_offset={x=-4, y=-2, z=-8},
			view_offset={x=0, y=-2, z=0},
			group="pass",
		},
		{
			name="4",
			attach_offset={x=4, y=-2, z=-8},
			view_offset={x=0, y=-2, z=0},
			group="pass",
		},
	},
	seat_groups = {
		dstand={
			name = "Driver Stand",
			access_to = {"pass"},
			require_doors_open=true,
			driving_ctrl_access=true,
		},
		pass={
			name = "Passenger area",
			access_to = {"dstand"},
			require_doors_open=true,
		},
	},
	assign_to_seat_group = {"dstand", "pass"},
	visual_size = {x=1, y=1},
	wagon_span=1.06,
	is_locomotive=true,
	collisionbox = {-0.8,-0.5,-0.7, 0.8,2,0.7},
	drops={"default:wood"},
}, S("Draisine"), "moretrains_draisine_inv.png")


advtrains.register_wagon("moretrains_minecart", {
	mesh="moretrains_minecart.b3d",
	textures = {"moretrains_vintage.png"},
	drives_on={default=true},
	max_speed=6,
	seats = {},
	visual_size = {x=1, y=1},
	wagon_span=1.06,
	collisionbox = {-0.8,-0.5,-0.7, 0.8,2,0.7},
	drops={"default:wood"},
	has_inventory = true,
	get_inventory_formspec = function(self, pname, invname)
		return "size[8,11]"..
			"list["..invname..";box;0,0;8,3;]"..
			"list[current_player;main;0,5;8,4;]"..
			"listring[]"
	end,
	inventory_list_sizes = {
		box=1*4,
	},
}, S("Minecart"), "moretrains_minecart_inv.png")

advtrains.register_wagon("moretrains_minecart_loaded", {
	mesh="moretrains_minecart_loaded.b3d",
	textures = {"moretrains_vintage.png"},
	drives_on={default=true},
	max_speed=6,
	seats = {},
	visual_size = {x=1, y=1},
	wagon_span=1.06,
	collisionbox = {-0.8,-0.5,-0.7, 0.8,2,0.7},
	drops={"default:wood"},
	has_inventory = true,
	get_inventory_formspec = function(self, pname, invname)
		return "size[8,11]"..
			"list["..invname..";box;0,0;8,3;]"..
			"list[current_player;main;0,5;8,4;]"..
			"listring[]"
	end,
	inventory_list_sizes = {
		box=1*4,
	},

}, S("Minecart (loaded)"), "moretrains_minecart_inv.png")


advtrains.register_wagon("moretrains_minecart_engine", {
	mesh="moretrains_minecart.b3d",
	textures = {"moretrains_vintage.png"},
	drives_on={default=true},
	max_speed=6,
	seats = {
		{
			name=S("Driver stand"),
			attach_offset={x=0, y=-2, z=13},
			view_offset={x=0, y=1.5, z=0},
			group="dstand",
		},
		{
			name="1",
			attach_offset={x=-4, y=-2, z=0},
			view_offset={x=0, y=-2, z=0},
			group="pass",
		},
		{
			name="2",
			attach_offset={x=4, y=-2, z=0},
			view_offset={x=0, y=-2, z=0},
			group="pass",
		},
		{
			name="3",
			attach_offset={x=-4, y=-2, z=-8},
			view_offset={x=0, y=-2, z=0},
			group="pass",
		},
		{
			name="4",
			attach_offset={x=4, y=-2, z=-8},
			view_offset={x=0, y=-2, z=0},
			group="pass",
		},
	},
	seat_groups = {
		dstand={
			name = "Driver Stand",
			access_to = {"pass"},
			require_doors_open=true,
			driving_ctrl_access=true,
		},
		pass={
			name = "Passenger area",
			access_to = {"dstand"},
			require_doors_open=true,
		},
	},
	assign_to_seat_group = {"dstand", "pass"},
	
	visual_size = {x=1, y=1},
	wagon_span=1.06,
	is_locomotive=true,
	collisionbox = {-0.8,-0.5,-0.7, 0.8,2,0.7},
	drops={"default:wood"},
	
}, S("Minecart with Engine"), "moretrains_minecart_inv.png")

--minetest.register_craft({
--	output = 'advtrains:moretrains_draisine',
--	recipe = {
--		{'default:steel_ingot', 'default:steel_ingot', 'default:steel_ingot'},
--		{'default:glass', 'dye:green', 'default:glass'},
--		{'advtrains:wheel', '', 'advtrains:wheel'},
--	},
--})

--minetest.register_craft({
--	output = 'advtrains:moretrains_minecart',
--	recipe = {
--		{'default:steel_ingot', 'default:steel_ingot', ''},
--		{'default:glass', 'dye:green', 'default:glass'},
--		{'advtrains:wheel', 'advtrains:wheel', 'advtrains:wheel'},
--	},
--})

