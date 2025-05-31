import 'dart:async';
import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/conversation.dart';
import '../models/message.dart';
import '../data/mock_data.dart';
import 'conversation_event.dart';
import 'conversation_state.dart';

class ConversationBloc extends Bloc<ConversationEvent, ConversationState> {
  Timer? _messageTimer;

  ConversationBloc() : super(ConversationInitial()) {
    on<LoadConversations>(_onLoadConversations);
    on<SendMessage>(_onSendMessage);
    on<ReceiveMessage>(_onReceiveMessage);
    on<LoadMessages>(_onLoadMessages);

    // Simuler la réception de messages aléatoirement
    _startMessageSimulation();
  }

  void _onLoadConversations(
    LoadConversations event,
    Emitter<ConversationState> emit,
  ) async {
    emit(ConversationLoading());
    
    try {
      // Simuler un délai de chargement
      await Future.delayed(const Duration(milliseconds: 500));
      
      final conversations = MockData.mockConversations;
      final messages = MockData.mockMessages;
      
      emit(ConversationLoaded(
        conversations: conversations,
        messages: messages,
      ));
    } catch (e) {
      emit(ConversationError(message: e.toString()));
    }
  }

  void _onSendMessage(
    SendMessage event,
    Emitter<ConversationState> emit,
  ) {
    if (state is ConversationLoaded) {
      final currentState = state as ConversationLoaded;
      
      // Créer un nouveau message
      final newMessage = Message(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        conversationId: event.conversationId,
        content: event.content,
        isMe: true,
        timestamp: DateTime.now(),
      );
      
      // Mettre à jour les messages
      final updatedMessages = Map<String, List<Message>>.from(currentState.messages);
      final conversationMessages = List<Message>.from(
        updatedMessages[event.conversationId] ?? [],
      );
      conversationMessages.add(newMessage);
      updatedMessages[event.conversationId] = conversationMessages;
      
      // Mettre à jour la conversation avec le dernier message
      final updatedConversations = currentState.conversations.map((conv) {
        if (conv.id == event.conversationId) {
          return conv.copyWith(
            lastMessage: event.content,
            timestamp: DateTime.now(),
          );
        }
        return conv;
      }).toList();
      
      // Trier les conversations par timestamp (plus récent en premier)
      updatedConversations.sort((a, b) => b.timestamp.compareTo(a.timestamp));
      
      emit(currentState.copyWith(
        conversations: updatedConversations,
        messages: updatedMessages,
      ));
    }
  }

  void _onReceiveMessage(
    ReceiveMessage event,
    Emitter<ConversationState> emit,
  ) {
    if (state is ConversationLoaded) {
      final currentState = state as ConversationLoaded;
      
      // Créer un nouveau message reçu
      final newMessage = Message(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        conversationId: event.conversationId,
        content: event.content,
        isMe: false,
        timestamp: DateTime.now(),
      );
      
      // Mettre à jour les messages
      final updatedMessages = Map<String, List<Message>>.from(currentState.messages);
      final conversationMessages = List<Message>.from(
        updatedMessages[event.conversationId] ?? [],
      );
      conversationMessages.add(newMessage);
      updatedMessages[event.conversationId] = conversationMessages;
      
      // Mettre à jour la conversation avec le dernier message
      final updatedConversations = currentState.conversations.map((conv) {
        if (conv.id == event.conversationId) {
          return conv.copyWith(
            lastMessage: event.content,
            timestamp: DateTime.now(),
          );
        }
        return conv;
      }).toList();
      
      // Trier les conversations par timestamp (plus récent en premier)
      updatedConversations.sort((a, b) => b.timestamp.compareTo(a.timestamp));
      
      emit(currentState.copyWith(
        conversations: updatedConversations,
        messages: updatedMessages,
      ));
    }
  }

  void _onLoadMessages(
    LoadMessages event,
    Emitter<ConversationState> emit,
  ) {
    // Cette méthode peut être utilisée pour charger les messages d'une conversation spécifique
    // Pour l'instant, tous les messages sont déjà chargés
  }

  void _startMessageSimulation() {
    _messageTimer = Timer.periodic(const Duration(seconds: 10), (timer) {
      if (state is ConversationLoaded) {
        final currentState = state as ConversationLoaded;
        final random = Random();
        
        // Messages aléatoires à recevoir
        final randomMessages = [
          'Comment ça va ?',
          'Tu fais quoi ?',
          'On se voit bientôt ?',
          'Merci !',
          'À plus tard',
          'Super !',
          'D\'accord',
          'Parfait !',
        ];
        
        if (currentState.conversations.isNotEmpty) {
          final randomConversation = currentState.conversations[
            random.nextInt(currentState.conversations.length)
          ];
          final randomMessage = randomMessages[
            random.nextInt(randomMessages.length)
          ];
          
          add(ReceiveMessage(
            conversationId: randomConversation.id,
            content: randomMessage,
          ));
        }
      }
    });
  }

  @override
  Future<void> close() {
    _messageTimer?.cancel();
    return super.close();
  }
}
