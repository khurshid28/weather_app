import '../../exportFiles.dart';

class MaterialAppCustomBuilder {
  MaterialAppCustomBuilder._();
  static Widget builder(BuildContext context, Widget? child) {
    return MediaQuery(
      child: CheckNetworkWidget(
        child: child ??
            Scaffold(
              body: Center(
                child: Text("Page builder Error"),
              ),
            ),
      ),
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
    );
  }
}
