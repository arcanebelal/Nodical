import 'package:nodical/user.dart';

class Message{
  final User sender;
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

//EXAMPLE USERS
final User currentUser = User(
  id: 0,
  name: 'Current  User',
  imageUrl: 'assets/images/Blank-Profile-Picture.jpg'
);
final User will = User(
  id: 1,
  name: 'Will',
  imageUrl: 'assets/images/Blank-Profile-Picture.jpg',
);
final User elena = User(
  id: 2,
  name: 'Elena',
  imageUrl: 'assets/images/Blank-Profile-Picture.jpg',
);
final User belal = User(
  id: 3,
  name: 'Belal',
  imageUrl: 'assets/images/Blank-Profile-Picture.jpg',
);
final User keigan = User(
  id: 4,
  name: 'Keigan',
  imageUrl: 'assets/images/Blank-Profile-Picture.jpg',
);
final User woodland = User(
  id: 5,
  name: 'Woodland',
  imageUrl: 'assets/images/Blank-Profile-Picture.jpg',
);
final User pierantozzi = User(
  id: 6,
  name: 'Pierantozzi',
  imageUrl: 'assets/images/Blank-Profile-Picture.jpg',
);

//FAVORITE CONTACTS
List<User> favorites = [will, elena, belal, keigan, woodland, pierantozzi];

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
    time: '2:04 PM',
    text: 'It\'s been alright.',
    isLiked: false,
    unread: true,
  ),
];