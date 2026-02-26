import 'package:get/get.dart';

import '../../presentation/pages/cv_editor_page.dart';
import '../../presentation/pages/cv_home_page.dart';
import '../../presentation/pages/cv_preview_page.dart';

class AppRoutes {
  static const home = '/';
  static const editor = '/editor';
  static const preview = '/preview';
}

class AppPages {
  static final pages = <GetPage<dynamic>>[
    GetPage(name: AppRoutes.home, page: () => const CVHomePage()),
    GetPage(name: AppRoutes.editor, page: () => const CVEditorPage()),
    GetPage(name: AppRoutes.preview, page: () => const CVPreviewPage()),
  ];
}
