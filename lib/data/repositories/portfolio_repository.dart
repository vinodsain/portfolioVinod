import '../models/app_model.dart';
import '../models/education_model.dart';
import '../models/experience_model.dart';
import '../models/project_model.dart';
import '../models/skill_model.dart';

class PortfolioRepository {
  // Singleton instance
  static final PortfolioRepository _instance = PortfolioRepository._internal();

  factory PortfolioRepository() {
    return _instance;
  }

  PortfolioRepository._internal();

  // Get all live apps
  List<PortfolioApp> getLiveApps() {
    return [
      PortfolioApp(
        name: 'Finunique',
        category: 'Finance · Utility & Recharge',
        description:
            'B2B2C fintech super-app with 3-tier role hierarchy — Admin, Distributor, Retailer, User. Integrates 25+ financial services: DMT, BBPS, AEPS, IMPS/NEFT, mATM/POS, mobile recharge, bill payments, loans, insurance & travel booking. Biometric auth & real-time tracking.',
        icon:
            'https://play-lh.googleusercontent.com/i8mORHFvtO0fz4vq9cvC9f7-VzNjvHD6xctiSdYSJ3NO3Fj2GJEdrHeGontsCV0tGvyUjT9KPHPlG2vblhQJ=w240-h480',
        screenshot:
            'https://play-lh.googleusercontent.com/HgrGpmVxeKliOCXq_Q2sA3LYBV-J8Po1g3YttZR4Z-SBfux3_4SHs8IO3K8huLjrekGkaNt0Z5NrStFI2MiUBA=w526-h296',
        rating: 4.4,
        reviews: 44,
        downloads: '1K+',
        technologies: [
          'Flutter',
          'Dart',
          'BBPS/AEPS/DMT',
          'Biometric Auth',
          'Firebase',
          'REST APIs',
          'GetX',
        ],
        googlePlayUrl:
            'https://play.google.com/store/apps/details?id=com.utility.finunique',
        appStoreUrl: 'https://apps.apple.com/in/app/finunique/id6760808229',
        isLive: true,
      ),
      PortfolioApp(
        name: 'WallyHd',
        category: 'Photography · Wallpapers',
        description:
            'High-performance Android wallpaper app delivering a curated gallery of HD, Full HD & 4K wallpapers. Features lazy-loading image pipelines, intuitive browsing, and a smooth, polished user experience.',
        icon:
            'https://play-lh.googleusercontent.com/kJuifhVVGK4bCWHDs2Q4_QRHPzH2a1DfvTKKn1eY79sNUNjcAExwCWs6UPajgcu8ubmd9QGuurX5ll_uGIQ8JA=w240-h480-rw',
        screenshot:
            'https://play-lh.googleusercontent.com/hgk_HtUT8EJ0oF1R0sW8oQuGFy88GxbBtq4y2M-KxghFi3DlcstMetL2x4-433LBVPesX4arApqgW1j-dVVSNQ=w526-h296-rw',
        rating: 4.0,
        reviews: 20,
        downloads: '500+',
        technologies: [
          'Android',
          'Java',
          '4K / HD',
          'Lazy Loading',
          'Custom UI',
        ],
        googlePlayUrl:
            'https://play.google.com/store/apps/details?id=com.wallyhd.gallery',
        isLive: true,
      ),
      PortfolioApp(
        name: 'Linxness',
        category: 'Finance · DeFi Exchange',
        description:
            'Cross-chain DeFi exchange app with WalletConnect for non-custodial wallet auth. Real-time lending & borrowing via Aave. Supports Ethereum, Polygon, BNB Chain & Avalanche from a single Flutter interface.',
        icon: '🔗',
        screenshot: 'assets/linxness.png',
        rating: 4.5,
        reviews: 15,
        downloads: 'Private',
        technologies: [
          'Flutter',
          'GetX',
          'WalletConnect',
          'Web3Dart',
          'Aave',
          'Ethereum',
          'Polygon',
        ],
        isLive: false,
      ),
      PortfolioApp(
        name: 'Workshop Suite',
        category: 'Productivity · 3 Apps',
        description:
            'Suite of 3 Flutter productivity apps with real-time Firebase chat (Firestore), push notifications (FCM), and task-coordination workflows. Delivered on schedule with modular, scalable architecture.',
        icon: '🛠️',
        screenshot: 'assets/workshop.png',
        rating: 4.3,
        reviews: 8,
        downloads: 'Private',
        technologies: [
          'Flutter',
          'Firebase',
          'Firestore',
          'FCM',
          'Real-time Chat',
        ],
        isLive: false,
      ),
    ];
  }

