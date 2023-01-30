using Test
using SimpleBio
using BioAlignments
using BioSequences
using DataFrames

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

@testset verbose = true "primer design tools" begin
    @testset verbose = true "dnatm" begin
        testdnatm = "GGAATTCC"
        tm_result = dnatm(testdnatm)
        @test typeof(tm_result) == DataFrame
        @test tm_result[1,1] == testdnatm
        @test tm_result[1,2] == 24
    end #dnatm

    @testset verbose = true "step_gen" begin
        teststep = "ATCG"
        stepresult = step_gen(teststep)
        @test length(stepresult) == length(teststep)
        @test stepresult[1] =="A"
        @test stepresult[2] =="AT"
        @test stepresult[3] =="ATC"
        @test stepresult[4] =="ATCG"
    end #step_gen

    @testset verbose = true "step_from_end" begin
        teststep = "ATCG"
        stepresult = step_from_end(teststep)
        @test length(stepresult) == length(teststep)-1
        @test stepresult[1] =="CG"
        @test stepresult[2] =="TCG"
        @test stepresult[3] =="ATCG"
    end #step_gen

    @testset verbose = true "multidnatm" begin
        testarr = ["GATC", "GAATTC", "GGAATTCC"]
        result = multidnatm(testarr)
        @test (result[1,1], result[2,1], result[3,1]) == (testarr[1], testarr[2], testarr[3])
        @test (result[1,2], result[2,2], result[3,2]) == (12, 16, 24)
    end

    @testset verbose = true "fwd primers" begin
        QB = "atggcaaaattagagactgttactttaggtaacat"
        fwd = fwd_primers(QB)
        typeof(fwd) == DataFrame
        arr =[]
        arrtm = []
        for n in 1:15
            push!(arr, fwd[n,1])
            push!(arrtm, fwd[n,2])
        end
        e = length(arr)
        for n in 1:e
            @test dnatm(arr[n])[1,2] == arrtm[n]
        end

        fwd52 = fwd_primers(QB, 52, 53)
        @test typeof(fwd52) == DataFrame
        @test fwd52[1,1] == "ATGGCAAAATTAGAGACTGTTAC"
        @test 52<=fwd52[1,2] <=53
    end

    @testset verbose = true "rev primers" begin
        QB = "atggcaaaattagagactgttactttaggtaacat"
        rev = rev_primers(QB)
        typeof(rev) == DataFrame
        arr =[]
        arrtm = []
        for n in 1:15
            push!(arr, rev[n,1])
            push!(arrtm, rev[n,2])

        end
        e = length(arr)
        for n in 1:e
            @test dnatm(arr[n])[1,2] == arrtm[n]
        end
        rev52 = rev_primers(QB, 52, 53)
        @test typeof(rev52) == DataFrame
        @test rev52[1,1] == "ATGTTACCTAAAGTAACAGTCTC"
        @test 52<=rev52[1,2] <=53
    end
end #primer design tools

end #test SimpleBio
