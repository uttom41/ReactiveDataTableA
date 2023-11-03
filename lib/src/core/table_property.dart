import 'package:flutter/material.dart';
import 'package:reactive_datatable_a/src/core/index.dart';

import '../../reactive_datatable_a.dart';

mixin MTableProperty on TableProperty {


  List<Widget> tableHeader() {
    List<Widget> h = [];

    for(int columnIndex = 0; columnIndex < getColumnList.length;columnIndex ++) {
      DataColumnA columnA = getColumnList[columnIndex];

      Widget child = Builder(
        builder: (subContext) {
          return Stack(
            children: [
              Container(
                width: columnA.notifyColumnWith.reactiveValue(subContext),
                height: columnA.columHeight,
                alignment: Alignment.center,
                constraints: BoxConstraints(minWidth: columnA.type==ColumnType.sl?5:getColMinWidth,maxWidth: columnA.notifyColumnWith.reactiveValue(subContext)),
                decoration: BoxDecoration(
                  color: getHeaderBG,
                  border: Border(
                    right: BorderSide(
                        width: getBorderSize,
                        color: getBorderColor
                    ),
                    top: BorderSide(
                        width: getBorderSize,
                        color: getBorderColor
                    ),
                    bottom: BorderSide(
                        width: getBorderSize,
                        color: getBorderColor
                    ),
                    left: BorderSide(
                        width: columnIndex==0?getBorderSize:0,
                        color: columnIndex==0?getBorderColor:Colors.transparent
                    ),
                  ),
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: AnimatedDefaultTextStyle(
                      style: columnA.textStyle,
                      softWrap: false,
                      duration: const Duration(milliseconds: 150),
                      child: columnA.label
                  ),
                ),
              ),
              _reSizeWidget(columnIndex)
            ],
          );
        }
    );

    if(columnA.tooltip != null) {
      child = Tooltip(
        message: columnA.tooltip,
        child: child,
      );
    }

     h.add(child);

    }


    return h;
  }
  double initX = 0.0;

  Widget _reSizeWidget(int index) {

    return Positioned(
      right: 0,
      child: Builder(
          builder: (subContext) {
            ValueNotifier<double> width = getColumnList[index].notifyColumnWith;
            return MouseRegion(
              // onHover: (event) {
              //   tab.setHover(true);
              // },
              // onExit: (event) {
              //   tab.setHover(false);
              // },
              cursor: SystemMouseCursors.cell,
              child: GestureDetector(
                  onPanStart: (details) {
                    initX = details.globalPosition.dx;
                    // conf.columnList[index].initX = details.globalPosition.dx;
                  },
                  onPanUpdate: (details) {
                    final increment = details.globalPosition.dx -  initX;
                    // final increment = details.globalPosition.dx -  conf.columnList[index].initX;
                    final newWidth =  width.reactiveValue(subContext) + increment;
                    initX = details.globalPosition.dx;
                    // conf.columnList[index].initX = details.globalPosition.dx;
                    getColumnList[index].updateCollWidth(newWidth > getColMinWidth ? newWidth : getColMinWidth);

                  },
                  child: Container(
                    alignment: Alignment.centerRight,
                    width: 5,
                    height: 50,
                    decoration: const BoxDecoration(),
                    child: Container(width: getBorderSize,height: getColHeight,decoration: BoxDecoration(color:getBorderColor),),

                    // child: tab.resizeHover.reactiveValue(subContext)?Icon(Icons.add,):Container(color: Colors.transparent,),
                  )
              ),
            );
          }
      ),
    );
  }


}
