import 'package:flutter/material.dart';

import '../../data/models/cv_model.dart';
import '../models/template_profile.dart';

class CVTemplateView extends StatelessWidget {
  const CVTemplateView({
    super.key,
    required this.cv,
    required this.template,
  });

  final CVModel cv;
  final TemplateProfile template;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: template.primary.withOpacity(0.15),
        border: Border.all(color: template.primary.withOpacity(0.45), width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          color: template.background,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: template.primary.withOpacity(0.28),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 38,
                      backgroundColor: template.primary.withOpacity(0.25),
                      child: Icon(Icons.person, size: 44, color: template.primary),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cv.fullName.isEmpty ? 'Your Name' : cv.fullName,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: template.primary,
                            ),
                          ),
                          const SizedBox(height: 6),
                          _meta('Phone number', cv.phone),
                          _meta('Email address', cv.email),
                          _meta('Website', 'github.com/your-profile'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              _section('ABOUT ME', cv.summary),
              _section('WORK EXPERIENCE', cv.experience),
              _section('EDUCATION AND TRAINING', cv.education),
              _section('LANGUAGE SKILLS', cv.skills),
              _section('PROJECTS', 'Highlight your top projects and achievements here.'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _meta(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 13, color: Colors.black87),
          children: [
            TextSpan(text: '$label: ', style: const TextStyle(fontWeight: FontWeight.w700)),
            TextSpan(text: value.isEmpty ? '-' : value),
          ],
        ),
      ),
    );
  }

  Widget _section(String title, String value) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(height: 1),
          const SizedBox(height: 6),
          Text(
            title,
            style: TextStyle(
              color: template.primary,
              fontWeight: FontWeight.w800,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value.isEmpty ? 'Add details here...' : value,
            style: TextStyle(
              color: template.secondary,
              fontSize: 14,
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }
}
