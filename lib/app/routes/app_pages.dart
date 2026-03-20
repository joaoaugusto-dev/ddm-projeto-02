import 'package:flutter/material.dart';

import '../../features/auth/view/login_page.dart';
import '../../features/auth/view/register_page.dart';
import 'app_routes.dart';

abstract class AppPages {
  static Map<String, WidgetBuilder> get routes => {
    AppRoutes.login: (_) => const LoginPage(),
    AppRoutes.register: (_) => const RegisterPage(),
  };
}
