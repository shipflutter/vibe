// import 'package:flutter/material.dart';

// class FlutterApp extends StatelessWidget {
//   const FlutterApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'ShipFlutter',
//       theme: ThemeData(
//         brightness: Brightness.dark,
//         primarySwatch: Colors.blue,
//         useMaterial3: true,
//       ),
//       home: const LandingPage(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// class LandingPage extends StatelessWidget {
//   const LandingPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
//           ),
//         ),
//         child: Center(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.all(32.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                   decoration: BoxDecoration(
//                     color: Colors.blue.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(20),
//                     border: Border.all(color: Colors.blue.withOpacity(0.2)),
//                   ),
//                   child: const Text(
//                     'ONE COMMAND. ALL THE CONTEXT.',
//                     style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 10),
//                   ),
//                 ),
//                 const SizedBox(height: 24),
//                 const Text(
//                   'Ship Full-Stack\nFlutter Apps with AI',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 32,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                     letterSpacing: -1,
//                   ),
//                 ),
//                 const SizedBox(height: 24),
//                 const Text(
//                   'Production-ready recipes covering Flutter, backend APIs, payments, and App Store compliance.',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(color: Colors.grey, fontSize: 16),
//                 ),
//                 const SizedBox(height: 40),
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white,
//                     foregroundColor: Colors.black,
//                     padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
//                   ),
//                   child: const Text('Get Started Free'),
//                 ),
//                 const SizedBox(height: 16),
//                 TextButton(
//                   onPressed: () {},
//                   style: TextButton.styleFrom(
//                     foregroundColor: Colors.white,
//                     side: const BorderSide(color: Colors.grey),
//                     padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
//                   ),
//                   child: const Text('View on App Store'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
