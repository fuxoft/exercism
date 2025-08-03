allergens=["eggs","peanuts","shellfish","strawberries","tomatoes","chocolate","pollen","cats"]

function allergic_to(score, allergen)
    score & 2^(findfirst(==(allergen),allergens)-1) != 0
end

function allergy_list(score) :: Set{String}
    result = Set()
    for item in allergens
        if allergic_to(score,item)
            push!(result,item)
        end
    end
    return result
end
