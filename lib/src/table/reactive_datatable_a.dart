import 'package:flutter/material.dart';
import 'package:reactive_datatable_a/src/table/table_conf.dart';
import '../../reactive_datatable_a.dart';


class ReactiveDataTableA extends StatefulWidget {
  final List<Map<String, ValueNotifier>> dataSource;
  final List<ColumnInfo> columData;
  // final double maxWidth;
  // final double maxHeight;
  //
  ReactiveDataTableA({Key? key,required this.dataSource, required this.columData }) : super(key: key) {
    TableConf conf = TableConf.init();
    conf.setRowList(dataSource);
    conf.setColumnList(columData);
  }

  @override
  State<ReactiveDataTableA> createState() => _ResizeTableAState();
}

class _ResizeTableAState extends State<ReactiveDataTableA> {
  final verticalScrollController = ScrollController();
  final horizontalScrollController = ScrollController();


  @override
  Widget build(BuildContext context) {
    TableConf conf = TableConf.init();
    return LayoutBuilder(
        builder: (context, constraints) {
          conf.setScreenWidth(constraints.maxWidth);
        return Scrollbar(
          thumbVisibility: true,
          trackVisibility: true, // make the scrollbar easy to see
          controller: verticalScrollController,
          child: Scrollbar(
            thumbVisibility: true,
            trackVisibility: true,
            controller: horizontalScrollController,
            notificationPredicate: (notify) => notify.depth == 1,
            child: SingleChildScrollView(
              controller: verticalScrollController,
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                controller: horizontalScrollController,
                scrollDirection: Axis.horizontal,
                child:  BuildTable().build(),
              ),
            ),
          ),
        );
      }
    );
  }

  @override
  void dispose() {
    TableConf.dispose();
    super.dispose();
  }
}
