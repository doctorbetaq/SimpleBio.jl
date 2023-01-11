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
        
        #alignment
            nAlign,
            aAlign

    import
        BioSequences,
        BioAlignments
    using
        BioSequences, 
        BioAlignments


    include("align.jl")
    include("seqidentiy.jl")
    include("nucleotidetool.jl")

end # module SimpleBio
