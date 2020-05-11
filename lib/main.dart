import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FormScreen(),
    );
  }
}

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  List<List<String>> arr = List.generate(4, (i) => List(4), growable: false);
  

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildBox(int row,int col) {
    return Container(
      height: 90,
      width: 70,
      child: TextFormField(
        decoration: InputDecoration(
          counterText:""
          ),
        showCursor: false,
        textCapitalization: TextCapitalization.characters,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 40,
        ),
        maxLength: 1,

        validator: (String value) {
          if (value.isEmpty) {
            return '$row , $col';
          }
          return null;
        },

        onSaved: (String value) {
          arr[row][col] = value;
        },
      ),
    );
  }
  
  Widget _rowOfBoxes(int row){
    
    return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildBox(row,0),
                  _buildBox(row,1),
                  _buildBox(row,2),
                  _buildBox(row,3),
                ]
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child:Text("Input"),),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _rowOfBoxes(0),
              _rowOfBoxes(1),
              _rowOfBoxes(2),
              _rowOfBoxes(3),

              RaisedButton(
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
                onPressed: () {
                  if (!_formKey.currentState.validate()) {
                    return;
                  }

                  _formKey.currentState.save();
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> print(arr),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
