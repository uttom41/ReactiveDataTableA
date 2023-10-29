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

  ValueNotifier<String> name = ValueNotifier("ij hjjhjh kjkjhkhk  kljlk lkjkl lklk lklk uttom");
  ValueNotifier<String> name2 = ValueNotifier("ij hjjhjh kjkjhkhk uyuugu jdfdgfdg dfdsgfd fdgfdsg skjf kdsjkjfkdsj kjjdshkahfjs kjsdjhjkfh ksdhkjfhdskj kdshkjahfdjks jksdkhkjfkdsj ig kljlk lkjkl jjhjh kjkjhkhk uyuuguig kljlk lkjkl lklk lklk uttom");
  ValueNotifier<String> age = ValueNotifier("12");
  String address = "Uttra";
  ValueNotifier<String> email = ValueNotifier("");
  ValueNotifier<String> action = ValueNotifier("");
  ValueNotifier<String> phone = ValueNotifier("01717633441");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white38,
        appBar: AppBar(title: Text("Example"),backgroundColor: Colors.deepPurple,),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: ReactiveDataTableA(
                    borderColor: Colors.purple,
                    dividerThickness: 1,
                    minColumnWith: 150,
                    minRowHeight: 50,
                    dataSource: [
                      {"name":name,"age":age,"Address":address,"Phone":phone,"email":email,"action":action},
                      {"name":name,"age":age,"Address":address,"Phone":phone,"email":email,"action":action},
                      {"name":name,"age":age,"Address":address,"Phone":phone,"email":email,"action":action},

                    ],
                    columData: [
                      ColumnInfo(
                        rowName: "",
                        type: ColumnType.sl,
                        columnHeader: Text(""),
                        columWidth: 30,
                        backgroundColor: Colors.white38,
                      ),
                      ColumnInfo(
                        rowName: "name",
                        type: ColumnType.string,
                        columnHeader: Row(mainAxisAlignment:MainAxisAlignment.center,children: [Container(color: Colors.red,height: 20,width: 20,),Text("Name")],),
                      ),
                      ColumnInfo(
                        rowName: "age",
                        type: ColumnType.string,
                        columnHeader: Text("Age"),
                      ),
                      ColumnInfo(
                        rowName: "Address",
                        backgroundColor: Colors.white70,
                        type: ColumnType.string,
                        columnHeader:Text("Address"),
                      ),
                      ColumnInfo(
                        rowName: "Phone",
                        type: ColumnType.string,
                        columnHeader: Text("Phone"),
                      ),
                      ColumnInfo(
                        rowName: "email",
                        type: ColumnType.editText,
                        columnHeader: Text("Email"),
                      ),
                      ColumnInfo(
                        rowName: "action",
                        type: ColumnType.action,
                        columnHeader: Text("Action"),
                      ),
                    ]
                ),
              ),

              InkWell(
                onTap: (){
                  setAgeValue();
                },
                child: Text("change value"),
              )
            ],
          ),
        )
    );
  }

  void setAgeValue() {
    int a = int.parse(age.value);
    a++;
    age.value = a.toString();
    age.notifyChanged();
  }
}
