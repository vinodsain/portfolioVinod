# Quick Start Guide

Get your portfolio app up and running in 5 minutes!

## ⚡ Prerequisites

Make sure you have:
- Flutter SDK installed (3.10.4+)
- Web support enabled

```bash
# Check Flutter version
flutter --version

# Enable web (if not already enabled)
flutter config --enable-web
```

## 🚀 Installation (Step by Step)

### Step 1: Clone/Open Project

```bash
cd "d:\flutter vs code\portfolio"
```

### Step 2: Get Dependencies

```bash
flutter pub get
```

This will download and install:
- GetX (state management)
- Google Fonts (typography)
- URL Launcher (link handling)
- Dio (HTTP client)
- And more...

### Step 3: Run the App

```bash
# Run on Chrome (recommended)
flutter run -d chrome

# Or run on Firefox
flutter run -d firefox

# Or run on Edge
flutter run -d edge
```

The app will open in your browser at `http://localhost:5900` (or similar port).

### Step 4: Hot Reload

While the app is running:
- **Save changes** to any file
- Changes will **instantly appear** in the browser
- No need to restart!

## 🎨 Customize Your Portfolio

### Change Name & Contact Info

**File**: `lib/utils/constants/strings.dart`

Find these lines and update:

```dart
static const String heroName = 'VINOD\nSAIN';  // ← Change to your name

static const String emailAddress = 'sainvinod2000@gmail.com';  // ← Your email

static const String phone = '+91 9460620778';  // ← Your phone

static const String location = 'Jaipur, Rajasthan, India';  // ← Your location
```

**Then**: Press `Ctrl+S` or `Cmd+S` to save - app updates automatically!

### Update Your Projects & Experience

**File**: `lib/data/repositories/portfolio_repository.dart`

This is where ALL your portfolio content lives:
- Live Apps
- Experience entries
- Skills
- Projects
- Education

Example - Add your first app:

```dart
PortfolioApp(
  name: 'My Awesome App',
  category: 'Finance · Mobile',
  description: 'Describe your app here...',
  icon: '💳',  // Use emoji or URL
  screenshot: '📱',  // Use emoji or URL
  rating: 4.5,
  reviews: 50,
  downloads: '1K+',
  technologies: ['Flutter', 'Firebase', 'GetX'],
  googlePlayUrl: 'https://play.google.com/store/apps/details?id=...',
  appStoreUrl: 'https://apps.apple.com/app/...',
  isLive: true,
),
```

## 🎯 Common Tasks

### Add a New App to Live Apps Section

1. Open: `lib/data/repositories/portfolio_repository.dart`
2. Find: `getLiveApps()` method
3. Add new `PortfolioApp` to the list
4. Save - app updates automatically!

### Add Experience Entry

1. Open: `lib/data/repositories/portfolio_repository.dart`
2. Find: `getExperience()` method
3. Add new `ExperienceEntry`:

```dart
ExperienceEntry(
  period: 'Jan 2024 – Present',
  company: 'Your Company',
  role: 'Your Role',
  location: 'City, Country',
  projects: [
    Project(
      name: 'Project Name',
      description: [
        'Achievement 1',
        'Achievement 2',
      ],
    ),
  ],
),
```

### Add Skills

1. Open: `lib/data/repositories/portfolio_repository.dart`
2. Find: `getSkillCategories()` method
3. Add new skill category:

```dart
SkillCategory(
  title: 'Category Name',
  skills: ['Skill 1', 'Skill 2', 'Skill 3'],
),
```

### Change App Colors

**File**: `lib/utils/constants/colors.dart`

```dart
// Change main accent color
static const Color hi = Color(0xFF00f5a0);  // Neon mint

// Change other colors as needed
static const Color bg = Color(0xFF060608);   // Background
```

## 📱 Test Responsive Design

Your app works on all devices:

```bash
# Test different screen sizes
flutter run -d chrome

# Then in Chrome:
# Press F12 → Toggle device toolbar (Ctrl+Shift+M)
# Choose device or drag to test any size
```

## 🏗️ Build for Production

When ready to deploy:

```bash
# Build optimized web version
flutter build web --release

# Output files are in: build/web/
```

## 🌐 Deploy

### Option 1: Netlify (Easiest)

```bash
# Install Netlify CLI
npm install -g netlify-cli

# Deploy
cd build/web
netlify deploy --prod
```

### Option 2: GitHub Pages

```bash
# Build with base path
flutter build web --release --base-href /my-portfolio/

# Push build/web to gh-pages branch
# Your site: github.com/username/my-portfolio/
```

### Option 3: Vercel

```bash
# Install Vercel CLI
npm install -g vercel

# Deploy
cd build/web
vercel --prod
```

## 🐛 Troubleshooting

### Issue: "flutter: command not found"

```bash
# Add Flutter to PATH:
# macOS/Linux:
export PATH="$PATH:[flutter_directory]/bin"

# Windows:
# Set PATH environment variable to [flutter_directory]\bin
```

### Issue: Pub packages won't install

```bash
# Clean everything and try again
flutter clean
flutter pub get
```

### Issue: App won't run

```bash
# Check everything
flutter doctor

# Install any missing dependencies suggested
flutter doctor --fix
```

### Issue: Hot reload not working

```bash
# Try hot restart (full reload)
# In terminal, press 'R' key

# Or restart the app
```

## 📚 Understanding the Code

### Project Structure

```
lib/
├── main.dart                    ← Entry point
├── config/theme/               ← App styling
├── data/models/                ← Data structures
├── data/repositories/           ← Your portfolio data
├── presentation/controllers/    ← State management (GetX)
├── presentation/pages/          ← Pages
├── presentation/widgets/        ← UI components
└── utils/constants/             ← Colors, strings
```

### Key Files to Know

- `lib/main.dart` - App setup
- `lib/data/repositories/portfolio_repository.dart` - **Your content goes here**
- `lib/utils/constants/strings.dart` - Text content
- `lib/utils/constants/colors.dart` - App colors
- `lib/presentation/controllers/home_controller.dart` - State management

### How It Works

1. **Data** → `portfolio_repository.dart` (your content)
2. **Controller** → `home_controller.dart` (manages state with GetX)
3. **Widgets** → Display content from controller
4. **User Interaction** → Controller updates, UI auto-refreshes

## 🎓 Next Steps

1. **Customize content** in `portfolio_repository.dart`
2. **Test on mobile** using device simulation
3. **Build for web** when ready
4. **Deploy** to Netlify, Vercel, or GitHub Pages
5. **Share your portfolio!**

## 📖 Learn More

- [Flutter Documentation](https://flutter.dev/docs)
- [GetX Documentation](https://pub.dev/packages/get)
- [Main Project README](./PORTFOLIO_README.md)
- [Detailed Customization Guide](./CUSTOMIZATION_GUIDE.md)

## 💡 Tips

✅ **Do:**
- Keep content up to date
- Test on mobile devices
- Use high-quality images
- Write compelling descriptions
- Update links regularly

❌ **Don't:**
- Hardcode data in widgets
- Forget to save changes
- Deploy without testing
- Use broken image links
- Keep outdated experience

## 🎉 You're Ready!

Your portfolio app is configured and ready to go. Start customizing and let your work shine!

Need help? Check the CUSTOMIZATION_GUIDE.md for detailed instructions.

---

**Happy Building! 🚀**
