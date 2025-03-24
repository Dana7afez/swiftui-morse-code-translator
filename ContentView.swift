import SwiftUI
let arabicToMorse: [Character: String] = [
        "ا": ".-",  
        "ب": "-...",  
        "ت": "-",  
        "ث": "-.-.",  
        "ج": "--.",  
        "ح": "....",  
        "خ": "---",  
        "د": "-..",  
        "ذ": "-..-",  
        "ر": ".-.",  
        "ز": "--..",  
        "س": "...",  
        "ش": "...-",  
        "ص": ".--.",  
        "ض": "-.-",  
        "ط": "..-",  
        "ظ": "..-.",  
        "ع": "--",  
        "غ": "-..-",  
        "ف": "..-.",  
        "ق": "--.-",  
        "ك": "-.-",  
        "ل": ".-..",  
        "م": "--",  
        "ن": "-.",  
        "ه": "....",  
        "و": ".--",  
        "ي": "..",  
        "ء": ".-.-.-"
    ]

func translateToMorse(text: String) -> String {
    let morseTranslation = text.compactMap { arabicToMorse[$0] }.joined(separator: " ")
    return morseTranslation.isEmpty ? "يوجد بعض الرموز التي لا يمكن ترجمتها، يرجى ادخال الحروف العربية فقط والمحاولة مره اخرى" : morseTranslation
}

import SwiftUI

struct ContentView: View {
    
    @State private var inputText: String = ""
    @State private var morseCode: String = ""
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                
                VStack(spacing: 15) {
                    
                    Image("Morsal")
                        .resizable() 
                        .scaledToFit()  
                        .frame(width: 250) 
                    
                    TextField("أدخل النص هنا", text: $inputText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Button(action: {
                        morseCode = translateToMorse(text: inputText)
                        
                    }) {
                        Text("ترجم إلى مورس")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.teal)
                            .cornerRadius(10)
                    }
                    
                    Text("رمز مورس:")
                        .font(.headline)
                    Text(morseCode)
                        .padding()
                        .multilineTextAlignment(.center)
                        .bold()
                        .frame(height: 40.0)
                        .padding(.horizontal, 16.0)
                        .background(Color(morseCode=="" ? .white : .systemGray6))
                        .cornerRadius(8.0)
                        .font(.system(size: 36))
                    
                }
                        .ignoresSafeArea()
                
            }
            .padding(.top, 16.0)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("ترجمة عربي إلى مورس")
                        .foregroundColor(.teal)
                        .bold()
                }
            }
            .toolbarBackground(Color(UIColor.secondarySystemBackground), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            
        }
                .navigationViewStyle(StackNavigationViewStyle()) 
    }
}
