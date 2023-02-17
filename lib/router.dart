import 'pages/base/project.dart';
import 'pages/base/task.dart';
import 'pages/login.dart';
import 'pages/root.dart';
import 'pages/nest_route/one.dart';
import 'pages/test/material_widget/list_view.dart';
import 'pages/test/my_widget/demo.dart';

var rootRouter = {
  '/': (context) => const RootPage(),
  '/login': (context) => const LoginPage(),
  '/nest/one': (context) => const OnePage(),
  '/project/detail': (context) => const ProjectDetailPage(),
  '/test/material_widget/list_view': (context) => const ListTileSelectExample(),
  '/test/my_widget/demo': (context) => const DemoPage(),
};

var nestRouter = {
  '/project/list': const ProjectListPage(),
  '/project/detail': const ProjectDetailPage(),
  '/task/list': const TaskListPage(),
  '/task/detail': const TaskDetailPage(),
};
