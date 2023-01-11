# include("seqidentiy.jl")


"""
    Transcript(x::String)
Transcription of the imput DNA equence.
This function only allow DNA sequence with A, T, C, G bases.
If there are other kind of base in the DNA sequence, consider using xTranscript(x::String)

"""
function Transcript(x::String)
    seq = uppercase(x)
    if IsDNA(seq) == true
        seq2 = replace(seq, 'T' => 'U')
        return seq2
    else
        error("Please enter a DNA sequence!")
    end
end

"""
    xTranscript(x::String)
Transcription of the imput DNA equence.
This function allow DNA sequences with bases not included in A, T, C, G.
"""
function xTranscript(x::String)
    seq = uppercase(x)
    if IsDNA(seq) == false
        @warn "The sequence contains unknown nucleobases!"
    end
    return replace(seq, 'T'=>'U')
end

# xTranscript("GAAT-TC")

"""
    DNArc(x::String)
This is the function for generating a reverse-compliment sequence to the entered sequence in string type.
"""
function DNArc(x::String)
    dna1 = uppercase(x)
    dna2 = []
    dna1c = [car for car in dna1]
    if IsDNA(dna1) == false
        @warn "The sequence contains unknown nucleobases!"
    end
    for car in dna1c
        if car == 'A'
            push!(dna2, 'T')
        elseif  car == 'T' 
            push!(dna2, 'A')
        elseif  car == 'C'
            push!(dna2, 'G')
        elseif  car == 'G'
            push!(dna2, 'C')
        else
            push!(dna2, car)
        end
    end
    reverse(join(dna2))
end

# DNArc("AAGGG")

"""
    RNArc(x::String)
This is the function for generating a reverse-compliment sequence to the entered sequence in string type.
"""
function RNArc(x::String)
    rna1 = uppercase(x)
    rna2 = []
    rna1c = [car for car in rna1]
    if IsRNA(rna1) == false
        @warn "The sequence contains unknown nucleobases!"
    end
    for car in rna1c
        if car == 'A'
            push!(rna2, 'U')
        elseif  car == 'U' 
            push!(rna2, 'A')
        elseif  car == 'C'
            push!(rna2, 'G')
        elseif  car == 'G'
            push!(rna2, 'C')
        else
            push!(rna2, car)
        end
    end
    reverse(join(rna2))
end
# RNArc("UUUGGG")


"""
    RTanscript(x::String)
Generate the retro transcription of the entered sequence in string type.
"""
function RTanscript(x::String)
    rna1 = uppercase(x)
    rna1c = [n for n in rna1]
    aucg = ['A', 'U', 'C', 'G']
    for n in rna1c
        if n ∉ aucg
            error("This is not a RNA sequence!")
        end
    end
    replace(rna1, 'U'=>'T')
end