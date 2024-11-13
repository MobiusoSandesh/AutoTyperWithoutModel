# AutoTyper

AutoTyper is a SwiftUI-based iOS application that generates text using a GPT-2 model. The app provides a clean and intuitive interface for text generation with support for both light and dark modes.

## Important: Required Model Download

⚠️ **Before running the project, you must download the GPT-2 model:**
- Model Link: [Download GPT-2 Model (600MB)](https://drive.google.com/file/d/1SuLlhHQeHz-LGujMVR6it3dWgxbaDA5A/view?usp=sharing)
- Size: 600MB
- After downloading, place the model file in the project's root directory

Download URL:
```
https://drive.google.com/file/d/1SuLlhHQeHz-LGujMVR6it3dWgxbaDA5A/view?usp=sharing
```

## Features

- 🎯 Real-time text generation using GPT-2
- 🌓 Dark/Light mode support
- 📱 Clean and modern SwiftUI interface
- 📋 Copy to clipboard functionality
- 🔄 Loading state indicators
- 📱 Responsive design

## Prerequisites

- Xcode 15.0 or later
- iOS 15.0 or later
- Swift 5.0 or later
- Downloaded GPT-2 model file (600MB)

## Installation

1. Clone the repository:
```bash
git clone https://github.com/MobiusoSandesh/AutoTyperWithoutModel.git
```

2. Download the required model:
   - Visit: [GPT-2 Model Download Link](https://drive.google.com/file/d/1SuLlhHQeHz-LGujMVR6it3dWgxbaDA5A/view?usp=sharing)
   - Or copy this URL:
   ```
   https://drive.google.com/file/d/1SuLlhHQeHz-LGujMVR6it3dWgxbaDA5A/view?usp=sharing
   ```
   - Download size: 600MB
   - Save the downloaded model in the project's root directory

3. Open the project in Xcode:
```bash
cd AutoTyperWithoutModel
open AutoTyperWithoutModel.xcodeproj
```

4. Build and run the project in Xcode

## Usage

1. Launch the app
2. Enter your input text in the text field
3. Tap the "Generate Text" button
4. Wait for the model to generate text
5. Use the copy button to copy the generated text to clipboard

## Project Structure

```
AutoTyperWithoutModel/
├── ContentView.swift      # Main UI implementation
├── GPT2.swift            # GPT-2 model wrapper
└── gpt2_64_12_2.mlmodel          # Downloaded GPT-2 model (600MB)
```

## Model Information
The project requires a GPT-2 model file to function:
- File Size: 600MB
- Required Location: Project root directory
- Format: ML model file

Download URL:
```
https://drive.google.com/file/d/1SuLlhHQeHz-LGujMVR6it3dWgxbaDA5A/view?usp=sharing
```
