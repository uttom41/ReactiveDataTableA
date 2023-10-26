

import 'package:flutter/material.dart';
import 'package:reactive_datatable_a/src/notify/reactive_notifyer.dart';

import '../../reactive_datatable_a.dart';

class BuildRow {
  final List<Map<String, ValueNotifier>> dataSource;
  final List<ColumnInfo> columData;

  BuildRow({required this.columData,required this.dataSource});

  DataRow build(Map<String, dynamic> rowData,int rowIndex) {
    return DataRow(
        cells: buildCell(rowData,rowIndex),
    );
  }
  
  List<DataCell> buildCell (Map<String, dynamic> rowData,int rowIndex) {
    return List.generate(columData.length, (index) => DataCell(
    Builder(
      builder: (subContext) {
        ValueNotifier<String?>? valueNotifier = rowData[columData[index].rowName];
        return ConstrainedBox(
          constraints: BoxConstraints(
              maxWidth: columData[index].columWidth!.reactiveValue(subContext),minHeight: 50,minWidth: index==0?30:100,
          ),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border:  Border.all(color: Colors.white38),
              color:(columData[index].backgroundColor!=null)?columData[index].backgroundColor!:Colors.transparent,

            ),
              child: Text(valueNotifier?.reactiveValue(subContext)??"${rowIndex+1}",style:TextStyle(color:columData[index].textColor,))
          ),
        );
      }
    ),
    )
    );
  }
}