# SimpleBio.jl
[![license](https://img.shields.io/github/license/doctorbetaq/SimpleBio.jl?style=flat-square)](https://github.com/doctorbetaq/SimpleBio.jl/blob/main/LICENSE)
[![build](https://img.shields.io/circleci/build/github/doctorbetaq/SimpleBio.jl/main?style=flat-square)](https://app.circleci.com/pipelines/github/doctorbetaq/SimpleBio.jl)
[![docs](https://img.shields.io/badge/docs-dev-blue?style=flat-square)](https://doctorbetaq.github.io/SimpleBio.jl/dev/)
[![docs](https://img.shields.io/badge/docs-stable-blue?style=flat-square)](https://doctorbetaq.github.io/SimpleBio.jl/stable/)


well come to SimpleBio.jl --biological sequences in simple text way!

## Features

+ Sequence identification for DNA or RNA. (isdna, isrna functions)
+ Work with nucleotides:
    + transcript (xtranscript) for transcription of DNA to RNA (xtranscript for DNA with nucleobase not ATCG.)
    + Reverse-compliment sequence using DNArc and RNArc functions.
    + Retro-transcription of RNA to DNA using RTanscript function.
    + randseq function to generate DNA, RNA or amino acid chains.
    + tranlatedna function for translation of dna sequence (also can enter RNA sequence if needed) to amino acid sequence.
+ Sequence alignment with nalign(DNA or RNA) and aalign (for amino acid sequences). 
    (powered by BioAlignments.jl and BioSequences.jl)
+ outputs are text String that can be used in the further processing!

## Install
To install SimpleBio, type ']' in REPL to enter Pkg mode and type:
```julia
add https://github.com/doctorbetaq/SimpleBio.jl
```

## Usage
To use SimpleBio, simply type in:
```julia
using SimpleBio
```