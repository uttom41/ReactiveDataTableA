

import 'package:flutter/material.dart';
import 'package:reactive_datatable_a/src/notify/reactive_notifyer.dart';
import 'package:reactive_datatable_a/src/table/calculate_cellsize.dart';
import 'package:reactive_datatable_a/src/table/table_conf.dart';

class BuildRow {

  DataRow build(Map<String, dynamic> rowData,int rowIndex) {
    CalculateCellSize().calculateRowSize(rowIndex);
    return DataRow(
      cells: buildCell(rowData,rowIndex),
    );
  }

  List<DataCell> buildCell (Map<String, dynamic> rowData,int rowIndex) {
    TableConf conf = TableConf.init();
    double rowHeight =rowData["height"].value??conf.rowMaxHeight;
    return List.generate(conf.columnList.length, (index) {
      return DataCell(
        Builder(
            builder: (subContext) {
              ValueNotifier<String?>? valueNotifier = rowData[conf.columnList[index].rowName];
              return Container(
                  width: conf.columnList[index].notifyColumnWith.reactiveValue(subContext),
                  height: rowHeight+16,
                  padding: const EdgeInsets.all(8),
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
                          width: index==0?conf.borderSize:0,
                          color: index==0?conf.borderColor:Colors.transparent
                      ),
                    ),
                    color:(conf.columnList[index].backgroundColor!=null)?conf.columnList[index].backgroundColor!:Colors.transparent,

                  ),
                  child: Text(valueNotifier?.reactiveValue(subContext)??"${rowIndex+1}",style:conf.columnList[index].textStyle)
              );
            }
        ),
      );
    }
    );
  }
}