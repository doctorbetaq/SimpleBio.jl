"""
    SimpleBio.jl 
    --biological sequences in simple text way!
    Package developed by doctorbetaq.
!!This package is currently under development and testing , it is not ready for production.!!

    =========
    Features:
    =========
+ Sequence identification for DNA or RNA. (IsDNA, IsRNA functions)
+ Work with nucleotides:
    *Transcription (xTranscript) for transcription of DNA to RNA (xTranscript for DNA with nucleobase not ATCG.)
    *Reverse-compliment sequence using DNArc and RNArc functions.
    *Retro-Transcription of RNA to DNA using RTanscript function.
    *RandSeq function to generate DNA, RNA or amino acid chains.
    
+ Sequence alignment with nAlign(DNA or RNA) and aAlign (for amino acid sequences). 
    (powered by BioAlignments.jl and BioSequences.jl)
+ outputs are text String that can be used in the further processing!
"""
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
