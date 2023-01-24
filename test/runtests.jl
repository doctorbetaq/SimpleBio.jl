using Test
using SimpleBio
using BioAlignments
using BioSequences

#set test variables
dnatest = "GAATTCGAATTC"
rnatest = "GUUAGUAAGGUC"
non = "KKYOOPKKYOOP"

@testset verbose = true "SimpleBio" begin
    @testset verbose = true "identify" begin
        @test isdna(dnatest) == true
        @test isdna(rnatest) == false
        @test isdna(non) == false
        @test isrna(dnatest) == false
        @test isrna(rnatest) == true
        @test isrna(non) == false
    end #test identify

    @testset verbose = true "nucleotidetools" begin
        @test transcript(dnatest) == "GAAUUCGAAUUC"
        @test xtranscript(dnatest) == "GAAUUCGAAUUC"
        @test DNArc(dnatest) == "GAATTCGAATTC"
        @test RNArc(rnatest) == "GACCUUACUAAC"
        @test RTranscript(rnatest) == "GTTAGTAAGGTC"
    end #test nucleotidetools

    DNAarr= ["DNA", "DNAs", "DNA nucleotides", "DNA chain", "dna", "dnas", "dna nucleotides", "dna chain"]
    RNAarr= ["RNA", "RNAs", "RNA nucleotides", "RNA chain", "rna", "rnas", "rna nucleotides", "rna chain"]  
    aminoacidarr= ["AminoAcid", "aminoacid", "amino acid", "peptide", "aa", "AA"]

@testset verbose = true "RandSeq-DNA" begin
    @testset "RandSeq-DNA-1" begin
        for n in DNAarr
            @test isdna(RandSeq(n, 10)) == true
        end
    end
    @testset verbose = true "RandSeq-DNA-2" begin  
        RNAarr= ["RNA", "RNAs", "RNA nucleotides", "RNA chain", "rna", "rnas", "rna nucleotides", "rna chain"]  
        for n in RNAarr
            @test isrna(RandSeq(n, 10)) == true
        end
    end
    @testset verbose = true "RandSeq-DNA-3" begin
        for n in aminoacidarr
            @test isdna(RandSeq(n, 10)) == false
        end
    end
end

@testset verbose = true "RandSeq-RNA" begin
    for n in DNAarr
        @test isdna(RandSeq(n, 10)) == true
    end
    for n in RNAarr
        @test isrna(RandSeq(n, 10)) == true
    end
    for n in aminoacidarr
        @test isrna(RandSeq(n, 10)) == false
    end
end
@testset verbose = true "10 rand seqs" begin
    @testset "10 rand dna" begin
        for o in DNAarr
            @test length(RandSeq(o, 10, 10)) == 10
        end
    end
    @testset verbose = true "10 rand rna" begin
        for o in RNAarr
        @test length(RandSeq(o, 10, 10)) == 10
        end
    end
    @testset verbose = true "10 rand aa" begin
        for o in aminoacidarr
        @test length(RandSeq(o, 10, 10)) == 10
        end
    end
end

@testset verbose = true "10 rand seqs arr out" begin
    DNAarr= ["DNA", "DNAs", "DNA nucleotides", "DNA chain", "dna", "dnas", "dna nucleotides", "dna chain"]
    RNAarr= ["RNA", "RNAs", "RNA nucleotides", "RNA chain", "rna", "rnas", "rna nucleotides", "rna chain"]  
    aminoacidarr= ["AminoAcid", "aminoacid", "amino acid", "peptide", "aa", "AA"]
    @testset  verbose = true "10 rand dna" begin
        for o in DNAarr
            @test length(RandSeq(1, o, 10, 10)) == 10
        end
    end
    @testset verbose = true "10 rand rna" begin
        for o in RNAarr
        @test length(RandSeq(1, o, 10, 10)) == 10
        end
    end
    @testset  verbose = true "10 rand aa" begin
        for o in aminoacidarr
        @test length(RandSeq(1, o, 10, 10)) == 10
        end
    end
