import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/app_model.dart';
import '../../../data/models/education_model.dart';
import '../../../data/models/experience_model.dart';
import '../../../data/models/project_model.dart';
import '../../../data/models/skill_model.dart';
import '../../../data/repositories/portfolio_repository.dart';

class HomeController extends GetxController {
  final repository = PortfolioRepository();

  // Observable variables
  RxList<PortfolioApp> liveApps = <PortfolioApp>[].obs;
  RxList<ExperienceEntry> experiences = <ExperienceEntry>[].obs;
  RxList<SkillCategory> skillCategories = <SkillCategory>[].obs;
  RxList<ProficiencySkill> proficiencySkills = <ProficiencySkill>[].obs;
  RxList<ProjectShowcase> projects = <ProjectShowcase>[].obs;
  RxList<EducationEntry> education = <EducationEntry>[].obs;
  RxMap<String, String> stats = <String, String>{}.obs;

  // UI State
  RxBool isLoading = true.obs;
  RxBool isMobileMenuOpen = false.obs;
  RxDouble scrollProgress = 0.0.obs;
  RxString activeSection = 'home'.obs;

  // Controllers
  final scrollController = ScrollController();
  final nameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final subjectFocusNode = FocusNode();
  final messageFocusNode = FocusNode();

  // Form variables
  RxString contactFormMessage = ''.obs;
  RxBool isContactFormSending = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
    scrollController.addListener(_onScroll);
  }

  void loadData() {
    try {
      isLoading.value = true;

      // Load all data from repository
      liveApps.assignAll(repository.getLiveApps());
      experiences.assignAll(repository.getExperience());
      skillCategories.assignAll(repository.getSkillCategories());
      proficiencySkills.assignAll(repository.getProficiencySkills());
      projects.assignAll(repository.getProjectShowcase());
      education.assignAll(repository.getEducation());
      stats.assignAll(repository.getStats());

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', 'Failed to load portfolio data');
    }
  }

  void _onScroll() {
    if (scrollController.hasClients) {
      final maxScroll = scrollController.position.maxScrollExtent;
      final currentScroll = scrollController.position.pixels;
      scrollProgress.value = (currentScroll / maxScroll);
    }
  }

  void toggleMobileMenu() {
    isMobileMenuOpen.toggle();
  }

  void closeMobileMenu() {
    isMobileMenuOpen.value = false;
  }

  void setActiveSection(String section) {
    activeSection.value = section;
  }

  void scrollToSection(GlobalKey? key) {
    if (key == null) return;

    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
      );
    }
    closeMobileMenu();
  }

  void submitContactForm({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    try {
      isContactFormSending.value = true;

      // Simulate form submission
      await Future.delayed(const Duration(milliseconds: 800));

      contactFormMessage.value = 'Message sent successfully!';
      isContactFormSending.value = false;

      // Clear form after success
      Future.delayed(const Duration(seconds: 3), () {
        contactFormMessage.value = '';
      });
    } catch (e) {
      contactFormMessage.value = 'Error sending message';
      isContactFormSending.value = false;
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    nameFocusNode.dispose();
    emailFocusNode.dispose();
    subjectFocusNode.dispose();
    messageFocusNode.dispose();
    super.onClose();
  }
}
