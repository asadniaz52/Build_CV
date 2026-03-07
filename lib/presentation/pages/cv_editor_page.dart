import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/routing/app_pages.dart';
import '../../viewmodels/cv_viewmodel.dart';

class CVEditorPage extends GetView<CVViewModel> {
  const CVEditorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit CV Details')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            _field('Full Name', controller.fullNameController),
            _field('Job Title', controller.jobTitleController),
            _field('Email', controller.emailController),
            _field('Phone', controller.phoneController),
            _field('Professional Summary', controller.summaryController, lines: 4),
            _field('Education', controller.educationController, lines: 4),
            _field('Experience', controller.experienceController, lines: 5),
            _field('Skills', controller.skillsController, lines: 3),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: () async {
                await controller.saveCV();
                Get.snackbar(
                  'Saved',
                  'CV saved in local SQLite database',
                  snackPosition: SnackPosition.BOTTOM,
                );
                Get.offNamed(AppRoutes.preview);
              },
              icon: const Icon(Icons.save_outlined),
              label: const Text('Save CV'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _field(String label, TextEditingController textController, {int lines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: textController,
        maxLines: lines,
        decoration: InputDecoration(labelText: label, alignLabelWithHint: lines > 1),
      ),
    );
  }
}
