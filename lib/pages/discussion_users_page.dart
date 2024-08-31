// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../components/my_app_bar_disc.dart';
import '../components/my_drawer.dart';
import '../components/user_tile.dart';
import '../services/auth/auth_service.dart';
import '../services/chat/chat_service.dart';
import 'chat_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // chat & auth service
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const MyAppBarDiscussion(
        title: "U S E R S",
        actions: [],
      ),
      drawer: const MyDrawer(),
      body: _buildUserList(),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor:Theme.of(context).colorScheme.background,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          // ignore: avoid_print
          print("Tapped on index $index");
        },
        items: [
        // ignore: prefer_const_constructors
        Icon(Icons.home),
        // ignore: prefer_const_constructors
        // Icon(Icons.app_blocking),
        Icon(Icons.list),
        // ignore: prefer_const_constructors
        Icon(Icons.notifications),
        Icon(Icons.chat),
        Icon(Icons.settings)
  

      ]
      ),
    );
  }

  // build a list of users except for the current logged in user
  Widget _buildUserList() {
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
}
