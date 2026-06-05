import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../presentation/controllers/home_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/strings.dart';

class HeroSection extends StatefulWidget {
  final HomeController controller;
  final Function(String) onCtaTap;

  const HeroSection({
    Key? key,
    required this.controller,
    required this.onCtaTap,
  }) : super(key: key);

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return Container(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).viewInsets.bottom > 0
            ? MediaQuery.of(context).size.height
            : MediaQuery.of(context).size.height,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 48,
        vertical: isMobile ? 60 : 80,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Badge
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Opacity(
                    opacity: _animationController.value,
                    child: Transform.translate(
                      offset: Offset(0, 50 * (1 - _animationController.value)),
                      child: child,
                    ),
                  );
                },
                child: _buildBadge(),
              ),
              SizedBox(height: isMobile ? 24 : 32),

              // Name
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Opacity(
                    opacity: _animationController.value,
                    child: Transform.translate(
                      offset: Offset(0, 60 * (1 - _animationController.value)),
                      child: child,
                    ),
                  );
                },
                child: _buildName(context, isMobile),
              ),
              SizedBox(height: isMobile ? 20 : 24),

              // Description
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Opacity(
                    opacity: _animationController.value,
                    child: Transform.translate(
                      offset: Offset(0, 60 * (1 - _animationController.value)),
                      child: child,
                    ),
                  );
                },
                child: _buildDescription(context),
              ),
              SizedBox(height: isMobile ? 32 : 48),

              // CTA Buttons
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Opacity(
                    opacity: _animationController.value,
                    child: Transform.translate(
                      offset: Offset(0, 60 * (1 - _animationController.value)),
                      child: child,
                    ),
                  );
                },
                child: _buildCTAButtons(context, isMobile),
              ),
              SizedBox(height: isMobile ? 40 : 64),

              // Stats Strip
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Opacity(
                    opacity: _animationController.value,
                    child: Transform.translate(
                      offset: Offset(0, 60 * (1 - _animationController.value)),
                      child: child,
                    ),
                  );
                },
                child: _buildStatsStrip(context, isMobile),
              ),

              // Scroll Indicator
              Center(
                child: Column(
                  children: [
                    Text(
                      AppStrings.scroll,
                      style: Theme.of(
                        context,
                      ).textTheme.labelSmall!.copyWith(color: AppColors.ink3),
                    ),
                    const SizedBox(height: 8),
                    CustomPaint(
                      painter: ScrollIndicatorPainter(),
                      size: const Size(1, 40),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.hi.withOpacity(0.08),
        border: Border.all(color: AppColors.hi.withOpacity(0.2), width: 1),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: AppColors.hi,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            AppStrings.availableBadge,
            style: Theme.of(
              context,
            ).textTheme.labelSmall!.copyWith(color: AppColors.hi),
          ),
        ],
      ),
    );
  }

  Widget _buildName(BuildContext context, bool isMobile) {
    return Text(
      AppStrings.heroName,
      style: Theme.of(
        context,
      ).textTheme.displayLarge!.copyWith(fontSize: isMobile ? 56 : 120),
    );
  }

  Widget _buildDescription(BuildContext context) {
    return SizedBox(
      width: 700,
      child: Text(
        AppStrings.heroDesc,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }

  Widget _buildCTAButtons(BuildContext context, bool isMobile) {
    const buttonHeight = 50.0;

    return Wrap(
      spacing: 16,
      runSpacing: 12,
      children: [
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(180, buttonHeight),
          ),
          icon: const Icon(Icons.play_arrow, size: 14),
          onPressed: () => widget.onCtaTap('apps'),
          label: const Text(AppStrings.viewLiveApps),
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(180, buttonHeight),
          ),
          onPressed: () => widget.onCtaTap('contact'),
          child: const Text(AppStrings.getInTouch),
        ),
      ],
    );
  }

  Widget _buildStatsStrip(BuildContext context, bool isMobile) {
    return Obx(() {
      final stats = widget.controller.stats;
      if (stats.isEmpty) return const SizedBox.shrink();

      return Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(4),
          color: AppColors.card,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildStatItem(context, stats['experience']!, 'Years Exp.'),
              Container(width: 1, height: 80, color: AppColors.border),
              _buildStatItem(context, stats['apps']!, 'Apps Shipped'),
              Container(width: 1, height: 80, color: AppColors.border),
              _buildStatItem(context, stats['apis']!, 'APIs Integrated'),
              Container(width: 1, height: 80, color: AppColors.border),
              _buildStatItem(context, stats['companies']!, 'Companies'),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildStatItem(BuildContext context, String value, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        children: [
          Text(
            value,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: AppColors.hi,
              fontSize: 28,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.labelSmall!.copyWith(color: AppColors.ink3),
          ),
        ],
      ),
    );
  }
}

class ScrollIndicatorPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.hi
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    // Draw gradient line
    canvas.drawLine(
      Offset(size.width / 2, 0),
      Offset(size.width / 2, size.height),
      paint,
    );

    // Draw arrow
    final arrowPaint = Paint()
      ..color = AppColors.hi
      ..strokeWidth = 1.5;

    const arrowSize = 6.0;
    canvas.drawLine(
      Offset(size.width / 2 - arrowSize / 2, size.height - arrowSize),
      Offset(size.width / 2, size.height),
      arrowPaint,
    );
    canvas.drawLine(
      Offset(size.width / 2 + arrowSize / 2, size.height - arrowSize),
      Offset(size.width / 2, size.height),
      arrowPaint,
    );
  }

  @override
  bool shouldRepaint(ScrollIndicatorPainter oldDelegate) => false;
}
