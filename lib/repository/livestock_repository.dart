import 'package:cloud_firestore/cloud_firestore.dart';

class LivestockRepostory{
  final firestore=FirebaseFirestore.instance;

  // Adding feeds to firebase
  Future<void> addFeed(feed)=>firestore.collection("feeds").add(feed);
  Future<void> updateFeed(id, feed)=>firestore.collection("feeds").doc(id).update(feed);
  Stream<QuerySnapshot> getAllFeedsSnapshot()=>firestore.collection("feeds").snapshots();
  Future<void> deleteFeed(id)=>firestore.collection("feeds").doc(id).delete();

  // Livestock feeding schedule
  Future<void> addFeedSchedule(feedschedule)=>firestore.collection("feed-schedules").add(feedschedule);
  Future<void> updateFeedSchedule(id, feedchedule)=>firestore.collection("feed-schedules").doc(id).update(feedchedule);
  Stream<QuerySnapshot> getAllFeedSchedulesSnapshot()=>firestore.collection("feed-schedules").snapshots();
  Future<void> deleteFeedSchedule(id)=>firestore.collection("feed-schedules").doc(id).delete();

  // Breeding management
   Future<void> addBreedingInformation(breedinginformation)=>firestore.collection("breeding-information").add(breedinginformation);
  Future<void> updateBreedingInformation(id, feedchedule)=>firestore.collection("breeding-information").doc(id).update(feedchedule);
  Stream<QuerySnapshot> getAllBreedingInformationsSnapshots()=>firestore.collection("breeding-information").snapshots();
  Future<void> deleteBreedingInformation(id)=>firestore.collection("breeding-information").doc(id).delete();


  // Animal health management
  Future<void> addAnimalHealthInformation(health)=>firestore.collection('health-information').add(health);
  Future<void> updateAnimalHealthInformation(id,health)=>firestore.collection('health-information').doc(id).update(health);
  Stream<QuerySnapshot> getAnimalHealthInformationSnapshots()=>firestore.collection('health-information').snapshots();
  Future<void> deleteAnimalHealthInformation(id)=>firestore.collection('health-information').doc(id).delete();

  // Weight management
  Future<void> addAnimalWeight(weight)=>firestore.collection('weight-information').add(weight);
  Future<void> updateAnimalWeight(id, weight)=>firestore.collection('weight-information').doc(id).update(weight);
  Stream<QuerySnapshot> getAllAnimalWeightSnapshots()=>firestore.collection('weight-information').orderBy("animalid", descending: false).snapshots();
  Stream<QuerySnapshot> getAllAnimalWeightSnapshotsForParticularAnimal(animalid)=>firestore.collection('weight-information').where("animalid", isEqualTo: animalid).snapshots();
  Future<void> deleteAnimalWeight(id)=>firestore.collection('weight-information').doc(id).delete();
}