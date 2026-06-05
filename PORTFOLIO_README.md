# Portfolio App - Flutter Web MVVM + GetX

A modern, responsive portfolio web application built with Flutter, featuring MVVM architecture and GetX state management. Inspired by the design of Vinod Sain's developer portfolio.

## Project Structure

```
lib/
├── config/
│   └── theme/
│       └── app_theme.dart          # App theme configuration
├── data/
│   ├── models/                     # Data models
│   │   ├── app_model.dart
│   │   ├── contact_model.dart
│   │   ├── education_model.dart
│   │   ├── experience_model.dart
│   │   ├── project_model.dart
│   │   └── skill_model.dart
│   ├── repositories/
│   │   └── portfolio_repository.dart # Data source
│   └── services/
└── presentation/
    ├── controllers/
    │   └── home_controller.dart    # GetX controller
    ├── pages/
    │   └── home/
    │       └── home_page.dart
    └── widgets/
        ├── app_nav_bar.dart        # Navigation
        ├── hero_section.dart       # Hero banner
        ├── apps_section.dart       # Live apps showcase
        ├── experience_section.dart  # Experience timeline
        ├── skills_section.dart     # Skills & proficiency
        ├── projects_section.dart   # Projects showcase
        ├── education_contact_section.dart # Education & Contact
        ├── section_widgets.dart    # Reusable components
        └── footer.dart             # Footer
├── utils/
│   └── constants/
│       ├── colors.dart
│       └── strings.dart
└── main.dart
```

## Architecture

This project follows the **MVVM (Model-View-ViewModel)** pattern:

- **Models** (`lib/data/models/`) - Data classes representing portfolio information
- **View** (`lib/presentation/pages/` & `lib/presentation/widgets/`) - UI components
- **ViewModel** (`lib/presentation/controllers/`) - Business logic and state management using GetX
- **Repository** (`lib/data/repositories/`) - Data source abstraction

## State Management

**GetX** is used for state management with:

- **Controllers** - Manages all UI state (RxList, RxBool, RxString, RxDouble, RxMap)
- **Reactive Variables** - Auto-updating UI when data changes
- **Dependency Injection** - GetX handles controller initialization
- **Service Locator** - Easy access to controllers throughout the app

### HomeController Features

```dart
// Observable state
RxList<PortfolioApp> liveApps;
RxList<ExperienceEntry> experiences;
RxList<SkillCategory> skillCategories;
RxList<ProficiencySkill> proficiencySkills;
RxList<ProjectShowcase> projects;
RxList<EducationEntry> education;
RxMap<String, String> stats;
RxBool isLoading;
RxBool isMobileMenuOpen;
RxDouble scrollProgress;

// Methods
void loadData()
void toggleMobileMenu()
void setActiveSection(String section)
void scrollToSection(GlobalKey? key)
void submitContactForm(...)
```

## Key Features

### 1. **Responsive Design**
- Mobile-first approach
- Breakpoints for tablet and desktop
- Hamburger menu for mobile

### 2. **Smooth Animations**
- Scroll reveal animations
- Fade and slide transitions
- Progress bar animations
- Skill bar animations

### 3. **Interactive Sections**
- Hero section with CTA buttons
- Live apps grid with store links
- Experience timeline
- Skill categories and proficiency bars
- Projects showcase
- Education timeline
- Contact form

