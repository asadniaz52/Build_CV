import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/services/export_service.dart';
import '../data/models/cv_model.dart';
import '../data/repositories/cv_repository.dart';
import '../presentation/models/template_profile.dart';

class CVViewModel extends GetxController {
  CVViewModel(this._repository, this._exportService);

  final CVRepository _repository;
  final ExportService _exportService;

  final cv = CVModel.empty().obs;
  final isLoading = false.obs;
  final isExporting = false.obs;
  final previewKey = GlobalKey();

  final fullNameController = TextEditingController();
  final jobTitleController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final summaryController = TextEditingController();
  final educationController = TextEditingController();
  final experienceController = TextEditingController();
  final skillsController = TextEditingController();

  final templates = templateProfiles;

  TemplateProfile get selectedTemplate {
    return templates.firstWhere(
      (element) => element.id == cv.value.templateId,
      orElse: () => templates.first,
    );
  }

  @override
  void onInit() {
    super.onInit();
    loadLatestCV();
  }

  Future<void> loadLatestCV() async {
    isLoading.value = true;
    final storedCV = await _repository.getLatestCV();
    cv.value = storedCV ?? CVModel.empty();
    _setControllersFromModel(cv.value);
    isLoading.value = false;
  }

  void selectTemplate(int templateId) {
    cv.value = cv.value.copyWith(templateId: templateId, updatedAt: DateTime.now());
  }

  void _setControllersFromModel(CVModel model) {
    fullNameController.text = model.fullName;
    jobTitleController.text = model.jobTitle;
    emailController.text = model.email;
    phoneController.text = model.phone;
    summaryController.text = model.summary;
    educationController.text = model.education;
    experienceController.text = model.experience;
    skillsController.text = model.skills;
  }

  Future<void> saveCV() async {
    final updated = cv.value.copyWith(
      fullName: fullNameController.text.trim(),
      jobTitle: jobTitleController.text.trim(),
      email: emailController.text.trim(),
      phone: phoneController.text.trim(),
      summary: summaryController.text.trim(),
      education: educationController.text.trim(),
      experience: experienceController.text.trim(),
      skills: skillsController.text.trim(),
      updatedAt: DateTime.now(),
    );

    final id = await _repository.saveCV(updated);
    cv.value = updated.copyWith(id: id);
  }

  Future<void> exportToPng() async {
    await _runExport(() async {
      final file = await _exportService.exportPng(previewKey, fileName: _fileName('png'));
      Get.snackbar('PNG Exported', file.path, snackPosition: SnackPosition.BOTTOM);
    });
  }

  Future<void> exportToPdf() async {
    await _runExport(() async {
      final file = await _exportService.exportPdf(previewKey, fileName: _fileName('pdf'));
      Get.snackbar('PDF Exported', file.path, snackPosition: SnackPosition.BOTTOM);
    });
  }

  Future<void> _runExport(Future<void> Function() action) async {
    try {
      isExporting.value = true;
      await Future<void>.delayed(const Duration(milliseconds: 100));
      await action();
    } catch (error) {
      Get.snackbar('Export failed', '$error', snackPosition: SnackPosition.BOTTOM);
    } finally {
      isExporting.value = false;
    }
  }

  String _fileName(String type) {
    final stamp = DateTime.now().millisecondsSinceEpoch;
    return 'cv_template_${cv.value.templateId}_${stamp}_$type';
  }

  @override
  void onClose() {
    fullNameController.dispose();
    jobTitleController.dispose();
    emailController.dispose();
    phoneController.dispose();
    summaryController.dispose();
    educationController.dispose();
    experienceController.dispose();
    skillsController.dispose();
    super.onClose();
  }
}
