// // import 'package:flutter/material.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';

// // class MyHomePage extends StatefulWidget {
// //   @override
// //   _MyHomePageState createState() => _MyHomePageState();
// // }

// // class _MyHomePageState extends State<MyHomePage> {
// //   // Reference to Firestore collection
// //   final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Firestore Demo'),
// //       ),
// //       body: FutureBuilder<QuerySnapshot>(
// //         future: usersCollection.get(),
// //         builder: (context, snapshot) {
// //           if (snapshot.connectionState == ConnectionState.waiting) {
// //             return Center(
// //               child: CircularProgressIndicator(),
// //             );
// //           } else if (snapshot.hasError) {
// //             return Center(
// //               child: Text('Error: ${snapshot.error}'),
// //             );
// //           } else {
// //             // Display the data from Firestore
// //             final List<DocumentSnapshot> documents = snapshot.data!.docs;
// //             return ListView.builder(
// //               itemCount: documents.length,
// //               itemBuilder: (context, index) {
// //                 Map<String, dynamic> data = documents[index].data() as Map<String, dynamic>;
// //                 return ListTile(
// //                   title: Text(data['name']),
// //                 );
// //               },
// //             );
// //           }
// //         },
// //       ),
// //     );
// //   }
// // }


// // ignore_for_file: deprecated_member_use

// import 'package:firebase_database/ui/firebase_animated_list.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final _databaseReference = FirebaseDatabase.instance.ref("registered_company");

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Firebase Realtime Database Example'),
//       ),
//       body: Center(
//         child: FirebaseAnimatedList(
//           query: _databaseReference,
//           itemBuilder: (context, snapshot, animation, index) {
//             return ListTile(
//               title: Text(snapshot.child('company_name').value.toString()),
//             );
//           },
//           )
//       ),
//     );
//   }


// Future<List<dynamic>> fetchData() async {
//   // Assuming _databaseReference is an instance of DatabaseReference
//   DatabaseEvent snapshot = await _databaseReference.child('registered_company').once();

//   List<dynamic> dataList = [];

//   // Check if the snapshot has data
//   if (snapshot.snapshot.value != null) {
//     // Loop through the snapshot to extract data
//     Map<dynamic, dynamic> values = snapshot as    Map<dynamic, dynamic>;
//     values.forEach((key, value) {
//       dataList.add(value);
//     });
//   }

//   return dataList;
// }

// }

