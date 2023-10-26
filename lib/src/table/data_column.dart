
import 'package:flutter/material.dart';
import 'package:reactive_datatable_a/src/notify/reactive_notifyer.dart';

import '../../reactive_datatable_a.dart';

class BuildDataColumn {
  final List<Map<String, ValueNotifier>> dataSource;
  final List<ColumnInfo> columData;
  BuildDataColumn({required this.columData,required this.dataSource});

 Widget build(ColumnInfo conf, int colIndex,int length) {
    if(conf.type == ColumnType.sl){
      return Container(
        width: 30,
        height: conf.columHeight, //parent.headerHeight,
        alignment: Alignment.center,
        constraints:  const BoxConstraints(minWidth: 30),
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
                width: 1.0,
                color: (colIndex != length)
                    ? Colors.white38
                    : Colors.transparent),
          ),
        ),
        child: Container(
          color: Colors.white38,
          padding: const EdgeInsets.only(left: 10.0, right: 15.0),
          alignment: Alignment.center,
          child: conf.columnHeader,
        ),
      );
    } else {
      return Builder(
        builder: (subContext) {
          return Container(
          width: conf.columWidth!.reactiveValue(subContext),
          height: conf.columHeight, //parent.headerHeight,
          alignment: Alignment.center,
          constraints:  const BoxConstraints(minWidth: 100),
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(
                  width: 1.0,
                  color: (colIndex != length)
                      ? Colors.white38
                      : Colors.transparent),
            ),
          ),
          child: Container(
            color: Colors.white38,
           // padding: const EdgeInsets.only(left: 10.0, right: 15.0),
            alignment: Alignment.center,
            child: conf.columnHeader,
          ),
    );
        }
      );
    }
 }

}