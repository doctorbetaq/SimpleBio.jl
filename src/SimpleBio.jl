module SimpleBio


    export 
        #seqidentiy
            IsDNA,
            IsRNA,

        #nucleotidetool
            Transcript,
            xTranscript,
            DNArc,
            RNArc,
            RTanscript, 
            RandSeq,
        
        #alignment
            nAlign,
            aAlign

    import
        BioSequences,
        BioAlignments,
        Random
    using
        BioSequences, 
        BioAlignments,
        Random


    include("align.jl")
    include("seqidentiy.jl")
    include("nucleotidetool.jl")

end # module SimpleBio
