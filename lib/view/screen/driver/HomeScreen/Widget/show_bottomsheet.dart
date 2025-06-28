//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../../../../component/CommonText.dart';
// import '../../../../component/button/CommonButton.dart';
//
// void _showRideBottomSheet() => showModalBottomSheet(
//   context: context,
//   shape: const RoundedRectangleBorder(
//     borderRadius: BorderRadius.only(
//       topLeft: Radius.circular(10),
//       topRight: Radius.circular(10),
//     ),
//   ),
//   builder: (BuildContext context) {
//     return Container(
//       height: 247,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: Colors.white,
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Row(
//                   children: [
//                     CircleAvatar(
//                       radius: 25,
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(20),
//                         clipBehavior: Clip.antiAlias,
//                         child: Image.asset(
//                           "assets/images/editimage.jpg",
//                           fit: BoxFit.cover,
//                           width: 48,
//                           height: 48,
//                         ),
//                       ),
//                     ),
//                     CommonText(text: "Shihab Ahmed", fontSize: 16, fontWeight: FontWeight.w500),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     CommonText(text: "\$510.00", fontSize: 16, fontWeight: FontWeight.w500),
//                     CommonText(text: "3.3 km", fontSize: 16, fontWeight: FontWeight.w500),
//                   ],
//                 ),
//               ],
//             ),
//             Divider(thickness: 1),
//             CommonText(text: "Pick up", fontSize: 14, fontWeight: FontWeight.w400),
//             CommonText(text: "Block B, Banasree, Dhaka.", fontSize: 14, fontWeight: FontWeight.w400),
//             Divider(thickness: 1),
//             CommonText(text: "Drop out", fontSize: 14, fontWeight: FontWeight.w400),
//             CommonText(text: "Dhanmondi, Dhaka.", fontSize: 14, fontWeight: FontWeight.w400),
//             SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 CommonButton(
//                   titleText: "Decline",
//                   buttonHeight: 40,
//                   buttonWidth: 113,
//                   borderColor: Colors.grey,
//                   titleSize: 14,
//                   titleColor: Colors.black,
//                   onTap: () {
//                     Navigator.pop(context); // Close the BottomSheet
//                     setState(() {
//                       _isContainerVisible = true; // Show the Positioned container again
//                     });
//                   },
//                 ),
//                 CommonButton(
//                   titleText: "Accept",
//                   buttonHeight: 40,
//                   buttonWidth: 113,
//                   backgroundColor: Colors.black,
//                   titleColor: Colors.white,
//                   titleSize: 14,
//                   onTap: () {
//                     // Add further logic for Accept action if needed
//                     Navigator.pop(context); // Close the BottomSheet
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   },
// );