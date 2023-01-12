# SimpleBio.jl
[![license](https://img.shields.io/github/license/doctorbetaq/SimpleBio.jl?style=flat-square)](https://github.com/doctorbetaq/SimpleBio.jl/blob/main/LICENSE)
[![build](https://img.shields.io/circleci/build/github/doctorbetaq/SimpleBio.jl/main?style=flat-square)](https://app.circleci.com/pipelines/github/doctorbetaq/SimpleBio.jl)
[![docs](https://img.shields.io/badge/docs-0.1.0-blue?style=flat-square)](https://doctorbetaq.github.io/SimpleBio.jl/)

--biological sequences in simple text way!
  
Package developed by doctorbetaq.
    
!!This package is currently under development and testing , it is not ready for production.!!



# Features:
+ Sequence identification for DNA or RNA. (IsDNA, IsRNA functions)
+ Work with nucleotides:
    *Transcription (xTranscript) for transcription of DNA to RNA (xTranscript for DNA with nucleobase not ATCG.)
    *Reverse-compliment sequence using DNArc and RNArc functions.
    *Retro-Transcription of RNA to DNA using RTanscript function.
    *RandSeq function to generate DNA, RNA or amino acid chains.
    
+ Sequence alignment with nAlign(DNA or RNA) and aAlign (for amino acid sequences). 
    (powered by BioAlignments.jl and BioSequences.jl)
+ outputs are text String that can be used in the further processing!
