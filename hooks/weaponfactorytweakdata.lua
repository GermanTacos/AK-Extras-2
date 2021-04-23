--=========================--
--       AK EXTRAS 2       --
-- GERMANTACOS, KILLERWOLF --
--=========================--

--=========================--
--        FUNCTIONS        --
--=========================--

function WeaponFactoryTweakData:akpack2_setup_variants( part, part_table, model, variant_table )
	for id, part_id in pairs(part_table) do
		if self.parts[part_id] then
			self.parts[part_id].texture_variants = self.parts[part_id].texture_variants or {}
			for id, var_id in pairs(variant_table) do
				self.parts[part_id].texture_variants[var_id] = {
					name_id = "bm_w_paint_" .. part .. "_" .. model .. "_" .. (var_id),
					desc_id = "bm_w_paint_" .. part .. "_" .. model .. "_" .. (var_id) .. "_desc",
					texture_bundle_folder = "mods",
					material_config = "units/mods/weapons/wpn_fps_ass_ak_all_" .. model .. "_pts/wpn_fps_ass_ak_all_" .. part .. "_" .. model .. "_" .. (var_id)
				}
			end
		end
	end
end

function WeaponFactoryTweakData:akpack2_setup_overrides( part_type, part_table, base_part, weapon_id )
	for id, part_id in pairs(self[weapon_id].uses_parts) do
		if self.parts[part_id].type == part_type then
			if self.parts[part_id].override and self.parts[part_id].override[base_part] then
				for _, extra_part_id in pairs(part_table) do
					if self.parts[extra_part_id] then
						self.parts[part_id].override[extra_part_id] = deep_clone(self.parts[part_id].override[base_part])					
					end
				end
			end
		end
	end
end

function WeaponFactoryTweakData:akpack2_setup_argument( argument, argument_value, method, part_type, part_table, weapon_or_table )
	if method == "forbids_uses_parts" then
		for id, part_id in pairs(self[weapon_or_table].uses_parts) do
			if self.parts[part_id].type == part_type then
				self.parts[part_id][argument] = self.parts[part_id][argument] or false
				if self.parts[part_id][argument] == argument_value then
					self.parts[part_id].forbids = self.parts[part_id].forbids or {}
					for _, extra_part_id in pairs(part_table) do
						if self.parts[extra_part_id] and not self.parts[part_id].forbids[extra_part_id] then
							table.insert(self.parts[part_id].forbids, extra_part_id)
						end
					end
				end
			end
		end
	elseif method == "forbids_table" then
		for id, part_id in pairs(weapon_or_table) do
			if self.parts[part_id] and self.parts[part_id].type == part_type then
				self.parts[part_id][argument] = self.parts[part_id][argument] or false
				if self.parts[part_id][argument] == argument_value then
					self.parts[part_id].forbids = self.parts[part_id].forbids or {}
					for _, extra_part_id in pairs(part_table) do
						if self.parts[extra_part_id] and not self.parts[part_id].forbids[extra_part_id] then
							table.insert(self.parts[part_id].forbids, extra_part_id)
						end
					end
				end
			end
		end
	end
end

--- Forbid Setup --- wtf is that bs above
function WeaponFactoryTweakData:akpack2_setup_forbid( mod_one, mod_two )
	if self.parts[mod_one] and self.parts[mod_two] then
		self.parts[mod_one].forbids = self.parts[mod_one].forbids or {}
		table.insert(self.parts[mod_one].forbids, mod_two)
		self.parts[mod_two].forbids = self.parts[mod_two].forbids or {}
		table.insert(self.parts[mod_two].forbids, mod_one)
	end
end

