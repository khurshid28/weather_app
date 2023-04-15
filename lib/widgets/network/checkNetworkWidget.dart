import 'package:flutter/cupertino.dart';

import '../../exportFiles.dart';

enum NetworkResult { on, off }

class CheckNetworkWidget extends StatefulWidget {
  Widget? child;
  CheckNetworkWidget({super.key, required this.child});

  @override
  State<CheckNetworkWidget> createState() => _CheckNetworkWidgetState();
}

class _CheckNetworkWidgetState extends State<CheckNetworkWidget> {
  NetworkResult result = NetworkResult.on;
  StreamSubscription<ConnectivityResult>? subscription;

  startListen() {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult res) async {
      if (res != ConnectivityResult.none) {
        result = (await InternetConnectionChecker().hasConnection)
            ? NetworkResult.on
            : NetworkResult.off;
      } else {
        result = NetworkResult.off;
      }
                    setState(() => {});
    });
  }

  cancelListen() {
    subscription!.cancel();
  }

  initChecker() async {
    result = (await InternetConnectionChecker().hasConnection)
        ? NetworkResult.on
        : NetworkResult.off;
                    setState(() => {});
                  
  }

  @override
  void initState() {
    initChecker();
    startListen();
    super.initState();
  }

  @override
  void dispose() {
    cancelListen();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        result == NetworkResult.off
            ? AbsorbPointer(
                child: widget.child ?? SizedBox(),
              )
            : widget.child!,
        AnimatedCrossFade(
          duration: Duration(milliseconds: 500),
          crossFadeState: result == NetworkResult.off
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          firstChild: 
          Container(
            width: 1.sw,
            height: 1.sh,
            color: Colors.black12,
            child: Center(
              child: CupertinoAlertDialog(
                title: Text(
                  'No connection',
                  style: TextStyle(
                    fontSize: 18.sp,
                  ),
                ),
                content: Text(
                  'Please, check your connection',
                  style: TextStyle(
                    fontSize: 16.sp,
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () async {
                      result = (await InternetConnectionChecker().hasConnection)
                          ? NetworkResult.on
                          : NetworkResult.off;
                    setState(() => {});
                    },
                    child: Text(
                      'OK',
                      style: TextStyle(
                        color: AppConstant.primaryColor,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
         
          secondChild: const SizedBox(),
        ),
      ],
    );
  }
}
