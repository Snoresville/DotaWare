require("base_minigame")
MinigameList.MathQuiz = base_minigame

-- Math Quiz
-- Creates a simple math question with two values and an operator.
-- Addition and Subtraction: Numbers range from 1-99.
-- Multiplication: Numbers range from 1-9.
function MinigameList.MathQuiz()
    print("[DotaWare] Math Quiz")
    self:Start()
end