import 'package:nodical/models/nodical_user.dart';

class Message {
  final NodicalUser sender;
  final String time;
  final String text;
  final bool isLiked;
  final bool unread;

  Message({
    this.sender,
    this.time,
    this.text,
    this.isLiked,
    this.unread,
  });
}

//EXAMPLE NodicalUserS
final NodicalUser currentNodicalUser = NodicalUser(
    name: 'Current  NodicalUser',
    imageUrl: 'assets/images/Blank-Profile-Picture.jpg');
final NodicalUser will = NodicalUser(
  name: 'Will',
  imageUrl: 'assets/images/Blank-Profile-Picture.jpg',
);
final NodicalUser elena = NodicalUser(
  name: 'Elena',
  imageUrl: 'assets/images/Blank-Profile-Picture.jpg',
);
final NodicalUser belal = NodicalUser(
  name: 'Belal',
  imageUrl: 'assets/images/Blank-Profile-Picture.jpg',
);
final NodicalUser keigan = NodicalUser(
  name: 'Keigan',
  imageUrl: 'assets/images/Blank-Profile-Picture.jpg',
);
final NodicalUser woodland = NodicalUser(
  name: 'Woodland',
  imageUrl: 'assets/images/Blank-Profile-Picture.jpg',
);
final NodicalUser pierantozzi = NodicalUser(
  name: 'Pierantozzi',
  imageUrl: 'assets/images/Blank-Profile-Picture.jpg',
);

//FAVORITE CONTACTS
List<NodicalUser> favorites = [
  will,
  elena,
  belal,
  keigan,
  woodland,
  pierantozzi
];

//EXAMPLE CHATS
List<Message> chats = [
  Message(
    sender: will,
    time: '2:02 PM',
    text: 'Hey how\'s it going?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: elena,
    time: '4:04 PM',
    text: 'Hey how\'s it going?',
    isLiked: false,
    unread: false,
  ),
];

List<Message> messages = [
  Message(
    sender: will,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentNodicalUser,
    time: '4:30 PM',
    text: 'Just walked my doge. She was super duper cute. The best pupper!!',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: will,
    time: '3:45 PM',
    text: 'How\'s the doggo?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: will,
    time: '3:15 PM',
    text: 'All the food',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentNodicalUser,
    time: '2:30 PM',
    text: 'Nice! What kind of food did you eat?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: will,
    time: '2:00 PM',
    text: 'I ate so much food today.',
    isLiked: false,
    unread: true,
  ),
];
