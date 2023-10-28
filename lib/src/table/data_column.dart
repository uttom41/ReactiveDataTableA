
import 'package:flutter/material.dart';
import 'package:reactive_datatable_a/src/table/table_conf.dart';

import '../../reactive_datatable_a.dart';

class BuildDataColumn {

  Widget build(ColumnInfo columnInfo, int colIndex,int length) {
    TableConf conf = TableConf.init();
      return Builder(
          builder: (subContext) {
            return Container(
              width: columnInfo.notifyColumnWith.reactiveValue(subContext),
              height: columnInfo.columHeight, //parent.headerHeight,
              alignment: Alignment.center,
              constraints: BoxConstraints(minWidth: columnInfo.type==ColumnType.sl?5:conf.colMinWidth,maxWidth: columnInfo.notifyColumnWith.reactiveValue(subContext)),
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                      width: conf.borderSize,
                      color: conf.borderColor
                  ),
                  top: BorderSide(
                      width: conf.borderSize,
                      color: conf.borderColor
                  ),
                  bottom: BorderSide(
                      width: conf.borderSize,
                      color: conf.borderColor
                  ),
                  left: BorderSide(
                      width: colIndex==0?conf.borderSize:0,
                      color: colIndex==0?conf.borderColor:Colors.transparent
                  ),
                ),
              ),
              child: Container(
                alignment: Alignment.center,
                child: columnInfo.columnHeader,
              ),
            );
          }
      );
  }

}