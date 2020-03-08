import 'User.dart';

class Message {
  final User sender;
  final String time;
  final String text;
  bool isLiked;
  final bool unread;

  Message({
    this.sender,
    this.time,
    this.text,
    this.isLiked,
    this.unread,
  });
}

// YOU - current user
final User currentUser = User(
  id: 0,
  name: 'Current User',
);

// USERS
final User chatbot = User(
  id: 1,
  name: 'ChatBot',
);
final User virag = User(
  id: 2,
  name: 'Virag',
);
final User charmee = User(
  id: 3,
  name: 'Charmee',
);
final User nikhil = User(
  id: 4,
  name: 'Nikhil',
);
final User khushi = User(
  id: 5,
  name: 'Khushi',
);
final User heet = User(
  id: 6,
  name: 'Heet',
);
final User sachin = User(
  id: 7,
  name: 'Sachin',
);

// FAVORITE CONTACTS
List<User> favourites = [chatbot,virag,charmee,nikhil,khushi,heet,sachin];

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: chatbot,
    time: '5:30 PM',
    text: 'How was your day?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: virag,
    time: '4:30 PM',
    text: 'Bro, life is so awesome',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: charmee,
    time: '3:30 PM',
    text: 'Life is not fun anymore',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: nikhil,
    time: '2:30 PM',
    text: 'Coronavirus is gonna kill me',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: khushi,
    time: '1:30 PM',
    text: 'Hey, whatsapp!',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: heet,
    time: '12:30 PM',
    text: 'Heyyyyyya',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: sachin,
    time: '11:30 AM',
    text: 'Wanna play cricket?',
    isLiked: false,
    unread: false,
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    sender: chatbot,
    time: '11:12 PM',
    text: 'Thanks for that',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: chatbot,
    time: '5:30 PM',
    text: 'You can have a chat with me!',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'No one loves me',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: chatbot,
    time: '3:45 PM',
    text:"I'm always here for you",
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: chatbot,
    time: '3:15 PM',
    text: 'You wanna talk about it?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'It was reallyy bad',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: chatbot,
    time: '2:00 PM',
    text: 'How was your day!',
    isLiked: true,
    unread: true,
  ),
];
