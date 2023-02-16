import 'package:my_app/pages/test/my_widget/demo.dart';

import 'pages/login.dart';
import 'pages/root.dart';
import 'pages/nest_route/one.dart';
import 'pages/test/material_widget/list_view.dart';

var router = {
  '/': (context) => const RootPage(),
  '/login': (context) => const LoginPage(),
  '/nest/one': (context) => const OnePage(),
  '/test/material_widget/list_view': (context) => const ListTileSelectExample(),
  '/test/my_widget/demo': (context) => const DemoPage(),
};
