import 'pages/login.dart';
import 'pages/root.dart';
import 'pages/nest_route/one.dart';

var router = {
  '/': (context) => const RootPage(),
  '/login': (context) => const LoginPage(),
  '/nest/one': (context) => const OnePage(),
};
