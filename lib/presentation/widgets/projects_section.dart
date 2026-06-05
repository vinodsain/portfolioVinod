import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../data/models/project_model.dart';
import '../../../presentation/controllers/home_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/strings.dart';
import 'section_widgets.dart';

class ProjectsSection extends StatelessWidget {
  final HomeController controller;

  const ProjectsSection({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return SectionContainer(
      fullWidth: true,
      hasBorder: true,
      child: Column(
        children: [
          SectionHeader(
            label: AppStrings.allWork,
            title: 'Project Showcase',
            highlightedWord: 'Showcase',
            isRevealed: true,
          ),
          Obx(
            () => GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: isMobile ? 400 : 350,
                mainAxisSpacing: 14,
                crossAxisSpacing: 14,
              ),
              itemCount: controller.projects.length,
              itemBuilder: (context, index) {
                return ProjectCard(project: controller.projects[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final ProjectShowcase project;

  const ProjectCard({Key? key, required this.project}) : super(key: key);

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.card,
          border: Border.all(
            color: isHovered ? AppColors.hi : AppColors.border,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                // Top Section
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: AppColors.border, width: 1),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        widget.project.icon,
                        width: 40,
                        height: 40,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 40,
                            height: 40,
                            color: AppColors.border,
                            child: const Icon(Icons.broken_image, size: 20),
                          );
                        },
                      ),
                      const SizedBox(height: 12),
                      Text(
                        widget.project.title,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        widget.project.description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.ink2,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                // Bottom Section
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Wrap(
                              spacing: 6,
                              children: widget.project.tags
                                  .map((tag) => _buildTag(context, tag))
                                  .toList(),
                            ),
                          ),
                          if (widget.project.link != null)
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () => _openLink(widget.project.link!),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      widget.project.linkText ?? 'View',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall!
                                          .copyWith(
                                            color: AppColors.hi,
                                            fontSize: 11,
                                          ),
                                    ),
                                    const SizedBox(width: 4),
                                    const Icon(
                                      Icons.arrow_forward,
                                      size: 11,
                                      color: AppColors.hi,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Badge
            Positioned(
              top: 16,
              right: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: _getBadgeColor(widget.project.badge),
                  border: Border.all(
                    color: _getBadgeBorderColor(widget.project.badge),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  widget.project.badge,
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: _getBadgeTextColor(widget.project.badge),
                    fontSize: 9,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(BuildContext context, String tag) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border2, width: 1),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Text(
        tag,
        style: Theme.of(
          context,
        ).textTheme.labelSmall!.copyWith(color: AppColors.ink3, fontSize: 9),
      ),
    );
  }

  Color _getBadgeColor(String badge) {
    if (badge.contains('Live')) {
      return AppColors.hi.withOpacity(0.1);
    } else if (badge.contains('Client')) {
      return Colors.white.withOpacity(0.05);
    }
    return AppColors.bg2.withOpacity(0.5);
  }

  Color _getBadgeBorderColor(String badge) {
    if (badge.contains('Live')) {
      return AppColors.hi.withOpacity(0.2);
    } else if (badge.contains('Client')) {
      return Colors.white.withOpacity(0.12);
    }
    return AppColors.border;
  }

  Color _getBadgeTextColor(String badge) {
    if (badge.contains('Live')) {
      return AppColors.hi;
    } else if (badge.contains('Client')) {
      return AppColors.ink3;
    }
    return AppColors.ink2;
  }

  void _openLink(String link) async {
    if (link.startsWith('#')) {
      // Internal link
      return;
    }
    final Uri url = Uri.parse(link);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }
}
