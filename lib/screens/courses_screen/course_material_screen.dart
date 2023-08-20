import 'package:e_sup_app/models/course_material.dart';
import 'package:e_sup_app/providers/course_materials_provider.dart';
import 'package:e_sup_app/providers/users_provider.dart';
import 'package:e_sup_app/widget/course_material_video_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import '../../models/quiz.dart';
import '../../models/user.dart' as model;

import '../../providers/quiz_provider.dart';
import '../../providers/stream_provider.dart';
import '../../widget/add_new_material.dart';
import '../../widget/course_material_item.dart';
import '../../widget/course_quiz_item.dart';
import '../../widget/my_appBar.dart';
import '../../widget/my_button.dart';
import '../../widget/searchBar.dart';
import '../activity_screens/quiz_uploader.dart';
import 'forum_screen.dart';
import '../../models/stream.dart' as model;
import 'lesson_write.dart';

class courseMaterialScreen extends StatefulWidget {
  final courseId;
  final coureTitle;
  final courseGrade;
  courseMaterialScreen(String this.courseId, this.coureTitle, this.courseGrade);

  @override
  State<courseMaterialScreen> createState() => _courseMaterialScreenState();
}

class _courseMaterialScreenState extends State<courseMaterialScreen> {
  final materialController = TextEditingController();
  var _isInit = true;
  // List<courseMaterial> _courseMaterials = [];
  List<model.Stream> _courseStream = [];

//Add new material button
  void _startAddNewMaterial(BuildContext ctx, String sId, String uid, courseId,
      int grade, bool isVideo) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: AddNewMaterial(sId, uid, courseId, grade, isVideo),
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
      setState(() {});
      Provider.of<courseMaterialProvider>(context, listen: false)
          .fetchCourseMaterials()
          .then((_) => setState(() {}));
      Provider.of<streamProvider>(context, listen: false)
          .fetchStreams()
          .then((_) => setState(() {}));
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    model.User userDetail =
        Provider.of<UserProvider>(context, listen: false).getUser;
    bool isEducator = userDetail.type == "Educator";
    _courseStream = Provider.of<streamProvider>(context, listen: false)
        .getCourseStreamByCourseId(widget.courseId);
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
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Image(
                    image: AssetImage("assets/Images/courseScreenImg.jpg"),
                  ),
                ),
                Container(
                  // color: Colors.lightBlue,
                  width: size.width - 150,
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(38.5),
                    border: Border.all(color: Colors.lightBlue, width: 3),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 7,
                        color: Color(0xFFD3D3D3).withOpacity(.84),
                      ),
                    ],
                  ),
                  child: TextButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.forum_outlined,
                          color: Colors.lightBlue,
                          size: 35,
                        ),
                        Text(
                          "Community Forum",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            decorationThickness: 3,
                          ),
                        ),
                      ],
                    ),
                    onPressed: _goToForum,
                  ),
                ),
                Search(
                  searchController: materialController,
                  textHint: "Search material",
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _courseStream.length,
                    itemBuilder: (_, i) => Column(
                      children: [
                        Divider(),
                        FutureBuilder<Widget>(
                          future: courseMT(_courseStream[i]),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else {
                              return snapshot.data ?? Container();
                            }
                          },
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
          ? SpeedDial(
              animatedIcon: AnimatedIcons.add_event,
              children: [
                SpeedDialChild(
                  child: Icon(Icons.add),
                  onTap: () => _startAddNewMaterial(
                    context,
                    userDetail.sId,
                    userDetail.uid,
                    widget.courseId,
                    widget.courseGrade,
                    false,
                  ),
                ),
                SpeedDialChild(
                  child: Icon(Icons.question_mark),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizUploader(widget.courseId),
                    ),
                  ),
                ),
                SpeedDialChild(
                  child: Icon(Icons.video_chat),
                  onTap: () => _startAddNewMaterial(
                      context,
                      userDetail.sId,
                      userDetail.uid,
                      widget.courseId,
                      widget.courseGrade,
                      true),
                ),
                SpeedDialChild(
                  child: Icon(Icons.edit_document),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LessonWrite(),
                    ),
                  ),
                ),
              ],
            )
          : null,
    );
  }

  Future<Widget> courseMT(model.Stream courseStream) async {
    String docId = courseStream.docId;
    courseMaterial _courseMaterial;
    if (courseStream.collection == "Course Materials") {
      _courseMaterial =
          await Provider.of<courseMaterialProvider>(context, listen: false)
              .getCourseMaterialByDocId(docId);
      return courseMaterialItem(
        author: _courseMaterial.authorId,
        courseId: _courseMaterial.courseId,
        fileType: _courseMaterial.fileType,
        gr: _courseMaterial.grade,
        title: _courseMaterial.title,
        date: _courseMaterial.date.toDate(),
        fileUrl: _courseMaterial.fileUrl,
        materialId: _courseMaterial.id,
        courseName: widget.coureTitle,
      );
    } else if (courseStream.collection == "quizzes") {
      Quiz _quiz = await Provider.of<QuizProvider>(context, listen: false)
          .getQuizByDocId(docId);
      print(_quiz.questions[0].questionText);
      return courseQuizItem(
        courseName: widget.coureTitle,
        quiz: _quiz,
      );
    } else if (courseStream.collection == "videos") {
      _courseMaterial =
          await Provider.of<courseMaterialProvider>(context, listen: false)
              .getCourseMaterialByDocId(docId);
      return courseVideoItem(
        courseId: _courseMaterial.courseId,
        courseName: _courseMaterial.title,
        materialId: _courseMaterial.courseId,
        title: _courseMaterial.title,
        videoUrl: _courseMaterial.fileUrl,
      );
    }
    // Return an empty Container if the condition is not met
    return Container();
  }
}
