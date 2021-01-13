import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  // textfild
  String _text;

  //text form fild
  TextEditingController _controller1;

  // Radio
  String _gender;

  // Dropdown
  List<String> dropdownItems = ['นาย', 'นางสาว'];
  String _selectedItem = 'นาย';

  // CheckBoox
  List<Food> food = Food.getFood();
  List<String> _foodChecked = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text From Field Example"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
//text fild
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 350,
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      //not show ??
                      if (value.isEmpty) {
                        return 'Enter some text';
                        //not show ??

                      } else {
                        _text = value;
                      }
                      return null;
                    });
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.add_comment),
                    labelText: "Enter text",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),

//text form fild
            Container(
              child: TextFormField(
                controller: _controller1,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter some text';
                  }
                  return value;
                },
              ),
            ),
            Divider(),

// checkbox food 1 2
            CheckboxListTile(
                title: Text("food1"),
                value: food[0].isChecked,
                onChanged: (bool value) {
                  setState(() {
                    food[0].isChecked = value;
                  });
                  if (value) {
                    _foodChecked.add(food[0].foodName);
                  } else {
                    _foodChecked.remove(food[0].foodName);
                  }
                }),
            CheckboxListTile(
                title: Text("food2"),
                value: food[1].isChecked,
                onChanged: (bool value) {
                  setState(() {
                    food[1].isChecked = value;
                  });
                  if (value) {
                    _foodChecked.add(food[1].foodName);
                  } else {
                    _foodChecked.remove(food[1].foodName);
                  }
                }),

// Radio เพศ
            RadioListTile(
                title: Text("เพศชาย"),
                value: "mele",
                groupValue: _gender,
                onChanged: (value) {
                  setState(() {
                    _gender = value;
                  });
                }),
            RadioListTile(
                title: Text("เพศหญิง"),
                value: "femele",
                groupValue: _gender,
                onChanged: (value) {
                  setState(() {
                    _gender = value;
                  });
                }),

            // DropdownButton(items: [
            //   DropdownMenuItem(value: local("n"),child:Text('นาย')),
            //   DropdownMenuItem(child: Text('นางสาว')),
            // ], onChanged: null),

// dropdown นาย นางสาว
            DropdownButton(
              value: _selectedItem,
              items: dropdownItems.map<DropdownMenuItem<String>>((val) {
                return DropdownMenuItem<String>(
                  child: Text(val),
                  value: val,
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedItem = value;
                });
              },
            ),

//submit button
            RaisedButton(
              child: Text('Submit'),
              onPressed: () {
                // text form fild error ??
                if (_formKey.currentState.validate()) {
                  print(_controller1.text);
                }
                // text form fild error ??

                print(_text);
                print(_foodChecked);
                print(_gender);
                print(_selectedItem);
              },
            )
          ],
        ),
      ),
    );
  }
}

class Food {
  String foodName;
  bool isChecked;

  Food(this.foodName, this.isChecked);

  static List<Food> getFood() {
    return <Food>[Food('food1', false), Food('food2', false)];
  }
}

// class PrefixItem {
//   String prefixName;
//   String val;

//   PrefixItem(this.val, this.prefixName);

//   static List<PrefixItem> getPrefix() {
//     return <PrefixItem>[
//       PrefixItem('1', 'นาย'),
//       PrefixItem('2', 'นางสาว'),
//     ];
//   }
// }
