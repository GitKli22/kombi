import 'package:combi/pages/chat_page.dart';
import 'package:flutter/material.dart';
import '../components/my_app_bar_disc.dart';
import '../components/my_drawer.dart';
import '../components/user_tile.dart';
import '../services/auth/auth_service.dart';
import '../services/chat/chat_service.dart';
 

final ChatService _chatService = ChatService();
final AuthService _authService = AuthService();

  Widget chatWidget() {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: _chatService.getUsersStreamExcludingBlocked(),
      builder: (context, snapshot) {
        // error
        if (snapshot.hasError) {
          return const Text("Error");
        }

        // loading..
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading..");
        }

        // list view
        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) => _buildUserListItem(userData, context))
              .toList(),
        );
      },
    );
  }

  // build individual list tile for user
  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    // display all users except current user
    if (_authService.getCurrentUser()!.email != userData["email"]) {
      return UserTile(
        text: userData["email"],
        onTap: () async {
          // mark all messages in this chat page as read
          await _chatService.markMessagesAsRead(userData["uid"]);

          // tapped on a user -> go to chat page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                receiverEmail: userData["email"],
                receiverID: userData["uid"],
              ),
            ),
          );
        },
        unreadMessagesCount: userData['unreadCount'],
      );
    } else {
      return Container();
    }
  }