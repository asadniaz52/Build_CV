import 'package:flutter/material.dart';

import '../../data/models/cv_model.dart';

class CVTemplateView extends StatelessWidget {
  const CVTemplateView({super.key, required this.cv});

  final CVModel cv;

  @override
  Widget build(BuildContext context) {
    final style = _styleFor(cv.templateId);

    return Card(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: style.gradient,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cv.fullName.isEmpty ? 'Your Name' : cv.fullName,
              style: TextStyle(
                fontSize: 28,
                color: style.primaryText,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              cv.jobTitle.isEmpty ? 'Target Role' : cv.jobTitle,
              style: TextStyle(fontSize: 16, color: style.secondaryText),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 12,
              runSpacing: 8,
              children: [
                _pill(cv.email, style),
                _pill(cv.phone, style),
              ],
            ),
            const SizedBox(height: 16),
            _section('Summary', cv.summary, style),
            _section('Education', cv.education, style),
            _section('Experience', cv.experience, style),
            _section('Skills', cv.skills, style),
          ],
        ),
      ),
    );
  }

  Widget _pill(String value, _TemplateStyle style) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: style.accent.withOpacity(0.18),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        value.isEmpty ? 'Not provided' : value,
        style: TextStyle(color: style.primaryText, fontSize: 12),
      ),
    );
  }

  Widget _section(String title, String value, _TemplateStyle style) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: style.primaryText,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value.isEmpty ? 'Add $title details...' : value,
            style: TextStyle(color: style.secondaryText, height: 1.4),
          ),
        ],
      ),
    );
  }

  _TemplateStyle _styleFor(int templateId) {
    const palettes = [
      _TemplateStyle(Colors.indigo, Colors.black87, Colors.black54),
      _TemplateStyle(Colors.teal, Colors.black87, Colors.black54),
      _TemplateStyle(Colors.deepPurple, Colors.black87, Colors.black54),
      _TemplateStyle(Colors.orange, Colors.black87, Colors.black54),
      _TemplateStyle(Colors.blueGrey, Colors.black87, Colors.black54),
      _TemplateStyle(Colors.green, Colors.black87, Colors.black54),
      _TemplateStyle(Colors.pink, Colors.black87, Colors.black54),
      _TemplateStyle(Colors.cyan, Colors.black87, Colors.black54),
      _TemplateStyle(Colors.red, Colors.black87, Colors.black54),
      _TemplateStyle(Colors.amber, Colors.black87, Colors.black54),
    ];

    return palettes[(templateId - 1).clamp(0, 9)];
  }
}

class _TemplateStyle {
  const _TemplateStyle(this.accent, this.primaryText, this.secondaryText);

  final MaterialColor accent;
  final Color primaryText;
  final Color secondaryText;

  LinearGradient get gradient {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Colors.white, accent.withOpacity(0.08)],
    );
  }
}
