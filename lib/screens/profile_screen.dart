import 'package:chat_poc_one/stream_keys.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

import '../widgets/widgets_all.dart';
import 'screens_all.dart';

class ProfileScreen extends StatelessWidget {
  static Route get route => MaterialPageRoute(
        builder: (context) => const ProfileScreen(),
      );
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.currentUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            Hero(
              tag: 'hero-profile-picture',
              child: Avatar.large(
                  url: user?.image ??
                      'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(user?.name ?? 'No name'),
            ),
            const Divider(),
            const _SignOutButton(),
          ],
        ),
      ),
    );
  }
}

class _SignOutButton extends StatefulWidget {
  const _SignOutButton({
    Key? key,
  }) : super(key: key);

  @override
  __SignOutButtonState createState() => __SignOutButtonState();
}

class __SignOutButtonState extends State<_SignOutButton> {
  bool _loading = false;

  Future<void> _signOut() async {
    setState(() {
      _loading = true;
    });

    try {
      await StreamChatCore.of(context).client.disconnectUser();

      Navigator.of(context).push(SelectUserScreen.route);
    } on Exception catch (e, st) {
      logger.e('Could not sign out', error: e, stackTrace: st);
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? const CircularProgressIndicator()
        : TextButton(
            onPressed: _signOut,
            child: const Text('Sign out'),
          );
  }
}
