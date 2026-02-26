import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/models/cv_model.dart';
import '../data/repositories/cv_repository.dart';

class CVViewModel extends GetxController {
  CVViewModel(this._repository);

  final CVRepository _repository;

  final cv = CVModel.empty().obs;
  final isLoading = false.obs;

  final fullNameController = TextEditingController();
  final jobTitleController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final summaryController = TextEditingController();
  final educationController = TextEditingController();
  final experienceController = TextEditingController();
  final skillsController = TextEditingController();

  final templates = List<int>.generate(10, (index) => index + 1);

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
