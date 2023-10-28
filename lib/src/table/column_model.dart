import 'package:flutter/material.dart';
import 'package:reactive_datatable_a/reactive_datatable_a.dart';

typedef Formatter =String Function(String value);
typedef OnTap = Function(Map<String,dynamic> rowData);
typedef ChangePage = void Function(int index);

class ColumnInfo {
  Widget columnHeader;
  ColumnType type;
  ValueNotifier<double>? _notifyColumnWith;
 // ValueNotifier<double>? _notifyRowHeight;
  double? columWidth;
  double? columHeight;
  Color? backgroundColor;
  bool selectedCol;
  TextStyle textStyle;
  String rowName;
  OnTap? onTap;
  Formatter? formatter;
  double initX;

  ColumnInfo({
    required this.columnHeader,
    required this.type,
    this.backgroundColor,
    required this.rowName,
    this.textStyle = const TextStyle(color: Colors.black54,fontSize: 14),
    this.columHeight,
    this.columWidth,
    this.selectedCol = false,
    this.formatter,
    this.onTap,
    this.initX =0,
  }){
    _notifyColumnWith = ValueNotifier(columWidth??0.0);
  //  _notifyRowHeight = ValueNotifier(columHeight??0.0);
  }

  void setCollWidth(double width) {
    _notifyColumnWith = ValueNotifier(width);
   // _notifyColumnWith!.notifyChanged();
  }

  // void setRowHeight(double width) {
  //   _notifyRowHeight = ValueNotifier(width);
  // }

  void updateCollWidth(double width) {
    _notifyColumnWith!.value = width;
    // _notifyColumnWith!.notifyChanged();
  }

  ValueNotifier<double> get notifyColumnWith => _notifyColumnWith!;

//  ValueNotifier<double> get notifyRowHeight => _notifyRowHeight!;


}

enum ColumnType {
  sl,
  string,
  editText,
  icon,
  image,
  checkBox,
  button
}
