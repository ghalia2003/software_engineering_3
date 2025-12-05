import 'package:go_router/go_router.dart';
import 'package:software_engineering_3/Home_page/view/home_page_body.dart';

abstract class AppRouter {
  // static const homePage = "/homePage";

  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomePageBody()),
    ],
  );
}
