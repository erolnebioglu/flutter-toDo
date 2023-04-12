import 'package:flutter/material.dart';
import 'main.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'colorpick.dart';


Color pickerColor = Color.fromARGB(255, 7, 172, 133);
Color currentColor = Color.fromARGB(255, 7, 172, 133);

class AddingPage extends StatelessWidget {
  const AddingPage({super.key});
  
  

  @override
  Widget build(BuildContext context) {
    //Color pickerColor = Color.fromARGB(255, 7, 172, 133);
    //Color currentColor = Color.fromARGB(255, 7, 172, 133);
    
    

    return Scaffold(
      
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          
          IconButton(onPressed: (){
            showModalBottomSheet(context: context,
            //isScrollControlled: true,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
              
            )),
            backgroundColor: pickerColor,
            isScrollControlled: true,
            
             builder: (context){
              return Container(
                
                height: 400,

                child: Padding(
                  padding: const EdgeInsets.only(left: 30,right: 30),
                  child: ListView(children: [
                    
                    SizedBox(height: 10.0,),
                    TextButton.icon(onPressed: (){print(Text(""));}, label: Text("share with your friens"),icon: Icon(Icons.share_sharp),
                    style: TextButton.styleFrom(fixedSize:const Size(300, 50) ,primary: pickerColor,backgroundColor: Colors.white),),
                    SizedBox(height: 10.0,),
                    TextButton.icon(onPressed: (){print(Text(""));}, label: Text("Delete"),icon: Icon(Icons.delete_outline),
                    style: TextButton.styleFrom(fixedSize:const Size(300, 50) ,primary: pickerColor,backgroundColor: Colors.white),),
                    SizedBox(height: 10.0,),
                    TextButton.icon(onPressed: (){print(Text(""));}, label: Text("Duplicate"),icon: Icon(Icons.control_point_duplicate_outlined),
                    style: TextButton.styleFrom(fixedSize:const Size(300, 50) ,primary: pickerColor,backgroundColor: Colors.white),),
                    SizedBox(height: 10.0,),
                    colorchange(),

                
                    
                    
                     
                    
                  ]),
                ),
              );
              
              }
              );
              }, icon: Icon(Icons.more_vert)),
          IconButton(onPressed: (){

            

          }, icon: Icon(Icons.done)),
        ],
        backgroundColor: pickerColor,
        title: Text('New Note',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),),
      backgroundColor: Colors.grey[200],
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
            
            children: [
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: TextFormField(
                  
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
              )
              
              
          ]
        
      ),),
    );
  }
  
  
}

class colorchange extends StatefulWidget {
  const colorchange({super.key});

  @override
  State<colorchange> createState() => _colorchangeState();
}


class _colorchangeState extends State<colorchange> {
  @override
  
  void changeColor(Color color) {
  setState(() => pickerColor = color);
}

  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        
        MaterialPicker(
        pickerColor: pickerColor,
        onColorChanged: changeColor,
      ),
      SizedBox(height: 10.0,),
      ElevatedButton(onPressed: () {
          setState(() => currentColor = pickerColor);
          Navigator.of(context).pop();
        }, child: Text("bas"),style: TextButton.styleFrom(fixedSize:const Size(300, 50) ,primary: pickerColor,backgroundColor: Colors.white),),
        SizedBox(height: 10.0,)
      ]),
    );
  }
}

