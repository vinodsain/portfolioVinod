# Portfolio Customization Guide

This guide explains how to customize the portfolio app with your own information, projects, and experience.

## Quick Start

### 1. Update Basic Information

**File**: `lib/utils/constants/strings.dart`

```dart
// Update your name
static const String heroName = 'YOUR NAME';

// Update contact info
static const String emailAddress = 'your@email.com';
static const String phone = '+91 YOUR_PHONE';
static const String linkedin = 'linkedin.com/in/your-profile';
static const String location = 'Your City, Country';
```

### 2. Update Portfolio Content

**File**: `lib/data/repositories/portfolio_repository.dart`

#### Add Your Apps

```dart
List<PortfolioApp> getLiveApps() {
  return [
    PortfolioApp(
      name: 'Your App Name',
      category: 'Category · Subcategory',
      description: 'App description here...',
      icon: 'https://url-to-icon.png', // or use emoji like '📱'
      screenshot: 'https://url-to-screenshot.png',
      rating: 4.5,
      reviews: 100,
      downloads: '10K+',
      technologies: ['Flutter', 'Dart', 'Firebase'],
      googlePlayUrl: 'https://play.google.com/store/apps/details?id=...',
      appStoreUrl: 'https://apps.apple.com/app/...',
      isLive: true,
    ),
  ];
}
```

#### Update Experience

```dart
List<ExperienceEntry> getExperience() {
  return [
    ExperienceEntry(
      period: 'Jan 2024 – Present',
      company: 'Your Company',
      role: 'Your Role',
      location: 'City, Country',
      projects: [
        Project(
          name: 'Project Name',
          description: [
            'Achievement 1: Describe what you did and the impact',
            'Achievement 2: Quantify results where possible',
            'Achievement 3: Highlight technical skills used',
          ],
        ),
      ],
    ),
  ];
}
```

#### Add Skills

```dart
List<SkillCategory> getSkillCategories() {
  return [
    SkillCategory(
      title: 'Programming Languages',
      skills: ['Python', 'JavaScript', 'Dart', 'Java'],
    ),
    SkillCategory(
      title: 'Frameworks',
      skills: ['Flutter', 'React', 'Django'],
    ),
    // ... more categories
  ];
}
```

#### Add Proficiency Bars

```dart
List<ProficiencySkill> getProficiencySkills() {
  return [
    ProficiencySkill(name: 'Flutter / Dart', percentage: 95),
    ProficiencySkill(name: 'JavaScript', percentage: 85),
    // ... more skills
  ];
}
```

#### Update Projects

```dart
List<ProjectShowcase> getProjectShowcase() {
  return [
    ProjectShowcase(
      title: 'Project Name',
      icon: '🚀',
      description: 'Brief description of the project...',
      tags: ['Flutter', 'Firebase', 'REST API'],
      link: 'https://github.com/...',
      linkText: 'GitHub →',
      badge: 'Live',
    ),
  ];
}
```

#### Update Education

```dart
List<EducationEntry> getEducation() {
  return [
    EducationEntry(
      period: '2020 — 2024',
      degree: 'Bachelor of Science in Computer Science',
      school: 'University Name, City',
    ),
  ];
}
```

### 3. Customize Colors

**File**: `lib/utils/constants/colors.dart`

```dart
class AppColors {
  // Change accent color
  static const Color hi = Color(0xFF00f5a0); // Neon mint
  
  // Change background
  static const Color bg = Color(0xFF060608); // Dark background
  
  // Change highlights
  static const Color hi2 = Color(0xFFff3c78); // Hot pink
  static const Color hi3 = Color(0xFFffc93c); // Amber
}
```

### 4. Customize Theme

**File**: `lib/config/theme/app_theme.dart`

```dart
textTheme: TextTheme(
  displayLarge: GoogleFonts.bebasNeue(
    fontSize: 64,
    fontWeight: FontWeight.bold,
    color: AppColors.ink,
  ),
  // ... customize other text styles
)
```

### 5. Update App Title & Metadata

**File**: `lib/main.dart`

```dart
GetMaterialApp(
  title: 'Your Name — Your Title',
  theme: AppTheme.darkTheme,
  debugShowCheckedModeBanner: false,
  home: const HomePage(),
);
```

**File**: `web/index.html`

```html
<meta name="description" content="Your Name — Your Professional Title. Your description here.">
<meta property="og:title" content="Your Name — Your Title">
<title>Your Name — Your Title</title>
```

## Content Tips

### Writing Good App Descriptions

```
❌ Bad: "An app for talking with friends"
✅ Good: "Real-time chat app with end-to-end encryption, supports 5000+ concurrent users, integrated with Firebase Realtime Database"
```

### Quantifying Achievements

```
❌ Bad: "Built some features"
✅ Good: "Built 15+ features reducing user churn by 30% through improved onboarding flow"
```

### Using Icons & Emojis

```dart
// Use emojis for quick visual appeal
icon: '💳',          // Finance
icon: '🚀',          // Startup/Innovation
icon: '📱',          // Mobile
icon: '🎨',          // Design
icon: '🔗',          // Blockchain
icon: '🛠️',          // Tools
```

