function CreateMainWindow()
    callbacks.mainWindow = Position(nil, nil, 1, GetScreenWidth() * UIParent:GetEffectiveScale(), GetScreenHeight() * UIParent:GetEffectiveScale(), "CENTER", 0, 0);

    -- Set position in the frame strata and z-index
    callbacks.mainWindow:SetFrameLevel(0);
    callbacks.mainWindow:SetFrameStrata("FULLSCREEN");
    callbacks.mainWindow:EnableMouse(true);
    if data.minimized ~= nil and data.minimized == true then
        callbacks.mainWindow:SetWidth(data.width);
        callbacks.mainWindow:SetHeight(data.height);
    elseif data.minimized == false then
    end

    callbacks.mainWindow:SetMovable(true);
    callbacks.mainWindow:SetResizable(true);
    callbacks.mainWindow:SetUserPlaced();
    callbacks.mainWindow:EnableMouse(true);
    callbacks.mainWindow:SetMinResize(800, 600);
    callbacks.mainWindow:SetMaxResize(GetScreenWidth() * UIParent:GetEffectiveScale(), GetScreenHeight() * UIParent:GetEffectiveScale());
    callbacks.mainWindow:RegisterForDrag("LeftButton");

    -- Allow the frame to be resized
    local resizeButton = CreateFrame("Button", nil, callbacks.mainWindow);
    resizeButton:SetSize(16, 16);
    resizeButton:SetPoint("BOTTOMRIGHT");
    resizeButton:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up");
    resizeButton:SetHighlightTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight");
    resizeButton:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down");

    resizeButton:SetScript("OnMouseDown", function(self, button)
        if callbacks.mainWindow:IsMovable() then
            callbacks.mainWindow:StartSizing("BOTTOMRIGHT");
            callbacks.mainWindow:SetUserPlaced(true);
        end
    end);

    callbacks.mainWindow:SetScript("OnSizeChanged", function(self, button) 
        if callbacks.mainWindow:IsMovable() then
            ResizeWindow();
        end
    end);
     
    resizeButton:SetScript("OnMouseUp", function(self, button)
        if callbacks.mainWindow:IsMovable() then
            callbacks.mainWindow:StopMovingOrSizing();
        end
    end);

    -- Fade in the frame
    FadeInFrame(callbacks.mainWindow, 0.35);

    -- Create the underlying elements
    callbacks.mainEdgesWindow = Position(nil, callbacks.mainWindow, 1, callbacks.mainWindow:GetWidth(), callbacks.mainWindow:GetHeight(), nil, 0, 0);
    
    -- Backdrop for the root window
    callbacks.mainEdgesWindow:SetBackdrop({
        bgFile = bd.EightTimesEight, edgeFile = bd.TooltipBor,
        tile = true, tileSize = 16, edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 }
    });
    callbacks.mainEdgesWindow:SetBackdropColor(0, 0, 0, 0.5);

    -- Create underlying components
    callbacks.addonHeaderWindow = Position(nil, callbacks.mainEdgesWindow, 1, callbacks.mainWindow:GetWidth(), 24, nil, 0, 0);
    
    -- Backdrop for the root window
    callbacks.addonHeaderWindow:SetBackdrop({
        bgFile = bd.BgScore, edgeFile = bd.TooltipBor,
        tile = true, tileSize = 64, edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 }
    });
    
    -- Allow the header to move the position of the frame
    callbacks.addonHeaderWindow:SetScript("OnMouseDown", function(self, button)
        if callbacks.mainWindow:IsMovable() then
            callbacks.mainWindow:StartMoving();
            callbacks.mainWindow:SetUserPlaced(true);
        end
    end);
     
    callbacks.addonHeaderWindow:SetScript("OnMouseUp", function(self, button)
        if callbacks.mainWindow:IsMovable() then
            callbacks.mainWindow:StopMovingOrSizing();
        end
    end);

    -- Set the name of the application at the top
    callbacks.addonHeaderText = Text(callbacks.addonHeaderWindow, texts.addonHeader);
    
    -- Close button
    local button = Position("Button", callbacks.addonHeaderWindow, nil, 25, 25, "TOPRIGHT", 1, 1);
    button:SetScript("OnClick", function() DisplayAddonFrame() end);
	button:SetNormalTexture(CreateButtonTex(button, bd.ButtonUp));
	button:SetHighlightTexture(CreateButtonTex(button, bd.ButtonHighlight));
	button:SetPushedTexture(CreateButtonTex(button, bd.ButtonDown));

    -- Minimize/Maximize button
    local minMaxButton = Position("Button", callbacks.addonHeaderWindow, nil, 25, 25, "TOPRIGHT", -15, 1);
    minMaxButton:SetScript("OnClick", function() 
        if data.minimized == true then
            data.minimized = false;
            minMaxButton:SetNormalTexture(CreateButtonTex(minMaxButton, bd.MaxUp));
            minMaxButton:SetHighlightTexture(CreateButtonTex(minMaxButton, bd.MaxHighlight));
            minMaxButton:SetPushedTexture(CreateButtonTex(minMaxButton, bd.MaxDown));
            ForceResize(true);
        else
            data.minimized = true;
            minMaxButton:SetNormalTexture(CreateButtonTex(minMaxButton, bd.MinUp));
            minMaxButton:SetHighlightTexture(CreateButtonTex(minMaxButton, bd.MinHighlight));
            minMaxButton:SetPushedTexture(CreateButtonTex(minMaxButton, bd.MinDown));
            ForceResize(false);
        end
    end);
    
    if data.minimized == true then
        minMaxButton:SetNormalTexture(CreateButtonTex(minMaxButton, bd.MinUp));
        minMaxButton:SetHighlightTexture(CreateButtonTex(minMaxButton, bd.MinHighlight));
	    minMaxButton:SetPushedTexture(CreateButtonTex(minMaxButton, bd.MinDown));
    else
        minMaxButton:SetNormalTexture(CreateButtonTex(minMaxButton, bd.MaxUp));
        minMaxButton:SetHighlightTexture(CreateButtonTex(minMaxButton, bd.MaxHighlight));
        minMaxButton:SetPushedTexture(CreateButtonTex(minMaxButton, bd.MaxDown));
    end
    
    -- Themed background window
    callbacks.themedBackgroundWindow = Position(nil, callbacks.mainEdgesWindow, 1, 
        callbacks.mainWindow:GetWidth(), 
        callbacks.mainWindow:GetHeight() - 22, 
        nil, 0, -22
    );
    
    local randomBackground = math.floor(math.random(0, 2), 0);
    local bgString = "";
    if randomBackground == 0 then
        bgString = UnitFactionGroup("player") == "Alliance" and bd.BgAlliance or bd.BgHorde;
    elseif randomBackground == 1 then
        bgString = UnitFactionGroup("player") == "Alliance" and bd.BgAlliance2 or bd.BgHorde3;
    elseif randomBackground == 2 then
        bgString = UnitFactionGroup("player") == "Alliance" and bd.BgAlliance3 or bd.BgHorde3;
    end
    
    callbacks.themedBackgroundWindow:SetBackdrop({
        bgFile = bgString,
        insets = { left = 4, right = 4, top = 0, bottom = 4 }
    });

    -- Manually set the texture because SetBackdrop doesn't allow for TexCoord
    callbacks.backgroundTexture = callbacks.themedBackgroundWindow:CreateTexture(nil, "BACKGROUND");
    callbacks.backgroundTexture:SetTexture(bgString);
    callbacks.backgroundTexture:SetPoint("TOPLEFT", 4, 0);
    callbacks.backgroundTexture:SetHeight(callbacks.themedBackgroundWindow:GetHeight() - 3);
    callbacks.backgroundTexture:SetWidth(callbacks.themedBackgroundWindow:GetWidth() - 7);
    callbacks.backgroundTexture:SetTexCoord(0, 1, 0, 0.58);

    -- Create the entire home window
    CreateHomeWindow();
end