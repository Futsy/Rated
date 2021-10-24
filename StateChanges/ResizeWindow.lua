function ForceResize(maximized)
    if maximized == true and data.minimized ~= nil then
        callbacks.mainWindow:SetWidth(GetScreenWidth() * UIParent:GetEffectiveScale());
        callbacks.mainWindow:SetHeight(GetScreenHeight() * UIParent:GetEffectiveScale());
        callbacks.mainWindow:SetMovable(false);
        callbacks.mainWindow:SetResizable(false);
        callbacks.mainWindow:SetPoint("TOPLEFT", 0, 0);
        ResizeWindow();
    elseif maximized == false and data.minimized ~= nil then
        callbacks.mainWindow:SetWidth(data.width);
        callbacks.mainWindow:SetHeight(data.height);
        callbacks.mainWindow:SetMovable(true);
        callbacks.mainWindow:SetResizable(true);
        callbacks.mainWindow:SetPoint("TOPLEFT", 0, 0);
        ResizeWindow();
    end
end

function ResizeWindow()
    if data.minimized == true then
        data.width = callbacks.mainWindow:GetWidth();
        data.height = callbacks.mainWindow:GetHeight();
    end

    -- MainWindow
    callbacks.mainEdgesWindow:SetWidth(callbacks.mainWindow:GetWidth());
    callbacks.mainEdgesWindow:SetHeight(callbacks.mainWindow:GetHeight());

    callbacks.addonHeaderWindow:SetWidth(callbacks.mainWindow:GetWidth());

    callbacks.themedBackgroundWindow:SetWidth(callbacks.mainWindow:GetWidth());
    callbacks.themedBackgroundWindow:SetHeight(callbacks.mainWindow:GetHeight() - 22);

    callbacks.backgroundTexture:SetHeight(callbacks.themedBackgroundWindow:GetHeight() - 3);
    callbacks.backgroundTexture:SetWidth(callbacks.themedBackgroundWindow:GetWidth() - 7);

    -- HomeWindow
    callbacks.homeWindow:SetWidth(callbacks.mainWindow:GetWidth());
    callbacks.homeWindow:SetHeight(callbacks.mainWindow:GetHeight() - 24);

    -- HomeModelWindow
    callbacks.homeModelWindow:SetWidth(callbacks.homeWindow:GetWidth() * 0.2);
    callbacks.homeModelWindow:SetHeight(callbacks.homeWindow:GetHeight());

    -- HomeBottomWindow
    callbacks.bottomHeaderWindow:SetWidth(callbacks.homeModelWindow:GetWidth(), callbacks.homeModelWindow:GetHeight() * 0.1);
    callbacks.bottomHeaderWindow:SetHeight(callbacks.homeModelWindow:GetHeight() * 0.1);

    -- HomeHeaderWindow
    callbacks.topHeaderWindow:SetWidth(callbacks.homeModelWindow:GetWidth());
    callbacks.topHeaderWindow:SetHeight(callbacks.homeModelWindow:GetHeight() * 0.1);

    callbacks.highestHeaderWindow:SetWidth(callbacks.homeModelWindow:GetWidth());
    callbacks.highestHeaderWindow:SetHeight(callbacks.homeModelWindow:GetHeight() * 0.07);

    callbacks.twosHeaderWindow:SetWidth(callbacks.homeModelWindow:GetWidth());
    callbacks.twosHeaderWindow:SetHeight(callbacks.homeModelWindow:GetHeight() * 0.07);

    callbacks.threesHeaderWindow:SetWidth(callbacks.homeModelWindow:GetWidth());
    callbacks.threesHeaderWindow:SetHeight(callbacks.homeModelWindow:GetHeight() * 0.07);

    -- GameScrollerWindow
    callbacks.gameScrollerWindow:SetWidth(callbacks.homeWindow:GetWidth() * 0.8);
    callbacks.gameScrollerWindow:SetHeight(callbacks.homeWindow:GetHeight());
    callbacks.gameScrollerWindow:SetPoint("TOPLEFT", callbacks.homeWindow:GetWidth() * 0.2, 0);
    
    callbacks.homeScrollWindow:SetWidth(callbacks.gameScrollerWindow:GetWidth() - 25);
    callbacks.homeScrollWindow:SetHeight(callbacks.gameScrollerWindow:GetHeight() - 1);

    -- Section headers
    for k,v in ipairs(sectionHandles) do
        v:SetWidth(callbacks.gameScrollerWindow:GetWidth() - 10);
    end

    -- Game entries
    for k,v in ipairs(gameEntryHandles) do
        v:SetWidth(callbacks.homeScrollWindow:GetWidth() - 3);
    end
end