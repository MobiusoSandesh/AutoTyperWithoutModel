//
//  ContentView.swift
//  AutoTyperWithoutModel
//
//  Created by Sandesh on 13/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var text: String = ""
    @State private var transformedText: String = ""
    private let gpt2 = GPT2(strategy: .greedy)
    
    var body: some View {
        VStack {
            // TextField for user input
            TextField("Enter Text Here", text: $text)
                .font(.system(size: 20))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundColor(.black)
                .shadow(radius: 10, x: 0, y: 0)
                .padding()
            
            Button(action: {
                generateText()
            }) {
                Text("Generate Text")
                    .font(.system(size: 18))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding(.top)
            
            // TextEditor for generated text, making it copyable
            TextEditor(text: .constant("Generated Text: \(text) \(transformedText)"))
                .font(.system(size: 16))
                .padding(.top)
                .foregroundColor(.gray)
                .frame(height: 100)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
        }
        .padding()
    }
    
    func generateText() {
        transformedText = gpt2.generate(text: text, nTokens: 10) { generatedText, timeTaken in
            print("Generated Text: \(generatedText) in \(timeTaken) seconds")
        }
    }
}

#Preview {
    ContentView()
}
