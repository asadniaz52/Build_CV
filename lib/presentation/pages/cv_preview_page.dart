import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/routing/app_pages.dart';
import '../../viewmodels/cv_viewmodel.dart';
import '../widgets/cv_template_view.dart';

class CVPreviewPage extends GetView<CVViewModel> {
  const CVPreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CV Preview'),
        actions: [
          TextButton.icon(
            onPressed: () => Get.toNamed(AppRoutes.editor),
            icon: const Icon(Icons.edit),
            label: const Text('Edit'),
          ),
        ],
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Template ${controller.cv.value.templateId}',
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                  OutlinedButton.icon(
                    onPressed: controller.saveCV,
                    icon: const Icon(Icons.sync),
                    label: const Text('Save Snapshot'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(child: CVTemplateView(cv: controller.cv.value)),
            ],
          ),
        ),
      ),
    );
  }
}
