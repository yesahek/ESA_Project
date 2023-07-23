import 'package:flutter/material.dart';

class showSubjects extends StatefulWidget {
  final List<String> items;
  const showSubjects({super.key, required this.items});

  @override
  State<showSubjects> createState() => _showSubjectsState();
}

class _showSubjectsState extends State<showSubjects> {
  final List<String> _selectedItems = [];

  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  void _cancel() {
    Navigator.pop(context);
  }

  void _submit() {
    Navigator.pop(context, _selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Select Subjects"),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items
              .map((item) => CheckboxListTile(
                    value: _selectedItems.contains(item),
                    title: Text(item),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (isChecked) => _itemChange(item, isChecked!),
                  ))
              .toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _cancel,
          child: Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: Text("Submit"),
        ),
      ],
    );
  }
}
