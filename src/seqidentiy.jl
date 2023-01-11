"""
    IsDNA()
Identify is a sequence is DNA sequence in string type.
"""
function IsDNA(x::String)
    seq = uppercase(x)
    dna = ['A','T','C','G']
    tru = []
    for b in seq
        if b in dna
            push!(tru, true)
        else
            push!(tru,false)
        end
    end
    
    if false in tru
#        println("This in not a DNA sequence or having unknown bases!")
        return false
    else
#        println("this is a DNA sequence.")
        return true
    end
end

"""
    IsRNA
Identify is a sequence is RNA sequence in string type.
"""
function IsRNA(x::String)
    
    seq = uppercase(x)
    rna = ['A','U','C','G']
    tru = []
    for b in seq
        if b in rna
            push!(tru, true)
        else
            push!(tru,false)
        end
    end
    
    if false in tru
#        println("This in not an RNA sequence or having unknown bases!")
        return false
    else
#        println("this is an RNA sequence.")
        return true
    end
end
