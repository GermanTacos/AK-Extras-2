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

Hooks:PostHook( WeaponFactoryTweakData, "init", "AKExtras2Init", function(self)

--=========================--
--          ARRAYS         --
--=========================--

ak_grips_bake = {
	"wpn_fps_ass_ak_stamp_762_pg_akm",
	"wpn_fps_ass_ak_stamp_545_pg_ak74"
	-- "wpn_fps_sho_ak_stamp_366_pg_vpo209",
	-- "wpn_fps_lmg_ak_stamp_545_pg_rpk74",
	-- "wpn_fps_ass_ak_krink_762_pg_akmsu",
	-- "wpn_fps_ass_ak_krink_545_pg_aks74u"
}

ak_variants_bake = {
	"fleck",
	"flecky",
	"maadi",
	"black"
}

ak_grips_poly = {
	"wpn_fps_ass_ak_stamp_762_pg_ak103",
	"wpn_fps_ass_ak_stamp_545_pg_ak74m",
	"wpn_fps_ass_ak_stamp_556_pg_ak101"
	-- "wpn_fps_smg_ak_stamp_919_pg_vityaz",
	-- "wpn_fps_smg_ak_stamp_918_pg_bizon",
	-- "wpn_fps_sho_ak_stamp_12g_pg_saiga12",
	-- "wpn_fps_lmg_ak_stamp_762_pg_rpk203",
	-- "wpn_fps_lmg_ak_stamp_545_pg_rpk74m",
	-- "wpn_fps_lmg_ak_stamp_556_pg_rpk201"
}

ak_stocks_poly = {
	"wpn_fps_ass_ak_stamp_762_st_ak103",
	"wpn_fps_ass_ak_stamp_545_st_ak74m",
	"wpn_fps_ass_ak_stamp_545_st_ak74_poly",
	"wpn_fps_ass_ak_stamp_556_st_ak101"
	-- "wpn_fps_sho_ak_stamp_12g_st_saiga12k",
	-- "wpn_fps_lmg_ak_stamp_762_st_rpk203",
	-- "wpn_fps_lmg_ak_stamp_545_st_rpk74m",
	-- "wpn_fps_lmg_ak_stamp_556_st_rpk201"
}

ak_handguards_lower_poly = {
	"wpn_fps_ass_ak_stamp_762_lhg_ak103",
	"wpn_fps_ass_ak_stamp_545_lhg_ak74m",
	"wpn_fps_ass_ak_stamp_556_lhg_ak101"
	-- "wpn_fps_smg_ak_stamp_919_lhg_vityaz",
	-- "wpn_fps_smg_ak_stamp_918_lhg_bizon",
	-- "wpn_fps_sho_ak_stamp_12g_lhg_saiga12",
	-- "wpn_fps_lmg_ak_stamp_762_lhg_rpk203",
	-- "wpn_fps_lmg_ak_stamp_545_lhg_rpk74m",
	-- "wpn_fps_lmg_ak_stamp_556_lhg_rpk201"
}

ak_handguards_upper_poly = {
	"wpn_fps_ass_ak_stamp_762_uhg_ak103",
	"wpn_fps_ass_ak_stamp_545_uhg_ak74m",
	"wpn_fps_ass_ak_stamp_556_uhg_ak101"
	-- "wpn_fps_smg_ak_stamp_919_uhg_vityaz",
	-- "wpn_fps_lmg_ak_stamp_762_uhg_rpk203",
	-- "wpn_fps_lmg_ak_stamp_545_uhg_rpk74m",
	-- "wpn_fps_lmg_ak_stamp_556_uhg_rpk201"
}

ak_variants_poly = {
	"plum",
	"border",
	"od",
	"sand"
}

self:akpack2_setup_variants( "pg", ak_grips_bake, "akm", ak_variants_bake )

end)