### 4. **Dark Modern Theme**
- Neon mint accent color (#00f5a0)
- Sleek dark background
- Gradient text effects
- Smooth hover states

## Colors

```dart
// Main Colors
bg: #060608
bg2: #0d0d12
card: #111117
card2: #18181f

// Borders
border: #1e1e28
border2: #2a2a38

// Text
ink: #eeaaf8
ink2: #9090b0
ink3: #55556a

// Accents
hi: #00f5a0 (neon mint)
hi2: #ff3c78 (hot pink)
hi3: #ffc93c (amber)
hi4: #3c8aff (electric blue)
```

## Setup & Installation

### Prerequisites

- Flutter SDK (3.10.4 or higher)
- Web support enabled: `flutter config --enable-web`

### Installation Steps

```bash
# Navigate to project directory
cd portfolio

# Get dependencies
flutter pub get

# Run the app
flutter run -d chrome

# Build for web
flutter build web --release
```

### Dependencies

```yaml
get: ^4.6.6                  # State management
dio: ^5.4.1                  # HTTP client
url_launcher: ^6.2.6         # Open URLs
intl: ^0.19.0               # Date/time formatting
google_fonts: ^6.2.1        # Custom fonts
```

## Data Management

### Portfolio Data Source

All portfolio data is managed in `PortfolioRepository`:

```dart
PortfolioRepository repo = PortfolioRepository();

// Get data
List<PortfolioApp> apps = repo.getLiveApps();
List<ExperienceEntry> experience = repo.getExperience();
List<SkillCategory> skills = repo.getSkillCategories();
```

**Modify Data**: Edit the repository to update portfolio content without touching UI code.

## Customization Guide

### 1. **Update Portfolio Data**

Edit `lib/data/repositories/portfolio_repository.dart`:

```dart
PortfolioApp(
  name: 'Your App Name',
  category: 'Category',
  description: 'App description...',
  // ... other fields
)
```

### 2. **Change Colors**

Update `lib/utils/constants/colors.dart`:

```dart
static const Color hi = Color(0xFF00f5a0); // Accent color
```

### 3. **Modify Text Content**

Update `lib/utils/constants/strings.dart`:

```dart
static const String heroName = 'YOUR NAME';
static const String emailAddress = 'your@email.com';
```

### 4. **Customize Theme**

Edit `lib/config/theme/app_theme.dart`:

```dart
textTheme: TextTheme(
  displayLarge: GoogleFonts.bebasNeue(...),
  // ... other styles
)
```

## Widget Components

### SectionHeader

Displays section label and title with animations:

```dart
SectionHeader(
  label: 'Label',
  title: 'Section Title',
  highlightedWord: 'Title',
  isRevealed: true,
)
```

### SectionContainer

Wraps sections with padding and styling:

```dart
SectionContainer(
  fullWidth: true,
  hasBorder: true,
  child: content,
)
```

### AppNavBar

Responsive navigation with mobile menu:

```dart
AppNavBar(
  controller: homeController,
  onLogoTap: () {},
  onNavLinkTap: (section) {},
)
```

## Form Handling

The contact form in `ContactSection` handles:

- Form validation
- Message composition
- Email client launch (mailto)
- Success feedback

```dart
void submitContactForm({
  required String name,
  required String email,
  required String subject,
  required String message,
})
```

## Performance Optimizations

- **Lazy Loading** - Images load on demand
- **Scroll Performance** - Optimized scroll listener
- **Memory Management** - Proper disposal of controllers and listeners
- **Responsive Rendering** - Grid layouts adapt to screen size

## Browser Compatibility

Tested on:
- Chrome
- Firefox
- Safari
- Edge

## Deployment

### Web Deployment

```bash
# Build optimized web version
flutter build web --release

# Output in: build/web/

# Deploy to hosting (Netlify, Vercel, GitHub Pages, etc.)
```

### GitHub Pages Deployment

```bash
flutter build web --release --base-href /portfolio/
# Deploy contents of build/web/ to gh-pages branch
```

## Troubleshooting

### Issue: Dependencies not found

```bash
flutter clean
flutter pub get
flutter pub upgrade
```

### Issue: Build errors

```bash
flutter doctor -v
# Check and fix any issues reported
```

### Issue: Images not loading

Check image URLs and ensure they're accessible. Use placeholder emojis for fallback.

## Future Enhancements

- [ ] Blog section
- [ ] Dark/Light theme toggle
- [ ] Analytics tracking
- [ ] Email backend integration
- [ ] Downloadable resume
- [ ] Animation library upgrade
- [ ] Accessibility improvements
- [ ] Multi-language support

## Contributing

Feel free to fork and submit pull requests for improvements!

## License

MIT License - feel free to use this portfolio template for your own portfolio.

## Credits

- Designed with inspiration from modern developer portfolios
- Built with Flutter & GetX
- Uses Google Fonts

---

**Made with ❤️ using Flutter**
