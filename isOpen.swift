import Foundation

/*
 * Complete the 'isOpen' function below.
 *
 * The function is expected to return true if market is open at tradeTime, false otherwise.
 */

func isOpen(atTime tradeTime: Int, marketHours: [Int]) -> Bool {
    let openHour = marketHours.first ?? 0
    let closeHour = marketHours.last ?? 2359
    
    if tradeTime == openHour || tradeTime == closeHour {
        return true
    }
    
    if openHour > closeHour {
        let openTimeSlot = Array(openHour...2359).map { $0 }
        let closeTimeSlot = Array(0...closeHour).map { $0 }
        return openTimeSlot.contains(tradeTime) || closeTimeSlot.contains(tradeTime)
    }
    
    return tradeTime >= openHour && tradeTime <= closeHour
}

let result = isOpen(atTime: 1245, marketHours: [930, 1600])
print(result, result == true)

let result2 = isOpen(atTime: 930, marketHours: [930, 1600])
print(result2, result2 == true)

let result3 = isOpen(atTime: 0, marketHours: [930, 1600])
print(result3, result3 == false)
