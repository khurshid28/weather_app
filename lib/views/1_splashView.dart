import 'package:app_for_test/exportFiles.dart';
import 'package:easy_localization/easy_localization.dart';

class SplashView extends StatefulWidget {
  String? locale;
  SplashView({super.key, this.locale});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      if (widget.locale == "en") {
        await context.setLocale(Locale("en", "US"));
      } else {
        await context.setLocale(Locale("ru", "RU"));
      }
      Navigator.pushNamedAndRemoveUntil(
          context, RouteNames.HomeView, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.primaryColor,
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 18.w,
            ),
            child: Image.asset(
              "assets/logo.png",
              width: 230.w,
            ),
          ),
        ),
      ),
    );
  }
}
