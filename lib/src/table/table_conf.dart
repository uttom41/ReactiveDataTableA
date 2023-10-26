
import 'package:flutter/material.dart';
import 'package:reactive_datatable_a/src/notify/reactive_notifyer.dart';

class TableConf {

  static TableConf? _instance;

  TableConf._();

  static TableConf init() {
    return _instance ??= TableConf._();
  }

  static dispose(){
    _instance=null;
  }

  ///Table height and witdh control
  double _colMinHeight = 50;

  double get colMinHeight => _colMinHeight;

  void setColMinHeight(double height) {
    _colMinHeight = height;
  }

  double _colMinWidth  = 100;

  double get colMinWidth => _colMinWidth;

  void setColMinWidth(double width) {
    _colMinWidth = width;
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
    _rowMinHeight = height;
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

  Color _borderColor = Colors.white12;

  Color get borderColor => _borderColor;

  void setBorderColor(Color color) {
    _borderColor = color;
  }

  double _textSize = 12.0;

  double get textSize => _textSize;

  void setTextSize(double textSize) {
    _textSize = textSize;
  }

  double _borderSize = 1;

  double get borderSize => _borderSize;

  void setBorderSize(double borderSize) {
    _borderSize = borderSize;
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

