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
  static int row=0,col=0;
  

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildBox() {
    int itsRow=row, itsCol=col;
    if (row<=3 && col<3) col+=1;
    else if (col>=3) {row+=1; col=0;}
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
            return '$itsRow , $itsCol';
          }

          return null;
        },
        onSaved: (String value) {
          arr[itsRow][itsCol] = value;
        },
      ),
    );
  }
  
  List <Widget> _rowOfBoxes(){
    return <Widget>[
                  _buildBox(),
                  _buildBox(),
                  _buildBox(),
                  _buildBox(),
                ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Box"),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _rowOfBoxes()
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _rowOfBoxes()
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _rowOfBoxes()
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _rowOfBoxes()
              ),
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

                  //Send to API
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
