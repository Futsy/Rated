function CreateHomeModel()  
    local model = CreateFrame("PlayerModel", nil, callbacks.homeModelWindow)
    model:SetSize(callbacks.homeModelWindow:GetWidth(), callbacks.homeModelWindow:GetHeight());
    model:SetPoint("CENTER", callbacks.homeModelWindow, "CENTER", 0, -100);
    model:SetPosition(0, 0, 0);
    model:SetRotation(0.5);
    model:SetAnimation(31);
    model:SetUnit("player");
    model:RefreshCamera();
    model:SetScript("OnShow", function(self)
        self:SetCustomCamera(1);
        self:SetCameraPosition(6.6, 1.8, 1);
    end);
    model:Show();
end