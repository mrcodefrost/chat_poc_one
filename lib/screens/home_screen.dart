import 'package:chat_poc_one/helpers.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets_all.dart';
import 'screens_all.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ValueNotifier<int> pageIndex = ValueNotifier(0);
  final ValueNotifier<String> title = ValueNotifier('Messages');

  final pages = const [
    MessagesScreen(),
    NotificationsScreen(),
    CallsScreen(),
    ContactsScreen(),
  ];

  final pageTitles = const [
    'Messages',
    'Notifications',
    'Calls',
    'Contacts',
  ];

  void _onNavBarItemSelected(index) {
    title.value = pageTitles[index];
    pageIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leadingWidth: 54,
        leading: Align(
            alignment: Alignment.centerRight,
            child: IconBackground(icon: Icons.search, onTap: () {})),
        title: ValueListenableBuilder(
            valueListenable: title,
            builder: (BuildContext context, String value, _) {
              return Text(
                value,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              );
            }),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Avatar.small(url: Helpers.randomPictureUrl()),
          )
        ],
      ),
      body: ValueListenableBuilder(
          valueListenable: pageIndex,
          builder: (BuildContext context, int value, _) {
            return pages[value];
          }),
      bottomNavigationBar:
          CustomBottonNavBar(onItemSelected: _onNavBarItemSelected),
    );
  }
}
