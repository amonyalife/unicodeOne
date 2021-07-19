import 'package:amonyatest/src/common/utils/app_routes.dart';
import 'package:amonyatest/src/screens/auth.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      onGenerateRoute: AppRouter.generateRoute,
      home: AuthScreen(),
    );
  }
}
