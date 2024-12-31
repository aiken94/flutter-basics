import 'package:go_router/go_router.dart';

import 'package:basics/gorouter/home_screen.dart';
import 'package:basics/gorouter/screen_one.dart';
import 'package:basics/gorouter/screen_two.dart';

final _router = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
  GoRoute(path: '/screen_one', builder: (context, state) => const ScreenOne()),
  GoRoute(path: '/screen_two', builder: (context, state) => const ScreenTwo()),
]);

GoRouter createRouter() {
  return _router;
}
