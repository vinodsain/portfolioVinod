import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/strings.dart';

class AppFooter extends StatelessWidget {
  final ScrollController scrollController;

  const AppFooter({Key? key, required this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.border, width: 1)),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 48,
        vertical: 32,
      ),
      child: isMobile
          ? Column(children: [Center(child: _buildFooterContent(context))])
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [_buildFooterContent(context), _buildBackToTop()],
            ),
    );
  }

  Widget _buildFooterContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.logo, style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 16),
        Text(
          AppStrings.footerCopy,
          style: Theme.of(
            context,
          ).textTheme.labelSmall!.copyWith(color: AppColors.ink3),
        ),
      ],
    );
  }

  Widget _buildBackToTop() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOutCubic,
          );
        },
        child: Row(
          children: [
            Text(
              AppStrings.backToTop,
              style: const TextStyle(
                fontSize: 11,
                color: AppColors.hi,
                letterSpacing: 0.1,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 6),
            const Icon(Icons.arrow_upward, size: 11, color: AppColors.hi),
          ],
        ),
      ),
    );
  }
}
