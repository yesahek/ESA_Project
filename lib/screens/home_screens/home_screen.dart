// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:e_sup_app/utils/home_button.dart';

import 'package:e_sup_app/providers/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/user.dart';
import '../../utils/colors.dart';
import '../../utils/home_button.dart';
import '../../widget/announsement_card.dart';
import '../../widget/my_appBar.dart';
import '../../widget/searchBar.dart';
import '../../widget/text_book_grid.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
//Add new material button
  // void _startAddNewTextBook(BuildContext ctx, int grade) {
  //   showModalBottomSheet(
  //     context: ctx,
  //     builder: (_) {
  //       return GestureDetector(
  //         onTap: () {},
  //         child: AddNewTextBook(grade),
  //         behavior: HitTestBehavior.opaque,
  //       );
  //     },
  //   );
  // }
  List<String> announsements = [
    'https://firebasestorage.googleapis.com/v0/b/esa-project-99df9.appspot.com/o/playground%2FIMG_20230803_031441_592.jpg?alt=media&token=8e745e5f-6bb0-4cb9-a046-958899420c4e',
    'https://firebasestorage.googleapis.com/v0/b/esa-project-99df9.appspot.com/o/playground%2FIMG_20230803_031242_963.jpg?alt=media&token=06064f88-698b-477d-9f6a-e665cbdd29bc',
    'https://firebasestorage.googleapis.com/v0/b/esa-project-99df9.appspot.com/o/playground%2FIMG_20230803_024744_175.jpg?alt=media&token=f7fa6895-19da-4cf6-b0ac-f8e3edfc7170',
    'https://firebasestorage.googleapis.com/v0/b/esa-project-99df9.appspot.com/o/playground%2FIMG_20230803_024733_196.jpg?alt=media&token=c86000ea-fc8b-42a0-8fe4-554f90bd4fe5'
  ];
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    User userDetail = userProvider.getUser;
    var isEducator = userDetail.type == "Educator";
    var isStudent = userDetail.type == "Student";
    var isAdmin = userDetail.type == "Admin";
    //print(isEducator);
    final searchController = TextEditingController();
    final String textHint = "subject";
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              MyAppBar(
                backArrow: false,
                title: "Home",
                name: "",
              ),
              const SizedBox(
                height: 20,
              ),
              Search(
                searchController: searchController,
                textHint: textHint,
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                //width: 100,
                //height: 210,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 4,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  itemBuilder: (BuildContext context, int index) {
                    Divider();
                    return AnnounsementCard(
                      imageUrl: announsements[index],
                    );
                  },
                ),
              ),
              //const MyCard(),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: tools.length,
                    itemBuilder: (context, i) {
                      return isStudent
                          ? ToosButton(
                              isAdmin: isAdmin,
                              isEducator: isEducator,
                              isStudent: isStudent,
                              color: Colors.red,
                              value: tools[i].notifcation,
                              icon: tools[i].icon,
                              index: i,
                              widget: tools[i].widget,
                            )
                          : isEducator
                              ? ToosButton(
                                  isAdmin: isAdmin,
                                  isEducator: isEducator,
                                  isStudent: isStudent,
                                  color: Colors.red,
                                  value: toolsForEducator[i].notifcation,
                                  icon: toolsForEducator[i].icon,
                                  index: i,
                                  widget: toolsForEducator[i].widget,
                                )
                              : ToosButton(
                                  isAdmin: isAdmin,
                                  isEducator: isEducator,
                                  isStudent: isStudent,
                                  color: Colors.red,
                                  value: toolsForAdmin[i].notifcation,
                                  icon: toolsForAdmin[i].icon,
                                  index: i,
                                  widget: toolsForAdmin[i].widget,
                                );
                    }),
              ),

              //**********TextBooks***************
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(
                      thickness: 2,
                      color: iconColor,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Text Books",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        // Text(
                        //   "More >>",
                        //   style: TextStyle(
                        //     color: Colors.blue,
                        //     fontSize: 18,
                        //     fontWeight: FontWeight.w100,
                        //   ),
                        // ),
                      ],
                    ),
                    Divider(
                      thickness: 2,
                      color: iconColor,
                    ),
                    TextBookGrid(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButtonLocation:
      //     isEducator ? FloatingActionButtonLocation.endFloat : null,
      // floatingActionButton: !isEducator && !isStudent
      //     ? FloatingActionButton(
      //         onPressed: () => _startAddNewTextBook(
      //           context,
      //           userDetail.grade as int,
      //         ),
      //         backgroundColor: Colors.blue,
      //         child: Icon(
      //           Icons.add,
      //         ),
      //       )
      //     : null,
    );
  }
}

class ToosButton extends StatelessWidget {
  final bool isStudent;
  final bool isEducator;
  final bool isAdmin;
  final Widget widget;
  final int index;
  final Icon icon;
  final Color color;
  final int value;

  const ToosButton({
    Key? key,
    required this.isStudent,
    required this.isEducator,
    required this.isAdmin,
    required this.widget,
    required this.index,
    required this.icon,
    required this.color,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var Tool;
    if (isAdmin) {
      Tool = toolsForAdmin[index];
    } else if (isEducator) {
      Tool = toolsForEducator[index];
    } else {
      Tool = tools[index];
    }
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => Tool.widget,
            ));
      },
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                height: 55,
                width: 55,
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
                  child: Tool.icon,
                ),
              ),
              if (value >= 1)
                Positioned(
                  right: 1,
                  top: 1,
                  child: Container(
                    padding: const EdgeInsets.all(2.0),
                    // color: Theme.of(context).accentColor,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      // ignore: unnecessary_null_comparison
                      color: color != null
                          ? color
                          : Theme.of(context).colorScheme.secondary,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 25,
                      minHeight: 25,
                    ),
                    child: Text(
                      value.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Text(
            Tool.name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}
