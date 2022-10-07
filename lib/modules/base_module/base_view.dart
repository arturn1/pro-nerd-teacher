import 'package:flutter/cupertino.dart';
import 'package:pro_nerd_teacher/modules/comments_module/comment_page.dart';
import 'package:pro_nerd_teacher/modules/home_module/home_view.dart';

class BasePage extends StatelessWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: 'Task',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        late final CupertinoTabView returnValue;
        switch (index) {
          case 0:
            returnValue = CupertinoTabView(builder: (context) {
              return const CupertinoPageScaffold(
                child: HomeView(),
              );
            });
            break;
          case 1:
            returnValue = CupertinoTabView(builder: (context) {
              return const CupertinoPageScaffold(
                child: CommentsPage(),
              );
            });
            break;
        }
        return returnValue;
      },
    );
  }
}
