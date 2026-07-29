import 'dart:ui';

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
      () => ClipRect(
        // Confines the BackdropFilter below to exactly this widget's bounds
        // (height: 64). Without this, BackdropFilter blurs the entire
        // rendering layer behind it rather than just its own widget —
        // which is why scrolling appeared to blur the whole page instead
        // of just the header strip.
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
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
                ? AppColors.bg.withOpacity(0.85)
                : AppColors.bg,
            boxShadow: isScrolled.value
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [],
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: isScrolled.value ? 8 : 0,
              sigmaY: isScrolled.value ? 8 : 0,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 48),
              child: Row(
                children: [
                  _AnimatedLogo(onTap: widget.onLogoTap),

                  const Spacer(),

                  if (!isMobile) ...[
                    _buildNavLink(context, AppStrings.liveApps, 'apps'),
                    const SizedBox(width: 8),

                    _buildNavLink(context, AppStrings.experience, 'experience'),
                    const SizedBox(width: 8),

                    _buildNavLink(context, AppStrings.skills, 'skills'),
                    const SizedBox(width: 8),

                    _buildNavLink(context, AppStrings.projects, 'projects'),
                    const SizedBox(width: 8),

                    _buildNavLink(context, AppStrings.education, 'education'),
                    const SizedBox(width: 20),

                    _HoverScaleButton(
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
                            widget.controller.isMobileMenuOpen.value
                                ? 1.0
                                : 0.0,
                          ),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavLink(BuildContext context, String label, String section) {
    return _HoverNavLink(
      label: label,
      onTap: () => widget.onNavLinkTap(section),
      controller: widget.controller,
      section: section,
    );
  }
}

/// Logo with subtle hover scale + rotation animation
class _AnimatedLogo extends StatefulWidget {
  final VoidCallback onTap;
  const _AnimatedLogo({required this.onTap});

  @override
  State<_AnimatedLogo> createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<_AnimatedLogo> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _hovering ? 1.08 : 1.0,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutBack,
          child: AnimatedRotation(
            turns: _hovering ? 0.02 : 0,
            duration: const Duration(milliseconds: 200),
            child: CircleAvatar(
              radius: 36,
              backgroundColor: AppColors.hi,
              child: ClipOval(
                child: Image.asset(
                  "assets/images/logo_new.png",
                  fit: BoxFit.cover,
                  width: 72,
                  height: 72,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Modern pill-style nav link.
/// - Unselected: plain white text, no background.
/// - Selected / hovered: accent-colored pill background with contrasting text,
///   animated in with a smooth scale + fade.
class _HoverNavLink extends StatefulWidget {
  final String label;
  final String section;
  final VoidCallback onTap;
  final HomeController controller;

  const _HoverNavLink({
    required this.label,
    required this.section,
    required this.onTap,
    required this.controller,
  });

  @override
  State<_HoverNavLink> createState() => _HoverNavLinkState();
}

class _HoverNavLinkState extends State<_HoverNavLink> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Obx(() {
          final isActive =
              widget.controller.activeSection.value == widget.section;
          final highlight = isActive || _hovering;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOutCubic,
            margin: const EdgeInsets.symmetric(horizontal: 2),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isActive
                  ? AppColors.ink3
                  : (_hovering
                        ? AppColors.hi.withOpacity(0.12)
                        : Colors.transparent),
              borderRadius: BorderRadius.circular(999),
            ),
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: isActive
                    ? AppColors.hi
                    : (_hovering ? AppColors.ink3 : AppColors.ink2),
                fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
              ),
              child: Text(widget.label),
            ),
          );
        }),
      ),
    );
  }
}

/// CTA button with hover scale + shadow lift
class _HoverScaleButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget child;

  const _HoverScaleButton({required this.onPressed, required this.child});

  @override
  State<_HoverScaleButton> createState() => _HoverScaleButtonState();
}

class _HoverScaleButtonState extends State<_HoverScaleButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedScale(
        scale: _hovering ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: _hovering
                ? [
                    BoxShadow(
                      color: AppColors.hi.withOpacity(0.4),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ]
                : [],
          ),
          child: ElevatedButton(
            onPressed: widget.onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.hi,
              foregroundColor: AppColors.ink2,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: widget.child,
          ),
        ),
      ),
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
      return AnimatedSize(
        duration: const Duration(milliseconds: 280),
        curve: Curves.easeInOut,
        child: !controller.isMobileMenuOpen.value
            ? const SizedBox(width: double.infinity)
            : Material(
                elevation: 4,
                color: AppColors.bg,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 24,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildMobileNavLink(
                        controller,
                        AppStrings.liveApps,
                        'apps',
                        0,
                      ),
                      _buildMobileNavLink(
                        controller,
                        AppStrings.experience,
                        'experience',
                        1,
                      ),
                      _buildMobileNavLink(
                        controller,
                        AppStrings.skills,
                        'skills',
                        2,
                      ),
                      _buildMobileNavLink(
                        controller,
                        AppStrings.projects,
                        'projects',
                        3,
                      ),
                      _buildMobileNavLink(
                        controller,
                        AppStrings.education,
                        'education',
                        4,
                      ),
                      _buildMobileNavLink(
                        controller,
                        AppStrings.contact,
                        'contact',
                        5,
                      ),
                    ],
                  ),
                ),
              ),
      );
    });
  }

  Widget _buildMobileNavLink(
    HomeController controller,
    String label,
    String section,
    int index,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: 1),
        duration: Duration(milliseconds: 250 + (index * 60)),
        curve: Curves.easeOutCubic,
        builder: (context, value, child) {
          return Opacity(
            opacity: value,
            child: Transform.translate(
              offset: Offset((1 - value) * 30, 0),
              child: child,
            ),
          );
        },
        child: Obx(() {
          final isActive = controller.activeSection.value == section;

          return InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              controller.isMobileMenuOpen.value = false;
              onNavLinkTap(section);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
              decoration: BoxDecoration(
                color: isActive ? AppColors.hi : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: isActive ? FontWeight.w700 : FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
