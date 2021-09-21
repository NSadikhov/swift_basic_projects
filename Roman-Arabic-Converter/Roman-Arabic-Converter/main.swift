// Converter from/to Roman to/from Arabic numbers

import Foundation

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

extension Dictionary where Value: Equatable {
    func findKey(value val: Value) -> Key? {
        return first(where: {$0.value == val})?.key
    }
}

let roman_arabic_dict: [String: Int] = [
    "I": 1,
    "IV": 4,
    "V": 5,
    "IX": 9,
    "X": 10,
    "XL": 40,
    "L": 50,
    "XC": 90,
    "C": 100,
    "CD": 400,
    "D": 500,
    "CM": 900,
    "M": 1000
]

var converter_choice:Int

repeat{
    print("\n< For Roman to Arabic numbers converter, Enter 1 >")
    print("< For Arabic to Roman numbers converter, Enter 2 >")
    print("Decision: ", terminator: "")
    
    converter_choice = Int(readLine()!) ?? 0
    
    while(converter_choice == 1){
        var isCorrect: Bool = true
        print("Enter any Roman number / To Exit -> 0: ", terminator: "")
        
        let roman_number = readLine()!.uppercased()
        
        if(Int(roman_number) == 0) {converter_choice = 0; break}
        
        var arabic_number: Int = 0
        
        var counter:Int = 0
        
        while (counter < roman_number.count) {
            var char_str = String(roman_number[counter])
            
            if(roman_arabic_dict[char_str] != nil){
                if((char_str == "I" || char_str == "X" || char_str == "C") && counter + 1 < roman_number.count &&
                    roman_arabic_dict[char_str + String(roman_number[counter + 1])] != nil
                ) {
                    counter += 1
                    char_str.append(roman_number[counter])
                }
                
                arabic_number += roman_arabic_dict[char_str]!
            }
            else {
                isCorrect = false
                break
            }
            
            counter += 1
        }
        if (!isCorrect) {
            print("<<< Wrong Format! Try again >>>")
            continue
        }
        
        
        print("Result: \(arabic_number)")
    }
    
    while(converter_choice == 2){
        print("Enter any Arabic number / To Exit -> 0: ", terminator: "")
        
        if let arabic_number = Int(readLine()!) {
            
            if(arabic_number == 0) {converter_choice = 0; break}
            
            var roman_number: String = ""
            
            var arabic_number_copy = arabic_number
            for level in roman_arabic_dict.values.sorted(by: {$0 > $1}){
                while (arabic_number_copy >= level) {
                    let remainder: Int = arabic_number_copy % level
                    var result: Int = arabic_number_copy - remainder

                    if let arabic_key = roman_arabic_dict.findKey(value: result) {
                        roman_number += arabic_key
                        
                    } else{
                        result/=level
                        while result > 0 {
                            roman_number += roman_arabic_dict.findKey(value: level)!
                            result-=1
                        }
                    }
                    arabic_number_copy = remainder
                }
            }
            
            print("Result: \(roman_number)")
        }
        else {
            print("<<< Wrong Format! Try again >>>")
        }
        
    }
    
}
while(converter_choice != 1 && converter_choice != 2)


