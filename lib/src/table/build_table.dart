//
// import 'package:flutter/material.dart';
//
// import '../../reactive_datatable_a.dart';
//
// class BuildTable {
//   double initX = 0.0;
//   Widget build(){
//
//     return DataTable(
//       columnSpacing: 0,
//       horizontalMargin: 0,
//       dataRowMaxHeight: double.infinity,
//       headingRowHeight: 50,
//       dividerThickness: null,//conf.borderSize,
//      // border: TableBorder.all(color:conf.borderColor),
//       columns: List.generate(conf.columnList.length, (index) {
//         return DataColumn(
//           label: Stack(
//             children: [
//               BuildDataColumn().build(conf.columnList[index], index, (conf.columnList.length - 1)),
//               Positioned(
//                 right: 0,
//                 child: Builder(
//                     builder: (subContext) {
//                       ValueNotifier<double> width = conf.columnList[index].notifyColumnWith;
//                       return MouseRegion(
//                         // onHover: (event) {
//                         //   tab.setHover(true);
//                         // },
//                         // onExit: (event) {
//                         //   tab.setHover(false);
//                         // },
//                         cursor: SystemMouseCursors.cell,
//                         child: GestureDetector(
//                           onPanStart: (details) {
//                             initX = details.globalPosition.dx;
//                            // conf.columnList[index].initX = details.globalPosition.dx;
//                           },
//                           onPanUpdate: (details) {
//                             final increment = details.globalPosition.dx -  initX;
//                            // final increment = details.globalPosition.dx -  conf.columnList[index].initX;
//                             final newWidth =  width.reactiveValue(subContext) + increment;
//                             initX = details.globalPosition.dx;
//                            // conf.columnList[index].initX = details.globalPosition.dx;
//                             conf.columnList[index].updateCollWidth(newWidth > conf.colMinWidth ? newWidth : conf.colMinWidth);
//
//                           },
//                           child: Container(
//                             alignment: Alignment.centerRight,
//                             width: 5,
//                             height: 50,
//                            decoration: const BoxDecoration(),
//                            child: Container(width: conf.borderSize,height: conf.colHeight,decoration: BoxDecoration(color:conf.borderColor),),
//
//                            // child: tab.resizeHover.reactiveValue(subContext)?Icon(Icons.add,):Container(color: Colors.transparent,),
//                           )
//                         ),
//                       );
//                     }
//                 ),
//               )
//             ],
//           ),
//         );
//       }),
//       rows: List.generate(
//         conf.rowList.length,
//             (index) => BuildRow().build(conf.rowList[index], index),
//       ),);
//   }
// }
