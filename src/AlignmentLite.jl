# __precompile__()

module AlignmentLite

    export 
    #seqidentiy
        IsDNA,
        IsRNA


    using
    BioSequences, 
    BioAlignments


    include("seqidentiy.jl")

end # module Alignmentlite