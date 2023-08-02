import 'package:e_sup_app/models/course_material.dart';
import 'package:e_sup_app/providers/course_materials_provider.dart';
import 'package:e_sup_app/providers/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/user.dart' as model;

import '../../widget/add_new_material.dart';
import '../../widget/course_material_item.dart';
import '../../widget/my_appBar.dart';
import '../../widget/my_button.dart';
import '../../widget/searchBar.dart';
import 'forum_screen.dart';

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

  // go to forum
  void _goToForum() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => forumScreen(
          courseId: widget.courseId,
          courseTitle: widget.coureTitle,
        ),
      ),
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
    var size = MediaQuery.of(context).size;
    model.User userDetail =
        Provider.of<UserProvider>(context, listen: false).getUser;
    _courseMaterials = Provider.of<courseMaterialProvider>(context,
            listen: false)
        .getCourseMaterialByCourseAndGrade(widget.courseId, userDetail.grade);
    bool isEducator = userDetail.type == "Educator";
    //print(isEducator);
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
                Stack(
                  children: [
                    Container(
                        //margin: EdgeInsets.all(10),
                        alignment: Alignment.bottomRight,
                        padding: EdgeInsets.only(
                            // top: size.height * .1,
                            left: size.width * .1,
                            right: size.width * .01),
                        height: size.height * .48,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/Images/book.jpg"),
                            fit: BoxFit.fitWidth,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                        ),
                        child: Container(
                          width: size.width * .3,
                          height: size.height * 0.06,
                          //width: size.width * 10,
                          padding: EdgeInsets.only(bottom: size.height * .01),
                          child: MyButton(
                            onTap: _goToForum,
                            content: Text("Forum"),
                          ),
                        )),
                  ],
                ),
                Search(
                  searchController: materialController,
                  textHint: "Search material",
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    // scrollDirection: Axis.vertical,
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
                          courseName: widget.coureTitle,
                        ),
                        Divider(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      //button for adding new course material

      floatingActionButtonLocation:
          isEducator ? FloatingActionButtonLocation.endFloat : null,
      floatingActionButton: isEducator
          ? FloatingActionButton(
              onPressed: () => _startAddNewMaterial(
                context,
                userDetail.sId,
                userDetail.uid,
                widget.courseId,
                userDetail.grade as int,
              ),
              backgroundColor: Color.fromARGB(255, 243, 211, 115),
              child: Icon(
                Icons.add,
              ),
            )
          : null,
    );
  }
}
