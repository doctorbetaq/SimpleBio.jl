# SimpleBio.jl
![release](https://img.shields.io/github/v/release/doctorbetaq/SimpleBio.jl?include_prereleases&style=flat-square) 
[![license](https://img.shields.io/github/license/doctorbetaq/SimpleBio.jl?style=flat-square)](https://github.com/doctorbetaq/SimpleBio.jl/blob/main/LICENSE)
[![build](https://img.shields.io/circleci/build/github/doctorbetaq/SimpleBio.jl/main?style=flat-square&logo=CircleCI)](https://app.circleci.com/pipelines/github/doctorbetaq/SimpleBio.jl?branch=main)
[![CodeCov](https://img.shields.io/codecov/c/github/doctorbetaq/SimpleBIo.jl?style=flat-square&logo=Codecov)](https://app.codecov.io/gh/doctorbetaq/SimpleBio.jl?search=&trend=24%20hours)
[![docs](https://img.shields.io/badge/docs-dev-blue?style=flat-square)](https://doctorbetaq.github.io/SimpleBio.jl/dev/)
[![docs](https://img.shields.io/badge/docs-stable-blue?style=flat-square)](https://doctorbetaq.github.io/SimpleBio.jl/stable/)
[![DOI](https://zenodo.org/badge/587544290.svg)](https://zenodo.org/badge/latestdoi/587544290)
![Stars](https://img.shields.io/github/stars/doctorbetaq/SimpleBio.jl?style=social)

Work with biological sequences as simple as a text way!

## Features
#### 1. Sequence identification for DNA or RNA by isdna, isrna functions.
#### 2. Work with nucleotides:
+ Function transcript (xtranscript) for transcription of DNA to RNA (xtranscript for DNA with nucleobase not ATCG.)
+ Reverse-compliment sequence using DNArc and RNArc functions.
+ Retro-Transcription of RNA to DNA using RTanscript function.
+ Function RandSeq for generating DNA, RNA or amino acid chains. rand_dna_rna function to generate a dataframe for random DNAs and their transcription.
+ Use the tranlatedna function for translation of dna sequence (also can enter RNA sequence if needed) to amino acid sequence.
+ Primer design tools (in development)
#### 3. Sequence alignment with nalign (DNA or RNA) and aalign (for amino acid sequences). 
#### 4. Outputs are text String that can be used in the further processing!

## Tests
SimpleBio has been tested in macos, linux and windows environments with latest julia stable release.

[![test](https://img.shields.io/github/actions/workflow/status/doctorbetaq/SimpleBio.jl/test.yml?style=flat-square)](https://github.com/doctorbetaq/SimpleBio.jl/actions/workflows/test.yml)

## Install
To install SimpleBio, type ']' in REPL to enter Pkg mode and type:
```julia
add SimpleBio
```

## Usage
To use SimpleBio, simply type in:
```julia
using SimpleBio
```
