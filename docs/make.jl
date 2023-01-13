push!(LOAD_PATH,"../src/")

using Documenter
using SimpleBio

DocMeta.setdocmeta!(SimpleBio, :DocTestSetup, :(using SimpleBio); recursive=true)

makedocs(
    sitename = "SimpleBio",
    format = Documenter.HTML(),
    modules = [SimpleBio],
    pages = [
        "SimpleBio" => "index.md",
        "Work with Nucleotides" =>"nts.md",
        "Sequence Alignment" => "ali.md",
        "API" => "api.md"
    ],
    checkdocs = :all,
        
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
deploydocs(
    repo = "github.com/doctorbetaq/SimpleBio.jl.git",
)
