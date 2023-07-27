import 'package:e_sup_app/models/course_material.dart';
import 'package:e_sup_app/providers/course_materials_provider.dart';
import 'package:e_sup_app/providers/users_provider.dart';
import 'package:e_sup_app/widget/course_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user.dart' as model;

import '../widget/add_new_material.dart';
import '../widget/material_item.dart';
import '../widget/my_appBar.dart';
import '../widget/searchBar.dart';

class courseMaterialScreen extends StatefulWidget {
  final courseId;
  final coureTitle;
  courseMaterialScreen(String this.courseId, this.coureTitle, {super.key});

  @override
  State<courseMaterialScreen> createState() => _courseMaterialScreenState();
}

class _courseMaterialScreenState extends State<courseMaterialScreen> {
  final materialController = TextEditingController();
  bool _isLoading = false;
  var _isInit = true;
  List<courseMaterial> _courseMaterials = [];

//Add new material button
  void _startAddNewMaterial(
      BuildContext ctx, String sId, String uid, courseId, int grade) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: AddNewMaterial(sId, uid, courseId, grade),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<courseMaterialProvider>(context, listen: false)
          .fetchCourseMaterials()
          .then((_) => setState(() {
                _isLoading = false;
              }));
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    model.User userDetail =
        Provider.of<UserProvider>(context, listen: false).getUser;
    _courseMaterials = Provider.of<courseMaterialProvider>(context,
            listen: false)
        .getCourseMaterialByCourseAndGrade(widget.courseId, userDetail.grade);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MyAppBar(
                  backArrow: true,
                  title: widget.coureTitle,
                  name: userDetail.firstname,
                ),
                Search(
                  searchController: materialController,
                  textHint: "Search material",
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: _courseMaterials.length,
                  itemBuilder: (_, i) => Column(
                    children: [
                      Divider(),
                      courseMaterialItem(
                        author: _courseMaterials[i].authorId,
                        courseId: _courseMaterials[i].courseId,
                        fileType: _courseMaterials[i].fileType,
                        gr: _courseMaterials[i].grade,
                        title: _courseMaterials[i].title,
                        date: _courseMaterials[i].date.toDate(),
                        fileUrl: _courseMaterials[i].fileUrl,
                        materialId: _courseMaterials[i].id,
                        
                      ),
                      Divider(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      //button for adding new course material
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewMaterial(
          context,
          userDetail.sId,
          userDetail.uid,
          widget.courseId,
          userDetail.grade,
        ),
        backgroundColor: Color.fromARGB(255, 243, 211, 115),
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
