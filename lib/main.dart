import 'package:chat_poc_one/screens/screens_all.dart';
import 'package:chat_poc_one/stream_keys.dart';
import 'package:chat_poc_one/theme.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

void main() {
  final client = StreamChatClient(apiKey);

  runApp(MyApp(
    client: client,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.client});

  final StreamChatClient client;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat POC One',
      theme: AppTheme().light,
      darkTheme: AppTheme().dark,
      themeMode: ThemeMode.dark,
      builder: (context, child) {
        return StreamChatCore(
            client: client,
            child: ChannelsBloc(
                child: UsersBloc(
                    child:
                        child!)) // child will not be null as home screen is passed at home
            );
      },
      home: HomeScreen(),
    );
  }
}
