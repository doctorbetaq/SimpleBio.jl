using Test
using SimpleBio

dnatest = "GAATTCGAATTC"
rnatest = "GUUAGUUC"
non = "KKYOOPKKYOOP"

@testset "identify" begin
    @test IsDNA(dnatest) == true
    @test IsDNA(rnatest) == false
    @test IsDNA(non) == false
    @test IsRNA(dnatest) == false
    @test IsRNA(rnatest) == true
    @test IsRNA(non) == false
end
