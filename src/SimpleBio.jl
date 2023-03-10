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
    *Retro-transcription of RNA to DNA using RTranscript function.
    *RandSeq function to generate DNA, RNA or amino acid chains.
    
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
            RTranscript, 
            RandSeq,
            rand_dna_rna,
        
        #alignment
            nalign,
            aalign,
            
        #translation
            translatedna,

        #primer design
            dnatm,
            step_gen,
            step_from_end,
            multidnatm,
            fwd_primers,
            rev_primers
    import
        BioSequences,
        BioAlignments,
        Random,
        DataFrames
    using
        BioSequences, 
        BioAlignments,
        Random,
        DataFrames


    include("align.jl")
    include("seqidentiy.jl")
    include("nucleotidetool.jl")
    include("translation.jl")
    include("primer.jl")

end # module SimpleBio
