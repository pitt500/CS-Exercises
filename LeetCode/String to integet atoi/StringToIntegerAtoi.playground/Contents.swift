import Foundation

class Solution {
  func myAtoi(_ str: String) -> Int {
    if str.isEmpty {
      return 0
    }
    
    let stringWithNoSpaces = stringWithoutSpaces(str)
    let number = getNumber(stringWithNoSpaces)
    
    return number
  }
  
  func stringWithoutSpaces(_ string: String) -> String {
    var index = 0
    for character in string {
      if character == " " {
        index += 1
      } else {
        break
      }
    }
    
    return String(string.suffix(string.count - index))
  }
  
  func getNumber(_ string: String) -> Int {
    var isNegative = false
    var index = 0
    let numberSet: Set = ["0","1","2","3","4","5","6","7","8","9"]
    
    if string.first == "-" {
      isNegative = true
      index += 1
    } else if string.first == "+" {
      index += 1
    }
    
    var number: Double = 0
    
    for character in string.suffix(string.count - index) {
      let stringCharacter = String(character)
      if numberSet.contains(stringCharacter){
        number = number * 10 + Double(stringCharacter)!
      } else {
        break
      }
      
    }
    
    if isNegative {
      number = -number
    }
    
    let maxValue: Double = pow(2, 31) - 1
    if number > maxValue {
      return Int(maxValue)
    }
    
    let minValue: Double = pow(-2, 31)
    if number < minValue {
      
      return Int(minValue)
    }
    
    return Int(number)
  }
}


