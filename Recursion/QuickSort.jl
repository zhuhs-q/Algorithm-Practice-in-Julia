#The idea of the main recursion is picking a pivot, taking it as a benchmark to split.
#There is a lot of algorithm about picking a pivot.
#still, we work on index.

function PivotChoice(A::Array{Float64}, begining::Int, ending::Int)
    return A[begining] #The simplest way: just take the first one.
end

function QuickSort(A::Array{Float64}, begining::Int, ending::Int)
    if ending - begining > 0
        pivot = PivotChoice(A, begining, ending)
        B = zeros(ending - begining+1)
        i = 1
        j = ending - begining+1
        for element in A[begining : ending]
            if element < pivot
                B[i] = element
                i += 1
            elseif element > pivot
                B[j] = element
                j -= 1
            end
        end
        B[i] = pivot
        A[begining:ending] = B
        QuickSort(A, begining, begining + i - 2)
        QuickSort(A, begining + i, ending)
    end
end

experiment = [5.0,1.0,7.0,9.0,3.0,10.0,6.0,]
QuickSort(experiment, 1, length(experiment))
print(experiment)
