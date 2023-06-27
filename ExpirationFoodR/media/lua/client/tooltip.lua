-- original mod by abreu20011
-- author: rez
-- version: 1.3.1-r0.6.0 (2019-10-11)
-- based on: 40.43

--[[
	Massive rework of abreu20011 mod.
	Displays information on food expiration in a tooltip. Adds new trait
	which provides more information and a colored progress bar.
	
	COPYRIGHT (as some people really need one it seems):
	The idea of the tooltip with food state is copyrighted to abreu20011.
	The idea of colored progress bar, math, states of food, colors, 
	placement and other things introduced in this rework is copyrighted 
	to Rez and cannot be used in other mods even based on the original 
	idea without written permit.
	Localizations are copyrighted to steam users who provided them
	(see localization files).
	Poster is copyrighted to abreu20011.
]]--

require "ISUI/ISToolTipInv"

-- settings block (changeable) --
local trait_logic = true;
local display_seconds = true;

-- do not edit below --
local has_trait;

local portions = {
	getText("UI_mod_fdxpr_state_verygood"),
	getText("UI_mod_fdxpr_state_good"),
	getText("UI_mod_fdxpr_state_ok"),
	getText("UI_mod_fdxpr_state_rotting"),
	getText("UI_mod_fdxpr_state_rotten")
	};

-- set width for pixel for fonts
local PX_LETTER = 8;
local font_name = UIFont.Medium;
local font_size = getCore():getOptionTooltipFont();

if font_size == "Large" then
	PX_LETTER = 9;
	font_name = UIFont.Large;
elseif font_size == "Small" then
	PX_LETTER = 6;
	font_name = UIFont.Small;
end

-- get UI language and add fix for wider Russian fonts
local current_lang = tostring(Translator.getLanguage());
if current_lang == "RU" then
	if font_size == "Large" then
		PX_LETTER = 10;
	elseif font_size == "Small" then
		PX_LETTER = 6.5;
	end
end

-- get line height for user-chosen font
local lh = getTextManager():getFontFromEnum(font_name):getLineHeight();

-- store previous rendering function in a local variable for compatibility with other mods
local original_render = ISToolTipInv.render;

function ISToolTipInv:fdxpr_render()
	--[[	Basically the same function from devs code.
		Should be actively maintained for every PZ release.	]]--

	if not self.item:IsFood() then
		-- call the previous function and return
		original_render(self);
		return;
	end
	
	-- we render the tool tip for inventory item only if there's no context menu showed
	if not ISContextMenu.instance or not ISContextMenu.instance.visibleCheck then
		local mx = getMouseX() + 24;
		local my = getMouseY() + 24;

		if not self.followMouse then
			mx = self:getX()
			my = self:getY()
			if self.anchorBottomLeft then
				mx = self.anchorBottomLeft.x
				my = self.anchorBottomLeft.y
			end
		end
		
		self.tooltip:setX(mx+11);
		self.tooltip:setY(my);

		self.tooltip:setWidth(50)
		self.tooltip:setMeasureOnly(true)
		self.item:DoTooltip(self.tooltip);
		self.tooltip:setMeasureOnly(false)

		local myCore = getCore();
		local maxX = myCore:getScreenWidth();
		local maxY = myCore:getScreenHeight();

		local tw = self.tooltip:getWidth();
		local th = self.tooltip:getHeight();

		if self.followMouse then
			self:adjustPositionToAvoidOverlap({ x = mx - 24 * 2, y = my - 24 * 2, width = 24 * 2, height = 24 * 2 });
		end

		self:drawRect(0, 0, self.width, self.height, self.backgroundColor.a, self.backgroundColor.r, self.backgroundColor.g, self.backgroundColor.b);
		self:drawRectBorder(0, 0, self.width, self.height, self.borderColor.a, self.borderColor.r, self.borderColor.g, self.borderColor.b);

		if self.item:IsFood() then
			local total = self.item:getScriptItem():getDaysTotallyRotten();
			local age = self.item:getAge();

			-- do we need trait for this to work? (look in settings to enable/disable)
			if trait_logic then
				player = getPlayer(0);
				has_trait = get_trait(player);
			else
				has_trait = true;
			end

			-- no sense if already rotten
			if age < total then
				local time_lines = 0; -- lines from time section
				local bar_lines = 0; -- lines from bar section
				local time_left; -- message string with times
				local draw_bar; -- draw the bar
				local fresh = self.item:getScriptItem():getDaysFresh();

				-- shift output for state
				local label_y = self.tooltip:getHeight() + lh * 0.2;
				local label = getText("UI_mod_fdxpr_state");
				local x_shift = (string.len(label) + 3) * PX_LETTER;
				local bar_length = PX_LETTER * 20;

				-- set colors for states
				local r, g, b = 1, 1, 1; -- white
				-- freshest
				if age <= fresh / 2 then
					r, g, b = 0.56, 0.93, 0.56; -- green
				-- fresh
				elseif age <= fresh then
					r, g, b = 0.78, 0.96, 0.28; -- yellowish green
				-- stale
				elseif age <= fresh + (total - fresh) / 2 then
					r, g, b = 0.95, 0.95, 0; -- yellow
				-- rotting
				else
					r, g, b = 0.95, 0.5, 0; -- orange
				end

				-- print label
				self.tooltip:DrawText(self.tooltip:getFont(), label, 5, label_y, 1, 1, 0.8, 1);

				-- lines to print
				time_left, draw_bar = days_left(fresh, total, age);
				time_lines = #time_left;
				local y_shift = label_y; -- TODO: move to one var, this is ugly
				
				-- calculate width
				local max_length = 0;
				for _, str in ipairs(time_left) do
					local s_len = string.len(str);
					if s_len > max_length then
						max_length = s_len;
					end
				end
				
				if draw_bar then
					self.tooltip:DrawProgressBar(x_shift, label_y + lh / 2, bar_length, 2, pct_bar(total, age), r, g, b, 1);
					y_shift = y_shift + lh * 0.8;
					tw = math.max(tw, x_shift + math.max(bar_length, max_length * PX_LETTER));
				else
					-- do not count in bar if could not be seen
					tw = math.max(tw, x_shift + max_length * PX_LETTER);
				end
				self.tooltip:DrawText(self.tooltip:getFont(), table.concat(time_left, "\n"), x_shift, y_shift, r, g, b, 1);
				
				-- if we had some extra output (> 1 line), extend tooltip vertically
				if time_lines > 0 and draw_bar then
					-- TODO: this may have no sense at time_lines = 0 anyways
					th = th + lh * (time_lines);
				end

				-- extend more for label + state
				th = th + lh * 1.26;
				th = th + 5; -- shift for nice margin
				tw = tw + 5; -- shift for nice margin
			end
		end

		self.tooltip:setX(math.max(0, math.min(mx + 11, maxX - tw - 1)));
		if not self.followMouse and self.anchorBottomLeft then
			self.tooltip:setY(math.max(0, math.min(my - th, maxY - th - 1)));
		else
			self.tooltip:setY(math.max(0, math.min(my, maxY - th - 1)));
		end

		self:setX(self.tooltip:getX() - 11);
		self:setY(self.tooltip:getY());
		self:setWidth(tw + 11);
		self:setHeight(th);

		self.item:DoTooltip(self.tooltip);
	end
