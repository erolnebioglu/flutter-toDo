import 'package:calculator/addPage.dart';
import 'package:calculator/editPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'getStartedPage.dart';
import 'addPage.dart';


void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ToDo",
      home: GetStartedPage(),
      theme: ThemeData(appBarTheme: AppBarTheme(
        color: Color.fromARGB(255, 65, 157, 68)
      )),
    );
  }
}

class frame extends StatelessWidget {
  const frame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      leading: Icon(Icons.ad_units_outlined),
      centerTitle: true,
      title:Text("MY Notes") ),
      backgroundColor: Colors.grey[200],
      body: MainScreen(),
      
      
    );
    
  }
}
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}
List firstList = [];
List colorList = [];

class _MainScreenState extends State<MainScreen> {

  TextEditingController t1 = TextEditingController();
  

  addItem(){
    setState(() {
      firstList.add(t1.text);
      t1.clear();
    });

  }
    deleteItem(){
    setState(() {
      firstList.remove(t1.text);
      t1.clear();
    });

  }
  


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Flexible(
            child:ListView.builder(
              itemCount: firstList.length,
              itemBuilder:(context,indexNum)=>ListTile(
                subtitle: Text("ToDoApp"),
                title: Text(firstList[indexNum]),
                
                onTap: (){
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>editPage(firstList[indexNum]),
                  
                  
                  ),
                  

                  );
                  
                },

                ) 
                
                ) ),
          //TextField(
            //controller: t1,
          //),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
            
            children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: FloatingActionButton(
              onPressed:(){
                Navigator.push(context, MaterialPageRoute(
                  builder:(context)=>addPage()));
              },
              backgroundColor: Color.fromARGB(255, 3, 2, 98),
              child: Icon(
                Icons.add,
                size: 35,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              
              ),
            ),
            SizedBox(width: 10,),
            //ElevatedButton(onPressed: deleteItem, child: Text("-"))
            ],),
          )
          

        ]
        
        ),
        
        
        
    );
    
  }
}




//ElevatedButton(
//             style: ElevatedButton.styleFrom(
//              primary: Color.fromARGB(255, 14, 58, 7),
//               shape:StadiumBorder()),
//            onPressed: addItem, child:Text("+")),
