import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:nodical/models/meeting.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final databaseReference = FirebaseDatabase.instance.reference();

  Future updateUserData(String name) async {
    return await databaseReference.child('usr').child(uid).set({
      'name': name,
    });

    //return await usrCollection.doc(uid).set({
    //  'name': name,
    //});
  }

  void addEvents(Meeting events) async {
    Map<String, dynamic> data = <String, dynamic>{
      'eventName': events.eventName,
      'from_hour': events.from.hour,
      'from_minute': events.from.minute,
      'to_hour': events.to.hour,
      'to_minute': events.to.minute,
      'background': events.background.toString(),
      'isAllDay': events.isAllDay,
      'startTimeZone': events.startTimeZone,
      'endTimeZone': events.endTimeZone,
      'description': events.description,
    };
    databaseReference
        .child('usr')
        .child(uid)
        .child('events')
        .child(events.eventName)
        .set(data);

    //FirebaseFirestore.instance
    //    .collection('usr')
    //    .doc(uid)
    //    .collection('userevents')
    //    .add(events.toJson());
    print("this has been called");
  }

  //get usr stream
}
