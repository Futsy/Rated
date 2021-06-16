function CreateMainWindow()
    callbacks.mainWindow = Position(nil, nil, 1, GetScreenWidth() * UIParent:GetEffectiveScale(), GetScreenHeight() * UIParent:GetEffectiveScale(), "CENTER", 0, 0);
    
    -- Backdrop for the root window
    callbacks.mainWindow:SetBackdrop({
        bgFile = bd.EightTimesEight,
        tile = true,
        tileSize = 8,
    });
    callbacks.mainWindow:SetBackdropColor(0, 0, 0, 0.5);

    -- Set position in the frame strata and z-index
    callbacks.mainWindow:SetFrameLevel(0);
    callbacks.mainWindow:SetFrameStrata("FULLSCREEN");
    callbacks.mainWindow:EnableMouse(true);

    -- Fade in the frame
    FadeInFrame(callbacks.mainWindow, 0.35);

    -- Create the underlying elements
    callbacks.mainEdgesWindow = Position(nil, callbacks.mainWindow, 1, GetScreenWidth() * UIParent:GetEffectiveScale(), GetScreenHeight() * UIParent:GetEffectiveScale(), nil, 0, 0);
    
    -- Backdrop for the root window
    callbacks.mainEdgesWindow:SetBackdrop({
        bgFile = bd.EightTimesEight, edgeFile = bd.TooltipBor,
        tile = true, tileSize = 16, edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 }
    });
    callbacks.mainEdgesWindow:SetBackdropColor(0, 0, 0, 0.5);

    -- Create underlying components
    callbacks.addonHeaderWindow = Position(nil, callbacks.mainEdgesWindow, 1, GetScreenWidth() * UIParent:GetEffectiveScale(), 24, nil, 0, 0);
    
    -- Backdrop for the root window
    callbacks.addonHeaderWindow:SetBackdrop({
        bgFile = bd.BgScore, edgeFile = bd.TooltipBor,
        tile = true, tileSize = 64, edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 }
    });

    -- Set the name of the application at the top
    callbacks.addonHeaderText = Text(callbacks.addonHeaderWindow, texts.addonHeader);
    
    -- Close button
    local button = Position("Button", callbacks.addonHeaderWindow, nil, 25, 25, "TOPRIGHT", 1, 1);
    button:SetScript("OnClick", function() DisplayAddonFrame() end);
	button:SetNormalTexture(CreateButtonTex(button, bd.ButtonUp));
	button:SetHighlightTexture(CreateButtonTex(button, bd.ButtonHighlight));
	button:SetPushedTexture(CreateButtonTex(button, bd.ButtonDown));
    
    -- Themed background window
    callbacks.themedBackgroundWindow = Position(nil, callbacks.mainEdgesWindow, 1, 
        GetScreenWidth() * UIParent:GetEffectiveScale(), 
        ((2 * GetScreenHeight()) * UIParent:GetEffectiveScale()) - 24, 
        nil, 0, -22
    );
    
    callbacks.themedBackgroundWindow:SetBackdrop({
        bgFile = UnitFactionGroup("player") == "Alliance" and bd.BgAlliance or bd.BgHorde,
        insets = { left = 4, right = 4, top = 0, bottom = 255 }
    });

    -- Create the entire home window
    CreateHomeWindow();
end