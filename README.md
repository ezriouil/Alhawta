<p align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter">
  <img src="https://img.shields.io/badge/📱-Mobile%20%26%20Web-blue?style=for-the-badge" alt="Platform">
  <img src="https://img.shields.io/badge/🛍️-Marketplace-green?style=for-the-badge" alt="Marketplace">
</p>

<h1 align="center">🛍️ Alhawta</h1>
<h3 align="center">E-Commerce / Marketplace App</h3>

<p align="center">
  <strong>A Flutter app for Android, iOS, and Web. Browse categories, products, stores, wishlist, and more. Firebase, Appwrite, ads, and rich UI with animations.</strong>
</p>

<p align="center">
  <a href="#-features">Features</a> •
  <a href="#-getting-started">Getting Started</a> •
  <a href="#-project-structure">Project Structure</a> •
  <a href="#-tech-stack">Tech Stack</a>
</p>

---

## 📖 Overview

Alhawta is a Flutter e-commerce/marketplace application. Features product browsing, categories, stores, wishlist, user auth, onboarding, and ad monetization. Supports multiple platforms including web.

---

## ✨ Features

| Feature | Description |
|---------|-------------|
| 🔐 **Auth** | Login, sign up (Firebase, Google Sign-In) |
| 📱 **Onboarding** | First-time user onboarding |
| 🏠 **Home** | Product feed, carousel, featured |
| 📂 **Categories** | Browse by category |
| 🔍 **Filter** | Filter products |
| 📦 **Product** | Product details |
| ➕ **New Product** | Add new product |
| 🏪 **Store** | Store management |
| ❤️ **Wishlist** | Save favorite products |
| 👤 **Profile** | User profile |
| ⚙️ **Settings** | App settings |
| 💰 **Ads** | AdMob & Unity Ads |
| 📷 **Images** | Picker, camera, gallery |
| 🌐 **Web** | Web support |
| 🌍 **Multi-language** | GetX translations |

---

## 🛠️ Tech Stack

| Category | Technology |
|----------|------------|
| **Framework** | Flutter |
| **State Management** | GetX |
| **Backend** | Firebase, Appwrite |
| **Auth** | Firebase Auth, Google Sign-In |
| **Storage** | Firebase Storage, get_storage |
| **Ads** | google_mobile_ads, unity_ads_plugin |
| **Images** | image_picker, camera, cached_network_image, gal |
| **UI** | iconsax, awesome_bottom_bar, shimmer |
| **Animation** | widget_and_text_animator |
| **Other** | connectivity_plus, permission_handler, url_launcher, intl_phone_field, carousel_slider |

---

## 📦 Dependencies

```
get                  # State, DI, routing, i18n
firebase_core        # Firebase
firebase_auth        # Auth
firebase_storage     # Storage
google_sign_in       # Google Sign-In
appwrite             # Appwrite backend
get_storage          # Local storage
iconsax              # Icons
awesome_bottom_bar   # Bottom navigation
widget_and_text_animator  # Animations
connectivity_plus    # Network check
permission_handler   # Permissions
image_picker         # Pick images
camera               # Camera
cached_network_image # Cache images
gal                  # Gallery
google_mobile_ads    # AdMob
unity_ads_plugin     # Unity Ads
intl_phone_field     # Phone input
carousel_slider      # Carousels
shimmer              # Loading skeleton
url_launcher         # Open links
readmore             # Expandable text
avatar_glow          # Avatar effect
```

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK >= 3.3.4
- Firebase project
- Appwrite project (optional)

### Installation

```bash
# Clone the repository
git clone https://github.com/ezriouil/alhawta.git
cd alhawta

# Install dependencies
flutter pub get

# Run the app
flutter run
```

### Firebase Setup

1. Create a project at [Firebase Console](https://console.firebase.google.com)
2. Add Android, iOS, and Web apps
3. Run `flutterfire configure` or add `firebase_options.dart`
4. Enable Auth (Email, Google Sign-In) and Storage

### Run

```bash
# Android
flutter run -d android

# iOS
flutter run -d ios

# Web
flutter run -d chrome
```

---

## 📁 Project Structure

```
lib/
├── main.dart
├── on_boarding_screen.dart
├── firebase_options.dart
├── auth/
├── categories/
│   ├── widgets/
│   ├── categories_controller.dart
│   └── categories_screen.dart
├── filter/
├── home/
│   ├── widgets/
│   ├── home_controller.dart
│   └── home_screen.dart
├── index/
├── new_product/
├── product/
├── profile/
├── settings/
├── store/
├── wishlist/
├── utils/
├── web/
├── android/
├── ios/
├── assets/
│   ├── icons/
│   ├── images/
│   │   └── categories/
│   ├── images/flags/
│   └── fonts/
│       ├── Poppins.ttf
│       ├── Poppins_Semi_Bold.ttf
│       └── Poppins_Bold.ttf
├── firebase.json
├── pubspec.yaml
└── README.md
```

---

## 🎨 Assets

| Path | Content |
|------|---------|
| `assets/icons/` | App icons |
| `assets/images/` | Images |
| `assets/images/categories/` | Category images |
| `assets/images/flags/` | Flag images (i18n) |
| `assets/fonts/` | Poppins (Pop, Pop_Semi_Bold, Pop_Bold) |

---

## 📱 Screens

| Screen | Module | Description |
|--------|--------|-------------|
| Onboarding | `on_boarding_screen.dart` | First launch |
| Home | `home/` | Main feed |
| Categories | `categories/` | Browse categories |
| Product | `product/` | Product details |
| New Product | `new_product/` | Add product |
| Store | `store/` | Store view |
| Wishlist | `wishlist/` | Saved products |
| Profile | `profile/` | User profile |
| Settings | `settings/` | App settings |
| Filter | `filter/` | Filter products |

---

## 📄 License

MIT License

---

## 👤 Author

**Mohamed Ezriouil**
- GitHub: [@ezriouil](https://github.com/ezriouil)

---

<p align="center">⭐ Star this repo if you find it helpful!</p>
