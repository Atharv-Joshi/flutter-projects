import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  final String uid;

  DatabaseService(
  {
    required this.uid
}
      );

  final CollectionReference collection = FirebaseFirestore.instance.collection('profiles');

  Future<void> updateUserData(String name, String email, String password , String channel , String accountingSoftware ) async {
    return await collection.doc(uid).set({
      'name': name,
      'email': email,
      'password': password,
      'channel': channel,
      'accountingSoftware': accountingSoftware,
    });
  }

}