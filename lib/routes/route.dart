



import '../exportFiles.dart';

class FullRoutes {
  Route? ongenerateRoute(RouteSettings settings) {
    String? routeName = settings.name;
    dynamic args = settings.arguments;

    switch (routeName) {
      case RouteNames.SplashView:
        return customPageRoute(SplashView());
      case RouteNames.HomeView:
        return customPageRoute(HomeView());
      

      default:
        return customPageRoute(NotFoundView());
    }
  }

  customPageRoute(Widget child) {
    return MaterialPageRoute(
      builder: (context) => child,
    );
  }
}
