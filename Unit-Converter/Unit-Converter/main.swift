// Unit converter from/to inch to/from cm
// Unit converter from/to feet to/from meters
// Unit converter from/to miles to/from kilometers

import Foundation

func unitConverter(converter_choice: inout Int, selected_choice: Int, unit_str1: String, unit_str2: String, formula: Double) {
    
    while(converter_choice == selected_choice){
        var inner_converter_choice:Int
        
        repeat{
            print("\n< From \(unit_str1) to \(unit_str2), Enter 1 >")
            print("< From \(unit_str2) to \(unit_str1), Enter 2 >")
            print("Decision / To Exit -> 0: ", terminator: "")
            
            inner_converter_choice = Int(readLine()!) ?? -1
            
            if(inner_converter_choice == 0) { converter_choice = 0; break }
            
            while(inner_converter_choice == 1) {
                print("\nEnter number in \(unit_str1) / To Exit -> 0: ", terminator: "")
                
                if let unit1 = Double(readLine()!) {
                    
                    if(unit1 == 0) {inner_converter_choice = 0; break}
                    
                    let unit2 = round((unit1 * formula) * 10000) / 10000
                    print("Result: \(unit1) \(unit_str1) is equal to \(unit2) \(unit_str2)")
                }
                else {
                    print("<<< Wrong Format! Try again >>>")
                }
            }
            
            while(inner_converter_choice == 2) {
                print("\nEnter number in \(unit_str2) / To Exit -> 0: ", terminator: "")
                
                if let unit1 = Double(readLine()!) {
                    
                    if(unit1 == 0) {inner_converter_choice = 0; break}
                    
                    let unit2 = round((unit1 / formula) * 10000) / 10000
                    print("Result: \(unit1) \(unit_str2) is equal to \(unit2) \(unit_str1)")
                }
                else {
                    print("<<< Wrong Format! Try again >>>")
                }
            }
            
        }
        while(inner_converter_choice != 1 && inner_converter_choice != 2)
        
    }
}

var converter_choice:Int

repeat{
    print("\n< For inch <=> cm, Enter 1 >")
    print("< For feet <=> m, Enter 2 >")
    print("< For miles <=> km, Enter 3 >")
    print("Decision: ", terminator: "")
    
    converter_choice = Int(readLine()!) ?? -1
    
    // Converter inch <=> cm
    unitConverter(converter_choice: &converter_choice, selected_choice: 1, unit_str1: "inch", unit_str2: "cm", formula: 2.54)
    
    // Converter feet <=> m
    unitConverter(converter_choice: &converter_choice, selected_choice: 2, unit_str1: "feet", unit_str2: "m", formula: 0.3048)
    
    // Converter miles <=> km
    unitConverter(converter_choice: &converter_choice, selected_choice: 3, unit_str1: "miles", unit_str2: "km", formula: 1.609344)
    
}
while(converter_choice != 1 && converter_choice != 2 && converter_choice != 3)


