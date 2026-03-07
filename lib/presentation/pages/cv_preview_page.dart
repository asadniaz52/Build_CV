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
        title: const Text('CV Preview (A4)'),
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
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Wrap(
                spacing: 8,
                runSpacing: 8,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    '${controller.selectedTemplate.name} • Template ${controller.cv.value.templateId}',
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  OutlinedButton.icon(
                    onPressed: controller.saveCV,
                    icon: const Icon(Icons.save_outlined),
                    label: const Text('Save'),
                  ),
                  FilledButton.icon(
                    onPressed: controller.isExporting.value ? null : controller.exportToPdf,
                    icon: const Icon(Icons.picture_as_pdf),
                    label: const Text('Export PDF'),
                  ),
                  FilledButton.tonalIcon(
                    onPressed: controller.isExporting.value ? null : controller.exportToPng,
                    icon: const Icon(Icons.image_outlined),
                    label: const Text('Export PNG'),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              if (controller.isExporting.value) const LinearProgressIndicator(),
              const SizedBox(height: 8),
              Expanded(
                child: SingleChildScrollView(
                  child: Center(
                    child: RepaintBoundary(
                      key: controller.previewKey,
                      child: AspectRatio(
                        aspectRatio: 1 / 1.4142,
                        child: SizedBox(
                          width: 595,
                          child: CVTemplateView(
                            cv: controller.cv.value,
                            template: controller.selectedTemplate,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
