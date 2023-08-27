import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/stream.dart' as model;

class streamProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<model.Stream> _items = [];

  List<model.Stream> get items {
    return [..._items];
  }

//add or registor on streams
  void addStream(newStream) {
    _items.add(newStream);
    notifyListeners();
  }

//fetch and set streams
  Future<void> fetchStreams() async {
    try {
      final snapshot = await _firestore
          .collection('streams')
          .orderBy('date', descending: true)
          .get();
      _items = snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data();
        return model.Stream(
          authorId: data['authorId'],
          streamId: data['streamId'],
          collection: data['collection'],
          courseId: data['courseId'],
          docId: data['docId'],
          date: data['date'],
        );
      }).toList();
      notifyListeners();
    } catch (e) {
      print("course stream provider: ${e.toString()}");
    }
  }

  List<model.Stream> getCourseStreamByCourseId(String cId) {
    return _items.where((str) => str.courseId == cId).toList();
  }

  model.Stream getCourseStreamByDoc(String docId) {
    return _items.firstWhere((str) => str.courseId == docId);
  }

  //Delete
  Future<void> deleteStream(String streamId ,String documentId ,String collection,) async {
    try {
      await FirebaseFirestore.instance
          .collection('streams')
          .doc(streamId)
          .delete();
          //and delete from to origin collection
          // if(collection == 'Course Materials'){

          // }
           await FirebaseFirestore.instance
          .collection(collection)
          .doc(documentId)
          .delete();
      print('Document deleted successfully $documentId');
    } catch (e) {
      print('Error deleting document: $e');
    }
    notifyListeners();
  }
}
