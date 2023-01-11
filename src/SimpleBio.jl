# __precompile__()

module SimpleBio

    export 
    #seqidentiy
        IsDNA,
        IsRNA


    using
    BioSequences, 
    BioAlignments


    include("seqidentiy.jl")

end # module SimpleBio