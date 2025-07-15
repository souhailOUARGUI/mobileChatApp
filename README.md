# mobileChatApp

# Application de Chat Flutter avec BLoC

Une application de chat moderne développée avec Flutter utilisant le pattern BLoC pour la gestion d'état.

## Fonctionnalités

### ✅ Implémentées
- **Liste des conversations** : Affichage de toutes les conversations avec nom du contact, dernier message et timestamp
- **Vue détaillée de conversation** : Interface de chat avec historique des messages et envoi de nouveaux messages
- **Gestion d'état BLoC** : Architecture robuste avec états immutables utilisant Equatable
- **Simulation de données** : Données mockées pour les conversations et messages
- **Simulation de réception** : Messages automatiques reçus toutes les 10 secondes
- **Interface responsive** : Design adaptatif avec Material Design

### 🎯 Événements BLoC
- `LoadConversations` : Charge la liste des conversations
- `SendMessage` : Envoie un nouveau message
- `ReceiveMessage` : Reçoit un message (simulé)
- `LoadMessages` : Charge les messages d'une conversation

### 📱 Écrans
1. **ConversationListScreen** : Liste des conversations avec pull-to-refresh
2. **ConversationDetailScreen** : Interface de chat avec envoi de messages

## Architecture

### Modèles de données
- **Conversation** : `id`, `contactName`, `lastMessage`, `timestamp`
- **Message** : `id`, `conversationId`, `content`, `isMe`, `timestamp`

### Structure des fichiers
```
lib/
├── bloc/
│   ├── conversation_bloc.dart
│   ├── conversation_event.dart
│   └── conversation_state.dart
├── data/
│   └── mock_data.dart
├── models/
│   ├── conversation.dart
│   └── message.dart
├── screens/
│   ├── conversation_list_screen.dart
│   └── conversation_detail_screen.dart
├── widgets/
│   ├── conversation_tile.dart
│   └── message_bubble.dart
└── main.dart
```

## Installation et utilisation

### Prérequis
- Flutter SDK (version 3.8.0 ou supérieure)
- Dart SDK

### Installation
```bash
# Cloner le projet
git clone <repository-url>
cd chatapplication

# Installer les dépendances
flutter pub get

# Lancer l'application
flutter run
```

### Tests
```bash
# Exécuter tous les tests
flutter test

# Exécuter les tests avec couverture
flutter test --coverage
```

## Dépendances

- `flutter_bloc: ^9.1.1` - Gestion d'état BLoC
- `equatable: ^2.0.7` - États immutables
- `intl: ^0.20.2` - Formatage des dates (non utilisé dans la version finale)

## Fonctionnalités techniques

### Gestion d'état
- **Pattern BLoC** avec états immutables
- **Equatable** pour la comparaison d'états
- **Provider pattern** pour l'injection de dépendances

### Interface utilisateur
- **Material Design** avec thème personnalisé
- **Bulles de messages** avec alignement selon l'expéditeur
- **Avatars** avec initiales des contacts
- **Timestamps** formatés intelligemment
- **Pull-to-refresh** sur la liste des conversations

### Simulation
- **Données mockées** réalistes
- **Messages automatiques** reçus aléatoirement
- **Tri automatique** des conversations par timestamp

## Améliorations possibles

- [ ] Persistance des données (SQLite/Hive)
- [ ] Notifications push
- [ ] Envoi d'images et fichiers
- [ ] Statuts de lecture des messages
- [ ] Recherche dans les conversations
- [ ] Thème sombre
- [ ] Internationalisation (i18n)
- [ ] Tests d'intégration plus complets

## Développement

### Ajout de nouvelles fonctionnalités
1. Créer les événements nécessaires dans `conversation_event.dart`
2. Mettre à jour les états dans `conversation_state.dart`
3. Implémenter la logique dans `conversation_bloc.dart`
4. Mettre à jour l'interface utilisateur

### Tests
L'application inclut des tests unitaires et de widgets couvrant :
- Affichage de la liste des conversations
- Navigation vers les détails
- Envoi de messages
- Logique du BLoC

## Licence

Ce projet est développé à des fins éducatives.
