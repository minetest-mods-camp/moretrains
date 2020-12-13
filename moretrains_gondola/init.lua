local S
if minetest.get_modpath("intllib") then
    S = intllib.Getter()
else
    S = function(s,a,...)a={a,...}return s:gsub("@(%d+)",function(n)return a[tonumber(n)]end)end
end


advtrains.register_wagon("moretrains_wagon_gondola", {
	mesh="moretrains_wagon_gondola.obj",
	textures = {"moretrains_wagon_gondola.png"},
	seats = {},
	drives_on={default=true},
	max_speed=20,
	visual_size = {x=1, y=1},
	wagon_span=2.784,
	collisionbox = {-1.0,-0.5,-1.0, 1.0,2.5,1.0},
	drops={"default:steelblock"},
	has_inventory = true,
	get_inventory_formspec = function(self, pname, invname)
		return "size[8,11]"..
			"list["..invname..";box;0,0;8,3;]"..
			"list[current_player;main;0,5;8,4;]"..
			"listring[]"
	end,
	inventory_list_sizes = {
		box=8*3,
	},
}, S("Gondola wagon (empty)"), "moretrains_wagon_gondola_inv.png")





