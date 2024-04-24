import 'package:chat_poc_one/stream_keys.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets_all.dart';
import 'screens_all.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final pages = const [
    MessagesScreen(),
    ContactsScreen(),
  ];

  int _pageNumber = 0; // original condition

  onPageChange(int newPageNumber) {
    setState(() {
      _pageNumber = newPageNumber; // new condition updated
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 54,
        leading: Align(
            alignment: Alignment.centerRight,
            child: IconBackground(
                icon: Icons.search,
                onTap: () {
                  logger.i('TODO Search');
                })),
        title: const Text('Chat POC'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Hero(
              tag: 'hero-profile-picture',
              child: Avatar.small(
                url: context.currentUserImage,
                onTap: () {
                  Navigator.of(context).push(ProfileScreen.route);
                },
              ),
            ),
          ),
        ],
      ),
      body: pages[_pageNumber],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onPageChange,
        currentIndex: _pageNumber,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Message',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.contacts), label: 'Contacts'),
          // BottomNavigationBarItem(icon: Icon(Icons.add)),
        ],
      ),
    );
  }
}
