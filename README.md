# ✨ Random Quote Generator

A simple and clean Flutter application that fetches and displays random quotes from the DummyJSON Quotes API. Built as part of the CodeAlpha Internship program.

## 📸 Features

* **🔄 Random Quotes** — Fetch a new inspirational quote with a single tap
* **🎨 Elegant UI** — Clean, minimal design with a customized background and user interface

## 🏗️ Architecture

```text
quote_generator/
├── assets/images/
│   └── 205_LE_upscale_prime.jpg
├── lib/
│   ├── Models/
│   │   └── quotes_data.dart
│   ├── main.dart
│   └── random_quote.dart
```
| Category | Library / Tool |
| --- | --- |
| **State Management** | Flutter Stateful Widget |
| **Networking** | Dio (^5.11.1) |
| **Icons** | Cupertino Icons (^1.0.8) |

**🚀 Getting Started**
Prerequisites
Flutter SDK (≥ 3.0.0)

Dart SDK

An IDE (VS Code or Android Studio)

Installation
Clone the repository:

Bash
git clone [https://github.com/Zat-0na/CodeAlpha_Random-Quote.git](https://github.com/Zat-0na/CodeAlpha_Random-Quote.git)
cd CodeAlpha_Random-Quote
Install dependencies:

Bash
flutter pub get
Run the app:

Bash
flutter run
🌐 API
This app uses the DummyJSON Quotes API:

Endpoint: https://dummyjson.com/quotes

Method: GET

Description: Fetches a list of quotes to display randomly.

📄 License
This project is open source and available for learning purposes.
Built with 💚 as part of the CodeAlpha Internship Task
