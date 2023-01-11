push!(LOAD_PATH,"../src/")
import Pkg
using Documenter
using BioToolsLite

makedocs(
    sitename = "BioToolsLite",
    format = Documenter.HTML(),
    modules = [BioToolsLite],
    pages = [
        "Home" => "index.md",
        "Identification" => "identify.md",
        "API references" => "references.md"
    ]
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
#=deploydocs(
    repo = "<repository url>"
)=#
