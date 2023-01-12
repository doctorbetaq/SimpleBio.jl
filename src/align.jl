import BioSequences, BioAlignments

using BioSequences, BioAlignments

"""
    nAlign(type::Int64, s1::String, s2::String)
Alignment of nucleotides (DNA or RNA) by default gap_open = -5, gap_extend = -1 (see BioAlignments.jl for details.).
parameter for type of sequence
    1 => DNA
    2 => RNA

"""
function nAlign(type::Int64, s1::String, s2::String)
    scoremodel = AffineGapScoreModel(EDNAFULL, gap_open=-5, gap_extend=-1)
    if type == 1
        s1, s2 = LongDNA{4}(s1), LongDNA{4}(s2)
    elseif type == 2
        s1, s2 = LongRNA{4}(s1), LongRNA{4}(s2)
    else
        error("please enter 1 for DNA and 2 for RNA alignment!")
    end
    res = pairalign(GlobalAlignment(), s1, s2, scoremodel)
    return alignment(res)
end

typeof(nAlign(1, "GAATTC", "GAATTC"))

"""
    nAlign(s1, s2, g_o, g_e)
Alignment of nucleotides (DNA or RNA) with type-in gap_open and gap_extend values. 
(see BioAlignments.jl for details.)

"""
function nAlign(type, s1, s2, g_o, g_e)
    scoremodel = AffineGapScoreModel(EDNAFULL, gap_open=g_o, gap_extend=g_e)
    if type == 1
        s1, s2 = LongDNA{4}(s1), LongDNA{4}(s2)
    elseif type == 2
        s1, s2 = LongRNA{4}(s1), LongRNA{4}(s2)
    end
    res = pairalign(GlobalAlignment(), s1, s2, scoremodel)
    return alignment(res)
end


nAlign(1,"GAATTA", "GAATTG", -5, -1)

"""
    aAlign(s1, s2)
Alignment of amino acid by default gap_open = -5, gap_extend = -1 
(see BioAlignments.jl for details.)

"""
function aAlign(s1::String, s2::String)
    scoremodel = AffineGapScoreModel(BLOSUM62, gap_open=-5, gap_extend=-1)
    s1, s2 = LongAA(s1), LongAA(s2)
    res = pairalign(GlobalAlignment(), s1, s2, scoremodel)
    return alignment(res)
end
typeof(aAlign("KYGRRRKKRGC", "KYGRRRGGGGKKRGC"))


"""
    aAlign(s1, s2, g_o, g_e)
Alignment of nucleotides (DNA or RNA) with type-in gap_open and gap_extend values. 
(see BioAlignments.jl for details.)

"""
function aAlign(s1, s2, g_o, g_e)
    scoremodel = AffineGapScoreModel(BLOSUM62, gap_open=g_o, gap_extend=g_e)
    s1, s2 = LongAA(s1), LongAA(s2)
    res = pairalign(GlobalAlignment(), s1, s2, scoremodel)
    return alignment(res)
end

# aAlign("KYGRRRKKRGC", "KYGRRRGGGGKKRGC", -10, -1)
