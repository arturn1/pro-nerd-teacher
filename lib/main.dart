import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:pro_nerd_teacher/modules/base_module/base_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Flutter Demo',
      theme: CupertinoThemeData(),
      home: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text('Cupertino Pro Nerd'),
          ),
          child: BasePage()),
    );
  }
}
