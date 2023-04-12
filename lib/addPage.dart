import 'package:calculator/colorpick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'main.dart';

Color pickerColor = Color.fromARGB(255, 7, 172, 133);
Color currentColor = Color.fromARGB(255, 7, 172, 133);

class addPage extends StatefulWidget {
  
  const addPage({super.key});
  

  @override
  State<addPage> createState() => _addPageState();
}


class _addPageState extends State<addPage> {
  
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
  void changeColor(Color color) {
  setState(() => pickerColor = color);
}
  
  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      resizeToAvoidBottomInset: false,
    appBar: AppBar(actions: [
      IconButton(onPressed: (){
          showModalBottomSheet(context: context,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
              
            )),

          isScrollControlled: true,
          backgroundColor: Colors.white,

           builder: (context){
            return Container(
              height: 400,
              child: Padding(
                  padding: const EdgeInsets.only(left: 30,right: 30),
                  child: ListView(children: [
                    
                    SizedBox(height: 10.0,),
                    TextButton.icon(onPressed: (){print(Text(""));}, label: Text("share with your friens"),icon: Icon(Icons.share_sharp),
                    style: TextButton.styleFrom(fixedSize:const Size(300, 50) ,primary: Colors.white,backgroundColor: Color.fromARGB(100, 0, 0, 0)),),
                    
                    
                    SizedBox(height: 10.0,),
                    TextButton.icon(onPressed: (){print(Text(""));}, label: Text("Duplicate"),icon: Icon(Icons.control_point_duplicate_outlined),
                    style: TextButton.styleFrom(fixedSize:const Size(300, 50) ,primary: Colors.white,backgroundColor: Color.fromARGB(100, 0, 0, 0)),),
                    SizedBox(height: 20.0,),

                    MaterialPicker(
                pickerColor: pickerColor,
        onColorChanged: changeColor,

              ),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: () {
          setState(() => currentColor = pickerColor);
          Navigator.of(context).pop();
        }, child: Text("Done"),style: TextButton.styleFrom(fixedSize:const Size(300, 50) ,primary: Colors.white,backgroundColor: Color.fromARGB(100, 0, 0, 0)),),
                    

                
                    
                    
                     
                    
                  ]),
                ),
                

            );
          });

      }, icon:Icon(Icons.more_vert) ),
      IconButton(onPressed: (){

            addItem();

          }, icon: Icon(Icons.done)),
          IconButton(onPressed: (){deleteItem();},icon: Icon(Icons.delete_outline),
                    style: TextButton.styleFrom(primary: Colors.white,backgroundColor: Color.fromARGB(100, 0, 0, 0)),),
          
    ],
    backgroundColor: pickerColor,
        title: Text('New Note',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
    
    ),
    backgroundColor: Colors.grey[200],
    body: Container(
      margin: EdgeInsets.all(20),
      child: Column(children: [
  
        SizedBox(height: 10,),
        Padding(
                padding: const EdgeInsets.only(top: 30),
                child: TextFormField(
                 
                  controller: t1,
                  decoration: InputDecoration(
                    
                    suffixIcon: Icon(Icons.abc),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: pickerColor)),
                        labelText: "Type Something...",
                        border: UnderlineInputBorder(),
                        
                        ),
                    
                ),
              ),
              SizedBox(height: 10.0,),
              
              Padding(
                padding: const EdgeInsets.only(right: 260),
                child: Text("Type Something...",
                style: TextStyle(
                  fontStyle:FontStyle.italic ,
                  color: Colors.grey),
                  textAlign: TextAlign.left,
                ),
              ),

              SizedBox(height: 10,),

              
      ],),
    ),

    );
  }
}