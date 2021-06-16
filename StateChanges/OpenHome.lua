function OpenHome()
    -- For the left part of the screen we show the components:
    callbacks.homeModelWindow:Show();
    callbacks.gameScrollerWindow:Show();
    FadeInFrame(callbacks.homeModelWindow, 0.2);
    FadeInFrame(callbacks.gameScrollerWindow, 0.2);

    -- First of all we have to decide whether we should show games or display the no games found
    -- Before we add the games we need to group them by day played
    local toBeAddedDays = {};
    for i, gameEntry in ipairs(data) do
        if tContains(toBeAddedDays, date("%d-%m-%Y", gameEntry.timeStamp)) == false then
            tinsert(toBeAddedDays, date("%d-%m-%Y", gameEntry.timeStamp));
        end
    end

    if #toBeAddedDays == 0 then
        callbacks.noGamesFoundWindow:Show();
        callbacks.homeScrollWindow:Hide();
        callbacks.gameScrollerWindow:Show();
    else
        callbacks.noGamesFoundWindow:Hide();
        callbacks.homeScrollWindow:Show();
        callbacks.gameScrollerWindow:Show();
    end
end