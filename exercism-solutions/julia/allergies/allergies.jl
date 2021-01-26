
allergens = Dict(
    "cats" => 128,
    "pollen" => 64,
    "chocolate" => 32,
    "tomatoes" => 16,
    "strawberries" => 8,
    "shellfish" => 4,
    "peanuts" => 2,
    "eggs" => 1,
)

allergic_to(score, allergen) = score & allergens[allergen] != 0

allergy_list(score) = Set([allergen for allergen in keys(allergens) if allergic_to(score, allergen)])
