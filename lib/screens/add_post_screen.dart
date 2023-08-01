import 'dart:io';
import 'dart:typed_data';

import 'package:e_sup_app/providers/posts_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../providers/users_provider.dart';
import '../utils/colors.dart';
import '../utils/utils.dart';
import '../widget/my_appBar.dart';

class AddPost extends StatefulWidget {
  final courseId;
  AddPost({super.key, required this.courseId});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  late User userData;

  Uint8List? _image;
  String _caption = '';
  var _isLoading = false;

  Future getImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _AskQuestionController = TextEditingController();
  TextEditingController _AController = TextEditingController();
  TextEditingController _BController = TextEditingController();
  TextEditingController _CController = TextEditingController();
  TextEditingController _DController = TextEditingController();
  bool _isPhotoSelected = false; // For checking if a photo is selected
  bool _isAskingQuestion = false;
  int _choices = 0;
  int _answer = 0;

  void _pickPhoto() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
      _isPhotoSelected = true;
    });
  }

  void _toggleQuestion() {
    setState(() {
      _isAskingQuestion = !_isAskingQuestion;
    });
  }

  Future<void> _addPost() async {
    String res = '';
    setState(() {
      _isLoading = true;
    });

    String forSnack = "";

    if (_isPhotoSelected ||
        _descriptionController.text.isNotEmpty ||
        _AskQuestionController.text.isNotEmpty) {
      res = await PostProvider().AddPost(
        coureseId: widget.courseId,
        description: _descriptionController.text,
        file: _isPhotoSelected ? _image : null,
        firstName: userData.firstname,
        uid: userData.uid,
        question: _AskQuestionController.text,
        choiceA: _AController.text,
        choiceB: _BController.text,
        choiceC: _CController.text,
        choiceD: _DController.text,
        answer: _answer,
      );
      setState(() {
        _isLoading = false;
      });
    } else {
      res = "Empity";
    }
    if (res == "success") {
      forSnack = "post uploaded successfuly";
    } else if (res == "Empity") {
      forSnack = "One of Three is required (Image, Question, Text)";
    } else {
      forSnack = "something wrong";
    }
    showSnackBar(context, forSnack);
    setState(() {
      _descriptionController.clear();
      _AskQuestionController.clear();
      _isPhotoSelected = false;
      _isAskingQuestion = false;
      _choices = 0;
      _AController.clear();
      _BController.clear();
      _CController.clear();
      _DController.clear();
    });
    setState(() {
      _isLoading = false;
    });
  }

  _toggleChoices(int add) {
    setState(() {
      _choices += add;
    });
  }

  _clear() {
    setState(() {
      _descriptionController.clear();
      _AskQuestionController.clear();
      _AController.clear();
      _BController.clear();
      _CController.clear();
      _DController.clear();
      _isPhotoSelected = false;
      _isAskingQuestion = false;
      _choices = 0;
      _answer = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    userData = Provider.of<UserProvider>(context, listen: false).getUser;
    if (_isLoading) {
      return Center(
          child: CircularProgressIndicator(
        color: Colors.blueAccent,
      ));
    } else {
      return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyAppBar(backArrow: true, title: "Forum", name: ""),
                        if (_isPhotoSelected)
                          Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: MemoryImage(_image!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        SizedBox(height: 16),
                        TextField(
                          controller: _descriptionController,
                          maxLines: null,
                          decoration: InputDecoration(
                            hintText: 'Share something....',
                            border: InputBorder.none,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: _toggleQuestion,
                                  icon: Icon(Icons.question_mark),
                                  label: Text("Ask"),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                if (_isAskingQuestion)
                                  Expanded(
                                    child: TextField(
                                      controller: _AskQuestionController,
                                      decoration: InputDecoration(
                                          labelText: 'Ask a question....'),
                                    ),
                                  ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            if (_isAskingQuestion)
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //Choice A
                                    if (_choices >= 2)
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 10),
                                            height: 35,
                                            width: 35,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: appColor,
                                                  blurRadius: 2,
                                                  spreadRadius: 2,
                                                ),
                                              ],
                                            ),
                                            child: Center(
                                              child: (Text(
                                                "A",
                                                style: TextStyle(fontSize: 20),
                                              )),
                                            ),
                                          ),
                                          Expanded(
                                            child: TextField(
                                              controller: _AController,
                                              decoration: InputDecoration(
                                                  labelText: 'Choice A'),
                                            ),
                                          ),
                                        ],
                                      ), //
                                    //Choice B
                                    if (_choices >= 2)
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 10),
                                            height: 35,
                                            width: 35,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: appColor,
                                                  blurRadius: 2,
                                                  spreadRadius: 2,
                                                ),
                                              ],
                                            ),
                                            child: Center(
                                              child: (Text(
                                                "B",
                                                style: TextStyle(fontSize: 20),
                                              )),
                                            ),
                                          ),
                                          Expanded(
                                            child: TextField(
                                              controller: _BController,
                                              decoration: InputDecoration(
                                                  labelText: 'Choice B'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    //Choice C
                                    if (_choices >= 3)
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 10),
                                            height: 35,
                                            width: 35,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: appColor,
                                                  blurRadius: 2,
                                                  spreadRadius: 2,
                                                ),
                                              ],
                                            ),
                                            child: Center(
                                              child: (Text(
                                                "C",
                                                style: TextStyle(fontSize: 20),
                                              )),
                                            ),
                                          ),
                                          Expanded(
                                            child: TextField(
                                              controller: _CController,
                                              decoration: InputDecoration(
                                                  labelText: 'Choice C'),
                                            ),
                                          ),
                                        ],
                                      ), //
                                    //Choice D
                                    if (_choices >= 4)
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 10),
                                            height: 35,
                                            width: 35,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: appColor,
                                                  blurRadius: 2,
                                                  spreadRadius: 2,
                                                ),
                                              ],
                                            ),
                                            child: Center(
                                              child: (Text(
                                                "D",
                                                style: TextStyle(fontSize: 20),
                                              )),
                                            ),
                                          ),
                                          Expanded(
                                            child: TextField(
                                              controller: _DController,
                                              decoration: InputDecoration(
                                                  labelText: 'Choice D'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    //choices add
                                    if (_choices < 4)
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: 18, top: 10),
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: appColor,
                                              blurRadius: 2,
                                              spreadRadius: 2,
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              if (_choices == 0) {
                                                _toggleChoices(2);
                                              } else {
                                                _toggleChoices(1);
                                              }
                                            },
                                            icon: Icon(
                                              Icons.add,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton.icon(
                              onPressed: _pickPhoto,
                              icon: Icon(Icons.photo),
                              label: Text('Select Image'),
                            ),
                            ElevatedButton.icon(
                              onPressed: _addPost,
                              icon: Icon(Icons.post_add),
                              label: Text('Post'),
                            ),
                            ElevatedButton.icon(
                              onPressed: _clear,
                              icon: Icon(Icons.clear),
                              label: Text('Clear'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(),
              ],
            ),
          ),
        ),
      );
    }
  }
}
