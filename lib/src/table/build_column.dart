//
// import 'package:flutter/material.dart';
// import '../../reactive_datatable_a.dart';
//
// class BuildDataColumn {
//
//   Widget build(DataColumnA columnInfo, int colIndex,int length) {
//
//     Widget child = Builder(
//         builder: (subContext) {
//           return Container(
//             width: columnInfo.notifyColumnWith.reactiveValue(subContext),
//             height: columnInfo.columHeight,
//             alignment: Alignment.center,
//             constraints: BoxConstraints(minWidth: columnInfo.type==ColumnType.sl?5:conf.colMinWidth,maxWidth: columnInfo.notifyColumnWith.reactiveValue(subContext)),
//             decoration: BoxDecoration(
//               color: conf.headerBG,
//               border: Border(
//                 right: BorderSide(
//                     width: conf.borderSize,
//                     color: conf.borderColor
//                 ),
//                 top: BorderSide(
//                     width: conf.borderSize,
//                     color: conf.borderColor
//                 ),
//                 bottom: BorderSide(
//                     width: conf.borderSize,
//                     color: conf.borderColor
//                 ),
//                 left: BorderSide(
//                     width: colIndex==0?conf.borderSize:0,
//                     color: colIndex==0?conf.borderColor:Colors.transparent
//                 ),
//               ),
//             ),
//             child: Container(
//               alignment: Alignment.center,
//               child: AnimatedDefaultTextStyle(
//                   style: columnInfo.textStyle,
//                   softWrap: false,
//                   duration: const Duration(milliseconds: 150),
//                   child: columnInfo.label
//               ),
//             ),
//           );
//         }
//     );
//
//     if(columnInfo.tooltip != null) {
//       child = Tooltip(
//         message: columnInfo.tooltip,
//         child: child,
//       );
//     }
//
//     return child;
//   }
//
// }