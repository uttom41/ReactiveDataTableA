import 'package:flutter/material.dart';
//import 'package:reactive_datatable_a/reactive_datatable_a.dart';

typedef Formatter =String Function(String value);
typedef OnTap = Function(Map<String,dynamic> rowData);
typedef ChangePage = void Function(int index);

class NotyWidth {
  ValueNotifier<double> notifyColumnWith = ValueNotifier(0.0);
}

@immutable
class DataColumnA extends DataColumn {
  final ColumnType type;
  final NotyWidth _notyWidth = NotyWidth();
  final double? columWidth;
  final double? columHeight;
  final Color? backgroundColor;
  final bool selectedCol;
  final TextStyle textStyle;
  final String rowName;
  final OnTap? onTap;
  final Formatter? formatter;

  DataColumnA({
    required super.label,
    required this.type,
    this.backgroundColor,
    required this.rowName,
    this.textStyle = const TextStyle(color: Colors.black54,fontSize: 14),
    this.columHeight = 50,
    this.columWidth,
    this.selectedCol = false,
    this.formatter,
    this.onTap,
    super.tooltip,
    super.mouseCursor,
    super.numeric,
    super.onSort
  });

  void setCollWidth(double width) {
    _notyWidth.notifyColumnWith =  ValueNotifier(width);
  //  _notifyColumnWith.notifyChanged();
  }

  void updateCollWidth(double width) {
    _notyWidth.notifyColumnWith.value = width;
    // _notifyColumnWith!.notifyChanged();
  }

  ValueNotifier<double> get notifyColumnWith => _notyWidth.notifyColumnWith;

}

enum ColumnType {
  sl,
  string,
  editText,
  icon,
  image,
  checkBox,
  action
}