Hooks:PostHook( WeaponFactoryTweakData, "init", "AKExtras2Init", function(self)

--=========================--
--          ARRAYS         --
--=========================--

--==========PARTS==========--

ak_parts_barrel_ext_univ = {
	"wpn_fps_ass_ak_all_md_dtk1",
	"wpn_fps_ass_ak_all_md_fhmb",
	"wpn_fps_ass_ak_all_md_jet",
	"wpn_fps_ass_ak_all_md_alpha",
	"wpn_fps_ass_ak_all_md_ivan"
}
ak_parts_barrel_ext_762x39 = {
	"wpn_fps_ass_ak_all_md_dyna",
	"wpn_fps_ass_ak_all_md_venom"
}

ak_parts_vg_univ = {
}

ak_parts_sights_univ = {
	"wpn_fps_upg_o_specter",
	"wpn_fps_upg_o_aimpoint",
	"wpn_fps_upg_o_aimpoint_2",
	"wpn_fps_upg_o_docter",
	"wpn_fps_upg_o_eotech",
	"wpn_fps_upg_o_t1micro",
	"wpn_fps_upg_o_cmore",
	"wpn_fps_upg_o_acog",
	"wpn_fps_upg_o_cs",
	"wpn_fps_upg_o_eotech_xps",
	"wpn_fps_upg_o_reflex",
	"wpn_fps_upg_o_rx01",
	"wpn_fps_upg_o_rx30",
	"wpn_fps_upg_o_spot"
}

ak_parts_pg_bake = {
	"wpn_fps_ass_ak_stamp_762_pg_akm",
	"wpn_fps_ass_ak_stamp_545_pg_ak74",
	"wpn_fps_ass_ak_stamp_366_pg_vpo209_bake",
	"wpn_fps_ass_ak_krink_545_pg_aks74u",
	"wpn_fps_ass_ak_krink_762_pg_akmsu",
	"wpn_fps_ass_ak_stamp_gold_pg_akms"
}

ak_parts_hg_all = {
	"wpn_fps_ass_ak_all_hg_trax",
	"wpn_fps_ass_ak_all_hg_cmrd",
	"wpn_fps_ass_ak_all_hg_ufm",
	"wpn_fps_ass_ak_all_hg_heat"
}

ak_parts_uhg_all = {
	"wpn_fps_ass_ak_stamp_762_uhg_akm",
	"wpn_fps_ass_ak_stamp_366_uhg_vpo209",
	"wpn_fps_ass_ak_stamp_gold_uhg_akm",
	"wpn_fps_ass_ak_stamp_545_uhg_ak74",
	"wpn_fps_ass_ak_stamp_762_uhg_ak103",
	"wpn_fps_ass_ak_stamp_545_uhg_ak74m",
	"wpn_fps_ass_ak_stamp_556_uhg_ak101",
	"wpn_fps_ass_ak_all_uhg_b19",
	"wpn_fps_ass_ak_all_uhg_swiss",
	"wpn_fps_ass_ak_all_uhg_goliaf"
}

ak_parts_uhg_all_attach = {
	"wpn_fps_ass_ak_all_uhg_b19",
	"wpn_fps_ass_ak_all_uhg_swiss",
	"wpn_fps_ass_ak_all_uhg_goliaf"
}

ak_parts_lhg_all = {
	"wpn_fps_ass_ak_stamp_762_lhg_akm",
	"wpn_fps_ass_ak_stamp_366_lhg_vpo209",
	"wpn_fps_ass_ak_stamp_gold_lhg_akms",
	"wpn_fps_ass_ak_stamp_545_lhg_ak74",
	"wpn_fps_ass_ak_stamp_762_lhg_ak103",
	"wpn_fps_ass_ak_stamp_545_lhg_ak74m",
	"wpn_fps_ass_ak_stamp_556_lhg_ak101",
	"wpn_fps_ass_ak_all_lhg_moe",
	"wpn_fps_ass_ak_all_lhg_zhukov",
	"wpn_fps_ass_ak_all_lhg_caa",
	"wpn_fps_ass_ak_all_lhg_ak200",
	"wpn_fps_ass_ak_all_lhg_b10m",
	"wpn_fps_ass_ak_all_lhg_b10",
	"wpn_fps_ass_ak_all_lhg_hex",
	"wpn_fps_ass_ak_all_lhg_tdi",
	"wpn_fps_ass_ak_all_lhg_vent",
	"wpn_fps_ass_ak_all_lhg_vs24",
	"wpn_fps_ass_ak_all_lhg_b11",
	"wpn_fps_ass_ak_all_lhg_xrsu",
	"wpn_fps_ass_ak_all_lhg_goliaf",
	"wpn_fps_ass_ak_all_lhg_ding",
	"wpn_fps_ass_ak_all_lhg_alpha",
	"wpn_fps_ass_ak_all_lhg_ivan",
	"wpn_fps_ass_ak_all_lhg_guard"
}

ak_parts_lhg_all_attach = {
	"wpn_fps_ass_ak_all_lhg_moe",
	"wpn_fps_ass_ak_all_lhg_zhukov",
	"wpn_fps_ass_ak_all_lhg_caa",
	"wpn_fps_ass_ak_all_lhg_ak200",
	"wpn_fps_ass_ak_all_lhg_b10m",
	"wpn_fps_ass_ak_all_lhg_b10",
	"wpn_fps_ass_ak_all_lhg_hex",
	"wpn_fps_ass_ak_all_lhg_tdi",
	"wpn_fps_ass_ak_all_lhg_vent",
	"wpn_fps_ass_ak_all_lhg_vs24",
	"wpn_fps_ass_ak_all_lhg_b11",
	"wpn_fps_ass_ak_all_lhg_xrsu",
	"wpn_fps_ass_ak_all_lhg_goliaf",
	"wpn_fps_ass_ak_all_lhg_ding",
	"wpn_fps_ass_ak_all_lhg_alpha",
	"wpn_fps_ass_ak_all_lhg_ivan",
	"wpn_fps_ass_ak_all_lhg_guard"
}

ak_parts_lhg_akm = {
	"wpn_fps_ass_ak_stamp_762_lhg_akm",
	"wpn_fps_ass_ak_stamp_366_lhg_vpo209",
	"wpn_fps_ass_ak_stamp_gold_lhg_akms"
}

ak_parts_uhg_akm = {
	"wpn_fps_ass_ak_stamp_762_uhg_akm",
	"wpn_fps_ass_ak_stamp_366_uhg_vpo209",
	"wpn_fps_ass_ak_stamp_gold_uhg_akm"
}

ak_parts_st_akm = {
	"wpn_fps_ass_ak_stamp_762_st_akm",
	"wpn_fps_ass_ak_stamp_366_st_vpo209",
	"wpn_fps_ass_ak_stamp_gold_st_akm"
}

ak_parts_lhg_ak74 = {
	"wpn_fps_ass_ak_stamp_545_lhg_ak74"
}

ak_parts_uhg_ak74 = {
	"wpn_fps_ass_ak_stamp_545_uhg_ak74"
}

ak_parts_st_ak74 = {
	"wpn_fps_ass_ak_stamp_545_st_ak74"
}

ak_parts_pg_poly = {
	"wpn_fps_ass_ak_stamp_762_pg_ak103",
	"wpn_fps_ass_ak_stamp_545_pg_ak74m",
	"wpn_fps_ass_ak_stamp_556_pg_ak101"
}

ak_parts_lhg_poly = {
	"wpn_fps_ass_ak_stamp_762_lhg_ak103",
	"wpn_fps_ass_ak_stamp_545_lhg_ak74m",
	"wpn_fps_ass_ak_stamp_556_lhg_ak101"
}

ak_parts_uhg_poly = {
	"wpn_fps_ass_ak_stamp_762_uhg_ak103",
	"wpn_fps_ass_ak_stamp_545_uhg_ak74m",
	"wpn_fps_ass_ak_stamp_556_uhg_ak101"
}


ak_parts_st_poly = {
	"wpn_fps_ass_ak_stamp_762_st_uf_ak103",
	"wpn_fps_ass_ak_stamp_545_st_uf_ak74m",
	"wpn_fps_ass_ak_stamp_545_st_ak74_poly",
	"wpn_fps_ass_ak_stamp_556_st_uf_ak101"
}

ak_parts_m_ak74m = {
	"wpn_fps_ass_ak_stamp_545_m_poly_30",
	"wpn_fps_ass_ak_krink_545_m_plum_30"
}

ak_parts_st_ak100 = {
	"wpn_fps_ass_ak_stamp_545_st_uf_ak74m",
	"wpn_fps_ass_ak_stamp_556_st_uf_ak101",
	"wpn_fps_ass_ak_stamp_762_st_uf_ak103"
}

--=========VARIANTS========--

ak_variants_pg_bake = {
	"fleck",
	"flecky",
	"maadi",
	"black"
}

ak_variants_hg_akm = {
	"hue",
	"red"
}

ak_variants_st_akm = {
	"hue",
	"romyg",
	"red"
}

ak_variants_hg_ak74 = {
	"red"
}

ak_variants_st_ak74 = {
	"red"
}

ak_variants_all_poly = {
	"plum",
	"border",
	"od",
	"sand"
}

for _, mag_id in pairs(ak_parts_m_ak74m) do
	self.parts[mag_id].texture_variants = self.parts[mag_id].texture_variants or {}
	self.parts[mag_id].texture_variants.slavu = {
		material_config = "units/mods/weapons/wpn_fps_ass_ak_all_545_mag_pts/wpn_fps_ass_ak_all_545_m_poly_30_slavu"
	}
end

for _, st_id in pairs(ak_parts_st_ak100) do
	self.parts[st_id].texture_variants = self.parts[st_id].texure_variants or {}
	self.parts[st_id].texture_variants.tiddy = {
		material_config = "units/mods/weapons/wpn_fps_ass_ak_all_ak100_pts/wpn_fps_ass_ak_all_st_ak100_tiddy"
	}
end

--- CAFCW ---
if attach_tables then
	for _, vg_id in pairs(attach_tables.Vertical_Grips) do
		if self.parts[vg_id] then
			table.insert(ak_parts_vg_univ, vg_id)
		end
	end
	for _, o_id in pairs(attach_tables.ACOG) do
		if self.parts[o_id] then
			table.insert(ak_parts_sights_univ, o_id)
		end
	end
	for _, o_id in pairs(attach_tables.Custom) do
		if self.parts[o_id] then
			table.insert(ak_parts_sights_univ, o_id)
		end
	end
	for _, o_id in pairs(attach_tables.Specter) do
		if self.parts[o_id] then
			table.insert(ak_parts_sights_univ, o_id)
		end
	end	
	self:cafcw_category_forbid("wpn_fps_ass_ak_stamp_762", "pistol_grip", "wpn_fps_ass_ak_all_st_opr8r", "wpn_fps_ass_ak_stamp_762_pg_akm")
end


--=========================--
--      COMPATIBILITY      --
--=========================--

if BeardLib.Utils:FindMod("AKM") then
	table.insert(ak_variants_pg_bake, "akm")
	self:akpack2_setup_overrides( "barrel2", ak_parts_barrel_ext_762x39, "wpn_fps_upg_ass_ns_battle", "wpn_fps_ass_ak_stamp_762" )
	self:akpack2_setup_overrides( "barrel2", ak_parts_barrel_ext_univ, "wpn_fps_upg_ass_ns_battle", "wpn_fps_ass_ak_stamp_762" )
	self:akpack2_setup_argument( "allows_vg", false, "forbids_uses_parts", "handguard_lower", ak_parts_vg_univ, "wpn_fps_ass_ak_stamp_762" )
	self:akpack2_setup_argument( "allows_vg", false, "forbids_table", "handguard_lower", ak_parts_vg_univ, ak_parts_lhg_all )
end

if BeardLib.Utils:FindMod("AK-74") then
	table.insert(ak_variants_pg_bake, "ak74")
end

if BeardLib.Utils:FindMod("VPO-209") then
	table.insert(ak_variants_pg_bake, "vpo209")
end

if BeardLib.Utils:FindMod("AKS-74U") then
	table.insert(ak_variants_pg_bake, "aks74u")
end

if BeardLib.Utils:FindMod("AKMSU") then
	table.insert(ak_variants_pg_bake, "akmsu")
end

if BeardLib.Utils:FindMod("gg_shovel") then
	self.parts.wpn_fps_ass_ak_all_st_zdann.pcs = {}
else
	self.parts.wpn_fps_ass_ak_all_st_zdann.pcs = nil
end

--=========================--
--          SETUP          --
--=========================--

self:akpack2_setup_variants( "pg", ak_parts_pg_bake, "akm", ak_variants_pg_bake )
self:akpack2_setup_variants( "lhg", ak_parts_lhg_akm, "akm", ak_variants_hg_akm )
self:akpack2_setup_variants( "uhg", ak_parts_uhg_akm, "akm", ak_variants_hg_akm )
self:akpack2_setup_variants( "st", ak_parts_st_akm, "akm", ak_variants_st_akm )
self:akpack2_setup_variants( "lhg", ak_parts_lhg_ak74, "ak74", ak_variants_hg_ak74 )
self:akpack2_setup_variants( "uhg", ak_parts_uhg_ak74, "ak74", ak_variants_hg_ak74 )
self:akpack2_setup_variants( "st", ak_parts_st_ak74, "ak74", ak_variants_st_ak74 )

--- VG stuff
for i, vg_id in pairs(ak_parts_vg_univ) do
	if self.parts[vg_id] then
		if self.wpn_fps_ass_ak_stamp_762 then
			self.wpn_fps_ass_ak_stamp_762.override[vg_id] = self.wpn_fps_ass_ak_stamp_762.override[vg_id] or {}
			self.wpn_fps_ass_ak_stamp_762.override[vg_id].override_weapon = {weapon_hold = "rpk", use_stance = "akm2_vg_ads"}
		end
	end
end

--- Sight Stuff
for i, o_id in pairs(ak_parts_sights_univ) do
	self.parts.wpn_fps_ass_ak_all_ro_tt01.override[o_id] = {a_obj = "a_o_tt01"}
end

--- Handguard stuff
for i, hg_id in pairs(ak_parts_hg_all) do
	for i, uhg_id in pairs(ak_parts_uhg_all_attach) do
		self:akpack2_setup_forbid( hg_id, uhg_id )
	end 
	for i, lhg_id in pairs(ak_parts_lhg_all_attach) do
		self:akpack2_setup_forbid( hg_id, lhg_id )
	end
end

end)