# include("seqidentiy.jl")
# include("nucleotidetool.jl")

dnaseq = "ATGGCCAAACTCGAAACCGTTACGCTGGGCAACATCGGCAAGGATGGCAAGCAGACGCTGGTGCTGAATCCGCGCGGTGTTAATCCGACCAATGGTGTGGCGAGTCTGAGTCAAGCGGGTGCCGTTCCAGCGCTGGAGAAACGTGTGACCGTTAGTGTGAGCCAGCCGAGTCGCAACCGCAAGAACTACAAGGTGCAAGTGAAGATTCAGAACCCAACCGCGTGCACCGCCAACGGTAGTTGCGATCCAAGCGTGACCCGCCAAGCGTACGCCGATGTTACCTTCAGCTTCACCCAGTACAGCACCGACGAAGAGCGCGCGTTTGTTCGCACCGAACTGGCCGCGCTGCTGGCGAGTCCACTGCTGATCGATGCGATTGACCAGCTGAACCCAGCCTAC"
codon = Dict(
    "TTT" => "Phe",
    "TTC" => "Phe",
    "TTA" => "Leu",
    "TTG" => "Leu",
    "CTT" => "Leu",
    "CTC" => "Leu",
    "CTA" => "Leu",
    "CTG" => "Leu",
    "ATT" => "Ile",
    "ATC" => "Ile",
    "ATA" => "Ile",
    "ATG" => "Met",
    "GTT" => "Val",
    "GTC" => "Val",
    "GTA" => "Val",
    "GTG" => "Val",

    "TCC" => "Ser",
    "TCT" => "Ser",
    "TCA" => "Ser",
    "TCG" => "Ser",
    "CCT" => "Pro",
    "CCC" => "Pro",
    "CCA" => "Pro",
    "CCG" => "Pro",
    "ACT" => "Thr",
    "ACC" => "Thr",
    "ACA" => "Thr",
    "ACG" => "Thr",
    "GCT" => "Ala",
    "GCC" => "Ala",
    "GCA" => "Ala",
    "GCG" => "Ala",

    "TAT" => "Tyr",
    "TAC" => "Tyr",
    "TAA" => "**",
    "TAG" => "**",
    "CAT" => "His",
    "CAC" => "His",
    "CAA" => "Gln",
    "CAG" => "Gln",
    "AAT" => "Asn",
    "AAC" => "Asn",
    "AAA" => "Lys",
    "AAG" => "Lys",
    "GAT" => "Asp",
    "GAC" => "Asp",
    "GAA" => "Glu",
    "GAG" => "Glu",

    "TGT" => "Cys",
    "TGC" => "Cys",
    "TGA" => "**",
    "TGG" => "Trp",
    "CGT" => "Arg",
    "CGC" => "Arg",
    "CGA" => "Arg",
    "CGG" => "Arg",
    "AGT" => "Ser",
    "AGC" => "Ser",
    "AGA" => "Arg",
    "AGG" => "Arg",
    "GGT" => "Gly",
    "GGC" => "Gly",
    "GGA" => "Gly",
    "GGG" => "Gly",
)

codon1 = Dict(
    "TTT" => "F",
    "TTC" => "F",
    "TTA" => "L",
    "TTG" => "L",
    "CTT" => "L",
    "CTC" => "L",
    "CTA" => "L",
    "CTG" => "L",
    "ATT" => "I",
    "ATC" => "I",
    "ATA" => "I",
    "ATG" => "M",
    "GTT" => "V",
    "GTC" => "V",
    "GTA" => "V",
    "GTG" => "V",

    "TCC" => "S",
    "TCT" => "S",
    "TCA" => "S",
    "TCG" => "S",
    "CCT" => "P",
    "CCC" => "P",
    "CCA" => "P",
    "CCG" => "P",
    "ACT" => "T",
    "ACC" => "T",
    "ACA" => "T",
    "ACG" => "T",
    "GCT" => "A",
    "GCC" => "A",
    "GCA" => "A",
    "GCG" => "A",

    "TAT" => "Y",
    "TAC" => "Y",
    "TAA" => "**",
    "TAG" => "**",
    "CAT" => "H",
    "CAC" => "H",
    "CAA" => "Q",
    "CAG" => "Q",
    "AAT" => "N",
    "AAC" => "N",
    "AAA" => "K",
    "AAG" => "K",
    "GAT" => "D",
    "GAC" => "D",
    "GAA" => "E",
    "GAG" => "E",

    "TGT" => "C",
    "TGC" => "C",
    "TGA" => "**",
    "TGG" => "W",
    "CGT" => "R",
    "CGC" => "R",
    "CGA" => "R",
    "CGG" => "R",
    "AGT" => "S",
    "AGC" => "S",
    "AGA" => "R",
    "AGG" => "R",
    "GGT" => "G",
    "GGC" => "G",
    "GGA" => "G",
    "GGG" => "G",
)

"""
    translatedna(x::String)
Return the translation result of the input DNA or RNA sequence in 3-letter amino acid codes.
"""
function translatedna(x::String)
    ux = uppercase(x)
    if isdna(ux) == false
        ux2 = RTranscript(ux)
    else
        ux2 = ux
    end
    n=3
    dna_array = [ux2[i:i+n-1] for i in 1:3:length(ux2)-(n-1)]
    translated = []

    for c in dna_array
        push!(translated, codon[c])
    end

    if translated[1] != "Met"
        error("Please enter DNA sequence start with start codon ATG or AUG!")
    end

    return join(translated, -)
end

# translatedna(1,dnaseq) == "MAKLETVTLGNIGKDGKQTLVLNPRGVNPTNGVASLSQAGAVPALEKRVTVSVSQPSRNRKNYKVQVKIQNPTACTANGSCDPSVTRQAYADVTFSFTQYSTDEERAFVRTELAALLASPLLIDAIDQLNPAY"

"""
    translatedna(operator::Int64, x::String)
Return the translation result of the input DNA or RNA sequence in 1-letter amino acid codes while operator enter =1.
"""
function translatedna(operator::Int64, x::String)
    ux = uppercase(x)
    if isdna(ux) == false
        ux2 = RTranscript(ux)
    else
        ux2 = ux
    end
    if operator !=1
        error("Please enter 1 in the operator for single letter expression stype amino acids!")
    end
    

    n=3
    dna_array = [ux2[i:i+n-1] for i in 1:3:length(ux2)-(n-1)]
    translated = []

    for c in dna_array
        push!(translated, codon1[c])
    end

    if translated[1] != "M"
        error("Please enter DNA sequence start with start codon ATG or AUG!")
    end

    return join(translated)
end

dna2="ATGGCCAAACTCGAAACCGTTACGCTGGGCAACATCGGCAAGGAT"
rna2 = "AUGGCCAAACUCGAAACCGUUACGCUGGGCAACAUCGGCAAGGAU"
translatedna(rna2)
translatedna(1, rna2)

