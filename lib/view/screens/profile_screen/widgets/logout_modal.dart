// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class LogoutModal extends StatelessWidget {
//   const LogoutModal({
//     super.key,
//     // required this.image,
//   });

//   // final ImagePickerBloc image;

//   @override
//   Widget build(BuildContext context) {
//     return
//     //  Center(
//       //     child: Container(
//       //       width: MediaQuery.of(context).size.width * 0.8, // Custom width
//       //       padding: EdgeInsets.all(16.0),
//       //       decoration: BoxDecoration(
//       //         color: CupertinoColors.darkBackgroundGray, // Background color
//       //         borderRadius: BorderRadius.circular(10),
//       //       ),
//       //       child: Column(
//       //         mainAxisSize: MainAxisSize.min,
//       //         children: [
//       //           Text(
//       //             'Logout',
//       //             style: TextStyle(
//       //               fontSize: 20,
//       //               fontWeight: FontWeight.bold,
//       //               color: Colors.white, // Title color
//       //             ),
//       //           ),
//       //           SizedBox(height: 10),
//       //           Text(
//       //             'Are you sure, do you want to logout?',
//       //             textAlign: TextAlign.center,
//       //             style: TextStyle(
//       //               color: Colors.white70, // Message color
//       //               fontSize: 16,
//       //             ),
//       //           ),
//       //           SizedBox(height: 20),
//       //           Row(
//       //             children: [
//       //               Expanded(
//       //                 child: GestureDetector(
//       //                   onTap: () {
//       //                     Navigator.of(context).pop();
//       //                     // YES button action
//       //                   },
//       //                   child: Container(
//       //                     padding: EdgeInsets.symmetric(vertical: 12),
//       //                     alignment: Alignment.center,
//       //                     decoration: BoxDecoration(
//       //                       color: CupertinoColors.systemRed, // YES button color
//       //                       borderRadius: BorderRadius.circular(5),
//       //                     ),
//       //                     child: Text(
//       //                       'YES',
//       //                       style: TextStyle(
//       //                         color: Colors.white, // YES button text color
//       //                         fontSize: 16,
//       //                       ),
//       //                     ),
//       //                   ),
//       //                 ),
//       //               ),
//       //               SizedBox(width: 10),
//       //               Expanded(
//       //                 child: GestureDetector(
//       //                   onTap: () {
//       //                     Navigator.of(context).pop();
//       //                   },
//       //                   child: Container(
//       //                     padding: EdgeInsets.symmetric(vertical: 12),
//       //                     alignment: Alignment.center,
//       //                     decoration: BoxDecoration(
//       //                       color: CupertinoColors.systemGrey, // NO button color
//       //                       borderRadius: BorderRadius.circular(5),
//       //                     ),
//       //                     child: Text(
//       //                       'NO',
//       //                       style: TextStyle(
//       //                         color: Colors.white, // NO button text color
//       //                         fontSize: 16,
//       //                       ),
//       //                     ),
//       //                   ),
//       //                 ),
//       //               ),
//       //             ],
//       //           ),
//       //         ],
//       //       ),
//       //     ),
//       //   );
//       // }
//   CupertinoAlertDialog(
//         title: const Text(
//           'Logout',
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         content: const Padding(
//           padding: EdgeInsets.symmetric(vertical: 12.0),
//           child: Text(
//             'Are you sure, do you want to logout?',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 16,
//             ),
//           ),
//         ),
//         actions: <Widget>[
//           CupertinoDialogAction(
//             child: const Text(
//               'YES',
//               style: TextStyle(
//                 color: Colors.redAccent,
//               ),
//             ),
//             onPressed: () {

//               Navigator.of(context).pop();
//               // Add logic for the YES button here.
//             },
//           ),
//           CupertinoDialogAction(
//             child: const Text('NO'),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       );
// }
// }