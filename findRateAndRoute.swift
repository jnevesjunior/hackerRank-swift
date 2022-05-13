import Foundation

/*
 * Complete the 'findRateAndRoute' function below.
 *
 * The function accepts:
 *  - currencyPair: a pair of ISO 4217 currency codes, e.g. USDEUR
 *  - rates: a dictionary of currency pairs and their respective exchange rate, e.g.
 *    USDEUR -> 0.89
 *    RUBDKK -> 0.083
 *    ...
 *
 * The function is expected to return, in a (Decimal, String) pair:
 *  1. exchange rate from left to right currency in currencyPair
 *  2. shortest route between currencies to make the exchange, formed concatenating currency codes (e.g. USDEURRUB)
 */

func findRateAndRoute(for currencyPair: String, rates: [String: Decimal]) -> (rate: Decimal, route: String) {
    let startCurrency = getFirstCurrency(currencyPair)
    let lastCurrency = getLastCurrency(currencyPair)
    
    var paths = [String: Decimal]()
    var pathsToCalc = [String: Decimal]()
    rates.filter {
        return getFirstCurrency($0.key) == startCurrency
    }.forEach { rate in 
        paths[startCurrency + getLastCurrency(rate.key)] = rate.value
    }
    
    var needToCalcAnotherLevel = true
    while needToCalcAnotherLevel {
        var filteradRates = [String: Decimal]()
        for path in paths { 
            filteradRates = rates.filter { rate in
                getFirstCurrency(rate.key) == getLastCurrency(path.key)
            }
        }
        
        if filteradRates.count == 0 {
            needToCalcAnotherLevel = false
            continue
        }
        
        var keyToRemove = ""
        for filteradRate in filteradRates {
            let filteradRatePath = filteradRate.key
            let currentLastCurrency = String(filteradRatePath.dropLast(3))
            
            paths.forEach { path in
                if getLastCurrency(path.key) != currentLastCurrency {
                    return
                }
                
                let currentPath = path
                keyToRemove = path.key
                
                let newLastCurrency = getLastCurrency(filteradRatePath)
                let newKey = currentPath.key + newLastCurrency
                let newValue = currentPath.value * filteradRate.value
                if newLastCurrency == lastCurrency {
                    pathsToCalc[newKey] = newValue
                } else {
                    paths[newKey] = newValue
                }
            }
        }
        
        if let index = paths.index(forKey: keyToRemove) {
            paths.remove(at: index)
        } 
    }
    
    if let path = pathsToCalc.sorted { $0.value < $1.value }.first {
        if let decimal = Decimal(string: String(format: "%.4f", Double(path.value as NSNumber))) {
            return (rate: decimal, route: path.key)    
        }
        return (rate: path.value, route: path.key)    
    }
    return (rate: 0.0, route: "")
}

func getFirstCurrency(_ currency: String) -> String {
    return String(currency.prefix(3))
}

func getLastCurrency(_ currency: String) -> String {
    return String(currency.suffix(3))
}

let result = findRateAndRoute(for: "GELHKD", rates: ["CRCSEK": 0.0146, 
                                                    "GMDJMD": 2.9725, 
                                                    "SVCGMD": 6.005, 
                                                    "TOPRUB": 34.1588,
                                                     "GMDCRC": 12.1763, 
                                                     "EGPGMD": 3.3421, 
                                                     "SEKGHS": 0.6644, 
                                                     "CRCTOP": 0.0036, 
                                                     "GHSHKD": 1.2504, 
                                                     "EGPSVC": 0.5566, 
                                                     "JMDCRC": 4.0963, 
                                                     "IDREGP": 0.0011, 
                                                     "GELEGP": 5.1432, 
                                                     "GELIDR": 4692.8022, 
                                                     "SEKHKD": 0.8307, 
                                                     "RUBSEK": 0.1207])
print(result, result == (rate: 2.5384, route: "GELEGPGMDJMDCRCSEKHKD"))

let result2 = findRateAndRoute(for: "NPRPHP", rates: ["NPRMUR": 0.3649, 
                                                    "TZSPHP": 0.0222,
                                                    "MURTZS": 52.6165,
                                                    "THBCUC": 0.0301, 
                                                    "BTNTHB": 0.4421, 
                                                    "MURBTN": 1.7129, 
                                                    "CUCTZS": 2309.4526])
print(result2, result2 == (rate: 0.4262, route: "NPRMURTZSPHP"))