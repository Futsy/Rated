frameNaming = 0;
function Position(baseFrame, parent, extensions, width, height, position, offsetX, offsetY)
    local standardFrame = "";
    if baseFrame == nil then
        standardFrame = "Frame";
    else
        standardFrame = baseFrame;
    end

    local elem = nil;
    if extensions == 1 then 
        elem = CreateFrame(standardFrame, "Frame_"..frameNaming.."Frame", parent, BackdropTemplateMixin and "BackdropTemplate");
    elseif extensions == 2 then
        elem = CreateFrame(standardFrame, "Frame_"..frameNaming.."Frame", parent, "UIPanelScrollFrameTemplate");
    else
        elem = CreateFrame(standardFrame, "Frame_"..frameNaming.."Frame", parent); 
    end
    frameNaming = frameNaming + 1;

    if width ~= nil then
        elem:SetWidth(width);
    end
    
    if height ~= nil then
        elem:SetHeight(height);
    end

    if position ~= nil and offsetX ~= nil and offsetY ~= nil then
        elem:SetPoint(position, offsetX, offsetY);
    elseif offsetX ~= nil and offsetY ~= nil then
        elem:SetPoint("TOPLEFT", offsetX, offsetY);
    end
    return elem;
end

textNaming = 0;
function Text(parent, textBlock)
    local elem = parent:CreateFontString("TextFrame_"..textNaming, "ARTWORK", textBlock[1]);
    elem:SetTextColor(textBlock[2][1], textBlock[2][2], textBlock[2][3], textBlock[2][4]);
    if textBlock[3] ~= nil then
        elem:SetPoint(textBlock[3], textBlock[4], textBlock[5]);
    else
        elem:SetPoint("TOPLEFT", textBlock[4], textBlock[5]);
    end
    elem:SetText(textBlock[6]);
    textNaming = textNaming + 1;
    return elem;
end

function CreateButtonTex(button, texture)
	local ntex = button:CreateTexture();
	ntex:SetTexture(texture);
	ntex:SetTexCoord(0, 1, 0, 0.9);
	ntex:SetAllPoints();
    return ntex;
end