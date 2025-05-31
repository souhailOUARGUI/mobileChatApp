import '../models/conversation.dart';
import '../models/message.dart';

class MockData {
  static List<Conversation> get mockConversations => [
        Conversation(
          id: '1',
          contactName: 'Alice Martin',
          lastMessage: 'Salut ! Comment ça va ?',
          timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
        ),
        Conversation(
          id: '2',
          contactName: 'Bob Dupont',
          lastMessage: 'On se voit demain ?',
          timestamp: DateTime.now().subtract(const Duration(hours: 2)),
        ),
        Conversation(
          id: '3',
          contactName: 'Claire Moreau',
          lastMessage: 'Merci pour ton aide !',
          timestamp: DateTime.now().subtract(const Duration(hours: 5)),
        ),
        Conversation(
          id: '4',
          contactName: 'David Leroy',
          lastMessage: 'À bientôt !',
          timestamp: DateTime.now().subtract(const Duration(days: 1)),
        ),
        Conversation(
          id: '5',
          contactName: 'Emma Bernard',
          lastMessage: 'Super idée !',
          timestamp: DateTime.now().subtract(const Duration(days: 2)),
        ),
      ];

  static Map<String, List<Message>> get mockMessages => {
        '1': [
          Message(
            id: '1',
            conversationId: '1',
            content: 'Salut Alice !',
            isMe: true,
            timestamp: DateTime.now().subtract(const Duration(minutes: 10)),
          ),
          Message(
            id: '2',
            conversationId: '1',
            content: 'Salut ! Comment ça va ?',
            isMe: false,
            timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
          ),
        ],
        '2': [
          Message(
            id: '3',
            conversationId: '2',
            content: 'Salut Bob !',
            isMe: true,
            timestamp: DateTime.now().subtract(const Duration(hours: 3)),
          ),
          Message(
            id: '4',
            conversationId: '2',
            content: 'Salut ! Tu es libre demain ?',
            isMe: false,
            timestamp: DateTime.now().subtract(const Duration(hours: 2, minutes: 30)),
          ),
          Message(
            id: '5',
            conversationId: '2',
            content: 'Oui, pourquoi ?',
            isMe: true,
            timestamp: DateTime.now().subtract(const Duration(hours: 2, minutes: 15)),
          ),
          Message(
            id: '6',
            conversationId: '2',
            content: 'On se voit demain ?',
            isMe: false,
            timestamp: DateTime.now().subtract(const Duration(hours: 2)),
          ),
        ],
        '3': [
          Message(
            id: '7',
            conversationId: '3',
            content: 'De rien Claire !',
            isMe: true,
            timestamp: DateTime.now().subtract(const Duration(hours: 6)),
          ),
          Message(
            id: '8',
            conversationId: '3',
            content: 'Merci pour ton aide !',
            isMe: false,
            timestamp: DateTime.now().subtract(const Duration(hours: 5)),
          ),
        ],
        '4': [
          Message(
            id: '9',
            conversationId: '4',
            content: 'À bientôt David !',
            isMe: true,
            timestamp: DateTime.now().subtract(const Duration(days: 1, hours: 1)),
          ),
          Message(
            id: '10',
            conversationId: '4',
            content: 'À bientôt !',
            isMe: false,
            timestamp: DateTime.now().subtract(const Duration(days: 1)),
          ),
        ],
        '5': [
          Message(
            id: '11',
            conversationId: '5',
            content: 'J\'ai une idée pour le projet',
            isMe: true,
            timestamp: DateTime.now().subtract(const Duration(days: 2, hours: 1)),
          ),
          Message(
            id: '12',
            conversationId: '5',
            content: 'Super idée !',
            isMe: false,
            timestamp: DateTime.now().subtract(const Duration(days: 2)),
          ),
        ],
      };
}
