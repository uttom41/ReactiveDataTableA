
import 'package:flutter/material.dart';
import '../../reactive_datatable_a.dart';

abstract class TableProperty {

  ///Screen Width
  double _screenWidth = 0.0;

  ///get parent screen width
  double get getScreenWidth => _screenWidth;

  ///set parent screen width
  void setScreenWidth(double width) {
    _screenWidth = width;
    _calculateColumnSize();
  }


  ///table row list
  List<Map<String, dynamic>> _rowList = [];

  ///get table row list
  List<Map<String, dynamic>> get getRowList => _rowList;

  ///set table row list
  void setRowList(List<Map<String, dynamic>> rowList) {
    _rowList = rowList;
  }

  ///table column list
  List<DataColumnA> _columnList = [];

  ///get table column list
  List<DataColumnA> get getColumnList => _columnList;

  ///set table column list
  void setColumnList(List<DataColumnA> colList) {
    _columnList = colList;
  }

  ///table header background color
  Color _headerBackgroundColor = Colors.white;

  ///set table header background color
  void setHeaderBG(Color? color) {
    _headerBackgroundColor = color?? Colors.white;
  }

  ///get table header background color
  Color get getHeaderBG => _headerBackgroundColor;

  bool _tableColumnWidthResize = true;

  bool get getTableColWithResize => _tableColumnWidthResize;

  void setTableColumnWidthResize(bool reSize) {
    _tableColumnWidthResize = reSize;
  }

  // ///Table padding
  // EdgeInsets _padding = EdgeInsets.zero;
  //
  // EdgeInsets get padding => _padding;
  //
  // void setPadding(EdgeInsets padding) {
  //   _padding = padding;
  // }

  ///Table height and width control
  ///
  double _colHeight = 50;

  double get getColHeight => _colHeight;

  void setColMinHeight(double height) {
    _colHeight = height;
  }

  double _colMinWidth  = 30;

  double get getColMinWidth => _colMinWidth;

  void setColMinWidth(double width) {
    if(width >0.0)_colMinWidth = width;
  }

  double _colMaxWidth  = 100;

  double get getColMaxWidth => _colMaxWidth;

  void setColMaxWidth(double width) {
    _colMaxWidth = width;
  }

  double _colMaxHeight = 50;

  double get getColMaxHeight => _colMaxHeight;

  void setColMaxHeight(double height) {
    _colMaxHeight = height;
  }

  double _rowMinHeight = 50;

  double get getRowMinHeight => _rowMinHeight;

  void setRowMinHeight(double height) {
    if(height>0.0)_rowMinHeight = height;
  }

  double _rowMinWidth  = 100;

  double get getRowMinWidth => _rowMinWidth;

  void setRowMinWidth(double width) {
    _rowMinWidth = width;
  }

  double _rowMaxWidth  = 100;

  double get getRowMaxWidth => _rowMaxWidth;

  void setRowMaxWidth(double width) {
    _rowMaxWidth = width;
  }
  double _rowMaxHeight = 50;

  double get getRowMaxHeight => _rowMaxHeight;

  void setRowMaxHeight(double height) {
    _rowMaxHeight = height;
  }

  ///Table color control
  Color _textColor = Colors.white12;

  Color get getTextColor => _textColor;

  void setTextColor(Color color) {
    _textColor = color;
  }

  Color _borderColor = Colors.black54;

  Color get getBorderColor => _borderColor;

  void setBorderColor(Color? color) {
    if(color != null)_borderColor = color;
  }

  double _textSize = 12.0;

  double get getTextSize => _textSize;

  void setTextSize(double textSize) {
    _textSize = textSize;
  }

  double _borderSize = 1;

  double get getBorderSize => _borderSize;

  void setBorderSize(double borderSize) {
   if(borderSize != 0.0) _borderSize = borderSize;
  }

  bool _slNo = true;

  bool get getSlNoColumnShowOrNot => _slNo;

  void setSlNoColumnShowOrNot(bool slNo) {
    _slNo = slNo;
  }


  final ValueNotifier<bool> _resizeHover = ValueNotifier(false);

  ValueNotifier<bool> get getResizeHover => _resizeHover;

  void setHover(bool value) {
    _resizeHover.value= value;
    _resizeHover.notifyChanged();
  }

  bool _headerFixedTop = true;

  void setHeaderFixedTop(bool? value) {
    _headerFixedTop = value??true;
  }

  bool get getHeaderFixedTop => _headerFixedTop;

  final List<Widget> _headerWidget = [];

  Widget getHeaderWidget(int index) => _headerWidget[index];

  void setHeaderWidget(Widget child) {
    _headerWidget.add(child);
  }



  void _calculateColumnSize() {
    int totalCelCount =0;

    for(DataColumnA  cel in _columnList) {
      if(cel.type == ColumnType.sl && cel.columWidth== null){
        cel.setCollWidth(30);
        _screenWidth -=30;
      } else if(cel.columWidth != null && cel.columWidth != 0.0) {
        _screenWidth -= cel.columWidth!;
      } else {
        totalCelCount++;
      }
    }

    if(_screenWidth > 0){
      for(DataColumnA cel in _columnList) {
        double cellWidth = _screenWidth / totalCelCount; ///single cell size without padding
        if(cel.notifyColumnWith.value == 0.0 || (cel.type != ColumnType.sl && cel.notifyColumnWith.value != cellWidth)){
          cel.setCollWidth(cellWidth>getColMinWidth?cellWidth:getColMinWidth);
        }
      }
    }

  }

}

