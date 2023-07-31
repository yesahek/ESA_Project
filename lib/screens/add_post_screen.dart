import 'dart:io';
import 'dart:typed_data';

import 'package:e_sup_app/providers/posts_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/colors.dart';
import '../utils/utils.dart';
import '../widget/my_appBar.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  Uint8List? _image;
  String _caption = '';
  var _isLoading = false;

  Future getImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  void _submit() {}

  TextEditingController _captionController = TextEditingController();
  TextEditingController _questionController = TextEditingController();
  bool _isPhotoSelected = false; // For checking if a photo is selected
  bool _isAskingQuestion = false;
  bool _isD = false;
  bool _isC = false;
  bool _isB = false;
  bool _isA = false;

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
    setState(() {
      _isLoading = true;
    });

    String forSnack = "";

    String res = await PostProvider().AddPost(
      description: _captionController.text,
      file: _isPhotoSelected ? _image : null,
      firstName: "iy",
      uid: "3YHmBpPYugNMdz5FHNj1f6C3Rbj2",
    );
    setState(() {
      _isLoading = false;
    });
    if (res == "success") {
      forSnack = "post uploaded successfuly";
    } else {
      forSnack = "something wrong";
    }
    showSnackBar(context, forSnack);
    setState(() {
      _captionController.clear();
      _questionController.clear();
      _isPhotoSelected = false;
      _isAskingQuestion = false;
    });
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(
            color: Colors.blueAccent,
          ))
        : Scaffold(
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
                              controller: _captionController,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                          controller: _questionController,
                                          decoration: InputDecoration(
                                              labelText: 'Question'),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        //Choice A
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
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                )),
                                              ),
                                            ),
                                            Expanded(
                                              child: TextField(
                                                decoration: InputDecoration(
                                                    labelText: 'Choice A'),
                                              ),
                                            ),
                                          ],
                                        ), //
                                        //Choice B
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
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                )),
                                              ),
                                            ),
                                            Expanded(
                                              child: TextField(
                                                decoration: InputDecoration(
                                                    labelText: 'Choice B'),
                                              ),
                                            ),
                                          ],
                                        ),
                                        //Choice C
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
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                )),
                                              ),
                                            ),
                                            Expanded(
                                              child: TextField(
                                                decoration: InputDecoration(
                                                    labelText: 'Choice C'),
                                              ),
                                            ),
                                          ],
                                        ), //
                                        //Choice D
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
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                )),
                                              ),
                                            ),
                                            Expanded(
                                              child: TextField(
                                                decoration: InputDecoration(
                                                    labelText: 'Choice D'),
                                              ),
                                            ),
                                          ],
                                        ),
                                        //choices add
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 18, top: 10),
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
                                              onPressed: () {},
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
                            if (_isAskingQuestion)
                              TextField(
                                controller: _questionController,
                                maxLines: null,
                                decoration: InputDecoration(
                                  hintText: 'Ask a question...',
                                  border: InputBorder.none,
                                ),
                              ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: _pickPhoto,
                                  icon: Icon(Icons.photo),
                                  label: Text('Select Image'),
                                ),
                                ElevatedButton.icon(
                                  onPressed: _toggleQuestion,
                                  icon: Icon(_isAskingQuestion
                                      ? Icons.text_fields
                                      : Icons.question_answer),
                                  label: Text(
                                      _isAskingQuestion ? 'Text' : 'Question'),
                                ),
                                ElevatedButton.icon(
                                  onPressed: _addPost,
                                  icon: Icon(Icons.post_add),
                                  label: Text('Post'),
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
