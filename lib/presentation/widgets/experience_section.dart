import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/experience_model.dart';
import '../../../presentation/controllers/home_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/strings.dart';
import 'section_widgets.dart';

class ExperienceSection extends StatelessWidget {
  final HomeController controller;

  const ExperienceSection({Key? key, required this.controller})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      fullWidth: true,
      hasBorder: true,
      child: Column(
        children: [
          SectionHeader(
            label: AppStrings.workHistory,
            title: 'Professional Experience',
            highlightedWord: 'Experience',
            isRevealed: true,
          ),
          Obx(
            () => ExperienceTimeline(
              experiences: controller.experiences.toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class ExperienceTimeline extends StatelessWidget {
  final List<ExperienceEntry> experiences;

  const ExperienceTimeline({Key? key, required this.experiences})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        experiences.length,
        (index) => TimelineEntry(
          experience: experiences[index],
          isFirst: index == 0,
          isLast: index == experiences.length - 1,
        ),
      ),
    );
  }
}

class TimelineEntry extends StatelessWidget {
  final ExperienceEntry experience;
  final bool isFirst;
  final bool isLast;

  const TimelineEntry({
    Key? key,
    required this.experience,
    required this.isFirst,
    required this.isLast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Timeline Line
        if (!isLast)
          Positioned(
            left: 4.5,
            top: 30,
            bottom: 0,
            width: 1,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColors.hi, Colors.transparent],
                ),
              ),
            ),
          ),

        Padding(
          padding: const EdgeInsets.only(left: 32, bottom: 56),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Timeline Dot
              Positioned(
                left: -31,
                top: 5,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: AppColors.hi,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.hi.withOpacity(0.6),
                        blurRadius: 12,
                      ),
                    ],
                  ),
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Period
                  Text(
                    experience.period,
                    style: Theme.of(
                      context,
                    ).textTheme.labelSmall!.copyWith(color: AppColors.hi),
                  ),

                  const SizedBox(height: 8),

                  // Company
                  Text(
                    experience.company,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontSize: isMobile ? 20 : 24,
                    ),
                  ),

                  const SizedBox(height: 4),

                  // Role
                  Text(
                    '${experience.role} · ${experience.location}',
                    style: Theme.of(
                      context,
                    ).textTheme.labelSmall!.copyWith(color: AppColors.ink3),
                  ),

                  const SizedBox(height: 20),

                  // Projects
                  ...experience.projects.map(
                    (project) => ProjectBullet(project: project),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProjectBullet extends StatelessWidget {
  final Project project;

  const ProjectBullet({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.card,
        border: Border.all(color: AppColors.border, width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Project Name
          Row(
            children: [
              const Text(
                '▶',
                style: TextStyle(fontSize: 12, color: AppColors.hi),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  project.name,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.hi,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Achievements
          ...project.description.map((desc) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '—',
                    style: TextStyle(color: AppColors.ink3, fontSize: 12),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      desc,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.ink2,
                        fontSize: 12.5,
                        height: 1.65,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
