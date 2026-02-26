import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/routing/app_pages.dart';
import '../../viewmodels/cv_viewmodel.dart';
import '../widgets/template_card.dart';

class CVHomePage extends GetView<CVViewModel> {
  const CVHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CV Builder'),
        actions: [
          TextButton.icon(
            onPressed: () => Get.toNamed(AppRoutes.preview),
            icon: const Icon(Icons.visibility_outlined),
            label: const Text('Preview'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Get.toNamed(AppRoutes.editor),
        label: const Text('Edit CV'),
        icon: const Icon(Icons.edit_note_rounded),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Choose from 10 templates',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 4),
              const Text('Your CV is saved locally in SQLite.'),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.builder(
                  itemCount: controller.templates.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.95,
                  ),
                  itemBuilder: (_, index) {
                    final templateId = controller.templates[index];
                    return TemplateCard(
                      templateId: templateId,
                      isSelected: controller.cv.value.templateId == templateId,
                      onTap: () => controller.selectTemplate(templateId),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
