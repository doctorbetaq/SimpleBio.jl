push!(LOAD_PATH,"../src/")

using Documenter
using ExBioHacker

DocMeta.setdocmeta!(ExBioHacker, :DocTestSetup, :(using ExBioHacker); recursive=true)

makedocs(
    sitename = "ExBioHacker",
    format = Documenter.HTML(),
    modules = [ExBioHacker],
    pages = [
        "ExBioHacker" => "index.md",
        "Work with Nucleotides" =>"nts.md",
        "Sequence Alignment" => "ali.md",
        "Primer Design" => "primer.md",
    ],
    checkdocs = :all,
        
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
deploydocs(
    repo = "github.com/doctorbetaq/ExBioHacker.jl.git",
)
