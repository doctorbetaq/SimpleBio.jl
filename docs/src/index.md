# SimpleBio.jl
[![license](https://img.shields.io/github/license/doctorbetaq/SimpleBio.jl?style=flat-square)](https://github.com/doctorbetaq/SimpleBio.jl/blob/main/LICENSE)
[![build](https://img.shields.io/circleci/build/github/doctorbetaq/SimpleBio.jl/main?style=flat-square&logo=CircleCI)](https://app.circleci.com/pipelines/github/doctorbetaq/SimpleBio.jl?branch=main)
![CodeCov](https://img.shields.io/codecov/c/github/doctorbetaq/SimpleBIo.jl?style=flat-square&logo=Codecov)
[![docs](https://img.shields.io/badge/docs-dev-blue?style=flat-square)](https://doctorbetaq.github.io/SimpleBio.jl/dev/)
[![docs](https://img.shields.io/badge/docs-stable-blue?style=flat-square)](https://doctorbetaq.github.io/SimpleBio.jl/stable/)


Welcome to SimpleBio.jl --work with biological sequences in simple text way!

## Features

#### 1. Sequence identification for DNA or RNA by isdna, isrna functions.
#### 2. Work with nucleotides:
+ Function transcript (xtranscript) for transcription of DNA to RNA (xtranscript for DNA with nucleobase not ATCG.)
+ Reverse-compliment sequence using DNArc and RNArc functions.
+ Retro-Transcription of RNA to DNA using RTanscript function.
+ Function RandSeq for generating DNA, RNA or amino acid chains.
+ Use the tranlatedna function for translation of dna sequence (also can enter RNA sequence if needed) to amino acid sequence.
    
#### 3. Sequence alignment with nalign (DNA or RNA) and aalign (for amino acid sequences). 
#### 4. Outputs are text String that can be used in the further processing!

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
