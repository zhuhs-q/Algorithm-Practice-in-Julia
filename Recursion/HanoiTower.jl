#This is a very basic and famous algorithm about recursion
#If you are not familiar with this problem, check https://en.wikipedia.org/wiki/Tower_of_Hanoi
function HanoiTower(n::Int, start::Int = 1, destination::Int = 3, placeholder::Int = 2)
    while n > 0
        HanoiTower(n-1, start, placeholder, destination)
        print("move disk ", n, " from ", start, " to ", destination,"\n")
        HanoiTower(n-1, placeholder, destination, start)
        n = n-1
    end
end

HanoiTower(5) #suppose there are 3 disks, you can change this parameter