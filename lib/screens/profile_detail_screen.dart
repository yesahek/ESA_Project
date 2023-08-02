import 'package:e_sup_app/utils/utils.dart';
import 'package:e_sup_app/widget/my_appBar.dart';
import 'package:flutter/material.dart';
import '../providers/users_provider.dart';

class ProfileDetailPage extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String type;
  final String sex;
  final String photoUrl;
  final String email;
  final int grade;
  final String phoneNumber;
  final String shoolName;
  final String userId;

  bool isForApproval = false;
  bool isEditButton = false;

  ProfileDetailPage({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.type,
    required this.sex,
    required this.photoUrl,
    required this.email,
    required this.grade,
    required this.phoneNumber,
    required this.shoolName,
    required this.userId,
    this.isForApproval = false,
    this.isEditButton = false,
  }) : super(key: key);

  @override
  State<ProfileDetailPage> createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends State<ProfileDetailPage> {
  var _isLoading = false;
  Future<void> _accept() async {
    setState(() {
      _isLoading = true;
    });
    var accept = await UserProvider().acceptUser(widget.userId);
    if (accept == "success") {
      setState(() {
        _isLoading = false;
        Navigator.pop(context);
        showSnackBar(context, "Accepted!");
      });
    } else {
      setState(() {
        _isLoading = false;
        showSnackBar(context, "Something wrong!");
      });
    }
  }

//edit profile
  void _editProfile() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
              color: Colors.blueAccent,
            ))
          : SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    MyAppBar(
                        backArrow: !widget.isEditButton,
                        title: widget.firstName,
                        name: ""),
                    CircleAvatar(
                      radius: 70,
                      backgroundImage: NetworkImage(widget.photoUrl),
                    ),
                    SizedBox(height: 20),
                    Text(
                      widget.firstName,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      widget.email,
                      style: TextStyle(fontSize: 16),
                    ),
                    ProfileDetailTile(
                      icon: Icons.person,
                      label: 'Full Name',
                      value: '${widget.firstName} ${widget.lastName} ',
                    ),
                    ProfileDetailTile(
                      icon: Icons.email,
                      label: "Email",
                      value: widget.email,
                    ),
                    ProfileDetailTile(
                      icon: Icons.phone,
                      label: 'Phone',
                      value: widget.phoneNumber,
                    ),
                    ProfileDetailTile(
                      icon: Icons.school_outlined,
                      label: 'School',
                      value: widget.shoolName,
                    ),
                    ProfileDetailTile(
                      icon: Icons.person,
                      label: 'Account Type',
                      value: widget.type,
                    ),
                    ProfileDetailTile(
                      icon: Icons.person,
                      label: 'Sex',
                      value: widget.sex,
                    ),
                    ProfileDetailTile(
                      icon: Icons.grade,
                      label: 'Grade',
                      value: widget.grade.toString(),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        if (widget.isForApproval && !widget.isEditButton)
                          ElevatedButton(
                            onPressed: _accept,
                            child: Text('Accept'),
                          ),
                        if (widget.isEditButton)
                          ElevatedButton(
                            onPressed: _editProfile,
                            child: Text('Edit'),
                          ),

                        //   ElevatedButton(
                        //     onPressed: () {
                        //       Navigator.pop(context);
                        //     },
                        //     child: Text('<- Back'),
                        //   ),
                        // // ElevatedButton(
                        //   onPressed: () {
                        //     //_reject;
                        //   },
                        //   child: Text('Reject'),
                        // ),
                        SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class ProfileDetailTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  ProfileDetailTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      subtitle: Text(value),
    );
  }
}
