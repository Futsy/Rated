function CreateHomeWindow()
    callbacks.homeWindow = Position(nil, callbacks.themedBackgroundWindow, 1, callbacks.mainWindow:GetWidth(), callbacks.mainWindow:GetHeight() - 24, nil, 0, 0);

    -- Create the underlying elements
    CreateHomeModelWindow();
    CreateGameScrollerWindow();
end
