import 'package:get/get.dart';

import '../../data/repositories/cv_repository.dart';
import '../../viewmodels/cv_viewmodel.dart';
import '../database/app_database.dart';
import '../services/export_service.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppDatabase>(() => AppDatabase());
    Get.lazyPut<CVRepository>(() => CVRepository(Get.find<AppDatabase>()));
    Get.lazyPut<ExportService>(() => ExportService());
    Get.put<CVViewModel>(
      CVViewModel(
        Get.find<CVRepository>(),
        Get.find<ExportService>(),
      ),
    );
  }
}
