# NewsReader

## Project Overview
NewsReader is an **iOS application** that fetches and displays the latest news headlines using the **NewsAPI**. The app follows **SOLID principles** and **Dependency Injection (DI)** to ensure maintainability and scalability. It is built using **Swift, UIKit**, and integrates **Unit Testing (XCTest)** with **Continuous Integration (CI/CD)**.

---

## 🎯 Goals of the Project
This project is designed to help me **strengthen my software development skills** by focusing on:

- ✅ **Dependency Injection (DI)** to separate concerns and enhance testability.
- ✅ **SOLID principles** for a maintainable and scalable architecture.
- ✅ **Unit Testing & Mocking** using `XCTest` to ensure reliable functionality.
- ✅ **CI/CD Integration** with GitHub Actions.
- ✅ **Efficient API Handling** (pagination & caching).

---

## 🔥 Challenges Faced
Throughout the development, I encountered several challenges:

### 1. **Dependency Injection (DI) Implementation**
- Initially, I tightly coupled the `NewsService` inside the `ViewModel`.
- Solution: Used **protocol-based DI** to decouple the service layer from the ViewModel.

### 2. **Unit Testing with Mocks**
- Real API calls made tests unreliable due to network conditions.
- Solution: Created `MockNewsService` to simulate API responses without real requests.

### 3. **Handling Image Loading & Caching**
- Downloading images synchronously caused UI lag.
- Solution: Implemented `ImageLoader` with `NSCache` for caching and background loading.

---

## 🏆 Key Learnings
- How **Dependency Injection** improves modularity and testability.
- Writing **unit tests** for both services and UI logic.
- **Mocking dependencies** in testing.
- Implementing **image caching** for performance optimization.
- Structuring a project following **SOLID design principles**.
- Setting up a **CI/CD pipeline** to automate testing.
- The benefits of **pagination and offline reading** for a better user experience.

---

## 🛠️ How to Run the Project
### 🔧 Setup
1. Clone the repo:
   ```sh
   git clone https://github.com/your-username/NewsReader.git
   cd NewsReader
   ```
2. Open the `.xcworkspace` in Xcode:
   ```sh
   open NewsReader.xcworkspace
   ```
3. Add your API key to **`Config.xcconfig`**:
   ```
   NEWS_API_KEY = your_api_key_here
   ```
4. Run the project in **Xcode** on an iPhone or iPad simulator.

### 🧪 Run Tests
To run unit tests:
```sh
Cmd + U  # Run all tests in Xcode
```
To check code coverage:
```sh
Xcode -> Edit Scheme -> Test -> Enable Code Coverage
```

---
