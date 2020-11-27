require("base_minigame")
MinigameList.ColourWord = base_minigame

-- Colour Word
-- A reflex game where the colour and the text is randomised based on a list.
-- If it asks for a colour, players have to type the colour of the word.
-- Vice versa for text.
function MinigameList.ColourWord()
    print("[DotaWare] Colour Word")
    self:Start()
end