### External URLs

```dart
// GitHub
googlePlayUrl: 'https://github.com/username/repo',

// Portfolio/Website
link: 'https://yourwebsite.com',

// Live Demo
link: 'https://demo.yoursite.com',

// LinkedIn
link: 'https://linkedin.com/in/your-profile',

// Twitter
link: 'https://twitter.com/yourhandle',
```

## Image Guidelines

### Icon Recommendations
- Size: 54x54 px
- Format: PNG with transparency preferred
- Source: Icons8, Flaticon, or custom design

### Screenshot Guidelines
- Size: 800x600 px or wider
- Format: PNG or WebP
- Content: App UI in use
- Don't include: Device frame (app handles responsiveness)

### Using Network Images

```dart
// Remote URL
icon: 'https://play-lh.googleusercontent.com/example.png'

// Fallback emoji if image fails
icon: '📱' // Used if image fails to load
```

## Building & Deployment

### Local Development

```bash
# Run on Chrome
flutter run -d chrome

# Run on Firefox
flutter run -d firefox

# Run on Edge
flutter run -d edge
```

### Build for Production

```bash
# Build optimized web version
flutter build web --release

# Output: build/web/
```

### Deploy to Netlify

```bash
# Install Netlify CLI
npm install -g netlify-cli

# Deploy
cd build/web
netlify deploy --prod
```

### Deploy to Vercel

```bash
# Install Vercel CLI
npm install -g vercel

# Deploy
vercel --prod
```

### Deploy to GitHub Pages

```bash
# Build with base-href
flutter build web --release --base-href /portfolio/

# Push build/web to gh-pages branch
```

## Animation & Transitions

The app includes several built-in animations:

### Scroll Animations
- Fade-in as you scroll to sections
- Smooth scroll progress bar at top
- Smooth scroll-to-section navigation

### Element Animations
- Hero name slides up
- CTA buttons fade in
- Proficiency bars animate from 0%
- Timeline entries reveal on scroll

These are handled automatically by the framework. To adjust timing:

**File**: `lib/presentation/widgets/hero_section.dart`

```dart
AnimationController(
  duration: const Duration(milliseconds: 800), // Change this
  vsync: this,
)
```

## Mobile Responsiveness

The app automatically adjusts for different screen sizes:

```dart
final isMobile = MediaQuery.of(context).size.width < 900;

// Adjust layout based on screen size
if (isMobile) {
  // Mobile layout
} else {
  // Desktop layout
}
```

To customize breakpoints, search for `< 900` in widget files and adjust as needed.

## Form Integration

The contact form currently opens the user's email client. To send emails to a server:

**File**: `lib/presentation/widgets/education_contact_section.dart`

```dart
void _submitForm() {
  // Replace with API call
  // Example using Dio:
  
  final dio = Dio();
  final response = await dio.post(
    'https://yourserver.com/api/contact',
    data: {
      'name': _nameController.text,
      'email': _emailController.text,
      'subject': _subjectController.text,
      'message': _messageController.text,
    },
  );
  
  if (response.statusCode == 200) {
    controller.contactFormMessage.value = 'Message sent!';
  }
}
```

## SEO Optimization

Update `web/index.html`:

```html
<meta name="description" content="Your professional description (160 chars)">
<meta name="keywords" content="flutter, developer, portfolio, ...">
<meta property="og:title" content="Your Name">
<meta property="og:description" content="Your tagline">
<meta property="og:image" content="https://yoursite.com/og-image.png">
```

## Analytics

To add Google Analytics:

Add to `web/index.html`:

```html
<script async src="https://www.googletagmanager.com/gtag/js?id=GA_ID"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'GA_ID');
</script>
```

## Common Customizations

### Change Hero Background
The hero section has a grid background. To change:

**File**: `lib/presentation/widgets/section_widgets.dart`

Modify the `grid-bg` CSS-equivalent style.

### Disable Mobile Menu Animation
**File**: `lib/presentation/widgets/app_nav_bar.dart`

Replace AnimatedIcon with regular Icon.

### Add Social Links
Update `_buildContactLeft()` in `education_contact_section.dart` to add more contact links.

## Troubleshooting

### Images Not Showing
- Check URL is accessible
- Use emoji fallback instead
- Test in browser DevTools

### Text Overlapping
- Check screen size breakpoint
- Adjust padding in `SectionContainer`
- Test on different devices

### Form Not Working
- Check browser console for errors
- Ensure email app is set up
- Try in incognito/private mode

## Best Practices

1. **Keep Content Updated** - Refresh experience and projects regularly
2. **Optimize Images** - Use optimized/compressed images
3. **Test on Mobile** - Always test responsive design
4. **Check Links** - Verify all external links work
5. **Use High-Quality Content** - Professional descriptions and images
6. **Mobile First** - Design for mobile, enhance for desktop
7. **Fast Load Times** - Optimize images and network requests

---

**Questions?** Check the main README.md or review widget source code for more examples!
