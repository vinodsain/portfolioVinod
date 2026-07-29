import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../data/models/app_model.dart';
import '../../../presentation/controllers/home_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/strings.dart';
import 'section_widgets.dart';

class AppsSection extends StatelessWidget {
  final HomeController controller;

  const AppsSection({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return SectionContainer(
      child: Column(
        children: [
          SectionHeader(
            label: AppStrings.publishedWork,
            title: 'Live Apps',
            highlightedWord: 'Apps',
            isRevealed: true,
          ),
          Obx(
            () => GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: isMobile ? 400 : 380,
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
                mainAxisExtent: 580,
              ),
              itemCount: controller.liveApps.length,
              itemBuilder: (context, index) {
                return AppCard(app: controller.liveApps[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AppCard extends StatefulWidget {
  final PortfolioApp app;

  const AppCard({Key? key, required this.app}) : super(key: key);

  @override
  State<AppCard> createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  bool isHovered = false;

  // ─── Helpers ────────────────────────────────────────────────────────────────

  /// Returns true when the string is a remote HTTPS URL.
  bool _isUrl(String value) => value.startsWith('https://');

  /// Returns true when the string is a local asset path.
  bool _isAsset(String value) =>
      value.startsWith('assets/') || value.startsWith('asset/');

  // ─── Screenshot widget ───────────────────────────────────────────────────────

  Widget _buildScreenshot() {
    final src = widget.app.screenshot;

    if (_isUrl(src)) {
      return Image.network(
        src,
        width: double.infinity,
        height: 190,
        fit: BoxFit.cover,
        // Show a shimmer-style placeholder while loading
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return _buildScreenshotPlaceholder();
        },
        // Fall back to icon placeholder on error (e.g. CORS on web)
        errorBuilder: (_, __, ___) => _buildScreenshotPlaceholder(),
      );
    }

    if (_isAsset(src)) {
      return Image.asset(
        src,
        width: double.infinity,
        height: 190,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => _buildScreenshotPlaceholder(),
      );
    }

    // Emoji / unknown — show placeholder
    return _buildScreenshotPlaceholder();
  }

  /// Placeholder shown when the screenshot cannot be loaded.
  Widget _buildScreenshotPlaceholder() {
    return Container(
      width: double.infinity,
      height: 190,
      color: AppColors.bg2,
      child: Center(
        child: Text(
          // If the icon is a URL we can't render it as text — use a generic symbol
          _isUrl(widget.app.icon) ? '📱' : widget.app.icon,
          style: const TextStyle(fontSize: 48),
        ),
      ),
    );
  }

  // ─── App icon widget ─────────────────────────────────────────────────────────

  Widget _buildIcon() {
    final src = widget.app.icon;

    // Remote image icon
    if (_isUrl(src)) {
      return Image.network(
        src,
        width: 54,
        height: 54,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(width: 54, height: 54, color: AppColors.bg2);
        },
        errorBuilder: (_, __, ___) =>
            const Center(child: Text('📱', style: TextStyle(fontSize: 28))),
      );
    }

    // Local asset icon
    if (_isAsset(src)) {
      return Image.asset(
        src,
        width: 54,
        height: 54,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) =>
            const Center(child: Text('📱', style: TextStyle(fontSize: 28))),
      );
    }

    // Emoji / text icon (e.g. '🔗', '🛠️', '🚀')
    return Center(child: Text(src, style: const TextStyle(fontSize: 28)));
  }

  // ─── Build ───────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Container(
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: isHovered ? AppColors.card2 : AppColors.card,
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // ── Screenshot ──────────────────────────────────────────────
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(4),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 190,
                    child: _buildScreenshot(),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ── Header ────────────────────────────────────────────
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Icon container — clipBehavior clips network images
                          // to the rounded rectangle correctly
                          Container(
                            width: 54,
                            height: 54,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              color: AppColors.bg2,
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(color: AppColors.border2),
                            ),
                            child: _buildIcon(),
                          ),

                          const SizedBox(width: 16),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.app.name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.ink,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  widget.app.category,
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // ── Description ───────────────────────────────────────
                      Text(
                        widget.app.description,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.ink2,
                          fontSize: 13,
                          height: 1.6,
                        ),
                      ),

                      const SizedBox(height: 16),

                      // ── Tech Stack ────────────────────────────────────────
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: widget.app.technologies
                            .map((tech) => _buildTechPill(context, tech))
                            .toList(),
                      ),

                      const SizedBox(height: 16),

                      // ── Store Buttons ─────────────────────────────────────
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          if (widget.app.googlePlayUrl != null)
                            _buildStoreButton(
                              context,
                              'Google Play',
                              widget.app.googlePlayUrl!,
                              true,
                            ),
                          if (widget.app.appStoreUrl != null)
                            _buildStoreButton(
                              context,
                              'App Store',
                              widget.app.appStoreUrl!,
                              false,
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // ── Live badge ──────────────────────────────────────────────────
            if (widget.app.isLive)
              Positioned(
                top: 16,
                right: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.hi.withOpacity(0.08),
                    border: Border.all(color: AppColors.hi.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 5,
                        height: 5,
                        decoration: const BoxDecoration(
                          color: AppColors.ink2,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Live',
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: AppColors.ink2,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // ─── Pill & button helpers ───────────────────────────────────────────────────

  Widget _buildTechPill(BuildContext context, String tech) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border2, width: 1),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Text(
        tech,
        style: Theme.of(
          context,
        ).textTheme.labelSmall!.copyWith(color: AppColors.ink3, fontSize: 9),
      ),
    );
  }

  Widget _buildStoreButton(
    BuildContext context,
    String label,
    String url,
    bool isAndroid,
  ) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _launchUrl(url),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: isAndroid
                ? AppColors.hi.withOpacity(0.08)
                : Colors.white.withOpacity(0.05),
            border: Border.all(
              color: isAndroid
                  ? AppColors.hi.withOpacity(0.25)
                  : Colors.white.withOpacity(0.12),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isAndroid ? Icons.android : Icons.apple,
                size: 13,
                color: isAndroid ? AppColors.ink2 : Colors.grey,
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: isAndroid ? AppColors.ink2 : Colors.grey,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }
}
