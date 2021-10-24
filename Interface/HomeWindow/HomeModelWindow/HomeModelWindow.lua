function CreateHomeModelWindow()
    callbacks.homeModelWindow = Position(nil, callbacks.homeWindow, 1, callbacks.homeWindow:GetWidth() * 0.2, callbacks.homeWindow:GetHeight(), nil, 0, 0);
    callbacks.homeModelWindow:Hide();

    -- Create the underlying elements
    CreateHomeHeaderWindow();
    CreateHomeModel();
    CreateHomeBottomWindow();
end