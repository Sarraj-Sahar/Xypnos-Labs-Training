// import 'dart:async';
// import 'package:get/get.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:xypnos_training/models/savedCourse.dart';

// ProducsController producsController = ProducsController.instance;

// class ProducsController extends GetxController {
//   static ProducsController instance = Get.find();
//   RxList<ProductModel> products = RxList<ProductModel>([]);
//   String collection = "products";

//   @override
//   onReady() {
//     super.onReady();
//     products.bindStream(getAllProducts());
//   }

//   Stream<List<ProductModel>> getAllProducts() => FirebaseFirestore.instance
//       .collection(collection)
//       .snapshots()
//       .map((query) =>
//           query.docs.map((item) => ProductModel.fromMap(item.data())).toList());
// }
