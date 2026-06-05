import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../presentation/controllers/home_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/strings.dart';

class AppNavBar extends StatefulWidget {
  final HomeController controller;
  final VoidCallback onLogoTap;
  final Function(String) onNavLinkTap;

  const AppNavBar({
    Key? key,
    required this.controller,
    required this.onLogoTap,
    required this.onNavLinkTap,
  }) : super(key: key);

  @override
  State<AppNavBar> createState() => _AppNavBarState();
}

class _AppNavBarState extends State<AppNavBar> {
  late ScrollController _scrollController;
  final RxBool isScrolled = false.obs;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.controller.scrollController;
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    isScrolled.value =
        _scrollController.hasClients && _scrollController.offset > 50;
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return Obx(
      () => Container(
        height: 64,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isScrolled.value ? AppColors.border : Colors.transparent,
              width: 1,
            ),
          ),
          color: isScrolled.value
              ? AppColors.bg.withOpacity(0.90)
              : AppColors.bg,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 48),
          child: Row(
            children: [
              GestureDetector(
                onTap: widget.onLogoTap,
                child: CircleAvatar(
                  radius: 36,
                  backgroundColor: AppColors.hi,
                  child: Image.asset("assets/images/logo_new.png"),
                ),
              ),

              const Spacer(),

              if (!isMobile) ...[
                _buildNavLink(context, AppStrings.liveApps, 'apps'),
                const SizedBox(width: 28),

                _buildNavLink(context, AppStrings.experience, 'experience'),
                const SizedBox(width: 28),

                _buildNavLink(context, AppStrings.skills, 'skills'),
                const SizedBox(width: 28),

                _buildNavLink(context, AppStrings.projects, 'projects'),
                const SizedBox(width: 28),

                _buildNavLink(context, AppStrings.education, 'education'),
                const SizedBox(width: 28),

                ElevatedButton(
                  onPressed: () => widget.onNavLinkTap('contact'),
                  child: const Text(AppStrings.hireMe),
                ),
              ] else ...[
                IconButton(
                  onPressed: widget.controller.toggleMobileMenu,
                  icon: Obx(
                    () => AnimatedIcon(
                      icon: AnimatedIcons.menu_close,
                      progress: AlwaysStoppedAnimation(
                        widget.controller.isMobileMenuOpen.value ? 1.0 : 0.0,
                      ),
                      color: AppColors.ink,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavLink(BuildContext context, String label, String section) {
    return InkWell(
      onTap: () => widget.onNavLinkTap(section),
      child: Obx(() {
        final isActive = widget.controller.activeSection.value == section;

        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: isActive ? AppColors.hi : AppColors.ink2,
              ),
            ),
            const SizedBox(height: 4),
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: isActive ? 20 : 0,
              height: 1,
              color: AppColors.hi,
            ),
          ],
        );
      }),
    );
  }
}

class MobileMenu extends StatelessWidget {
  final HomeController controller;
  final Function(String) onNavLinkTap;

  const MobileMenu({
    Key? key,
    required this.controller,
    required this.onNavLinkTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (!controller.isMobileMenuOpen.value) {
        return const SizedBox.shrink();
      }

      return Material(
        elevation: 4,
        color: AppColors.bg,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildMobileNavLink(AppStrings.liveApps, 'apps'),
              const SizedBox(height: 20),

              _buildMobileNavLink(AppStrings.experience, 'experience'),
              const SizedBox(height: 20),

              _buildMobileNavLink(AppStrings.skills, 'skills'),
              const SizedBox(height: 20),

              _buildMobileNavLink(AppStrings.projects, 'projects'),
              const SizedBox(height: 20),

              _buildMobileNavLink(AppStrings.education, 'education'),
              const SizedBox(height: 20),

              _buildMobileNavLink(AppStrings.contact, 'contact'),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildMobileNavLink(String label, String section) {
    return InkWell(
      onTap: () {
        controller.isMobileMenuOpen.value = false;
        onNavLinkTap(section);
      },
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.ink,
        ),
      ),
    );
  }
}
