
// // ignore_for_file: deprecated_member_use


// import 'package:firebase_database/firebase_database.dart';
// import 'package:smart_hrm/models/company_model.dart';


// Future<List<Company>> getCompany() async {
//   Query companySnapshot = FirebaseDatabase.instance
//       .reference()
//       .child("registered_company").child("0");

//   List<Company> needs = [];

//   DatabaseEvent result = await companySnapshot.once();
  
//   if (result.snapshot.value != null) {
//     Map<dynamic, dynamic> map = result.snapshot.value as Map<dynamic, dynamic>;
    
//     map.forEach((key, value) {
//       needs.add(Company.fromJson(value));
//     });

//     print('checking company list: $needs');
//   } else {
//     // Handle case where there is no data
//     print('No data available for companies.');
//   }

//   return needs;
// }


//  class FirebaseService {
//   static Future<List<Company>> getCompanies() async {
//     DatabaseReference companyRef =
//         FirebaseDatabase.instance.reference().child("registered_company");

//     var keys = [];
//     var snapshots = (await companyRef.get()).children;

//     for (var snapshot in snapshots) {
//       keys.add(snapshot.key!);
//     }

//     print("keys");
//     print(keys);

//     List<Company> companies = [];

//     for (String key in keys) {
//       DatabaseEvent companySnapshot = await companyRef.child(key).once();

//       if (companySnapshot.snapshot.value != null) {
//         // Assuming your Company class has a factory constructor
//         Company company = Company.fromJson(
//           Map<String, dynamic>.from(companySnapshot.snapshot.value as  Map<String, dynamic>),
//         );
//         companies.add(company);
//       }
//     }

//     return companies;
//   }
// }



