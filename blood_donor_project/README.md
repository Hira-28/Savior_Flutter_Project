<div align="center">

<img src="https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white" />
<img src="https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white" />
<img src="https://img.shields.io/badge/Auth-BetterAuth-E53935?style=for-the-badge&logoColor=white" />
<img src="https://img.shields.io/badge/Database-PostgreSQL-336791?style=for-the-badge&logo=postgresql&logoColor=white" />
<img src="https://img.shields.io/badge/Platform-Android%20%7C%20iOS-brightgreen?style=for-the-badge" />
<img src="https://img.shields.io/badge/License-MIT-red?style=for-the-badge" />

<br /><br />

```
 ██████╗  █████╗ ██╗   ██╗██╗ ██████╗ ██╗   ██╗██████╗ 
██╔════╝ ██╔══██╗██║   ██║██║██╔═══██╗██║   ██║██╔══██╗
╚██████╗ ███████║██║   ██║██║██║   ██║██║   ██║██████╔╝
 ╚════██╗██╔══██║╚██╗ ██╔╝██║██║   ██║██║   ██║██╔══██╗
 ██████╔╝██║  ██║ ╚████╔╝ ██║╚██████╔╝╚██████╔╝██║  ██║
 ╚═════╝ ╚═╝  ╚═╝  ╚═══╝  ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝
```

# 🩸 Saviour

### *Connecting blood donors with seekers — saving lives, one donation at a time.*

<br />

