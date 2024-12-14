import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_app/core/providers/firebase_provider.dart';
final authRepositoryProvider=Provider((ref) => AuthRepository(firestore: ref.read(firebaseProvider)),);
class AuthRepository{
final FirebaseFirestore _firestore;
AuthRepository({required FirebaseFirestore firestore}):
    _firestore=firestore;



}