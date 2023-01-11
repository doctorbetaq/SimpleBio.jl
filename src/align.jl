import BioSequences, BioAlignments

using BioSequences, BioAlignments

"""
    nAlign(s1, s2)
Alignment of nucleotides (DNA or RNA) by default gap_open = -5, gap_extend = -1 
(see BioAlignments.jl for details.)

"""
function nAlign(s1::String, s2::String)
    scoremodel = AffineGapScoreModel(EDNAFULL, gap_open=-5, gap_extend=-1)
    s1, s2 = LongDNA{4}(s1), LongDNA{4}(s2)
    res = pairalign(GlobalAlignment(), s1, s2, scoremodel)
    return alignment(res)
end

"""
    nAlign(s1, s2, g_o, g_e)
Alignment of nucleotides (DNA or RNA) with type-in gap_open and gap_extend values. 
(see BioAlignments.jl for details.)

"""
function nAlign(s1, s2, g_o, g_e)
    scoremodel = AffineGapScoreModel(EDNAFULL, gap_open=g_o, gap_extend=g_e)
    s1, s2 = LongDNA{4}(s1), LongDNA{4}(s2)
    res = pairalign(GlobalAlignment(), s1, s2, scoremodel)
    return alignment(res)
end


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
# aAlign("KYGRRRKKRGC", "KYGRRRGGGGKKRGC")


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