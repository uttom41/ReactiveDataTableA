
import 'package:flutter/material.dart';
import 'package:reactive_datatable_a/src/table/table_conf.dart';
import 'package:reactive_datatable_a/src/notify/reactive_notifyer.dart';

import '../../reactive_datatable_a.dart';

class BuildTable {
  final List<Map<String, ValueNotifier>> dataSource;
  final List<ColumnInfo> columData;
  const BuildTable({required this.columData, required this.dataSource});

  Widget build(){
    return DataTable(
      columnSpacing: 0,
      horizontalMargin: 0,
      headingRowHeight: 50,
      dividerThickness: .5,
      // border: TableBorder.all(color:Colors.red),
      columns: List.generate(columData.length, (index) {
        return DataColumn(
          label: Stack(
            children: [
              BuildDataColumn(dataSource: dataSource,columData: columData).build(columData[index], index, (columData.length - 1)),
              Positioned(
                right: 0,
                child: Builder(
                    builder: (subContext) {
                      ValueNotifier<double> width = columData[index].columWidth!;
                      TableConf tab = TableConf.init();
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
                            columData[index].initX = details.globalPosition.dx;
                          },
                          onPanUpdate: (details) {
                            final increment = details.globalPosition.dx -  columData[index].initX;
                            final newWidth =  width.reactiveValue(subContext) + increment;
                            columData[index].initX = details.globalPosition.dx;
                            columData[index].setCollWidth(newWidth > 100 ? newWidth : 100);

                          },
                          child: Container(
                            alignment: Alignment.centerRight,
                            width: 50,
                            height: 50,
                           decoration: const BoxDecoration(),
                           child: Container(width: 2,height: 50,decoration: BoxDecoration(color: Colors.red),),

                           // child: tab.resizeHover.reactiveValue(subContext)?Icon(Icons.add,):Container(color: Colors.transparent,),
                          )
                        ),
                      );
                    }
                ),
              )
            ],
          ),
        );
      }),
      rows: List.generate(
        dataSource.length,
            (index) => BuildRow(dataSource: dataSource,columData: columData).build(dataSource[index], index),
      ),);
  }
}