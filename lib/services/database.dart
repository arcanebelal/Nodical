import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference usrCollection =
      FirebaseFirestore.instance.collection('usr');

  Future updateUserData(String name) async {
    return await usrCollection.doc(uid).set({
      'name': name,
    });
  }

  //get usr stream
  Stream<QuerySnapshot> get usrs {
    return usrCollection.snapshots();
  }
}
