// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:url_launcher/url_launcher.dart';
// import '../../../data/models/education_model.dart';
// import '../../../presentation/controllers/home_controller.dart';
// import '../../../utils/constants/colors.dart';
// import '../../../utils/constants/strings.dart';
// import 'section_widgets.dart';

// class EducationSection extends StatelessWidget {
//   final HomeController controller;

//   const EducationSection({Key? key, required this.controller})
//     : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final isMobile = MediaQuery.of(context).size.width < 900;

//     return SectionContainer(
//       child: Column(
//         children: [
//           SectionHeader(
//             label: AppStrings.academic,
//             title: 'Education',
//             highlightedWord: 'cation',
//             isRevealed: true,
//           ),
//           Obx(
//             () => GridView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//                 maxCrossAxisExtent: isMobile ? 400 : 350,
//                 mainAxisSpacing: 1,
//                 crossAxisSpacing: 1,
//               ),
//               itemCount: controller.education.length,
//               itemBuilder: (context, index) {
//                 return EducationCard(entry: controller.education[index]);
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class EducationCard extends StatefulWidget {
//   final EducationEntry entry;

//   const EducationCard({Key? key, required this.entry}) : super(key: key);

//   @override
//   State<EducationCard> createState() => _EducationCardState();
// }

// class _EducationCardState extends State<EducationCard> {
//   bool isHovered = false;

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) => setState(() => isHovered = true),
//       onExit: (_) => setState(() => isHovered = false),
//       child: Container(
//         margin: const EdgeInsets.all(8),
//         decoration: BoxDecoration(
//           color: isHovered ? AppColors.card2 : AppColors.card,
//           border: Border.all(color: AppColors.border, width: 1),
//           borderRadius: BorderRadius.circular(4),
//         ),
//         padding: const EdgeInsets.all(32),
//         child: Stack(
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Period
//                 Text(
//                   widget.entry.period,
//                   style: Theme.of(context).textTheme.labelSmall!.copyWith(
//                     color: AppColors.hi,
//                     fontSize: 10,
//                   ),
//                 ),
//                 const SizedBox(height: 12),
//                 // Degree
//                 Text(
//                   widget.entry.degree,
//                   style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                     fontWeight: FontWeight.w700,
//                     fontSize: 16,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 // School
//                 Text(
//                   widget.entry.school,
//                   style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                     color: AppColors.ink2,
//                     fontSize: 13,
//                     height: 1.5,
//                   ),
//                 ),
//               ],
//             ),
//             // Left border
//             if (isHovered)
//               Positioned(
//                 left: 0,
//                 top: 0,
//                 bottom: 0,
//                 child: Container(
//                   width: 3,
//                   decoration: BoxDecoration(
//                     color: AppColors.hi,
//                     borderRadius: BorderRadius.circular(2),
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ContactSection extends StatefulWidget {
//   final HomeController controller;

//   const ContactSection({Key? key, required this.controller}) : super(key: key);

//   @override
//   State<ContactSection> createState() => _ContactSectionState();
// }

// class _ContactSectionState extends State<ContactSection> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _subjectController = TextEditingController();
//   final _messageController = TextEditingController();

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _emailController.dispose();
//     _subjectController.dispose();
//     _messageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isMobile = MediaQuery.of(context).size.width < 900;

//     return SectionContainer(
//       fullWidth: true,
//       hasBorder: true,
//       child: Column(
//         children: [
//           SectionHeader(
//             label: AppStrings.getInTouchSection,
//             title: "Let's Work Together",
//             highlightedWord: 'Work',
//             isRevealed: true,
//           ),
//           Container(
//             decoration: BoxDecoration(
//               border: Border.all(color: AppColors.border, width: 1),
//               borderRadius: BorderRadius.circular(4),
//             ),
//             clipBehavior: Clip.antiAlias,
//             child: isMobile
//                 ? Column(
//                     children: [
//                       _buildContactLeft(context),
//                       Container(height: 1, color: AppColors.border),
//                       _buildContactRight(context),
//                     ],
//                   )
//                 : Expanded(child: _buildContactLeft(context)),

//             // : Row(
//             //     children: [
//             //       Container(width: 1, color: AppColors.border),
//             //       // Expanded(child: _buildContactRight(context)),
//             //     ],
//             //   ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildContactLeft(BuildContext context) {
//     return Container(
//       color: AppColors.card,
//       padding: const EdgeInsets.all(56),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             AppStrings.openToOpportunities,
//             style: Theme.of(
//               context,
//             ).textTheme.displayMedium!.copyWith(fontSize: 40),
//           ),
//           const SizedBox(height: 16),
//           Text(
//             AppStrings.contactSubtitle,
//             style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//               color: AppColors.ink2,
//               fontSize: 14,
//             ),
//           ),
//           const SizedBox(height: 32),
//           // Contact Links
//           _buildContactLink(
//             context,
//             '✉️',
//             'Email',
//             AppStrings.emailAddress,
//             'mailto:${AppStrings.emailAddress}',
//           ),
//           const SizedBox(height: 12),
//           _buildContactLink(
//             context,
//             '📞',
//             'Phone',
//             AppStrings.phone,
//             'tel:${AppStrings.phone.replaceAll(' ', '')}',
//           ),
//           const SizedBox(height: 12),
//           _buildContactLink(
//             context,
//             '💼',
//             'LinkedIn',
//             AppStrings.linkedin,
//             'https://linkedin.com/in/vinod-sain-01684b221',
//           ),
//           const SizedBox(height: 12),
//           _buildContactInfo(context, '📍', 'Location', AppStrings.location),
//         ],
//       ),
//     );
//   }

//   Widget _buildContactRight(BuildContext context) {
//     return Container(
//       color: AppColors.bg2,
//       padding: const EdgeInsets.all(56),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             '// Send a message',
//             style: Theme.of(
//               context,
//             ).textTheme.labelSmall!.copyWith(color: AppColors.ink3),
//           ),
//           const SizedBox(height: 24),
//           Form(
//             key: _formKey,
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     Expanded(
//                       child: _buildFormField(
//                         'Name',
//                         _nameController,
//                         'Your name',
//                       ),
//                     ),
//                     const SizedBox(width: 16),
//                     Expanded(
//                       child: _buildFormField(
//                         'Email',
//                         _emailController,
//                         'your@email.com',
//                         isEmail: true,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//                 _buildFormField(
//                   'Subject',
//                   _subjectController,
//                   'Project type / inquiry',
//                 ),
//                 const SizedBox(height: 16),
//                 _buildFormField(
//                   'Message',
//                   _messageController,
//                   'Tell me about your project, timeline, and budget...',
//                   isTextArea: true,
//                   minLines: 5,
//                 ),
//                 const SizedBox(height: 20),
//                 SizedBox(
//                   width: double.infinity,
//                   child: Obx(
//                     () => ElevatedButton(
//                       onPressed: widget.controller.isContactFormSending.value
//                           ? null
//                           : _submitForm,
//                       child: Text(
//                         widget.controller.isContactFormSending.value
//                             ? 'Sending...'
//                             : AppStrings.sendMessage,
//                       ),
//                     ),
//                   ),
//                 ),
//                 if (widget.controller.contactFormMessage.isNotEmpty)
//                   Padding(
//                     padding: const EdgeInsets.only(top: 12),
//                     child: Obx(
//                       () => Text(
//                         widget.controller.contactFormMessage.value,
//                         style: Theme.of(context).textTheme.labelSmall!.copyWith(
//                           color: AppColors.hi,
//                           fontSize: 12,
//                         ),
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildFormField(
//     String label,
//     TextEditingController controller,
//     String placeholder, {
//     bool isEmail = false,
//     bool isTextArea = false,
//     int minLines = 1,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: Theme.of(
//             context,
//           ).textTheme.labelSmall!.copyWith(color: AppColors.ink3),
//         ),
//         const SizedBox(height: 8),
//         isTextArea
//             ? TextField(
//                 controller: controller,
//                 minLines: minLines,
//                 maxLines: minLines + 2,
//                 decoration: InputDecoration(
//                   hintText: placeholder,
//                   contentPadding: const EdgeInsets.all(12),
//                 ),
//               )
//             : TextField(
//                 controller: controller,
//                 keyboardType: isEmail
//                     ? TextInputType.emailAddress
//                     : TextInputType.text,
//                 decoration: InputDecoration(hintText: placeholder),
//               ),
//       ],
//     );
//   }

//   Widget _buildContactLink(
//     BuildContext context,
//     String icon,
//     String label,
//     String value,
//     String url,
//   ) {
//     return MouseRegion(
//       cursor: SystemMouseCursors.click,
//       child: GestureDetector(
//         onTap: () => _openUrl(url),
//         child: Container(
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             border: Border.all(color: AppColors.border2, width: 1),
//             borderRadius: BorderRadius.circular(3),
//           ),
//           child: Row(
//             children: [
//               Text(icon, style: const TextStyle(fontSize: 18)),
//               const SizedBox(width: 16),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       label,
//                       style: Theme.of(context).textTheme.labelSmall!.copyWith(
//                         color: AppColors.ink3,
//                         fontSize: 10,
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                     Text(
//                       value,
//                       style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                         color: AppColors.ink,
//                         fontSize: 13,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildContactInfo(
//     BuildContext context,
//     String icon,
//     String label,
//     String value,
//   ) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         border: Border.all(color: AppColors.border2, width: 1),
//         borderRadius: BorderRadius.circular(3),
//       ),
//       child: Row(
//         children: [
//           Text(icon, style: const TextStyle(fontSize: 18)),
//           const SizedBox(width: 16),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   label,
//                   style: Theme.of(context).textTheme.labelSmall!.copyWith(
//                     color: AppColors.ink3,
//                     fontSize: 10,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   value,
//                   style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                     color: AppColors.ink,
//                     fontSize: 13,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _submitForm() {
//     if (_formKey.currentState!.validate()) {
//       widget.controller.submitContactForm(
//         name: _nameController.text,
//         email: _emailController.text,
//         subject: _subjectController.text,
//         message: _messageController.text,
//       );

//       // Clear form
//       _nameController.clear();
//       _emailController.clear();
//       _subjectController.clear();
//       _messageController.clear();
//     }
//   }

//   void _openUrl(String url) async {
//     final Uri urlUri = Uri.parse(url);
//     if (await canLaunchUrl(urlUri)) {
//       await launchUrl(urlUri, mode: LaunchMode.externalApplication);
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../data/models/education_model.dart';
import '../../../presentation/controllers/home_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/strings.dart';
import 'section_widgets.dart';

// ─────────────────────────────────────────────────────────────────────────────
// SVG icon widgets (no external asset needed)
// ─────────────────────────────────────────────────────────────────────────────

/// Gmail "M" logo rendered as a Flutter widget.
class _GmailIcon extends StatelessWidget {
  final double size;
  const _GmailIcon({this.size = 22});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(painter: _GmailPainter()),
    );
  }
}

class _GmailPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // White background envelope
    final bgPaint = Paint()..color = Colors.white;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, w, h),
        Radius.circular(w * 0.08),
      ),
      bgPaint,
    );

    // Red left flap
    final redPaint = Paint()..color = const Color(0xFFEA4335);
    final leftPath = Path()
      ..moveTo(0, h * 0.2)
      ..lineTo(w * 0.5, h * 0.62)
      ..lineTo(0, h * 0.85)
      ..close();
    canvas.drawPath(leftPath, redPaint);

    // Blue right flap
    final bluePaint = Paint()..color = const Color(0xFF4285F4);
    final rightPath = Path()
      ..moveTo(w, h * 0.2)
      ..lineTo(w * 0.5, h * 0.62)
      ..lineTo(w, h * 0.85)
      ..close();
    canvas.drawPath(rightPath, bluePaint);

    // Bottom bar
    final greenPaint = Paint()..color = const Color(0xFF34A853);
    canvas.drawRect(Rect.fromLTWH(0, h * 0.85, w * 0.5, h * 0.15), greenPaint);

    final yellowPaint = Paint()..color = const Color(0xFFFBBC05);
    canvas.drawRect(
      Rect.fromLTWH(w * 0.5, h * 0.85, w * 0.5, h * 0.15),
      yellowPaint,
    );

    // Top M chevron (red)
    final mPath = Path()
      ..moveTo(0, h * 0.2)
      ..lineTo(w * 0.5, h * 0.62)
      ..lineTo(w, h * 0.2)
      ..lineTo(w, h * 0.15)
      ..lineTo(w * 0.5, h * 0.57)
      ..lineTo(0, h * 0.15)
      ..close();
    canvas.drawPath(mPath, redPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Phone icon using Flutter's built-in icon (no emoji).
class _PhoneIcon extends StatelessWidget {
  final double size;
  const _PhoneIcon({this.size = 20});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.phone_outlined,
      size: size,
      color: const Color(0xFF25D366),
    );
  }
}

