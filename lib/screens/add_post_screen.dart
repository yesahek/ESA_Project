import 'dart:io';
import 'dart:typed_data';

import 'package:e_sup_app/models/post.dart';
import 'package:e_sup_app/providers/posts_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

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
    // set state because we need to display the image we selected on the circle avatar
    setState(() {
      _image = im;
    });
  }

  void _submit() {
    print(_image);
    print(_caption);
  }

  TextEditingController _captionController = TextEditingController();
  bool _isPhotoSelected = false; // For checking if a photo is selected

  void _pickPhoto() async {
    Uint8List im = await pickImage(ImageSource.gallery);

    setState(() {
      _image = im;
      _isPhotoSelected = true;
    });
  }

  void _addPost() {
    setState(() {
      _isLoading = true;
    });
    Post newPost = Post(
        postId: "postId521",
        likes: 0,
        uid: "uid",
        username: "mukera",
        datePublished: DateTime.now(),
        description: _captionController.text);
    PostProvider().AddPost(description: _captionController.text,file: _image!,firstName: "",uid: "",);
    setState(() {
      _captionController.clear();
      _isPhotoSelected = false;
    });
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                        controller: _captionController,
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: 'Description....',
                          border: InputBorder.none,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton.icon(
                            onPressed: _pickPhoto,
                            icon: Icon(Icons.photo),
                            label: Text('Photo'),
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