end

@testset verbose = true "10 rand dna-rna dataframe" begin
    @test typeof(rand_dna_rna(10,10)) == DataFrame
end

alndna = nalign(1, "GAATTC", "GAATTC")
alnrna = nalign(2, "GAAUUC", "GAAUUC")
alndna2 = nalign(1, "GAATTC", "GAATTC", -5, -1)
alnrna2 = nalign(2, "GAAUUC", "GAAUUC", -5, -1)
alnaa = aalign("KYGRRRKKRGC", "KYGRRRGGGGKKRGC")
alnaa2 = aalign("KYGRRRKKRGC", "KYGRRRGGGGKKRGC", -10, -1)

@testset verbose = true "alignment" begin
    @test typeof(alndna) ==BioAlignments.PairwiseAlignment{BioSequences.LongSequence{BioSequences.DNAAlphabet{4}}, BioSequences.LongSequence{BioSequences.DNAAlphabet{4}}}
    @test typeof(alnrna) ==BioAlignments.PairwiseAlignment{BioSequences.LongSequence{BioSequences.RNAAlphabet{4}}, BioSequences.LongSequence{BioSequences.RNAAlphabet{4}}}
    @test typeof(alndna2) ==BioAlignments.PairwiseAlignment{BioSequences.LongSequence{BioSequences.DNAAlphabet{4}}, BioSequences.LongSequence{BioSequences.DNAAlphabet{4}}}
    @test typeof(alnrna2) ==BioAlignments.PairwiseAlignment{BioSequences.LongSequence{BioSequences.RNAAlphabet{4}}, BioSequences.LongSequence{BioSequences.RNAAlphabet{4}}}
    @test typeof(alnaa) == PairwiseAlignment{LongAA, LongAA}
    @test typeof(alnaa2) == PairwiseAlignment{LongAA, LongAA}
end


@testset verbose = true "translation to aa" begin
    dnaseq = "ATGGCCAAACTCGAAACCGTTACGCTGGGCAACATCGGCAAGGATGGCAAGCAGACGCTGGTGCTGAATCCGCGCGGTGTTAATCCGACCAATGGTGTGGCGAGTCTGAGTCAAGCGGGTGCCGTTCCAGCGCTGGAGAAACGTGTGACCGTTAGTGTGAGCCAGCCGAGTCGCAACCGCAAGAACTACAAGGTGCAAGTGAAGATTCAGAACCCAACCGCGTGCACCGCCAACGGTAGTTGCGATCCAAGCGTGACCCGCCAAGCGTACGCCGATGTTACCTTCAGCTTCACCCAGTACAGCACCGACGAAGAGCGCGCGTTTGTTCGCACCGAACTGGCCGCGCTGCTGGCGAGTCCACTGCTGATCGATGCGATTGACCAGCTGAACCCAGCCTAC"
    @test translatedna(1,dnaseq) == "MAKLETVTLGNIGKDGKQTLVLNPRGVNPTNGVASLSQAGAVPALEKRVTVSVSQPSRNRKNYKVQVKIQNPTACTANGSCDPSVTRQAYADVTFSFTQYSTDEERAFVRTELAALLASPLLIDAIDQLNPAY"
    dna2="ATGGCCAAACTCGAAACCGTTACGCTGGGCAACATCGGCAAGGAT"
    @test translatedna(dna2) =="Met-Ala-Lys-Leu-Glu-Thr-Val-Thr-Leu-Gly-Asn-Ile-Gly-Lys-Asp"
    @test translatedna(1, dna2) == "MAKLETVTLGNIGKD"
    rna2 = "AUGGCCAAACUCGAAACCGUUACGCUGGGCAACAUCGGCAAGGAU"
    @test translatedna(rna2) =="Met-Ala-Lys-Leu-Glu-Thr-Val-Thr-Leu-Gly-Asn-Ile-Gly-Lys-Asp"
    @test translatedna(1, rna2) == "MAKLETVTLGNIGKD"

end

end #test SimpleBio



