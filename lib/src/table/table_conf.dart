
import 'package:flutter/material.dart';
import 'package:reactive_datatable_a/src/table/calculate_cellsize.dart';

import '../../reactive_datatable_a.dart';

class TableConf {

  static TableConf? _instance;

  TableConf._();

  static TableConf init() {
    return _instance ??= TableConf._();
  }

  static dispose(){
    _instance=null;
  }

  ///Screen Width
  double _screenWidth = 0.0;

  double get screenWidth => _screenWidth;

  void setScreenWidth(double width) {
    _screenWidth = width;
    CalculateCellSize().calculateColumnSize();
   // _screenWidth.notifyChanged();
  }



  ///table item
  List<Map<String, dynamic>> _rowList = [];

  List<Map<String, dynamic>> get rowList => _rowList;

  void setRowList(List<Map<String, dynamic>> rowList) {
    _rowList = rowList;
  }

  List<ColumnInfo> _columnList = [];

  List<ColumnInfo> get columnList => _columnList;

  void setColumnList(List<ColumnInfo> colList) {
    _columnList = colList;
  }

  // ///Table padding
  // EdgeInsets _padding = EdgeInsets.zero;
  //
  // EdgeInsets get padding => _padding;
  //
  // void setPadding(EdgeInsets padding) {
  //   _padding = padding;
  // }

  ///Table height and witdh control
  double _colHeight = 50;

  double get colHeight => _colHeight;

  void setColMinHeight(double height) {
    _colHeight = height;
  }

  double _colMinWidth  = 30;

  double get colMinWidth => _colMinWidth;

  void setColMinWidth(double width) {
    if(width >0.0)_colMinWidth = width;
  }

  double _colMaxWidth  = 100;

  double get colMaxWidth => _colMaxWidth;

  void setColMaxWidth(double width) {
    _colMaxWidth = width;
  }

  double _colMaxHeight = 50;

  double get colMaxHeight => _colMaxHeight;

  void setColMaxHeight(double height) {
    _colMaxHeight = height;
  }

  double _rowMinHeight = 50;

  double get rowMinHeight => _rowMinHeight;

  void setRowMinHeight(double height) {
    if(height>0.0)_rowMinHeight = height;
  }

  double _rowMinWidth  = 100;

  double get rowMinWidth => _rowMinWidth;

  void setRowMinWidth(double width) {
    _rowMinWidth = width;
  }

  double _rowMaxWidth  = 100;

  double get rowMaxWidth => _rowMaxWidth;

  void setRowMaxWidth(double width) {
    _rowMaxWidth = width;
  }
  double _rowMaxHeight = 50;

  double get rowMaxHeight => _rowMaxHeight;

  void setRowMaxHeight(double height) {
    _rowMaxHeight = height;
  }

  ///Table color control
  Color _textColor = Colors.white12;

  Color get textColor => _textColor;

  void setTextColor(Color color) {
    _textColor = color;
  }

  Color _borderColor = Colors.black54;

  Color get borderColor => _borderColor;

  void setBorderColor(Color? color) {
    if(color != null)_borderColor = color;
  }

  double _textSize = 12.0;

  double get textSize => _textSize;

  void setTextSize(double textSize) {
    _textSize = textSize;
  }

  double _borderSize = 1;

  double get borderSize => _borderSize;

  void setBorderSize(double borderSize) {
   if(borderSize != 0.0) _borderSize = borderSize;
  }

  bool _slNo = true;

  bool get slNoColumnShowOrNot => _slNo;

  void setSlNoColumnShowOrNot(bool slNo) {
    _slNo = slNo;
  }


  final ValueNotifier<bool> _resizeHover = ValueNotifier(false);

  ValueNotifier<bool> get resizeHover => _resizeHover;

  void setHover(bool value) {
    _resizeHover.value= value;
    _resizeHover.notifyChanged();
  }



}

