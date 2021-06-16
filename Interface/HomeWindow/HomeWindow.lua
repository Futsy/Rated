function CreateHomeWindow()
    callbacks.homeWindow = Position(nil, callbacks.themedBackgroundWindow, 1, GetScreenWidth() * UIParent:GetEffectiveScale(), (GetScreenHeight() * UIParent:GetEffectiveScale()) - 24, nil, 0, 0);
    
    -- Create the underlying elements
    CreateHomeModelWindow();
    CreateGameScrollerWindow();
end
