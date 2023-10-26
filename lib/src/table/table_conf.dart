
import 'package:flutter/material.dart';
import 'package:reactive_datatable_a/src/notify/reactive_notifyer.dart';

class TableConf {

   static TableConf? _instance;

   TableConf._();

   static TableConf init() {
     return _instance ??= TableConf._();
   }

   ///Table height and witdh control
  double colMinHeight = 50;
  double colMinWidth  = 100;
  double colMaxWidth  = 100;
  double colMaxHeight = 50;

  double rowMinHeight = 50;
  double rowMinWidth  = 100;
  double rowMaxWidth  = 100;
  double rowMaxHeight = 50;

  ///Table color control
   Color textColor = Colors.white12;
   Color borderColor = Colors.white12;
   double textSize = 12.0;
   double borderSize = 1;


  bool slNo = true;

  final ValueNotifier<bool> _resizeHover = ValueNotifier(false);

  ValueNotifier<bool> get resizeHover => _resizeHover;

  void setHover(bool value) {
    _resizeHover.value= value;
    _resizeHover.notifyChanged();
  }



}

