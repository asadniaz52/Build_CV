import 'package:flutter/material.dart';

import '../models/template_profile.dart';

class TemplateCard extends StatelessWidget {
  const TemplateCard({
    super.key,
    required this.template,
    required this.isSelected,
    required this.onTap,
  });

  final TemplateProfile template;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: isSelected ? Theme.of(context).colorScheme.primary : Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: template.background,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: template.primary.withOpacity(0.3)),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 12,
                        left: 10,
                        right: 10,
                        child: Container(height: 8, color: template.primary.withOpacity(0.15)),
                      ),
                      Positioned(
                        top: 28,
                        left: 10,
                        child: CircleAvatar(radius: 11, backgroundColor: template.primary.withOpacity(0.2)),
                      ),
                      Positioned(
                        top: 28,
                        left: 36,
                        right: 12,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(height: 5, color: template.primary.withOpacity(0.25)),
                            const SizedBox(height: 4),
                            Container(height: 5, color: template.secondary.withOpacity(0.2)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(template.name, style: const TextStyle(fontWeight: FontWeight.w700)),
              Text('Template ${template.id}', style: const TextStyle(fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}
