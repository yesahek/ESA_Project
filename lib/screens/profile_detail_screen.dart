// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: 
            _isLoading
        ? Center(
            child: CircularProgressIndicator(
            color: Colors.blueAccent,
          ))
        : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  MyAppBar(backArrow: true, title: widget.firstName, name: ""),
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage(
                        widget.photoUrl),
                  ),
                  SizedBox(height: 20),
                  Text(
                    widget.firstName, 
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.email, 
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
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
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: _accept,
                        child: Text('Accept'),
                      ),
                      // ElevatedButton(
                      //   onPressed: () {
                      //     //_reject;
                      //   },
                      //   child: Text('Reject'),
                      // ),
                    ],
                  ),
                ],
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
