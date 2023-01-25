
# using DataFrames
function dnatm(dnaseq::String)
    dna = [base for base in uppercase(dnaseq)]
    len = length(dnaseq)
    a = 0
    t = 0
    c = 0
    g = 0
    for base in dna
        if base == 'A'
            a += 1
        elseif  base == 'T'
            t += 1
        elseif  base == 'C'
            c += 1
        elseif  base == 'G'
            g += 1
        else
            error("Inputs only support regular DNAs with ATCG bases!")
        end
    end
        
    if len <= 13
        tm = (a+t)*2+(c+g)*4
    elseif 13<len<=20
        tm = 64.9+41*(c+g-16.4)/(a+t+c+g)
    else
        tm = 0.41*((g+c)/len)-675/len+81.5
    end

    tm2 = round(tm*10)/10
    DataFrame("Input DNA sequence" => [dnaseq], "Tm (°C)" => [tm2])
    # tm2
end
