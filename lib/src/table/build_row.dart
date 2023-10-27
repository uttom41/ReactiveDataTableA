

import 'package:flutter/material.dart';
import 'package:reactive_datatable_a/src/notify/reactive_notifyer.dart';
import 'package:reactive_datatable_a/src/table/table_conf.dart';

class BuildRow {

  DataRow build(Map<String, dynamic> rowData,int rowIndex) {
    return DataRow(
        cells: buildCell(rowData,rowIndex),
    );
  }
  
  List<DataCell> buildCell (Map<String, dynamic> rowData,int rowIndex) {
    TableConf conf = TableConf.init();
    return List.generate(conf.columnList.length, (index) => DataCell(
    Builder(
      builder: (subContext) {
        ValueNotifier<String?>? valueNotifier = rowData[conf.columnList[index].rowName];
        return ConstrainedBox(
          constraints: BoxConstraints(
              maxWidth: conf.columnList[index].notifyColumnWith.reactiveValue(subContext),minHeight: conf.rowMinHeight,minWidth: conf.colMinWidth,
          ),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                    width: conf.borderSize,
                    color: conf.borderColor
                ),
                // top: BorderSide(
                //     width: conf.borderSize,
                //     color: conf.borderColor
                // ),
                bottom: BorderSide(
                    width: conf.borderSize,
                    color: conf.borderColor
                ),
                left: BorderSide(
                    width: conf.borderSize,
                    color: index==0?conf.borderColor:Colors.transparent
                ),
              ),
              color:(conf.columnList[index].backgroundColor!=null)?conf.columnList[index].backgroundColor!:Colors.transparent,

            ),
              child: Text(valueNotifier?.reactiveValue(subContext)??"${rowIndex+1}",style:TextStyle(color:conf.columnList[index].textColor,))
          ),
        );
      }
    ),
    )
    );
  }
}