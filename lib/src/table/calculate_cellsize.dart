

import 'package:flutter/material.dart';

import '../../reactive_datatable_a.dart';

class CalculateCellSize{

  final List<ColumnInfo> columData;
  final BuildContext context;

  CalculateCellSize({required this.columData,required this.context});

  void calculateSize() {
    Size mediaSize = MediaQuery.of(context).size;
    double cellWidth = mediaSize.width / columData.length;
    double extraWidth = ((cellWidth-30)/(columData.length-1)) + cellWidth;

    for(ColumnInfo  cel in columData) {
      cel.setCollWidth(extraWidth);
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