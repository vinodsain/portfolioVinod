import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/presentation/controllers/home_controller.dart';
import 'package:portfolio/presentation/widgets/app_nav_bar.dart';
import 'package:portfolio/presentation/widgets/apps_section.dart';
import 'package:portfolio/presentation/widgets/education_contact_section.dart';
import 'package:portfolio/presentation/widgets/experience_section.dart';
import 'package:portfolio/presentation/widgets/footer.dart';
import 'package:portfolio/presentation/widgets/hero_section.dart';
import 'package:portfolio/presentation/widgets/projects_section.dart';
import 'package:portfolio/presentation/widgets/skills_section.dart';

import '../../../utils/constants/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController _controller;

  // Global Keys for sections
  final GlobalKey _appsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _educationKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _controller = Get.put(HomeController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Stack(
        children: [
          // Main Content
          SingleChildScrollView(
            controller: _controller.scrollController,
            child: Column(
              children: [
                // Hero Section
                HeroSection(controller: _controller, onCtaTap: _handleCtaTap),
                // Live Apps Section
                _buildSection(
                  key: _appsKey,
                  child: AppsSection(controller: _controller),
                ),
                // Experience Section
                _buildSection(
                  key: _experienceKey,
                  child: ExperienceSection(controller: _controller),
                ),
                // Skills Section
                _buildSection(
                  key: _skillsKey,
                  child: SkillsSection(controller: _controller),
                ),
                // Projects Section
                _buildSection(
                  key: _projectsKey,
                  child: ProjectsSection(controller: _controller),
                ),
                // Education Section
                _buildSection(
                  key: _educationKey,
                  child: EducationSection(controller: _controller),
                ),
                // Contact Section
                _buildSection(
                  key: _contactKey,
                  child: ContactSection(controller: _controller),
                ),
                // Footer
                AppFooter(scrollController: _controller.scrollController),
              ],
            ),
          ),
          // Navigation Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 64,
            child: AppNavBar(
              controller: _controller,
              onLogoTap: () {
                _controller.scrollController.animateTo(
                  0,
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeInOutCubic,
                );
              },
              onNavLinkTap: _handleCtaTap,
            ),
          ),
          // Mobile Menu
          Positioned(
            top: 64,
            left: 0,
            right: 0,
            child: MobileMenu(
              controller: _controller,
              onNavLinkTap: _handleCtaTap,
            ),
          ),
          // Scroll Progress Bar
          Obx(
            () => Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 2,
                width:
                    MediaQuery.of(context).size.width *
                    _controller.scrollProgress.value,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF00f5a0), Color(0xFF00d9f5)],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({required GlobalKey key, required Widget child}) {
    return Container(key: key, child: child);
  }

  void _handleCtaTap(String section) {
    GlobalKey? targetKey;

    switch (section) {
      case 'apps':
        targetKey = _appsKey;
        _controller.setActiveSection('apps');
        break;
      case 'experience':
        targetKey = _experienceKey;
        _controller.setActiveSection('experience');
        break;
      case 'skills':
        targetKey = _skillsKey;
        _controller.setActiveSection('skills');
        break;
      case 'projects':
        targetKey = _projectsKey;
        _controller.setActiveSection('projects');
        break;
      case 'education':
        targetKey = _educationKey;
        _controller.setActiveSection('education');
        break;
      case 'contact':
        targetKey = _contactKey;
        _controller.setActiveSection('contact');
        break;
    }

    if (targetKey != null) {
      _controller.scrollToSection(targetKey);
    }
  }
}
