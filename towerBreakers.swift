import Foundation

func towerBreakers(n: Int, m: Int) -> Int {    
    let towers = n 
    let height = m
    
    if height == 1 {
        return 2
    } else {
        if towers % 2 == 0 {
            return 2
        } else {
            return 1
        }
    }
}


print(towerBreakers(n: 2, m: 2))  // 2
print(towerBreakers(n: 1, m: 4))  // 1
print(towerBreakers(n: 1, m: 7))  // 1
print(towerBreakers(n: 3, m: 7))  // 1