using Random
export RandSeq

"""
    transcript(x::String)
transcription of the imput DNA equence.
This function only allow DNA sequence with A, T, C, G bases.
If there are other kind of base in the DNA sequence, consider using xtranscript(x::String)

"""
function transcript(x::String)
    seq = uppercase(x)
    if isdna(seq) == true
        seq2 = replace(seq, 'T' => 'U')
        return seq2
    else
        error("Please enter a DNA sequence!")
    end
end

"""
    xtranscript(x::String)
transcription of the imput DNA equence.
This function allow DNA sequences with bases not included in A, T, C, G.
"""
function xtranscript(x::String)
    seq = uppercase(x)
    if isdna(seq) == false
        @warn "The sequence contains unknown nucleobases!"
    end
    return replace(seq, 'T'=>'U')
end

# xtranscript("GAAT-TC")

"""
    DNArc(x::String)
This is the function for generating a reverse-compliment sequence to the entered sequence in string type.
"""
function DNArc(x::String)
    dna1 = uppercase(x)
    dna2 = []
    dna1c = [car for car in dna1]
    if isdna(dna1) == false
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
    if isrna(rna1) == false
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
    RTranscript(x::String)
Generate the retro transcription of the entered sequence in string type.
"""
function RTranscript(x::String)
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

"""
    RandSeq(type::String, length::Int64)
Generate random sequence of select type (RNA, DNA or aminoacid).
Acceptable parameters of type: 
DNA: ["DNA", "DNAs", "DNA nucleotides", "DNA chain", "dna", "dnas", "dna nucleotides", "dna chain"]
RNA: ["RNA", "RNAs", "RNA nucleotides", "RNA chain", "rna", "rnas", "rna nucleotides", "rna chain"]
amino acid: ["AminoAcid", "aminoacid", "amino acid", "peptide", "aa", "AA"]
"""
function RandSeq(type::String, length::Int64)
    if type in ["DNA", "DNAs", "DNA nucleotides", "DNA chain", "dna", "dnas", "dna nucleotides", "dna chain"]
        seqout = join(rand(['A','T','C','G'], length))
        println("""
        Generated one random RNA sequence:
        sequence: 5'-$seqout-3'
        """)
    elseif type in ["RNA", "RNAs", "RNA nucleotides", "RNA chain", "rna", "rnas", "rna nucleotides", "rna chain"]
        seqout = join(rand(['A','U','C','G'], length))
        println("""
        Generated one random DNA sequence:
        sequence: 5'-$seqout-3'
        """)
    elseif type in ["AminoAcid", "aminoacid", "amino acid", "peptide", "aa", "AA"]
        seqout = join(rand(['A','R','N','D','C','Q','E','G','H','I','L','K','M','F','P','S','T','W','Y','V'], length))
        println("""
        Generated one random amino acid peptide chain sequence:
        sequence: 5'-$seqout-3'
        """)
    end
    return seqout
end


"""
    RandSeq(type::String, length::Int64, num::Int64)
Generate inputted numbers of random sequence of select type (RNA, DNA or aminoacid).
Acceptable parameters of type: 
DNA: ["DNA", "DNAs", "DNA nucleotides", "DNA chain", "dna", "dnas", "dna nucleotides", "dna chain"]
RNA: ["RNA", "RNAs", "RNA nucleotides", "RNA chain", "rna", "rnas", "rna nucleotides", "rna chain"]
amino acid: ["AminoAcid", "aminoacid", "amino acid", "peptide", "aa", "AA"]
"""
function RandSeq(type::String, length::Int64, num::Int64)
    x = 1
    out = []
    for x in 1:num
        if type in ["DNA", "DNAs", "DNA nucleotides", "DNA chain", "dna", "dnas", "dna nucleotides", "dna chain"]
            seqout = join(rand(['A','T','C','G'], length))
            push!(out, seqout)
            x+=1
        elseif type in ["RNA", "RNAs", "RNA nucleotides", "RNA chain", "rna", "rnas", "rna nucleotides", "rna chain"]
            seqout = join(rand(['A','U','C','G'], length))
            push!(out, seqout)
            x+=1
        elseif type in ["AminoAcid", "aminoacid", "amino acid", "peptide", "aa", "AA"]
            seqout = join(rand(['A','R','N','D','C','Q','E','G','H','I','L','K','M','F','P','S','T','W','Y','V'], length))
            push!(out, seqout)
            x+=1
        end
    end
    jo=join(out, "\n")
    println("""
        Generated $num random $type sequences:
        sequences (5'-3"): 
        $jo""")
        return out
end
typeof(RandSeq("DNA", 10, 10))
"""
    RandSeq(operator::Int64, type::String, length::Int64, num::Int64)
Generate inputted numbers of random sequence of select type (RNA, DNA or aminoacid).
operator = 1 to get array returned.
Acceptable parameters of type: 
DNA: ["DNA", "DNAs", "DNA nucleotides", "DNA chain"]
RNA: ["RNA", "RNAs", "RNA nucleotides", "RNA chain"]
amino acid: ["AminoAcid", "aminoacid", "amino acid", "peptide", "aa", "AA"]
"""
function RandSeq(operator::Int64, type::String, length::Int64, num::Int64)
    x = 1
    out = []
    for x in 1:num
        if type in ["DNA", "DNAs", "DNA nucleotides", "DNA chain",  "dna", "dnas", "dna nucleotides", "dna chain"]
            seqout = join(rand(['A','T','C','G'], length))
            push!(out, seqout)
            x+=1
        elseif type in ["RNA", "RNAs", "RNA nucleotides", "RNA chain",  "rna", "rnas", "rna nucleotides", "rna chain"]
            seqout = join(rand(['A','U','C','G'], length))
            push!(out, seqout)
            x+=1
        elseif type in ["AminoAcid", "aminoacid", "amino acid", "peptide", "aa", "AA"]
            seqout = join(rand(['A','R','N','D','C','Q','E','G','H','I','L','K','M','F','P','S','T','W','Y','V'], length))
            push!(out, seqout)
            x+=1
        end
    end
    jo=join(out, "\n")
    if operator == 1
        return out
    else
        println("""
        Generated $num random $type sequences:
        sequences (5'-3"): 
        $jo""")
        @warn "Type RandSeq(operator, type, length, number) with operator = 1 to get the array return!"
    end
end
# using DataFrames
# include("seqidentiy.jl")
"""
    rand_dna_rna(length::Int64, number::Int64)
Generate a dataframe of DNA sequences and transcripted RNAs with typed in length and number.
"""
function rand_dna_rna(length::Int64, number::Int64)
    dnas = RandSeq(1, "DNA", length, number)
    rnas = []
    for seq in dnas
        rseq = transcript(seq)
        push!(rnas, rseq)
    end
    data = DataFrame("DNAs" => dnas, "Transcription" => rnas)
    return data
end
typeof(rand_dna_rna(10,10))