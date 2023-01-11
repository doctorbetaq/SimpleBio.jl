# __precompile__()

module BioToolsLite

    export 
    #seqidentiy
        IsDNA,
        IsRNA


    using
    BioSequences, 
    BioAlignments


    include("seqidentiy.jl")

end # module BioToolsLite