import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';

class SectionHeader extends StatelessWidget {
  final String label;
  final String title;
  final String? highlightedWord;
  final bool isRevealed;

  const SectionHeader({
    Key? key,
    required this.label,
    required this.title,
    this.highlightedWord,
    this.isRevealed = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 56),
      child: AnimatedOpacity(
        opacity: isRevealed ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 700),
        child: AnimatedSlide(
          offset: isRevealed ? Offset.zero : const Offset(0, 0.4),
          duration: const Duration(milliseconds: 700),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Label
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    Text(
                      '// ',
                      style: Theme.of(
                        context,
                      ).textTheme.labelSmall!.copyWith(color: AppColors.ink3),
                    ),
                    Text(
                      label,
                      style: Theme.of(
                        context,
                      ).textTheme.labelSmall!.copyWith(color: AppColors.hi),
                    ),
                  ],
                ),
              ),
              // Title
              RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.displayMedium,
                  children: [
                    if (highlightedWord != null)
                      TextSpan(
                        text: title.replaceAll(highlightedWord!, ''),
                        style: const TextStyle(color: AppColors.ink),
                      ),
                    if (highlightedWord != null) ...[
                      TextSpan(
                        text: highlightedWord,
                        style: const TextStyle(color: AppColors.hi),
                      ),
                    ] else ...[
                      TextSpan(
                        text: title,
                        style: const TextStyle(color: AppColors.ink),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final bool fullWidth;
  final bool hasBorder;

  const SectionContainer({
    Key? key,
    required this.child,
    this.padding,
    this.fullWidth = false,
    this.hasBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;
    final horizontalPadding = isMobile ? 24.0 : 48.0;

    return Container(
      decoration: BoxDecoration(
        color: fullWidth ? AppColors.bg2 : Colors.transparent,
        border: hasBorder
            ? Border(
                top: const BorderSide(color: AppColors.border),
                bottom: const BorderSide(color: AppColors.border),
              )
            : null,
      ),
      child: Padding(
        padding:
            padding ??
            EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: isMobile ? 80 : 112,
            ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: child,
          ),
        ),
      ),
    );
  }
}
