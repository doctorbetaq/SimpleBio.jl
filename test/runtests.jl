using Test
using SimpleBio
using BioAlignments
using BioSequences

dnatest = "GAATTCGAATTC"
rnatest = "GUUAGUAAGGUC"
non = "KKYOOPKKYOOP"

@testset verbose = true "SimpleBio" begin
    @testset "identify" begin
        @test IsDNA(dnatest) == true
        @test IsDNA(rnatest) == false
        @test IsDNA(non) == false
        @test IsRNA(dnatest) == false
        @test IsRNA(rnatest) == true
        @test IsRNA(non) == false
    end #test identify

    @testset "nucleotidetools" begin
        @test Transcript(dnatest) == "GAAUUCGAAUUC"
        @test xTranscript(dnatest) == "GAAUUCGAAUUC"
        @test DNArc(dnatest) == "GAATTCGAATTC"
        @test RNArc(rnatest) == "GACCUUACUAAC"
        @test RTanscript(rnatest) == "GTTAGTAAGGTC"
    end #test nucleotidetools

    DNAarr= ["DNA","DNAs", "DNA nucleotides", "DNA chain"]
    RNAarr= ["RNA", "RNAs", "RNA nucleotides", "RNA chain"]
    aminoacidarr= ["AminoAcid", "aminoacid", "amino acid", "peptide", "aa", "AA"]

# @testset "RandomDNA" begin
    @testset "RandSeq-DNA-1" begin
        for n in DNAarr
            @test IsDNA(RandSeq(n, 10)) == true
        end
    end
    @testset "RandSeq-DNA-2" begin  
        RNAarr= ["RNA", "RNAs", "RNA nucleotides", "RNA chain"]  
        for n in RNAarr
            @test IsRNA(RandSeq(n, 10)) == true
        end
    end
    @testset "RandSeq-DNA-3" begin
        for n in aminoacidarr
            @test IsDNA(RandSeq(n, 10)) == false
        end
    end
# end

@testset "RandSeq-RNA" begin
    for n in DNAarr
        @test IsDNA(RandSeq(n, 10)) == true
    end
    for n in RNAarr
        @test IsRNA(RandSeq(n, 10)) == true
    end
    for n in aminoacidarr
        @test IsRNA(RandSeq(n, 10)) == false
    end
end



alndna = nAlign(1, "GAATTC", "GAATTC")
alnrna = nAlign(2, "GAAUUC", "GAAUUC")
alndna2 = nAlign(1, "GAATTC", "GAATTC", -5, -1)
alnrna2 = nAlign(2, "GAAUUC", "GAAUUC", -5, -1)
alnaa = aAlign("KYGRRRKKRGC", "KYGRRRGGGGKKRGC")
alnaa2 = aAlign("KYGRRRKKRGC", "KYGRRRGGGGKKRGC", -10, -1)

@testset "alignment" begin
    @test typeof(alndna) ==BioAlignments.PairwiseAlignment{BioSequences.LongSequence{BioSequences.DNAAlphabet{4}}, BioSequences.LongSequence{BioSequences.DNAAlphabet{4}}}
    @test typeof(alnrna) ==BioAlignments.PairwiseAlignment{BioSequences.LongSequence{BioSequences.RNAAlphabet{4}}, BioSequences.LongSequence{BioSequences.RNAAlphabet{4}}}
    @test typeof(alndna2) ==BioAlignments.PairwiseAlignment{BioSequences.LongSequence{BioSequences.DNAAlphabet{4}}, BioSequences.LongSequence{BioSequences.DNAAlphabet{4}}}
    @test typeof(alnrna2) ==BioAlignments.PairwiseAlignment{BioSequences.LongSequence{BioSequences.RNAAlphabet{4}}, BioSequences.LongSequence{BioSequences.RNAAlphabet{4}}}
    @test typeof(alnaa) == PairwiseAlignment{LongAA, LongAA}
    @test typeof(alnaa2) == PairwiseAlignment{LongAA, LongAA}
end

end #test SimpleBio