import 'package:flutter/cupertino.dart';

typedef Formatter =String Function(String value);
typedef OnTap = Function(Map<String,dynamic> rowData);
typedef ChangePage = void Function(int index);

class ColumnInfo {
  Widget columnHeader;
  ColumnType type;
  ValueNotifier<double>? columWidth;
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
    double? columWidth,
    this.selectedCol = false,
    this.formatter,
    this.onTap,
    this.initX =0,
  }){
    this.columWidth = ValueNotifier(columWidth??100.0);
  }

  void setCollWidth(double width) {
    columWidth!.value = width;
//    columWidth!.notifyChanged();
  }

}

enum ColumnType {
  sl,
  string,
  editText,
  icon,
  image,
  bool,
}
