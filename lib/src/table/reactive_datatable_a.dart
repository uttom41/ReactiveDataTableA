import 'package:flutter/material.dart';
import '../../reactive_datatable_a.dart';


class ReactiveDataTableA extends StatefulWidget {
  final List<Map<String, ValueNotifier>> dataSource;
  final List<ColumnInfo> columData;
  // final double maxWidth;
  // final double maxHeight;
  //
  const ReactiveDataTableA({Key? key,required this.dataSource, required this.columData }) : super(key: key);

  @override
  State<ReactiveDataTableA> createState() => _ResizeTableAState();
}

class _ResizeTableAState extends State<ReactiveDataTableA> {
  final verticalScrollController = ScrollController();
  final horizontalScrollController = ScrollController();


  @override
  Widget build(BuildContext context) {
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
            child:  BuildTable(dataSource: widget.dataSource,columData: widget.columData).build(),
          ),
        ),
      ),
    );
  }
}
