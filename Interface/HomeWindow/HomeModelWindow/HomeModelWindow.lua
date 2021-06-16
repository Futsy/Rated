function CreateHomeModelWindow()
    callbacks.homeModelWindow = Position(nil, callbacks.homeWindow, 1, (GetScreenWidth() * UIParent:GetEffectiveScale()) * 0.2, (GetScreenHeight() * UIParent:GetEffectiveScale()) - 24, nil, 0, 0);
    callbacks.homeModelWindow:Hide();

    -- Create the underlying elements
    CreateHomeHeaderWindow();
    CreateHomeModel();
    CreateHomeBottomWindow();
end