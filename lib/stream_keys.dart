import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart' as log;
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

const apiKey = "unhmztx7m8jh";

// token for id -
const userToken = '';

// secret : vttsm3mynungy5u4rsvfktwzazh823z7h6mqmyr7fdp6vpmbqtjk3f2x85eyx42k

// Generate tokens from here
// each token is unique to the user id, there is a generator on page that will require
// secret key and user id to generate a token
// secret key is present in stream dashboard > project > secret
// https://getstream.io/chat/docs/flutter-dart/tokens_and_authentication/?language=dart

var logger = log.Logger();

// Extensions can be used to add functionality to the SDK
extension StreamChatContext on BuildContext {
  // Fetches the current user image
  String? get currentUserImage => StreamChatCore.of(this).currentUser?.image;

  // Fetches the current user
  User? get currentUser => StreamChatCore.of(this).currentUser;
}
