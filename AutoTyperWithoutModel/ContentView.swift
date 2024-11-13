//
//  ContentView.swift
//  AutoTyperWithoutModel
//
//  Created by Sandesh on 13/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var inputText: String = ""
    @State private var generatedText: String = ""
    @State private var isGenerating: Bool = false
    @State private var showCopiedAlert: Bool = false
    @Environment(\.colorScheme) var colorScheme
    
    private let gpt2 = GPT2(strategy: .greedy)
    
    var body: some View {
        ZStack {
           
            LinearGradient(
                gradient: Gradient(colors: [
                    colorScheme == .dark ? .black : .gray.opacity(0.1),
                    colorScheme == .dark ? .gray.opacity(0.3) : .white
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 24) {
    
                    Text("AI Text Generator")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .padding(.top, 20)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Your Input")
                            .font(.headline)
                            .foregroundColor(.gray)
                        
                        TextEditor(text: $inputText)
                            .frame(height: 100)
                            .padding(8)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(colorScheme == .dark ? Color(.systemGray6) : .white)
                                    .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 2)
                            )
                    }
                    .padding(.horizontal)
                    
                    Button(action: {
                        withAnimation {
                            generateText()
                        }
                    }) {
                        HStack {
                            Text(isGenerating ? "Generating..." : "Generate Text")
                            if isGenerating {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [.blue, .blue.opacity(0.8)]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .shadow(color: .blue.opacity(0.3), radius: 5, x: 0, y: 2)
                    }
                    .disabled(inputText.isEmpty || isGenerating)
                    .padding(.horizontal)
                    
                    if !generatedText.isEmpty {
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Text("Generated Text")
                                    .font(.headline)
                                    .foregroundColor(.gray)
                                
                                Spacer()
                                
                                Button(action: {
                                    UIPasteboard.general.string = "\(inputText) \(generatedText)"
                                    withAnimation {
                                        showCopiedAlert = true
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                        showCopiedAlert = false
                                    }
                                }) {
                                    Image(systemName: "doc.on.doc")
                                        .foregroundColor(.blue)
                                }
                            }
                            
                            Text("\(inputText) \(generatedText)")
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(colorScheme == .dark ? Color(.systemGray6) : .white)
                                        .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 2)
                                )
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.vertical)
            }
            
            if showCopiedAlert {
                VStack {
                    Spacer()
                    Text("Copied to clipboard!")
                        .padding()
                        .background(Color.black.opacity(0.7))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding(.bottom, 32)
                }
            }
        }
    }
    
    private func generateText() {
        isGenerating = true
        DispatchQueue.global(qos: .userInitiated).async {
            let result = gpt2.generate(text: inputText, nTokens: 10) { generatedText, timeTaken in
                print("Generated Text: \(generatedText) in \(timeTaken) seconds")
            }
            
            DispatchQueue.main.async {
                generatedText = result
                isGenerating = false
            }
        }
    }
}

#Preview {
    ContentView()
}
