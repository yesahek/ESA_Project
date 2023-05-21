// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_sup_app/utils/home_button.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/global_variables.dart';
import '../../widget/announsement_card.dart';
import '../../widget/my_appBar.dart';
import '../../widget/searchBar.dart';
import '../../widget/text_book_grid.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //*******Home Screen Buttens List******* */

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
              SizedBox(
                //width: 100,
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  //shrinkWrap: true,
                  itemCount: 5,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  itemBuilder: (BuildContext context, int index) {
                    Divider();
                    return const AnnounsementCard();
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
                      return ToosButton(
                        color: Colors.red,
                        value: tools[i].notifcation,
                        icon: tools[i].icon,
                        index: i,
                        widget: tools[i].widget,
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
                        Text(
                          "More >>",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
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
    );
  }
}

class ToosButton extends StatelessWidget {
  final Widget widget;
  final int index;
  final Icon icon;
  final Color color;
  final int value;

  const ToosButton({
    Key? key,
    required this.widget,
    required this.index,
    required this.icon,
    required this.color,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => tools[index].widget,
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
                  child: tools[index].icon,
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
                      color:
                          color != null ? color : Theme.of(context).accentColor,
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
            tools[index].name,
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
