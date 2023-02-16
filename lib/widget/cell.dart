// import 'package:flutter/material.dart';

// class Cells extends StatelessWidget {
//   const Cell({super.key, required this.title});
//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         children: [
//           Text(title),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ListView.separated(
//               itemCount: cellNames.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return ListTile(
//                   title: Text(cellNames[index].name),
//                   trailing: const Icon(Icons.keyboard_arrow_right_outlined),
//                   onTap: () {
//                     Navigator.pushNamed(context, cellNames[index].url);
//                   },
//                 );
//               },
//               separatorBuilder: (BuildContext context, int index) =>
//                   const Divider(height: 1.0),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }


// class Cell extends StatefulWidget {
//  Cell({super.key, required this.title,this.cellNames});
//     final String title;
//  late List<CellModel> cellNames =[];

//   @override
//   State<Cell> createState() => _CellState();
// }

// class _CellState extends State<Cell> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }


// class CellModel {
//   final String name;
//   final String url;

//   CellModel(this.name, this.url);
// }
