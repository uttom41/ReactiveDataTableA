import 'package:flutter/material.dart';
import 'package:reactive_datatable_a/reactive_datatable_a.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  ValueNotifier<String> name = ValueNotifier("Amitghghjgjhgjhgj hjjhjh kjkjhkhk uyuuguig kljlk lkjkl lklk lklk Amitghghjgjhgjhgj Amitghghjgjhgjhgj hjjhjh kjkjhkhk uyuuguig kljlk lkjkl lklk lklkAmitghghjgjhgjhgj hjjhjh kjkjhkhk uyuuguig kljlk lkjkl lklk lklkhjjhjh kjkjhkhk uyuuguig kljlk lkjkl lklk lklkAmitghghjgjhgjhgj hjjhjh kjkjhkhk uyuuguig kljlk lkjkl lklk lklk uttom");
  ValueNotifier<String> age = ValueNotifier("12");
  ValueNotifier<String> address = ValueNotifier("Uttra");
  ValueNotifier<String> phone = ValueNotifier("01717633441");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ReactiveDataTableA(
              dataSource: [
                {"name":name,"age":age,"Address":address,"Phone":phone},
              ],
              columData: [
                ColumnInfo(
                  rowName: "name",
                  type: ColumnType.string,
                  columnHeader: Row(mainAxisAlignment:MainAxisAlignment.center,children: [Container(color: Colors.red,height: 20,width: 20,),Text("Name")],),
                  textColor: Colors.white38,
                ),
                ColumnInfo(
                  rowName: "age",
                  type: ColumnType.string,
                  columnHeader: Text("Age"),
                  textColor: Colors.white38,
                ),
                ColumnInfo(
                  rowName: "Address",
                  backgroundColor: Colors.white70,
                  type: ColumnType.string,
                  columnHeader:Text("Address"),
                  textColor: Colors.white38,
                ),
                ColumnInfo(
                  rowName: "Phone",
                  type: ColumnType.string,
                  columnHeader: Text("Phone"),
                  textColor: Colors.white38,
                ),
              ]
          ),

          InkWell(
            onTap: (){
             // viewModel.setAgeValue();
            },
            child: Text("change value"),
          )
        ],
      )
    );
  }
}