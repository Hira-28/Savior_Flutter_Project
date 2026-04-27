💉 BloodConnect

A Full-Featured Mobile Blood Donation Application

*Connecting blood donors with seekers — saving lives, one donation at a time.*

---

</div>

📖 Overview

**BloodConnect** is a production-quality native mobile application built with **Flutter & Dart**, designed to bridge the critical gap between blood donors and seekers during medical emergencies. The app provides a centralized, fast, and intuitive mobile platform for donor discovery, real-time communication, blood bank information, and blood request management — all secured with **Firebase Authentication**.



## ✨ Features

### 🏠 Home Screen
- Custom **MapPainter** — stylized donor location map using Flutter's `CustomPainter`
- 3×2 **Quick Action Grid** — Find Donors, Donate, Blood Bank, Support, Blood Request, More
- **Blood Seeker Cards** — avatar, blood type badge, description, location, Donate button
- **Side Drawer** — gradient profile header with full navigation menu
- **Bottom Navigation Bar** — Home, Inbox, Notifications, Profile (with correct tab state reset on back press)

### 🔍 Find Donor Screen
- Filter by **blood type** (A+, A−, B+, B−, O+, O−, AB+, AB−) using chip selector
- **Tab bar** — All / Recent / Urgent
- Real-time filtering with Dart's `List.where()`
- **Donate button** deep-links directly to Chat screen

### 🏥 Blood Bank Screen
- Searchable **blood bank directory** with real-time search
- **Detail view** — SliverAppBar, ratings, reviews, operating hours, distance
- Write a review section
- **📞 Call** and **🗺 Get Direction** action buttons

### 📋 Blood Request Screen
- **Post A Request** form with:
  - Patient name field
  - Blood group grid selector (all 8 types)
  - Unit slider (1–10 units) with custom `SliderTheme`
  - Phone number and location fields
  - Gender dropdown and date picker
  - Success screen with data passed back via `Navigator.pop()`
- Request list with **urgency badges** (CRITICAL / URGENT / NORMAL)
- **Status badges** (PENDING / FULFILLED)

### 💬 Inbox & Chat Screen
- Conversation list with **unread message badges**
- **Deep linking** — openable directly from Donate button with donor pre-loaded
- **Chat bubbles** — red (sent) / white (received)
- **Auto-scroll** to latest message via `ScrollController`
- **Read receipts** — double-tick ✓✓ on sent messages
- Emoji and attachment icons in input bar

### 🔔 Notifications Screen
- Read / unread **visual distinction** (red dot + tinted background)
- Tap to **mark individual** notification as read
- **Mark all read** AppBar action button
- 5 notification types: match, request, reminder, success, info

### 👤 Profile Screen
- Gradient avatar with camera edit button
- **Blood type badge** + Verified Donor badge
- **Stats row** — Total Donations | Lives Saved | Badges
- Full settings menu: My Donations, Blood Requests, Achievements, Privacy, Language, Support, Logout

### ❓ Support Screen
- Contact options — Call, Live Chat, Email
- **Animated FAQ accordion** with `AnimatedRotation` chevron

---

## 🏗️ Project Structure

blood_donation_app/
├── lib/
│   ├── main.dart                         # App entry point, MaterialApp & theme
│   │
│   ├── constants/
│   │   └── app_constants.dart           # Colors, blood types, mock data
│   │
│   ├── widgets/
│   │   └── shared_widgets.dart          # Reusable custom widgets
│   │
│   └── screens/
│       ├── home_screen.dart            # Home screen + Drawer + Bottom Navigation
│       ├── find_donor_screen.dart      # Donor list with blood group filter
│       ├── blood_bank_screen.dart      # Blood bank list + details page
│       ├── blood_request_screen.dart   # Blood request list + request form
│       ├── inbox_screen.dart           # Inbox + Chat screen
│       ├── notifications_screen.dart   # Notifications page
│       ├── profile_screen.dart         # User profile & settings
│       └── support_screen.dart         # Help center + FAQ
│
├── assets/
│   ├── images/                         # App images, icons, avatars
│   └── fonts/                          # Custom fonts (optional)
│
├── pubspec.yaml                        # Dependencies & assets config
├── README.md                           # Project documentation
└── .gitignore                          # Ignored files
