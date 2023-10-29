
import 'package:flutter/material.dart';
import 'package:reactive_datatable_a/src/table/table_conf.dart';

import '../../reactive_datatable_a.dart';

class CalculateCellSize{

  void calculateColumnSize() {

    TableConf conf = TableConf.init();

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

  }

  void calculateRowSize(int rowIndex) {
    TableConf conf = TableConf.init();

    double rowHeight = 0.0;

    for (ColumnInfo cell in conf.columnList) {
      // Size size = _textSize(cell.rowName, TextStyle(fontSize: 14, fontFamily: parent.theme.fonts));
      // cell.columWidth = (parent.maxWidth>(size.width + 50.0))?(size.width + 50.0):parent.maxWidth;
      // cell.columHeight= cell.columHeight > size.height?cell.columHeight:size.height;

      if (cell.type == ColumnType.string) {
        String text = conf.rowList[rowIndex][cell.rowName]?.value;

        if (cell.formatter != null) {
          text = cell.formatter!(conf.rowList[rowIndex][cell.rowName] as String);
        }

        Size size = _textSize(text, cell.textStyle,conf.colMinWidth,(cell.notifyColumnWith.value-16));
        int line = (size.width/(cell.notifyColumnWith.value-16)).round()+2;
        if(rowHeight<size.height)rowHeight = size.height*line;
      }
    }

    conf.rowList[rowIndex]["height"] = ValueNotifier<double>(rowHeight > conf.rowMinHeight? rowHeight:conf.rowMinHeight);

  }

  Size _textSize(String text, TextStyle style,double minWidth, double maxWidth) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),maxLines: 1, textDirection: TextDirection.ltr)
      ..layout();/////////maxWidth
    return textPainter.size;
  }
}