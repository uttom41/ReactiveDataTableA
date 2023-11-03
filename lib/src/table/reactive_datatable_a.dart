import 'package:flutter/material.dart';
import 'package:reactive_datatable_a/src/core/base.dart';
import '../../reactive_datatable_a.dart';


// ignore: must_be_immutable
class ReactiveDataTableA extends DataTable {
  final verticalScrollController = ScrollController();
  final horizontalScrollController = ScrollController();
  final BaseTable baseTable = BaseTable();

  final List<Map<String, dynamic>> rowDataList;
  final List<DataColumnA> dataColumns;
  final double? minColumnWith;
  final double? minRowHeight;
  final bool columnWidthResize;
  final Color? borderColor;
  final Color? headerBackgroundColor;
  final double? borderThickness;
  final bool? headerFixedTop;

  ReactiveDataTableA({
    super.key,
    required this.dataColumns,
    required super.rows,
    required this.rowDataList,
    this.columnWidthResize = true,
    this.minColumnWith,
    this.minRowHeight,
    this.borderColor,
    this.borderThickness,
    this.headerBackgroundColor,
    this.headerFixedTop,
  }):super(columns: dataColumns,dividerThickness: 0) {
    baseTable.setRowList(rowDataList);
    baseTable.setColumnList(dataColumns);
    baseTable.setColMinWidth(minColumnWith??0.0);
    baseTable.setRowMinHeight(minRowHeight??0.0);
    baseTable.setBorderColor(borderColor);
    baseTable.setBorderSize(dividerThickness??0.0);
    baseTable.setHeaderBG(headerBackgroundColor);
    baseTable.setTableColumnWidthResize(columnWidthResize);
  }

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
        builder: (context, constraints) {
          baseTable.setScreenWidth(constraints.maxWidth);
          return Material(
            type: MaterialType.transparency,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            clipBehavior: Clip.hardEdge,
            child: Scrollbar(
              thumbVisibility: true,
              trackVisibility: true, // make the scrollbar easy to see
              controller: verticalScrollController,
              notificationPredicate: (notify) => notify.depth == 1,
              child: Scrollbar(
                thumbVisibility: true,
                trackVisibility: true,
                controller: horizontalScrollController,

                notificationPredicate: (notify) => notify.depth == 1,
                child: SingleChildScrollView(
                  controller: verticalScrollController,
                  scrollDirection: Axis.vertical,
                  physics: baseTable.getHeaderFixedTop?const NeverScrollableScrollPhysics():null,
                  child: SingleChildScrollView(
                    controller: horizontalScrollController,
                    scrollDirection: Axis.horizontal,

                    child: // BuildTable().build(),
                    Row(children: baseTable.tableHeader())

                    // Column(
                    //   children: [
                    //
                    //     Column(
                    //       children:List.generate(
                    //       conf.rowList.length,
                    //           (rowIndex) => Row(children:List.generate(conf.columnList.length, (index) {
                    //             Widget cellWidget = Container();
                    //
                    //             Map<String,  dynamic> rowData = conf.rowList[rowIndex];
                    //             double rowHeight =rowData["height"]??conf.rowMaxHeight;
                    //             if(rowData[conf.columnList[index].rowName] is ValueNotifier) {
                    //               cellWidget = Builder(
                    //                   builder: (subContext) {
                    //                     ValueNotifier<String?>? valueNotifier = rowData[conf.columnList[index].rowName];
                    //                     Widget widget = Container();
                    //                     if(conf.columnList[index].type == ColumnType.sl || ColumnType.string ==conf.columnList[index].type) {
                    //                       widget = Text(valueNotifier?.reactiveValue(subContext)??"${rowIndex+1}",style:conf.columnList[index].textStyle);
                    //                     } else if (conf.columnList[index].type == ColumnType.editText) {
                    //                       widget = CustomTextField(
                    //                           onChanged:(String? value) {
                    //                             valueNotifier?.value = value;
                    //
                    //                           }
                    //                       );
                    //                     } else if(conf.columnList[index].type == ColumnType.action) {
                    //                       widget = InkWell(
                    //                         onTap: (){
                    //
                    //                         },
                    //                         child: Container(color: Colors.teal,width: double.infinity,height: double.infinity,),
                    //                       );
                    //                     }
                    //                     return Container(
                    //                         width: conf.columnList[index].notifyColumnWith.reactiveValue(subContext),
                    //                         height: rowHeight+16,
                    //                         // padding: const EdgeInsets.all(8),
                    //                         alignment: Alignment.center,
                    //                         decoration: BoxDecoration(
                    //                           border: Border(
                    //                             right: BorderSide(
                    //                                 width: conf.borderSize,
                    //                                 color: conf.borderColor
                    //                             ),
                    //                             // top: BorderSide(
                    //                             //     width: conf.borderSize,
                    //                             //     color: conf.borderColor
                    //                             // ),
                    //                             bottom: BorderSide(
                    //                                 width: conf.borderSize,
                    //                                 color: conf.borderColor
                    //                             ),
                    //                             left: BorderSide(
                    //                                 width: index==0?conf.borderSize:0,
                    //                                 color: index==0?conf.borderColor:Colors.transparent
                    //                             ),
                    //                           ),
                    //                           color:(conf.columnList[index].backgroundColor!=null)?conf.columnList[index].backgroundColor!:Colors.transparent,
                    //
                    //                         ),
                    //                         child: widget
                    //                     );
                    //                   }
                    //               );
                    //             } else {
                    //               cellWidget = Builder(
                    //                   builder: (subContext) {
                    //                     dynamic value = rowData[conf.columnList[index].rowName];
                    //                     Widget widget = Container();
                    //                     if(conf.columnList[index].type == ColumnType.sl || ColumnType.string ==conf.columnList[index].type) {
                    //                       widget = Text(value??"${rowIndex+1}",style:conf.columnList[index].textStyle);
                    //                     } else if (conf.columnList[index].type == ColumnType.editText) {
                    //                       widget = CustomTextField(
                    //                           onChanged:(String? value) {
                    //                             // valueNotifier?.value = value;
                    //
                    //                           }
                    //                       );
                    //                     } else if(conf.columnList[index].type == ColumnType.action) {
                    //                       widget = InkWell(
                    //                         onTap: (){
                    //
                    //                         },
                    //                         child: Container(color: Colors.teal,width: double.infinity,height: double.infinity,),
                    //                       );
                    //                     }
                    //                     return Container(
                    //                         width: conf.columnList[index].notifyColumnWith.reactiveValue(subContext),
                    //                         height: rowHeight+16,
                    //                         // padding: const EdgeInsets.all(8),
                    //                         alignment: Alignment.center,
                    //                         decoration: BoxDecoration(
                    //                           border: Border(
                    //                             right: BorderSide(
                    //                                 width: conf.borderSize,
                    //                                 color: conf.borderColor
                    //                             ),
                    //                             // top: BorderSide(
                    //                             //     width: conf.borderSize,
                    //                             //     color: conf.borderColor
                    //                             // ),
                    //                             bottom: BorderSide(
                    //                                 width: conf.borderSize,
                    //                                 color: conf.borderColor
                    //                             ),
                    //                             left: BorderSide(
                    //                                 width: index==0?conf.borderSize:0,
                    //                                 color: index==0?conf.borderColor:Colors.transparent
                    //                             ),
                    //                           ),
                    //                           color:(conf.columnList[index].backgroundColor!=null)?conf.columnList[index].backgroundColor!:Colors.transparent,
                    //
                    //                         ),
                    //                         child: widget
                    //                     );
                    //                   }
                    //               );
                    //             }
                    //             return (cellWidget);
                    //           })),
                    //     ),)
                    //   ],
                    // )
                  ),
                ),
              ),
            ),
          );
        }
    );
  }


}
