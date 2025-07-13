# 📸 Instagram Profile UI Clone (SwiftUI)

This is a modern clone of Instagram's user profile screen built with **Swift** and **SwiftUI**, featuring dynamic posts, interactive carousels, profile actions, and music pinning — all managed with custom MVVM architecture.

---

## ✨ Features

- 🧠 **MVVM Architecture**
  - Custom `UserViewModel` & `NavigationViewModel`
  - Clean state management using `@ObservedObject` & `@StateObject`

- 🖼️ **Post Grid + Carousel**
  - `LazyVGrid` for multi-column posts
  - `NavigationLink` to open full post
  - `TabView` carousel for multi-image posts

- 🎯 **Story Highlights**
  - Scrollable story bubbles with image + caption
  - Styled with overlays and gradients

- ❤️ **Post Interactions**
  - Like / Unlike with real-time count
  - Comment and share icons with mock data
  - Custom zIndex avatar stack for likes

- 🎵 **Pinned Music in Bio**
  - Music display with artist name
  - Play icon + user caption

- 🧩 **Reusable Views**
  - `HeaderView`, `PostsView`, `HighlightView`, `PostView`, `NavigationView`

- 🌗 **Dark Mode Support**
  - System-aware styling for light and dark themes

---

## 🛠️ Tech Stack

- **Language:** Swift
- **UI Framework:** SwiftUI
- **Architecture:** MVVM
- **Components:** TabView, LazyVGrid, NavigationStack, ScrollView, State/ObservedObject

---

## 📸 Screenshots

| Post gridHeader |  Post Grid (Light) |  Full Post |
|-----------------|--------------------|------------|
| ![Profile](https://github.com/user-attachments/assets/270f372f-9f59-404c-bd65-94c01a59ff5e) | ![Profile](https://github.com/user-attachments/assets/a94f70fb-d360-4eac-8f24-87e1e1e497a2) | ![Post](https://github.com/user-attachments/assets/a1147d90-52c2-4168-9258-4989124e37bd) |  |

---

## 🧠 What I Learned

- Managing nested view logic using multiple view models
- Animating post transitions and UI interaction
- Building scrollable and responsive layouts using `LazyVGrid` and `ScrollView`
- Creating reusable SwiftUI components with binding and data injection

---


## 📈 Next Steps

- Add real user authentication
- Fetch user content from Firebase or Supabase
- Add stories & highlights playback
- Enable comments and real user likes

---

## 👨‍💻 Author

**Youssef Ashraf**  
iOS Developer | Computer Science Student  
[GitHub](https://github.com/yousseeefashrraf) · [YouTube](https://youtube.com/@YooussefAshraf)

---

## ⚠️ Disclaimer

This project is for educational and portfolio purposes only. It does not use any actual Instagram services or assets.
