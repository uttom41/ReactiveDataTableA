

import 'package:flutter/material.dart';
import 'package:reactive_datatable_a/src/table/table_conf.dart';

import '../../reactive_datatable_a.dart';

class CalculateCellSize{

  void calculateColumnSize() {

    TableConf conf = TableConf.init();

   // double extraWidth = ((cellWidth-30)/(conf.columnList.length-1)) + cellWidth;
    double currentWidth = conf.screenWidth; /// total width.
    int totalCelCount =0;

    for(ColumnInfo  cel in conf.columnList) {
      if(cel.type == ColumnType.sl && cel.columWidth==0.0){
        cel.setCollWidth(30);
        currentWidth -=30;
      } else if(cel.columWidth != null && cel.columWidth != 0.0) {
        currentWidth -= cel.columWidth!;
      } else {
        totalCelCount++;
      }
    }
    if(currentWidth > 0){
      for(ColumnInfo cel in conf.columnList) {
        double cellWidth = currentWidth / totalCelCount; ///single cell size without padding
        if(cel.notifyColumnWith.value == 0.0 || (cel.type != ColumnType.sl && cel.notifyColumnWith.value != cellWidth)){
          cel.setCollWidth(cellWidth>conf.colMinWidth?cellWidth:conf.colMinWidth);
        }
      }
    }

    // for (ColumnInfo cell in parent.columData) {
    //  // Size size = _textSize(cell.rowName, TextStyle(fontSize: 14, fontFamily: parent.theme.fonts));
    //  // cell.columWidth = (parent.maxWidth>(size.width + 50.0))?(size.width + 50.0):parent.maxWidth;
    //  // cell.columHeight= cell.columHeight > size.height?cell.columHeight:size.height;
    //   if (parent.dataSource.isNotEmpty) {
    //     for (Map<String, dynamic> rowItem in parent.dataSource) {
    //      // if (cell.iconStatus == null) {
    //         String text = rowItem[cell.rowName].value;
    //         if (cell.formatter != null) {
    //           text = cell.formatter!(rowItem[cell.name]);
    //         }
    //         Size size = _textSize(text, TextStyle(fontSize: 14, fontFamily: parent.theme.fonts));
    //         if (cell.columWidth < (size.width + 60.0)) {
    //           cell.columWidth = (size.width + 50.0);
    //         }
    //         cell.columHeight= cell.columHeight > size.height?cell.columHeight:size.height;
    //     //  }
    //     }
    //   }
    // }

  }

  Size _textSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),maxLines: 6, textDirection: TextDirection.ltr)
      ..layout(minWidth: 100, maxWidth: 100);/////////maxWidth
    return textPainter.size;
  }
}