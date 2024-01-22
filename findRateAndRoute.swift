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
    
    let firstCurrency = firstCurrencyFromPair(currencyPair)
    let endCurrency = lastCurrencyFromPair(currencyPair)
    var currencyPairs = getCurrencyPairsListStating(with: firstCurrency, rates: rates)
    var listToCheck = currencyPairs
    
    var possibleRoute = ""
    var possibleRate: Decimal = 0
    
    while listToCheck.count > 0 {
        
        let key = Array(listToCheck.keys)[0]
        
        let nextPairs = getCurrencyPairsListStating(with: lastCurrencyFromPair(key), rates: rates)
        let previousRate = currencyPairs[key] ?? 0
        nextPairs.forEach { nextPair in
            
            let lastCurrency = lastCurrencyFromPair(nextPair.key)
            
            let newKey = key + lastCurrency
            let newRate = nextPair.value * previousRate ?? 0
            
            if lastCurrency == endCurrency {
                if possibleRoute == "" || newKey.count < possibleRoute.count {
                    possibleRoute = newKey
                    possibleRate = newRate
                }
            } else {
                currencyPairs[newKey] = newRate
                listToCheck[newKey] = newRate
            }
        }
        currencyPairs.removeValue(forKey: key)
        listToCheck.removeValue(forKey: key)
    }
    
    return (
        rate: Decimal(string: String(format: "%.4f", Double(possibleRate as NSNumber))) ?? 0,
        route: possibleRoute
    )
}

func getCurrencyPairsListStating(with currency: String, rates: [String: Decimal]) -> [String: Decimal] {
    rates.filter {
        currency == firstCurrencyFromPair($0.key)
    }
}

func firstCurrencyFromPair(_ currencyPair: String) -> String {
    String(currencyPair.prefix(3))
}

func lastCurrencyFromPair(_ currencyPair: String) -> String {
    String(currencyPair.suffix(3))
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
print(result, result == (rate: 2.5384, route: "GELEGPGMDCRCSEKHKD"))

let result2 = findRateAndRoute(for: "NPRPHP", rates: ["NPRMUR": 0.3649,
                                                    "TZSPHP": 0.0222,
                                                    "MURTZS": 52.6165,
                                                    "THBCUC": 0.0301,
                                                    "BTNTHB": 0.4421,
                                                    "MURBTN": 1.7129,
                                                    "CUCTZS": 2309.4526])
print(result2, result2 == (rate: 0.4262, route: "NPRMURTZSPHP"))