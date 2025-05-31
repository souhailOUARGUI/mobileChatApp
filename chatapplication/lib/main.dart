import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/conversation_bloc.dart';
import 'screens/conversation_list_screen.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConversationBloc(),
      child: MaterialApp(
        title: 'Chat Application',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.blue[600],
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const ConversationListScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
