import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/skill_model.dart';
import '../../../presentation/controllers/home_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/strings.dart';
import 'section_widgets.dart';

class SkillsSection extends StatelessWidget {
  final HomeController controller;

  const SkillsSection({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return SectionContainer(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Column(
        children: [
          SectionHeader(
            label: AppStrings.capabilities,
            title: 'Technical Skills',
            highlightedWord: 'Skills',
            isRevealed: true,
          ),

          // ── Skill Category Cards ───────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.only(
              bottom: 32,
              right: 4,
              left: 4,
              top: 16,
            ),
            child: Obx(
              () => GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: isMobile ? 300 : 400,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                  // FIX: Use mainAxisExtent instead of childAspectRatio.
                  // childAspectRatio causes overflow when chip content wraps
                  // to more lines than the fixed height allows.
                  mainAxisExtent: isMobile ? 200 : 180,
                ),
                itemCount: controller.skillCategories.length,
                itemBuilder: (context, index) {
                  return SkillCard(category: controller.skillCategories[index]);
                },
              ),
            ),
          ),

          // ── Proficiency Bars ───────────────────────────────────────────────
          Obx(
            () => Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.border, width: 1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Container(
                padding: const EdgeInsets.all(32),
                decoration: const BoxDecoration(color: AppColors.card),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Row(
                      children: [
                        Container(width: 16, height: 1, color: AppColors.hi),
                        const SizedBox(width: 8),
                        Text(
                          'Proficiency',
                          style: Theme.of(
                            context,
                          ).textTheme.labelSmall!.copyWith(color: AppColors.hi),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    // Bars
                    ...controller.proficiencySkills.map(
                      (skill) => ProficiencyBar(skill: skill),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Skill Card
// ─────────────────────────────────────────────────────────────────────────────

class SkillCard extends StatefulWidget {
  final SkillCategory category;

  const SkillCard({Key? key, required this.category}) : super(key: key);

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Container(
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: isHovered ? AppColors.card2 : AppColors.card,
          border: Border.all(color: AppColors.border, width: 1),
          borderRadius: BorderRadius.circular(4),
        ),
        // FIX: Use padding + let height be driven by mainAxisExtent on the
        // grid, not by an aspect ratio. ClipRect prevents any overflow from
        // being visible if a category has unusually many chips.
        child: ClipRect(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Category title
                Row(
                  children: [
                    Container(width: 16, height: 1, color: AppColors.hi),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        widget.category.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(
                          context,
                        ).textTheme.labelSmall!.copyWith(color: AppColors.hi),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Skill chips
                Expanded(
                  child: SingleChildScrollView(
                    // Allow chips to scroll if they overflow the fixed height
                    physics: const NeverScrollableScrollPhysics(),
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: widget.category.skills
                          .map((skill) => _buildSkillChip(context, skill))
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSkillChip(BuildContext context, String skill) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border2, width: 1),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Text(
        skill,
        style: Theme.of(
          context,
        ).textTheme.labelSmall!.copyWith(color: AppColors.ink2, fontSize: 11),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Proficiency Bar
// ─────────────────────────────────────────────────────────────────────────────

class ProficiencyBar extends StatefulWidget {
  final ProficiencySkill skill;

  const ProficiencyBar({Key? key, required this.skill}) : super(key: key);

  @override
  State<ProficiencyBar> createState() => _ProficiencyBarState();
}

class _ProficiencyBarState extends State<ProficiencyBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.skill.name,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.ink2,
                  fontSize: 12,
                ),
              ),
              Text(
                '${widget.skill.percentage}%',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: AppColors.hi,
                  fontSize: 11,
                  fontFamily: 'JetBrains Mono',
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: LinearProgressIndicator(
                  minHeight: 3,
                  value: _animation.value * (widget.skill.percentage / 100),
                  backgroundColor: AppColors.border2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color.lerp(
                          AppColors.hi,
                          Color.lerp(
                                AppColors.hi,
                                AppColors.hi2,
                                (widget.skill.percentage % 50) / 50,
                              ) ??
                              AppColors.hi2,
                          0.5,
                        ) ??
                        AppColors.hi,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
