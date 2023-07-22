import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  final List<String> drValue; // Receive the drValue as a parameter
  //final ValueNotifier<String> valueNotifier;

  const Dropdown({
    required this.drValue,
    Key? key,
    // required this.valueNotifier
  }) : super(key: key);

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.drValue
        .first; // Initialize dropdownValue with the first item from the received list
  }

  String selectedValue = ""; // Create a variable to store the selected value


  @override
  Widget build(BuildContext context) {
    //  ValueNotifier<String> valueNotifier = widget.valueNotifier;
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });

        //valueNotifier.value = value!;
      },
      items: widget.drValue.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
                 );
      }).toList(),
    );
  }
}
