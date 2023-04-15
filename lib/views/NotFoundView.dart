import 'package:app_for_test/exportFiles.dart';

class NotFoundView extends StatefulWidget {
  const NotFoundView({super.key});

  @override
  State<NotFoundView> createState() => _NotFoundViewState();
}

class _NotFoundViewState extends State<NotFoundView> {
  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "PAGE NOT FOUND",
          style: TextStyle(
            color: Colors.red,
            fontSize: 25.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