  // Get experience entries
  List<ExperienceEntry> getExperience() {
    return [
      ExperienceEntry(
        period: 'Sep 2025 – Present',
        company: 'SevenUnique Tech Solution Pvt. Ltd.',
        role: 'Flutter Developer',
        location: 'Jaipur, India',
        projects: [
          Project(
            name: 'Finunique — B2B2C Fintech Super-App',
            description: [
              'Architected Flutter app with 3-tier role hierarchy (Admin → Distributor → Retailer → User) and permission-gated transaction workflows, ensuring clean separation of business logic.',
              'Integrated 25+ live financial APIs — BBPS, AEPS, DMT, IMPS/NEFT, mATM/POS — with biometric authentication and real-time transaction status tracking.',
              'Designed and built a full wallet & ledger system: commission calculation, auto-settlements, and reconciliation with audit-ready architecture.',
              'Implemented scoped state management reducing unnecessary UI rebuilds, improving perceived load performance by ~30%.',
            ],
          ),
          Project(
            name: 'WallyHd — Android Wallpaper App',
            description: [
              'Developed high-performance Android (Java) wallpaper gallery app with lazy-loading image pipeline for HD, Full HD & 4K content.',
              'Designed intuitive browsing UI with smooth transitions and curated wallpaper collections, published on Google Play.',
            ],
          ),
        ],
      ),
      ExperienceEntry(
        period: 'Feb 2025 – Aug 2025',
        company: 'Iskylar Technology',
        role: 'Flutter Developer',
        location: 'Jaipur, India',
        projects: [
          Project(
            name: 'Linxness — Cross-Chain DeFi Exchange',
            description: [
              'Built a multi-chain cryptocurrency exchange app in Flutter using GetX for performant state management across complex async DeFi data flows.',
              'Integrated WalletConnect protocol for non-custodial wallet connection — user keys never leave the device.',
              'Enabled real-time lending & borrowing powered by Aave market data; displayed live APY rates and position monitoring dashboards.',
              'Used Web3Dart for direct smart contract interactions, token transfers, and on-chain queries on Ethereum, Polygon, BNB Chain & Avalanche.',
            ],
          ),
          Project(
            name: 'Workshop — Internal Productivity Suite',
            description: [
              'Delivered 3 Flutter apps on time with modular architecture; implemented Firebase Firestore real-time chat and FCM push notifications.',
              'Led development coordination: code reviews, workflow management, and cross-team delivery.',
            ],
          ),
        ],
      ),
      ExperienceEntry(
        period: 'Dec 2023 – Jan 2025',
        company: 'Parasme Software Technology',
        role: 'Jr. Android Developer',
        location: 'Jaipur, India',
        projects: [
          Project(
            name: 'Mobile Development',
            description: [
              'Built and maintained Flutter & Android applications across full development lifecycle: design → development → testing → deployment.',
              'Delivered features and bug fixes using Android SDK, Jetpack Compose, and REST API integrations within Agile sprint cycles.',
              'Gained deep hands-on experience with Git workflows, state management patterns, and Play Store deployment processes.',
            ],
          ),
        ],
      ),
    ];
  }

  // Get skill categories
  List<SkillCategory> getSkillCategories() {
    return [
      SkillCategory(
        title: 'Mobile Frameworks',
        skills: [
          'Flutter',
          'Dart',
          'Android SDK',
          'Kotlin',
          'Java',
          'Jetpack Compose',
          'iOS / Xcode',
        ],
      ),
      SkillCategory(
        title: 'State Management',
        skills: ['GetX', 'BLoC', 'Provider', 'Riverpod', 'setState'],
      ),
      SkillCategory(
        title: 'Blockchain & Web3',
        skills: [
          'Web3Dart',
          'WalletConnect',
          'Aave',
          'Ethereum',
          'Polygon',
          'BNB Chain',
          'Avalanche',
          'Smart Contracts',
        ],
      ),
      SkillCategory(
        title: 'APIs & Payments',
        skills: [
          'REST APIs',
          'BBPS',
          'AEPS',
          'DMT',
          'IMPS / NEFT',
          'mATM / POS',
          'Payment Gateways',
        ],
      ),
      SkillCategory(
        title: 'Backend & Cloud',
        skills: [
          'Firebase Auth',
          'Firestore',
          'FCM',
          'Biometric Auth',
          'Real-time DB',
        ],
      ),
      SkillCategory(
        title: 'Tools & DevOps',
        skills: [
          'Android Studio',
          'VS Code',
          'Xcode',
          'Git / GitHub',
          'Postman',
          'Play Store',
          'App Store',
        ],
      ),
    ];
  }

