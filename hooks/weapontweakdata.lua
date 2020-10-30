Hooks:PostHook( WeaponTweakData, "init", "AK_Extra2Init", function(self)

if self.SetupAttachmentPoint then

	-- mental note for future KW: maybe automate this into a function, looks a bit bloated already with only one attachment point      bitch
	if self.ak_stamp_762 then
		self:SetupAttachmentPoint("ak_stamp_762", {
			name = "a_o_tt01", 
			base_a_obj = "a_o", 
			position = Vector3( 0, -0.7, -0.5 ), 
			rotation = Rotation( 0, 0, 0 ) 
		})
	end
	if self.ak_stamp_545 then
		self:SetupAttachmentPoint("ak_stamp_545", {
			name = "a_o_tt01", 
			base_a_obj = "a_o", 
			position = Vector3( 0, -0.7, -0.5 ), 
			rotation = Rotation( 0, 0, 0 ) 
		})
	end		
	if self.ak_stamp_556 then
		self:SetupAttachmentPoint("ak_stamp_556", {
			name = "a_o_tt01", 
			base_a_obj = "a_o", 
			position = Vector3( 0, -0.7, -0.5 ), 
			rotation = Rotation( 0, 0, 0 ) 
		})
	end
	if self.ak_stamp_366 then
		self:SetupAttachmentPoint("ak_stamp_366", {
			name = "a_o_tt01", 
			base_a_obj = "a_o", 
			position = Vector3( 0, -0.7, -0.5 ), 
			rotation = Rotation( 0, 0, 0 ) 
		})
	end
	if self.ak_stamp_gold then
		self:SetupAttachmentPoint("ak_stamp_gold", {
			name = "a_o_tt01", 
			base_a_obj = "a_o", 
			position = Vector3( 0, -0.7, -0.5 ), 
			rotation = Rotation( 0, 0, 0 ) 
		})
	end
	if self.ak_chicom_762 then
		self:SetupAttachmentPoint("ak_chicom_762", {
			name = "a_o_tt01", 
			base_a_obj = "a_o", 
			position = Vector3( 0, -0.7, -0.5 ), 
			rotation = Rotation( 0, 0, 0 ) 
		})
	end
	if self.ak_chicom_556 then
		self:SetupAttachmentPoint("ak_chicom_556", {
			name = "a_o_tt01", 
			base_a_obj = "a_o", 
			position = Vector3( 0, -0.7, -0.5 ), 
			rotation = Rotation( 0, 0, 0 ) 
		})
	end
		
end

end)