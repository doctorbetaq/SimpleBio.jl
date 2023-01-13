"""
    SimpleBio.jl 
    --biological sequences in simple text way!
    Package developed by doctorbetaq.
!!This package is currently under development and testing , it is not ready for production.!!

    =========
    Features:
    =========
+ Sequence identification for DNA or RNA. (isdna, isrna functions)
+ Work with nucleotides:
    *transcript (xtranscript) for transcription of DNA to RNA (xtranscript for DNA with nucleobase not ATCG.)
    *Reverse-compliment sequence using DNArc and RNArc functions.
    *Retro-transcription of RNA to DNA using RTanscript function.
    *randseq function to generate DNA, RNA or amino acid chains.
    
+ Sequence alignment with nalign(DNA or RNA) and aalign (for amino acid sequences). 
    (powered by BioAlignments.jl and BioSequences.jl)
+ outputs are text String that can be used in the further processing!
"""

module SimpleBio

    
    export 
        #seqidentiy
            isdna,
            isrna,

        #nucleotidetool
            transcript,
            xtranscript,
            DNArc,
            RNArc,
            RTanscript, 
            randseq,
        
        #alignment
            nalign,
            aalign

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
