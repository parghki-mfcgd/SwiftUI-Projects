//
//  ContentView.swift
//  UnitConversion
//
//  Created by Kirti Parghi on 2023-02-20.
//

import SwiftUI

struct ContentView: View {
    @State private var inputUnit = 0
    @State private var outputUnit = 0
    @State private var inputValue = 0
    @State private var answer = ""
    
    var body: some View {
        Form {
            Section {
                Text("Select Input Unit:")
                Picker("", selection: $inputUnit) {
                                Text("meters").tag(0)
                                Text("km").tag(1)
                                Text("feet").tag(2)
                                Text("yards").tag(3)
                                Text("miles").tag(4)
                }
                .pickerStyle(.segmented)
            }
            Section {
                Text("Select Output Unit")
                Picker("", selection: $outputUnit) {
                                Text("meters").tag(0)
                                Text("km").tag(1)
                                Text("feet").tag(2)
                                Text("yards").tag(3)
                                Text("miles").tag(4)
                }
                .pickerStyle(.segmented)
            }
            Section {
                TextField(
                  "Enter a number",
                  value: $inputValue,
                  formatter: NumberFormatter()
                ).padding()
                Button("Calculate") {
                    if self.inputUnit == 0 { //Meter
                        switch self.outputUnit {
                            case 0: //meter
                                self.answer = "\($inputValue.wrappedValue)"
                            case 1: //km
                                self.answer = "\(Float($inputValue.wrappedValue)/1000.0)"
                            case 2: //feet
                                self.answer = "\(Float($inputValue.wrappedValue)*3.28)"
                            case 3: //yards
                                self.answer = "\(Float($inputValue.wrappedValue)*1.0936)"
                            case 4: //miles
                                self.answer = "\(Float($inputValue.wrappedValue)/1609.344)"
                            default:
                                print("")
                        }
                    } else if self.inputUnit == 1 { //km
                        switch self.outputUnit {
                        case 0: //meter
                            self.answer = "\(Float($inputValue.wrappedValue)*1000.0)"
                        case 1: //km
                            self.answer = "\($inputValue.wrappedValue)"
                        case 2: //feet
                            self.answer = "\(Float($inputValue.wrappedValue)*3280.8398950131)"
                        case 3: //yards
                            self.answer = "\(Float($inputValue.wrappedValue)*1093.6132983377)"
                        case 4: //miles
                            self.answer = "\(Float($inputValue.wrappedValue)*0.62137119)"
                        default:
                            print("")
                        }
                    } else if self.inputUnit == 2 { //feet
                        switch self.outputUnit {
                        case 0: //meter
                            self.answer = "\(Float($inputValue.wrappedValue)*0.304)"
                        case 1: //km
                            self.answer = "\(Float($inputValue.wrappedValue)*0.00030480)"
                        case 2: //feet
                            self.answer = "\($inputValue.wrappedValue)"
                        case 3: //yards
                            self.answer = "\(Float($inputValue.wrappedValue)/3.0)"
                        case 4: //miles
                            self.answer = "\(Float($inputValue.wrappedValue)*0.0001894)"
                        default:
                            print("")
                        }
                    } else if self.inputUnit == 3 { //yards
                        switch self.outputUnit {
                        case 0: //meter
                            self.answer = "\(Float($inputValue.wrappedValue)*0.9144)"
                        case 1: //km
                            self.answer = "\(Float($inputValue.wrappedValue)*0.0009144)"
                        case 2: //feet
                            self.answer = "\(Float($inputValue.wrappedValue)*3.0)"
                        case 3: //yards
                            self.answer = "\($inputValue.wrappedValue)"
                        case 4: //miles
                            self.answer = "\(Float($inputValue.wrappedValue)/1760.0)"
                        default:
                            print("")
                        }
                    } else if self.inputUnit == 4 { //Miles
                        switch self.outputUnit {
                        case 0: //meter
                            self.answer = "\(Float($inputValue.wrappedValue)*1609.344)"
                        case 1: //km
                            self.answer = "\(Float($inputValue.wrappedValue)*1.609344)"
                        case 2: //feet
                            self.answer = "\(Float($inputValue.wrappedValue)*5280)"
                        case 3: //yards
                            self.answer = "\(Float($inputValue.wrappedValue)*1760)"
                        case 4: //miles
                            self.answer = "\($inputValue.wrappedValue)"
                        default:
                            print("")
                        }
                    }
                }.buttonStyle(.borderedProminent)
            }
            Section {
                Text("Answer:")
                Text("\(answer)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