end

function get_trait(pl)
	--[[	pl: player object (obj)
		returns: bool	]]--
	prof = tostring(pl:getDescriptor():getProfession());
	if prof == "burgerflipper" or prof == "chef" then
		return true
	else
		if pl:HasTrait(initMod.NAME_TRAIT) or pl:HasTrait('Nutritionist') or pl:HasTrait('Cook') then
			return true
		else
			return false
		end
	end
end

function days_to_human(d)
	--[[	d: days left (float)
		TODO: to array for better memory usage	]]--

	local s = ""; -- message

	-- separate days
	local days, fh = math.modf(d);
	-- fraction to hours
	local h = fh * 24;
	-- separate hours
	local hours, fm = math.modf(h);
	-- fraction to minutes
	local m = fm * 60;
	-- separate minutes
	local mins, fs = math.modf(m);

	if days > 0 then
		s = s .. string.format("%d%s ", days, getText("UI_mod_fdxpr_days"));
	end
	if hours > 0 then
		s = s .. string.format("%d%s ", hours, getText("UI_mod_fdxpr_hours"));
	end
	if mins > 0 then
		s = s .. string.format("%d%s", mins, getText("UI_mod_fdxpr_mins"));
	end

	-- only if seconds are enabled
	if display_seconds then
		-- fraction to seconds
		local secs = math.floor(fs * 60);
		if secs > 0 then
			s = s .. string.format(" %d%s", secs, getText("UI_mod_fdxpr_secs"));
		end
	end
	return s;
end


function days_left(fresh, total, age)
	--[[	fresh: fresh days for object
		total: days till rotten for object
		age: days of life for the object	]]--

	local a = {}; -- message array to return
	local draw_bar; -- flag for bar
	local rotten_in = total - age;
	local stale_in = fresh - age;

	if total == 1000000000 and fresh == 1000000000 then
		-- this is non-perishable food
		table.insert(a, string.format("%s", getText("UI_mod_fdxpr_state_nonperish")));
	else
		if has_trait then
			if stale_in > 0 then
				table.insert(a, string.format("%s %s", getText("UI_mod_fdxpr_stale"), days_to_human(stale_in)));
			end
			if rotten_in > 0 then
				table.insert(a, string.format("%s %s", getText("UI_mod_fdxpr_rotten"), days_to_human(rotten_in)));
			end
			-- send flag for bar
			draw_bar = true;
		else
			state = math.ceil(age / total * 4);
			table.insert(a, portions[state]);
		end
	end
	return a, draw_bar;
end

function pct_bar(total, age)
	--[[	total: days till rotten for object
		age: days of life for the object	]]--

	local left = total - age;
	-- no zero division, no negative results
	if total == 0 or total == nil or total < left or left < 0 then
		return 0;
	else
		return left / total;
	end
end

ISToolTipInv.render = ISToolTipInv.fdxpr_render