[📱 Screenshots](#-screenshots) • [✨ Features](#-features) • [🚀 Getting Started](#-getting-started) • [🏗 Architecture](#-project-structure) • [🤝 Contributing](#-contributing)

<br />

</div>

---

## 📖 Overview

**Saviour** is a production-quality native mobile application built with **Flutter & Dart**, designed to bridge the critical gap between blood donors and seekers during medical emergencies.

The app provides a centralized, fast, and intuitive mobile platform for:

- 🗺 **Donor Discovery** — Find nearby donors by blood type with map visualization
- 💬 **Real-time Communication** — Chat directly with donors in seconds
- 🏥 **Blood Bank Directory** — Searchable blood bank listings with call & directions
- 📋 **Blood Request Management** — Post urgent requests with status tracking
- 🔔 **Smart Notifications** — Instant alerts for blood matches and request updates

Powered by **BetterAuth** for secure authentication and **PostgreSQL** for reliable, scalable data storage.

---

## ✨ Features

<details>
<summary><strong>🏠 Home Screen</strong></summary>

- Custom **MapPainter** — stylized donor location map using Flutter's `CustomPainter`
- 3×2 **Quick Action Grid** — Find Donors, Donate, Blood Bank, Support, Blood Request, More
- **Blood Seeker Cards** — avatar, blood type badge, description, location, Donate button
- **Side Drawer** — gradient profile header with full navigation menu
- **Bottom Navigation Bar** — Home, Inbox, Notifications, Profile (with correct tab state reset on back press)

</details>

<details>
<summary><strong>🔍 Find Donor Screen</strong></summary>

- Filter by **blood type** (A+, A−, B+, B−, O+, O−, AB+, AB−) using chip selector
- **Tab bar** — All / Recent / Urgent
- Real-time filtering with Dart's `List.where()`
- **Donate button** deep-links directly to the Chat screen

</details>

<details>
<summary><strong>🏥 Blood Bank Screen</strong></summary>

- Searchable **blood bank directory** with real-time search
- **Detail view** — SliverAppBar, ratings, reviews, operating hours, distance
- Write a review section
- **📞 Call** and **🗺 Get Directions** action buttons

</details>

<details>
<summary><strong>📋 Blood Request Screen</strong></summary>

- **Post A Request** form with:
  - Patient name field
  - Blood group grid selector (all 8 types)
  - Unit slider (1–10 units) with custom `SliderTheme`
  - Phone number and location fields
  - Gender dropdown and date picker
  - Success screen with data passed back via `Navigator.pop()`
- Request list with **urgency badges** (CRITICAL / URGENT / NORMAL)
- **Status badges** (PENDING / FULFILLED)

</details>

<details>
<summary><strong>💬 Inbox & Chat Screen</strong></summary>

- Conversation list with **unread message badges**
- **Deep linking** — openable directly from Donate button with donor pre-loaded
- **Chat bubbles** — red (sent) / white (received)
- **Auto-scroll** to latest message via `ScrollController`
- **Read receipts** — double-tick ✓✓ on sent messages
- Emoji and attachment icons in input bar

</details>

<details>
<summary><strong>🔔 Notifications Screen</strong></summary>

- Read / unread **visual distinction** (red dot + tinted background)
- Tap to **mark individual** notification as read
- **Mark all read** AppBar action button
- 5 notification types: match, request, reminder, success, info

</details>

<details>
<summary><strong>👤 Profile Screen</strong></summary>

- Gradient avatar with camera edit button
- **Blood type badge** + Verified Donor badge
- **Stats row** — Total Donations | Lives Saved | Badges
- Full settings menu: My Donations, Blood Requests, Achievements, Privacy, Language, Support, Logout

</details>

<details>
<summary><strong>❓ Support Screen</strong></summary>

- Contact options — Call, Live Chat, Email
- **Animated FAQ accordion** with `AnimatedRotation` chevron

</details>

---

## 🛠 Tech Stack

| Category | Technology |
|---|---|
| **Framework** | Flutter 3.x |
| **Language** | Dart 3.x |
| **Authentication** | BetterAuth |
| **Database** | PostgreSQL |
| **State Management** | setState / Provider |
| **Custom UI** | CustomPainter, SliverAppBar, SliderTheme |
| **Navigation** | Flutter Navigator 2.0 |
| **HTTP Client** | Dio |
| **Platform** | Android & iOS |

---

## 🚀 Getting Started

Verify your Flutter setup:

```bash
flutter doctor
```

All entries should show ✅. Resolve any issues before continuing.

---

### 📦 Installation

**1. Clone the repository**

```bash
git clone https://github.com/your-username/saviour.git
cd saviour
```

**2. Install Flutter dependencies**

```bash
flutter pub get
```

### 📝 `pubspec.yaml` Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter

  # Networking
  dio: ^5.4.0

  # Secure token storage
  flutter_secure_storage: ^9.0.0

  # State management
  provider: ^6.1.1

  # Utilities
  url_launcher: ^6.2.2
  intl: ^0.19.0
  cached_network_image: ^3.3.1
  flutter_dotenv: ^5.1.0
```

Then run:

```bash
flutter pub get
```

---

### ▶️ Running the App

**Start the backend server first, then run the Flutter app:**

```bash
# Terminal 1 — backend
cd backend
npm run dev

# Terminal 2 — Flutter app
cd ..
flutter run
```

**Run on a specific device:**

```bash
# List available devices
flutter devices

# Run on a specific device
flutter run -d <device-id>
```

**Run in release mode:**

```bash
flutter run --release
```

---

### 🏗 Build

**Build Android APK:**

```bash
flutter build apk --release
```

Output: `build/app/outputs/flutter-apk/app-release.apk`

**Build Android App Bundle (for Play Store):**

```bash
flutter build appbundle --release
```

**Build iOS (macOS required):**

```bash
flutter build ios --release
```

---

## 🏗 Project Structure

```
saviour/
├── lib/
│   ├── main.dart                         # App entry point, MaterialApp & theme
│   │
│   ├── constants/
│   │   └── app_constants.dart            # Colors, blood types, mock data
│   │
│   ├── services/
│   │   ├── auth_service.dart             # BetterAuth REST integration
│   │   ├── token_storage.dart            # Secure token persistence
│   │   └── api_service.dart              # Base API client (Dio)
│   │
│   ├── widgets/
│   │   └── shared_widgets.dart           # Reusable custom widgets
│   │
│   └── screens/
│       ├── home_screen.dart              # Home screen + Drawer + Bottom Navigation
│       ├── find_donor_screen.dart        # Donor list with blood group filter
│       ├── blood_bank_screen.dart        # Blood bank list + details page
│       ├── blood_request_screen.dart     # Blood request list + request form
│       ├── inbox_screen.dart             # Inbox + Chat screen
│       ├── notifications_screen.dart     # Notifications page
│       ├── profile_screen.dart           # User profile & settings
│       └── support_screen.dart           # Help center + FAQ
│
├── assets/
│   ├── images/                           # App images, icons, avatars
│   └── fonts/                            # Custom fonts (optional)
│
├── backend/                              # Backend server
│   ├── src/
│   │   ├── auth.ts                       # BetterAuth configuration
│   │   └── server.ts                     # Express server entry point
│   └── package.json
│
├── migrations/
│   └── init.sql                          # PostgreSQL schema migrations
│
├── .env.example                          # Environment variable template
├── pubspec.yaml                          # Flutter dependencies & assets config
├── README.md                             # Project documentation
└── .gitignore                            # Ignored files
```

## 🙏 Acknowledgements

- [Flutter](https://flutter.dev/) — the beautiful cross-platform UI toolkit
- [BetterAuth](https://www.better-auth.com/) — modern, framework-agnostic authentication
- [PostgreSQL](https://www.postgresql.org/) — powerful open-source relational database
- Blood donors everywhere — the real heroes 🩸

---

<div align="center">

**Made with ❤️ and 🩸 to save lives**

⭐ Star this repo if Saviour helps you!

</div>
