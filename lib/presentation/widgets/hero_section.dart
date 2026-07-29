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
        minHeight: MediaQuery.of(context).size.height,
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.bg, AppColors.bg2],
                ),
              ),
            ),
          ),

          Positioned(
            top: -150,
            right: -100,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.hi.withOpacity(.08),
              ),
            ),
          ),

          Positioned(
            bottom: -200,
            left: -150,
            child: Container(
              width: 450,
              height: 450,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.hi4.withOpacity(.08),
              ),
            ),
          ),

          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1400),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 24 : 80,
                  vertical: 80,
                ),
                child: isMobile
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildHeroContent(true),
                          const SizedBox(height: 60),
                          _buildPhoneMockup(),
                        ],
                      )
                    : Row(
                        children: [
                          Expanded(flex: 6, child: _buildHeroContent(false)),
                          Expanded(flex: 4, child: _buildPhoneMockup()),
                        ],
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhoneMockup() {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(seconds: 2),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 20 * (1 - value)),
          child: child,
        );
      },
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [AppColors.hi.withOpacity(.3), Colors.transparent],
                ),
              ),
            ),

            Container(
              width: 280,
              height: 580,
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(40),
                border: Border.all(color: AppColors.border2),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.hi.withOpacity(.25),
                    blurRadius: 40,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.asset(
                  "assets/images/preview.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroContent(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.hi.withOpacity(.08),
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: AppColors.hi.withOpacity(.3)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.ink2,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                AppStrings.availableBadge,
                style: const TextStyle(
                  color: AppColors.ink2,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 30),

        Text(
          "Hi, I'm",
          style: TextStyle(fontSize: isMobile ? 24 : 32, color: AppColors.ink2),
        ),

        const SizedBox(height: 8),

        Text(
          "VINOD",
          style: TextStyle(
            fontSize: isMobile ? 60 : 120,
            height: .9,
            fontWeight: FontWeight.w900,
            color: AppColors.ink,
          ),
        ),

        ShaderMask(
          shaderCallback: (bounds) {
            return const LinearGradient(
              colors: [AppColors.hi, AppColors.hi4],
            ).createShader(bounds);
          },
          child: Text(
            "SAIN",
            style: TextStyle(
              fontSize: isMobile ? 60 : 120,
              height: .9,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ),

        const SizedBox(height: 30),

        SizedBox(
          width: 650,
          child: Text(
            AppStrings.heroDesc,
            style: TextStyle(
              fontSize: isMobile ? 16 : 20,
              height: 1.8,
              color: AppColors.ink2,
            ),
          ),
        ),

        const SizedBox(height: 40),

        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.rocket_launch, color: AppColors.ink2),
              label: const Text(
                "View Projects",
                style: TextStyle(color: AppColors.ink2),
              ),
              onPressed: () => widget.onCtaTap("projects"),
            ),

            OutlinedButton(
              onPressed: () => widget.onCtaTap("contact"),
              child: const Text("Hire Me"),
            ),
          ],
        ),

        const SizedBox(height: 50),

        _buildModernStats(),
      ],
    );
  }

  Widget _buildModernStats() {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      children: [
        _statCard("2+", "Years"),
        _statCard("10+", "Apps"),
        _statCard("300+", "APIs"),
        _statCard("3", "Companies"),
      ],
    );
  }

  Widget _statCard(String value, String title) {
    return Container(
      width: 130,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.card.withOpacity(.6),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: AppColors.ink2,
            ),
          ),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(color: AppColors.ink2)),
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
