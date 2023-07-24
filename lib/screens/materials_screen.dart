import 'dart:math';

import 'package:e_sup_app/models/stud_material.dart';
import 'package:e_sup_app/providers/stud_materials.dart';
import 'package:e_sup_app/providers/users.dart';
import 'package:e_sup_app/widget/material_item.dart';
import 'package:e_sup_app/widget/my_appBar.dart';
import 'package:e_sup_app/widget/searchBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/add_new_material.dart';
import '../widget/new_material.dart';

class MaterialsScreen extends StatefulWidget {
  const MaterialsScreen({super.key});

  @override
  State<MaterialsScreen> createState() => _MaterialsScreenState();
}

class _MaterialsScreenState extends State<MaterialsScreen> {
  void _addNewMaterial(
    String mtId,
    String mtTitle,
    String mtAuthorSchool,
    String uid,
    int grade,
    String type,
    String dept,
    DateTime date,
    String fileUrl,
  ) {
    final newMaterial = StudMaterial(
      id: mtId,
      authorId: uid,
      date: date,
      dept: dept,
      fileType: type,
      grade: grade,
      title: mtTitle,
      fileUrl: fileUrl,
    );
    setState(() {
      Provider.of<StudMaterials>(context, listen: false)
          .addMaterial(newMaterial);
    });
  }

  void _startAddNewMaterial(BuildContext ctx, String sId, String uid) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: AddNewMaterial(sId, uid),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final material = Provider.of<StudMaterials>(context, listen: false);
    final userDetail =
        Provider.of<UserProvider>(context, listen: false).getUser;
    final searchController = TextEditingController();
    final String textHint = "search material";
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: SingleChildScrollView(
            child: Column(children: [
              MyAppBar(backArrow: false, title: "Material", name: ""),
              Search(
                searchController: searchController,
                textHint: textHint,
              ),
              SizedBox(
                height: 10,
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: material.items.length,
                itemBuilder: (_, i) => Column(
                  children: [
                    materialItem(
                      title: material.items[i].title,
                      author: material.items[i].authorId,
                      dept: material.items[i].dept,
                      gr: material.items[i].grade,
                      fileType: material.items[i].fileType,
                    ),
                    Divider(),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewMaterial(
          context,
          userDetail.sId,
          userDetail.uid,
        ),
        backgroundColor: Color.fromARGB(255, 243, 211, 115),
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
