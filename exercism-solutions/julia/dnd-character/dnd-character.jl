function modifier(ability)
    return floor((ability - 10) / 2)
end

function ability()
    dice = rand(1:6, 4)
    return sum(dice) - minimum(dice)
end

mutable struct DNDCharacter
    strength::Integer
    dexterity::Integer
    constitution::Integer
    intelligence::Integer
    wisdom::Integer
    charisma::Integer
    hitpoints::Integer

    function DNDCharacter()
        constitution = ability()
        new(ability(), ability(), constitution, ability(), ability(), ability(), 10 + modifier(constitution))
    end
end
