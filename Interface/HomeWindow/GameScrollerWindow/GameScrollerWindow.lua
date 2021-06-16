function CreateGameScrollerWindow()
    callbacks.gameScrollerWindow = Position(nil, callbacks.homeWindow, 1, (GetScreenWidth() * UIParent:GetEffectiveScale()) * 0.8, (GetScreenHeight() * UIParent:GetEffectiveScale()) - 24, nil, (GetScreenWidth() * UIParent:GetEffectiveScale()) * 0.2, 0);
    callbacks.gameScrollerWindow:Hide();

    -- Create the no games window
    callbacks.noGamesFoundWindow = Text(callbacks.gameScrollerWindow, texts.noGames);
    callbacks.noGamesFoundWindow:Hide();
    
    -- Create the scrollable area
    callbacks.homeScrollWindow = Position("ScrollFrame", callbacks.gameScrollerWindow, 2, callbacks.gameScrollerWindow:GetWidth() - 25, callbacks.gameScrollerWindow:GetHeight() - 1, nil, 0, 0);
    callbacks.gameScrollArea = Position(nil, callbacks.homeScrollWindow, nil, callbacks.gameScrollerWindow:GetWidth(), 10, nil, nil, nil);
    callbacks.homeScrollWindow:SetScrollChild(callbacks.gameScrollArea);
end