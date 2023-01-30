"""
    dnatm(dnaseq::String)
Calculate the melting temperature of imput DNA sequence.
The calculation is assume the annealing occurs under the standard conditions of 50 nM primer, 50 mM Na+, and pH 7.0.
"""
function dnatm(dnaseq::String)
    dna = [base for base in uppercase(dnaseq)]
    len = length(dnaseq)
    a = 0
    t = 0
    c = 0
    g = 0
    for base in dna
        if base == 'A'
            a += 1
        elseif  base == 'T'
            t += 1
        elseif  base == 'C'
            c += 1
        elseif  base == 'G'
            g += 1
        else
            error("Inputs only support regular DNAs with ATCG bases!")
        end
    end
        
    if len <= 13
        tm = (a+t)*2+(c+g)*4
    elseif 13<len<=20
        tm = 64.9+41*(c+g-16.4)/(a+t+c+g)
    else
        tm = 0.41*((g+c)/len)-675/len+81.5
    end

    tm2 = round(tm*10)/10
    DataFrame("Input DNA sequence (5'-3')" => [dnaseq], "Tm (°C)" => [tm2])
end

# seq = "GAATTCGAACCT"

"""
    step_gen(seq::String)
Generate a vector that contains stepwise increasing characters from the first character to the end.
"""
function step_gen(seq::String)
    dnas_array = [] 
    n = 1
    while n <= length(seq)
        push!(dnas_array, seq[1:n])
        n+=1
    end
    return dnas_array
end
# step_gen(seq)
# seq

"""
    step_from_end(seq::String)
The reverse version of step_gen()
"""
function step_from_end(seq::String)
    dnas_array = [] 
    n = 1
    while n < length(seq)
        push!(dnas_array, seq[end-n:end])
        n+=1
    end
    return dnas_array
end
# step_from_end(seq)

"""
    multidnatm(dnas_array::Vector)
Generate a dataframe that shows all the Tm of sequences in the input array.
""" 
function multidnatm(dnas_array::Vector)
    tm_array = []
    for dna in dnas_array
        push!(tm_array, dnatm(dna)[1,2])
    end
    data = DataFrame("DNA sequences  (5'-3')"=> dnas_array, "Tm" => tm_array)
    data
end
# multidnatm(step_gen(seq))


# seq="ATGGATTCCAAGGTTAACCGAATTCGGCAAGGAACCTTCCAAGGCCAAATGGCCAATAAGGTTAGCTAGCCTAGCCATGCAGTACCAGTTAA"

"""
    fwd_primers(seq::String)
Auto generation of foward primer candidates of an input sequence.
"""
function fwd_primers(seq::String)
    seq_u = uppercase(seq)
    if isdna(seq_u) == falses
        error("Please enter dna sequence only contain ATCG!")
    end
    gen_arr = step_gen(seq_u)
    testtm = multidnatm(gen_arr)
    n=1
    tmnew=[]
    while n < length(seq)
        if 45 <= testtm[n,2] <= 65
            push!(tmnew, testtm[n,1])
        end
        n+=1
    end
    candidates = multidnatm(tmnew)
    return candidates
end
# fwd_primers(seq)

"""
    fwd_primers(seq::String, tm_low::Int64, tm_high::Int64)
Auto generation of foward primer candidates of an input sequence in setted Tm range.
"""
function fwd_primers(seq::String, tm_low::Int64, tm_high::Int64)
    seq_u = uppercase(seq)
    if isdna(seq_u) == falses
        error("Please enter dna sequence only contain ATCG!")
    end
    gen_arr = step_gen(seq_u)
    testtm = multidnatm(gen_arr)
    n=1
    tmnew=[]
    while n < length(seq)
        if tm_low <= testtm[n,2] <= tm_high
            push!(tmnew, testtm[n,1])
        end
        n+=1
    end
    candidates = multidnatm(tmnew)
    return candidates
end
# fwd_primers(seq, 52, 56)


"""
    rev_primers(seq::String)
Auto generation of foward primer candidates of an input sequence.
"""
function rev_primers(seq::String)
    seq_u = uppercase(seq)
    if isdna(seq_u) == falses
        error("Please enter dna sequence only contain ATCG!")
    end
    gen_arr = step_from_end(seq_u)
    testtm = multidnatm(gen_arr)
    n=1
    tmnew=[]
    while n < length(seq)
        if 45 <= testtm[n,2] <= 65
            push!(tmnew, DNArc(testtm[n,1]))
        end
        n+=1
    end
    candidates = multidnatm(tmnew)
    return candidates
end
# rev_primers(seq)

"""
    rev_primers(seq::String, tm_low::Int64, tm_high::Int64)
Auto generation of foward primer candidates of an input sequence in setted Tm range.
"""
function rev_primers(seq::String, tm_low::Int64, tm_high::Int64)
    seq_u = uppercase(seq)
    if isdna(seq_u) == falses
        error("Please enter dna sequence only contain ATCG!")
    end
    gen_arr = step_from_end(seq_u)
    testtm = multidnatm(gen_arr)
    n=1
    tmnew=[]
    while n < length(seq)
        if tm_low <= testtm[n,2] <= tm_high
            push!(tmnew, DNArc(testtm[n,1]))
        end
        n+=1
    end
    candidates = multidnatm(tmnew)
    return candidates
end
# rev_primers(seq, 52, 56)

# QB = "atggcaaaattagagactgttactttaggtaacatcgggaaagatggaaaacaaactctggtcctcaatccgcgtggggtaaatcccactaacggcgttgcctcgctttcacaagcgggtgcagttcctgcgctggagaagcgtgttaccgtttcggtatctcagccttctcgcaatcgtaagaactacaaggtccaggttaagatccagaacccgaccgcttgcactgcaaacggttcttgtgacccatccgttactcgccaggcgtatgctgacgtgaccttttcgttcacgcagtatagtaccgatgaggaacgagcttttgttcgtacagagcttgctgctctgctcgctagtcctctgctgatcgatgctattgatcagctgaacccagcgtat"
# rev_primers(QB, 52, 54)