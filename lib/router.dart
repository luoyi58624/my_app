import 'pages/root.dart';
import 'pages/nest_route/one.dart';

var router = {
  '/': (context) => const RootPage(),
  '/nest/one': (context) => const OnePage(),
};
