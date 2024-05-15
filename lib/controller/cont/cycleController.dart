import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CycleController extends GetxController {
  var agricyclesList = [].obs;
  var topArticlesList = [].obs;

  @override
  void onInit() {
    getAgricycles();
    getTopArticles();
    super.onInit();
  }

  void getAgricycles() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("Agricycles").get();
    agricyclesList.addAll(querySnapshot.docs);
  }

  void getTopArticles() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("TopArticles").get();
    topArticlesList.addAll(querySnapshot.docs);
  }

  Future<bool> fetchFavoriteState(String articleName) async {
    try {
      CollectionReference collectionReference =
          FirebaseFirestore.instance.collection("TopArticles");
      QuerySnapshot querySnapshot =
          await collectionReference.where("name", isEqualTo: articleName).get();

      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot docSnapshot = querySnapshot.docs.first;
        bool favorite = docSnapshot.get("favorite");
        return favorite;
      } else {
        print("Article not found: $articleName");
        return false;
      }
    } catch (e) {
      print("Error fetching favorite state: $e");
      return false;
    }
  }

  Future<void> toggleFavorite(String articleName, bool currentFavorite) async {
    try {
      CollectionReference collectionReference =
          FirebaseFirestore.instance.collection("TopArticles");
      QuerySnapshot querySnapshot =
          await collectionReference.where("name", isEqualTo: articleName).get();

      if (querySnapshot.docs.isNotEmpty) {
        DocumentReference docRef = querySnapshot.docs.first.reference;
        bool newFavorite = currentFavorite;
        await docRef.update({"favorite": newFavorite});
        print("Favorite toggled successfully: $newFavorite");
      } else {
        print("Article not found: $articleName");
      }
    } catch (e) {
      print("Error toggling favorite: $e");
    }
  }
}