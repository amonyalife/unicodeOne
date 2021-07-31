import 'package:flutter/cupertino.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Center(
            child: Container(
      child: Text("zdes budet Favorite Restourants"),
    )));
  }
}
