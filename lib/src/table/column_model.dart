import 'package:flutter/cupertino.dart';
import 'package:reactive_datatable_a/reactive_datatable_a.dart';

typedef Formatter =String Function(String value);
typedef OnTap = Function(Map<String,dynamic> rowData);
typedef ChangePage = void Function(int index);

class ColumnInfo {
  Widget columnHeader;
  ColumnType type;
  ValueNotifier<double>? _notifyColumnWith;
  double? columWidth;
  double columHeight;
  Color? backgroundColor;
  bool selectedCol;
  Color textColor;
  String rowName;
  OnTap? onTap;
  Formatter? formatter;
  double initX;

  ColumnInfo({
    required this.columnHeader,
    required this.type,
    this.backgroundColor,
    required this.rowName,
    required this.textColor,
    this.columHeight =50,
    this.columWidth,
    this.selectedCol = false,
    this.formatter,
    this.onTap,
    this.initX =0,
  }){
    _notifyColumnWith = ValueNotifier(columWidth??0.0);
  }

  void setCollWidth(double width) {
    _notifyColumnWith = ValueNotifier(width);
   // _notifyColumnWith!.notifyChanged();
  }

  void updateCollWidth(double width) {
    _notifyColumnWith!.value = width;
    // _notifyColumnWith!.notifyChanged();
  }

  ValueNotifier<double> get notifyColumnWith => _notifyColumnWith!;


}

enum ColumnType {
  sl,
  string,
  editText,
  icon,
  image,
  bool,
}
