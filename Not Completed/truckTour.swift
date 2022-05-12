import Foundation

/*
 * Complete the 'truckTour' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts 2D_INTEGER_ARRAY petrolpumps as parameter.
 */
 
 // start at point that i'll have petrol to go to the next
 // on next pont i'll remove that sum of km/l || add more || i need to see if i'll has petro to go to the next one

func truckTour(petrolpumps: [[Int]]) -> Int {
    var startPoint = -1
    
    var carringPetrol = 0
    for (index, petrolpump) in petrolpumps.enumerated() {
        let storagePetrol = petrolpump[0]
        let kmToNext = petrolpump[1]
        
        carringPetrol = storagePetrol
        carringPetrol -= kmToNext
        
        if carringPetrol < 0 {
            continue
        }
        
        var nextPoints = [[Int]]()
        if index != petrolpumps.count - 1 {
            nextPoints.append(contentsOf: petrolpumps[(index + 1)...(petrolpumps.count - 1)])
        }
        if index != 0 {
            nextPoints.append(contentsOf: petrolpumps[0..<index])   
        }
        
        for nextPetrolpump in nextPoints { 
            let nextStoragePetrol = nextPetrolpump[0]
            let nextKmToNext = nextPetrolpump[1]
            
            carringPetrol += nextStoragePetrol
            carringPetrol -= nextKmToNext
            
            if carringPetrol < 0 {
                break
            }
            
            startPoint = index
        }
        
        if startPoint != -1 {
            break
        }
        
    }
    
    return startPoint
}

let result = truckTour(petrolpumps: [[1, 5], [10, 3], [3, 4]])
print(result, result == 1)

let result = truckTour(petrolpumps: [[1, 5], [10, 3], [3, 4]]) // not work with hidden tests
print(result, result == 1)