  // Get proficiency skills
  List<ProficiencySkill> getProficiencySkills() {
    return [
      ProficiencySkill(name: 'Flutter / Dart', percentage: 92),
      ProficiencySkill(name: 'Android (Java / Kotlin)', percentage: 82),
      ProficiencySkill(name: 'REST API Integration', percentage: 90),
      ProficiencySkill(name: 'Firebase', percentage: 80),
      ProficiencySkill(name: 'Blockchain / Web3', percentage: 72),
      ProficiencySkill(name: 'UI / UX Design', percentage: 78),
    ];
  }

  // Get projects showcase
  List<ProjectShowcase> getProjectShowcase() {
    return [
      ProjectShowcase(
        title: 'Finunique — Fintech App',
        icon:
            'https://play-lh.googleusercontent.com/i8mORHFvtO0fz4vq9cvC9f7-VzNjvHD6xctiSdYSJ3NO3Fj2GJEdrHeGontsCV0tGvyUjT9KPHPlG2vblhQJ=w240-h480',
        description:
            'Full-stack fintech super-app with role-based hierarchy, 25+ financial service integrations, wallet & ledger system, biometric auth. Live on both Play Store & App Store.',
        tags: ['Flutter', 'Fintech', 'BBPS/AEPS', 'Firebase'],
        link:
            'https://play.google.com/store/apps/details?id=com.utility.finunique',
        linkText: 'Play Store →',
        badge: 'Live',
      ),
      ProjectShowcase(
        title: 'Finunique iOS',
        icon:
            'https://play-lh.googleusercontent.com/i8mORHFvtO0fz4vq9cvC9f7-VzNjvHD6xctiSdYSJ3NO3Fj2GJEdrHeGontsCV0tGvyUjT9KPHPlG2vblhQJ=w240-h480',

        description:
            'Full iOS port of the Finunique fintech platform built with Flutter. Deployed on the Apple App Store, serving users across iOS devices with full feature parity.',
        tags: ['Flutter', 'iOS', 'App Store'],
        link: 'https://apps.apple.com/in/app/finunique/id6760808229',
        linkText: 'App Store →',
        badge: 'Live · iOS',
      ),

      ProjectShowcase(
        title: 'WallyHd — Wallpaper App',
        icon:
            'https://play-lh.googleusercontent.com/kJuifhVVGK4bCWHDs2Q4_QRHPzH2a1DfvTKKn1eY79sNUNjcAExwCWs6UPajgcu8ubmd9QGuurX5ll_uGIQ8JA=w240-h480-rw',
        description:
            'Android wallpaper gallery with HD/4K content, lazy-loading image pipeline, smooth browsing experience. Published on Google Play.',
        tags: ['Android', 'Java', '4K HD'],
        link:
            'https://play.google.com/store/apps/details?id=com.wallyhd.gallery',
        linkText: 'Play Store →',
        badge: 'Live',
      ),
      ProjectShowcase(
        title: 'Linxness — DeFi Exchange',
        icon: '🔗',
        description:
            'Multi-chain DeFi exchange with WalletConnect, real-time Aave lending/borrowing, and support for 5+ blockchain networks in one Flutter app.',
        tags: ['Flutter', 'Web3', 'Aave', 'WalletConnect'],
        badge: 'Client',
      ),
      ProjectShowcase(
        title: 'Workshop',
        icon: '🛠️',
        description:
            '3 Flutter productivity apps with real-time Firebase chat, FCM push notifications, and team task-coordination workflows. Delivered on schedule.',
        tags: ['Flutter', 'Firebase', 'FCM', 'Firestore'],
        badge: 'Client',
      ),
      ProjectShowcase(
        title: 'Next Project',
        icon: '🚀',
        description:
            'Currently building something exciting. Open to freelance projects and collaborations in fintech, DeFi, or high-performance mobile apps.',
        tags: ['Flutter', 'Available'],
        link: '#contact',
        linkText: 'Discuss →',
        badge: 'In Progress',
      ),
    ];
  }

  // Get education entries
  List<EducationEntry> getEducation() {
    return [
      EducationEntry(
        period: '2021 — 2023',
        degree: 'Master of Computer Application',
        school: 'Maharishi Arvind Institute of Science and Management, Jaipur',
      ),
      EducationEntry(
        period: '2018 — 2021',
        degree: 'Bachelor of Science',
        school: 'Maharishi Arvind University, Jaipur',
      ),
      EducationEntry(
        period: 'Ongoing',
        degree: 'Self-learning & Upskilling',
        school:
            'Flutter, Blockchain/Web3, Jetpack Compose — continuous learning through official docs, courses & hands-on projects',
      ),
    ];
  }

  // Get stats
  Map<String, String> getStats() {
    return {'experience': '2+', 'apps': '8+', 'apis': '400+', 'companies': '3'};
  }
}
