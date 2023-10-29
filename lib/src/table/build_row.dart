

import 'package:flutter/material.dart';
import 'package:reactive_datatable_a/reactive_datatable_a.dart';
import 'package:reactive_datatable_a/src/table/calculate_cellsize.dart';
import 'package:reactive_datatable_a/src/table/table_conf.dart';

import '../field/text_field.dart';

class BuildRow {

  DataRow build(Map<String,  dynamic> rowData,int rowIndex) {
    CalculateCellSize().calculateRowSize(rowIndex);
    return DataRow(
      cells: buildCell(rowData,rowIndex),
    );
  }

  List<DataCell> buildCell (Map<String, dynamic> rowData,int rowIndex) {
    TableConf conf = TableConf.init();
    double rowHeight =rowData["height"]??conf.rowMaxHeight;
    return List.generate(conf.columnList.length, (index) {
      Widget cellWidget = Container();
      if(rowData[conf.columnList[index].rowName] is ValueNotifier) {
        cellWidget = Builder(
            builder: (subContext) {
              ValueNotifier<String?>? valueNotifier = rowData[conf.columnList[index].rowName];
              Widget widget = Container();
              if(conf.columnList[index].type == ColumnType.sl || ColumnType.string ==conf.columnList[index].type) {
                widget = Text(valueNotifier?.reactiveValue(subContext)??"${rowIndex+1}",style:conf.columnList[index].textStyle);
              } else if (conf.columnList[index].type == ColumnType.editText) {
                widget = CustomTextField(
                    onChanged:(String? value) {
                      valueNotifier?.value = value;

                    }
                );
              } else if(conf.columnList[index].type == ColumnType.action) {
                widget = InkWell(
                  onTap: (){

                  },
                  child: Container(color: Colors.teal,width: double.infinity,height: double.infinity,),
                );
              }
              return Container(
                  width: conf.columnList[index].notifyColumnWith.reactiveValue(subContext),
                  height: rowHeight+16,
                  // padding: const EdgeInsets.all(8),
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
                  child: widget
              );
            }
        );
      } else {
        cellWidget = Builder(
            builder: (subContext) {
              dynamic value = rowData[conf.columnList[index].rowName];
              Widget widget = Container();
              if(conf.columnList[index].type == ColumnType.sl || ColumnType.string ==conf.columnList[index].type) {
                widget = Text(value??"${rowIndex+1}",style:conf.columnList[index].textStyle);
              } else if (conf.columnList[index].type == ColumnType.editText) {
                widget = CustomTextField(
                    onChanged:(String? value) {
                     // valueNotifier?.value = value;

                    }
                );
              } else if(conf.columnList[index].type == ColumnType.action) {
                widget = InkWell(
                  onTap: (){

                  },
                  child: Container(color: Colors.teal,width: double.infinity,height: double.infinity,),
                );
              }
              return Container(
                  width: conf.columnList[index].notifyColumnWith.reactiveValue(subContext),
                  height: rowHeight+16,
                  // padding: const EdgeInsets.all(8),
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
                  child: widget
              );
            }
        );
      }
      return DataCell(cellWidget);
    });
  }
}