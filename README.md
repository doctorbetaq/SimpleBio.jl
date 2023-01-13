# SimpleBio.jl
[![license](https://img.shields.io/github/license/doctorbetaq/SimpleBio.jl?style=flat-square)](https://github.com/doctorbetaq/SimpleBio.jl/blob/main/LICENSE)
[![build](https://img.shields.io/circleci/build/github/doctorbetaq/SimpleBio.jl/main?style=flat-square)](https://app.circleci.com/pipelines/github/doctorbetaq/SimpleBio.jl)
[![docs](https://img.shields.io/badge/docs-0.1.0-blue?style=flat-square)](https://doctorbetaq.github.io/SimpleBio.jl/)

--biological sequences in simple text way!
  
Package developed by doctorbetaq.

## Features
#### 1. Sequence identification for DNA or RNA. (isdna, isrna functions)
#### 2. Work with nucleotides:
+ transcript (xtranscript) for transcription of DNA to RNA (xtranscript for DNA with nucleobase not ATCG.)
+ Reverse-compliment sequence using DNArc and RNArc functions.
+ Retro-Transcription of RNA to DNA using RTanscript function.
+ randseq function to generate DNA, RNA or amino acid chains.
    
#### 3. Sequence alignment with nalign(DNA or RNA) and aalign (for amino acid sequences). 
#### 4. outputs are text String that can be used in the further processing!


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