/// LinkedIn "in" logo.
class _LinkedInIcon extends StatelessWidget {
  final double size;
  const _LinkedInIcon({this.size = 20});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: const Color(0xFF0077B5),
        borderRadius: BorderRadius.circular(size * 0.18),
      ),
      child: Center(
        child: Text(
          'in',
          style: TextStyle(
            color: Colors.white,
            fontSize: size * 0.52,
            fontWeight: FontWeight.w800,
            height: 1,
          ),
        ),
      ),
    );
  }
}

/// Location pin icon.
class _LocationIcon extends StatelessWidget {
  final double size;
  const _LocationIcon({this.size = 20});

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.location_on_outlined, size: size, color: AppColors.ink3);
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Education Section (unchanged logic, kept here for single-file convenience)
// ─────────────────────────────────────────────────────────────────────────────

class EducationSection extends StatelessWidget {
  final HomeController controller;

  const EducationSection({Key? key, required this.controller})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return SectionContainer(
      child: Column(
        children: [
          SectionHeader(
            label: AppStrings.academic,
            title: 'Education',
            highlightedWord: 'cation',
            isRevealed: true,
          ),
          Obx(
            () => GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: isMobile ? 400 : 350,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
              ),
              itemCount: controller.education.length,
              itemBuilder: (context, index) {
                return EducationCard(entry: controller.education[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class EducationCard extends StatefulWidget {
  final EducationEntry entry;

  const EducationCard({Key? key, required this.entry}) : super(key: key);

  @override
  State<EducationCard> createState() => _EducationCardState();
}

class _EducationCardState extends State<EducationCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isHovered ? AppColors.card2 : AppColors.card,
          border: Border.all(
            color: isHovered ? AppColors.hi : AppColors.border,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        padding: const EdgeInsets.all(32),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.entry.period,
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: AppColors.hi,
                    fontSize: 10,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  widget.entry.degree,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.entry.school,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.ink2,
                    fontSize: 13,
                    height: 1.5,
                  ),
                ),
              ],
            ),
            // if (isHovered)
            //   Positioned(
            //     left: 0,
            //     top: 0,
            //     bottom: 0,
            //     child: Container(
            //       width: 3,
            //       decoration: BoxDecoration(
            //         color: AppColors.hi,
            //         borderRadius: BorderRadius.circular(2),
            //       ),
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Contact Section
// ─────────────────────────────────────────────────────────────────────────────

class ContactSection extends StatefulWidget {
  final HomeController controller;

  const ContactSection({Key? key, required this.controller}) : super(key: key);

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  // ── URL launcher ────────────────────────────────────────────────────────────

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);

    if (kIsWeb) {
      // On web, launchMode.externalApplication opens a new tab / native mail client
      await launchUrl(uri, mode: LaunchMode.externalApplication);
      return;
    }

    // On mobile / desktop try platform default first (opens Gmail app, Phone app, etc.)
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  /// Opens Gmail compose window.
  /// On Android → Gmail app; on iOS → Mail/Gmail app; on Web → new tab to Gmail.
  Future<void> _openEmail(String email) async {
    // mailto: is the universal intent — OS routes it to the default mail app
    // (Gmail on Android if set as default, or prompts to choose).
    final mailtoUri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {'subject': 'Project Inquiry'},
    );

    if (await canLaunchUrl(mailtoUri)) {
      await launchUrl(mailtoUri, mode: LaunchMode.externalApplication);
    } else {
      // Fallback: open Gmail compose in browser
      final webMailUri = Uri.parse(
        'https://mail.google.com/mail/?view=cm&fs=1&to=$email&su=Project+Inquiry',
      );
      await launchUrl(webMailUri, mode: LaunchMode.externalApplication);
    }
  }

  // ── Build ───────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return SectionContainer(
      fullWidth: true,
      hasBorder: true,
      child: Column(
        children: [
          SectionHeader(
            label: AppStrings.getInTouchSection,
            title: "Let's Work Together",
            highlightedWord: 'Work',
            isRevealed: true,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.border, width: 1),
              borderRadius: BorderRadius.circular(4),
            ),
            clipBehavior: Clip.antiAlias,
            child: _buildContactLeft(context),
            //
            // isMobile
            // ?
            // ? Column(
            //     children: [

            //       Container(height: 1, color: AppColors.border),
            //       _buildContactRight(context),
            //     ],
            //   )
            // : Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Expanded(child: _buildContactLeft(context)),
            //       Container(width: 1, color: AppColors.border),
            //       Expanded(child: _buildContactRight(context)),
            //     ],
            //   ),
          ),
        ],
      ),
    );
  }

  // ── Left panel ──────────────────────────────────────────────────────────────

  Widget _buildContactLeft(BuildContext context) {
    return Container(
      color: AppColors.card,
      padding: const EdgeInsets.all(56),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.openToOpportunities,
            style: Theme.of(
              context,
            ).textTheme.displayMedium!.copyWith(fontSize: 40),
          ),
          const SizedBox(height: 16),
          Text(
            AppStrings.contactSubtitle,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: AppColors.ink2,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 32),

          // ── Email — Gmail logo ─────────────────────────────────────────────
          _buildContactLink(
            context,
            icon: const _GmailIcon(size: 22),
            label: 'Email',
            value: AppStrings.emailAddress,
            onTap: () => _openEmail(AppStrings.emailAddress),
          ),
          const SizedBox(height: 12),

          // ── Phone ──────────────────────────────────────────────────────────
          _buildContactLink(
            context,
            icon: const _PhoneIcon(size: 20),
            label: 'Phone',
            value: AppStrings.phone,
            onTap: () =>
                _openUrl('tel:${AppStrings.phone.replaceAll(' ', '')}'),
          ),
          const SizedBox(height: 12),

          // ── LinkedIn ───────────────────────────────────────────────────────
          _buildContactLink(
            context,
            icon: const _LinkedInIcon(size: 20),
            label: 'LinkedIn',
            value: AppStrings.linkedin,
            onTap: () =>
                _openUrl('https://linkedin.com/in/vinod-sain-01684b221'),
          ),
          const SizedBox(height: 12),

          // ── Location (non-clickable) ───────────────────────────────────────
          _buildContactInfo(
            context,
            icon: const _LocationIcon(size: 20),
            label: 'Location',
            value: AppStrings.location,
          ),
        ],
      ),
    );
  }

  // ── Right panel (form) ──────────────────────────────────────────────────────

  Widget _buildContactRight(BuildContext context) {
    return Container(
      color: AppColors.bg2,
      padding: const EdgeInsets.all(56),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '// Send a message',
            style: Theme.of(
              context,
            ).textTheme.labelSmall!.copyWith(color: AppColors.ink3),
          ),
          const SizedBox(height: 24),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _buildFormField(
                        'Name',
                        _nameController,
                        'Your name',
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildFormField(
                        'Email',
                        _emailController,
                        'your@email.com',
                        isEmail: true,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _buildFormField(
                  'Subject',
                  _subjectController,
                  'Project type / inquiry',
                ),
                const SizedBox(height: 16),
                _buildFormField(
                  'Message',
                  _messageController,
                  'Tell me about your project, timeline, and budget...',
                  isTextArea: true,
                  minLines: 5,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: Obx(
                    () => ElevatedButton(
                      onPressed: widget.controller.isContactFormSending.value
                          ? null
                          : _submitForm,
                      child: Text(
                        widget.controller.isContactFormSending.value
                            ? 'Sending...'
                            : AppStrings.sendMessage,
                      ),
                    ),
                  ),
                ),
                Obx(() {
                  final msg = widget.controller.contactFormMessage.value;
                  if (msg.isEmpty) return const SizedBox.shrink();
                  return Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text(
                      msg,
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: AppColors.hi,
                        fontSize: 12,
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Reusable contact row — clickable ────────────────────────────────────────

  Widget _buildContactLink(
    BuildContext context, {
    required Widget icon,
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.border2, width: 1),
            borderRadius: BorderRadius.circular(3),
          ),
          child: Row(
            children: [
              SizedBox(width: 22, height: 22, child: Center(child: icon)),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: AppColors.ink3,
                        fontSize: 10,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      value,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.ink,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 12,
                color: AppColors.ink3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── Reusable contact row — non-clickable ────────────────────────────────────

  Widget _buildContactInfo(
    BuildContext context, {
    required Widget icon,
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border2, width: 1),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Row(
        children: [
          SizedBox(width: 22, height: 22, child: Center(child: icon)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: AppColors.ink3,
                    fontSize: 10,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.ink,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Form field ──────────────────────────────────────────────────────────────

  Widget _buildFormField(
    String label,
    TextEditingController controller,
    String placeholder, {
    bool isEmail = false,
    bool isTextArea = false,
    int minLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.labelSmall!.copyWith(color: AppColors.ink3),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: isEmail
              ? TextInputType.emailAddress
              : isTextArea
              ? TextInputType.multiline
              : TextInputType.text,
          minLines: minLines,
          maxLines: isTextArea ? minLines + 2 : 1,
          decoration: InputDecoration(
            hintText: placeholder,
            contentPadding: const EdgeInsets.all(12),
          ),
        ),
      ],
    );
  }

  // ── Submit ──────────────────────────────────────────────────────────────────

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      widget.controller.submitContactForm(
        name: _nameController.text,
        email: _emailController.text,
        subject: _subjectController.text,
        message: _messageController.text,
      );
      _nameController.clear();
      _emailController.clear();
      _subjectController.clear();
      _messageController.clear();
    }
  }
}
