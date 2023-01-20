#This example is a little more complicated
#Some people say that this algorithm is hard to implement. That's because they do not fully exploit recursion
#The technical difficulty is how to update our original A. The trick is working on index
function Merge(A::Array{Float64}, m::Int, begining::Int, ending::Int)
    operation = A[begining:ending]
    i = 1
    j = m+1
    n = length(operation)
    B = zeros(n)
    for k = 1 : n
        if j > n
            B[k] = operation[i]
            i += 1
        elseif i > m
            B[k] = operation[j]
            j += 1
        elseif operation[i] < operation[j]
            B[k] = operation[i]
            i += 1
        else
            B[k] = operation[j]
            j += 1
        end
    end
    A[begining:ending] = B
end

function MergeSort(A::Array{Float64}, begining::Int, ending::Int)
    if ending - begining > 0
        m = floor(Int, ending - begining)
        MergeSort(A, begining, m)
        MergeSort(A, m + 1, ending)
        Merge(A, m, begining, ending)
    end
    return A
end

experiment = [1.0,6.0,4.0,8.0,3.0]
MergeSort(experiment,1, length(experiment))