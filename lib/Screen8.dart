import 'package:flutter/material.dart';

class ActiveStudent extends StatefulWidget {
  const ActiveStudent({super.key});

  @override
  State<ActiveStudent> createState() => _ActiveStudentState();
}

class _ActiveStudentState extends State<ActiveStudent> {
  bool changebutton = false;
  String? selectedDate;
  String? selectedActive;
  String? selectedCourse;

  List<String> dateOptions = ['Today', 'Yesterday', 'Last Week'];
  List<String> activeOptions = ['Active', 'Inactive'];
  List<String> courseOptions = ['Web Designing', 'Tally', 'PHP'];

  Widget _customSizedDropdown({
    required String hint,
    required String? selectedValue,
    required List<String> items,
    required ValueChanged<String?> onChanged,
    double? width,
    required double height,
  }) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9), // Transparent white
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Color.fromRGBO(226, 226, 226, 1)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue,
          isExpanded: true, // Makes sure text wraps inside
          isDense: true, // Reduces vertical padding
          icon: Icon(Icons.keyboard_arrow_down, size: 14),
          dropdownColor: Colors.white,
          onChanged: onChanged,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w400,
            fontFamily: 'SFProText',
            color: Color.fromRGBO(24, 24, 24, 1),
          ),
          hint: Text(
            hint,
            overflow: TextOverflow.visible,
          ),
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 248, 248, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        title: Text(
          "Active Student",
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'SFProText',
              color: Color.fromRGBO(24, 24, 24, 1)),
        ),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60), // Adjust height as needed
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
            child: Container(
              height: 44,
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5), // light grey
                borderRadius: BorderRadius.circular(30), // pill shape
              ),
              child: TextField(
                style: TextStyle(fontSize: 15),
                decoration: InputDecoration(
                  hintText: 'Search student',
                  hintStyle: TextStyle(
                      color: Color.fromRGBO(24, 24, 24, 0.3),
                      fontFamily: 'AktivGroteskCorp',
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                ),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none)),
          IconButton(onPressed: () {}, icon: Icon(Icons.menu))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _customSizedDropdown(
                    hint: "Date modify",
                    selectedValue: selectedDate,
                    items: dateOptions,
                    onChanged: (val) {
                      setState(() => selectedDate = val);
                    },
                    width: 95,
                    height: 25,
                  ),
                  SizedBox(width: 8),
                  IntrinsicWidth(
                    child: _customSizedDropdown(
                      hint: "Status",
                      selectedValue: selectedActive,
                      items: activeOptions,
                      onChanged: (val) {
                        setState(() => selectedActive = val);
                      },
                      width: null,
                      height: 25,
                    ),
                  ),
                  SizedBox(width: 8),
                  IntrinsicWidth(
                    child: _customSizedDropdown(
                      hint: "Course",
                      selectedValue: selectedCourse,
                      items: courseOptions,
                      onChanged: (val) {
                        setState(() => selectedCourse = val);
                      },
                      width: null,
                      height: 25,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Stack(children: [
                  CircleAvatar(
                    backgroundColor: Color.fromRGBO(216, 0, 39, 0.2),
                    child: Text("KR",
                        style: TextStyle(
                            color: Color.fromRGBO(216, 0, 39, 1),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'SFProText')),
                  ),
                  Positioned(
                      top: 2,
                      right: 2,
                      child: Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(0, 216, 9, 1),
                        ),
                      ))
                ]),
                title: Text(
                  "Kishan Ravaliya",
                  style: TextStyle(
                      fontFamily: 'SFProText',
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                ),
                subtitle: Text("Web Designing",
                    style: TextStyle(
                        fontFamily: 'SFProText',
                        fontWeight: FontWeight.w400,
                        fontSize: 12)),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '15/08/2024',
                          style: TextStyle(
                              color: Color.fromRGBO(24, 24, 24, 1),
                              fontFamily: 'SFProText',
                              fontSize: 8,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.red,
                        child: Icon(
                          Icons.navigate_next,
                          size: 17,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () async {
                        setState(() {
                          changebutton = true;
                        });
                        await Future.delayed(Duration(seconds: 1));
                        await Navigator.pushNamed(context, '/StudentDetails');

                        setState(() {
                          changebutton = false;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Divider(),
              ListTile(
                leading: Stack(children: [
                  CircleAvatar(
                    backgroundColor: Color.fromRGBO(17, 0, 216, 0.2),
                    child: Text("KP",
                        style: TextStyle(
                            color: Color.fromRGBO(17, 0, 216, 1),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'SFProText')),
                  ),
                  Positioned(
                      top: 2,
                      right: 2,
                      child: Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(0, 216, 9, 1),
                        ),
                      ))
                ]),
                title: Text("Kashyp Parikh",
                    style: TextStyle(
                      fontFamily: 'SFProText',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    )),
                subtitle: Text("Tally",
                    style: TextStyle(
                        fontFamily: 'SFProText',
                        fontWeight: FontWeight.w400,
                        fontSize: 12)),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '15/08/2024',
                          style: TextStyle(
                              color: Color.fromRGBO(24, 24, 24, 1),
                              fontFamily: 'SFProText',
                              fontSize: 8,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.red,
                      child: Icon(
                        Icons.navigate_next,
                        size: 17,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              ListTile(
                leading: Stack(children: [
                  CircleAvatar(
                    backgroundColor: Color.fromRGBO(0, 164, 216, 0.2),
                    child: Text("PM",
                        style: TextStyle(
                            color: Color.fromRGBO(0, 164, 216, 1),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'SFProText')),
                  ),
                  Positioned(
                      top: 2,
                      right: 2,
                      child: Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(0, 216, 9, 1),
                        ),
                      ))
                ]),
                title: Text(
                  "Priya Mehta",
                  style: TextStyle(
                    fontFamily: 'SFProText',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                subtitle: Text("PHP",
                    style: TextStyle(
                        fontFamily: 'SFProText',
                        fontWeight: FontWeight.w400,
                        fontSize: 12)),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '15/08/2024',
                          style: TextStyle(
                              color: Color.fromRGBO(24, 24, 24, 1),
                              fontFamily: 'SFProText',
                              fontSize: 8,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.red,
                      child: GestureDetector(
                        child: Icon(
                          Icons.navigate_next,
                          size: 17,
                          color: Colors.white,
                        ),
                        onTap: () async {
                          setState(() {
                            changebutton = true;
                          });

                          // Navigate to Inquiries
                          await Future.delayed(Duration(seconds: 1));
                          await Navigator.pushNamed(context, '/StudentDetails');

                          setState(() {
                            changebutton = false;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              ListTile(
                leading: Stack(children: [
                  CircleAvatar(
                    backgroundColor: Color.fromRGBO(0, 216, 9, 0.2),
                    child: Text("PC",
                        style: TextStyle(
                            color: Color.fromRGBO(0, 216, 9, 1),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'SFProText')),
                  ),
                  Positioned(
                      top: 2,
                      right: 2,
                      child: Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(0, 216, 9, 1),
                        ),
                      ))
                ]),
                title: Text(
                  "Puja Chuhan",
                  style: TextStyle(
                    fontFamily: 'SFProText',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                subtitle: Text("PHP",
                    style: TextStyle(
                        fontFamily: 'SFProText',
                        fontWeight: FontWeight.w400,
                        fontSize: 12)),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '15/08/2024',
                          style: TextStyle(
                              color: Color.fromRGBO(24, 24, 24, 1),
                              fontFamily: 'SFProText',
                              fontSize: 8,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.red,
                      child: Icon(
                        Icons.navigate_next,
                        size: 17,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              ListTile(
                  leading: Stack(children: [
                    CircleAvatar(
                      backgroundColor: Color.fromRGBO(17, 0, 216, 0.2),
                      child: Text("KP",
                          style: TextStyle(
                              color: Color.fromRGBO(17, 0, 216, 1),
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'SFProText')),
                    ),
                    Positioned(
                        top: 2,
                        right: 2,
                        child: Container(
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(0, 216, 9, 1),
                          ),
                        ))
                  ]),
                  title: Text(
                    "Kashyp Parikh",
                    style: TextStyle(
                      fontFamily: 'SFProText',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  subtitle: Text("Tally",
                      style: TextStyle(
                          fontFamily: 'SFProText',
                          fontWeight: FontWeight.w400,
                          fontSize: 12)),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '15/08/2024',
                            style: TextStyle(
                                color: Color.fromRGBO(24, 24, 24, 1),
                                fontFamily: 'SFProText',
                                fontSize: 8,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.red,
                        child: Icon(
                          Icons.navigate_next,
                          size: 17,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )),
              Divider(),
              ListTile(
                  leading: Stack(children: [
                    CircleAvatar(
                      backgroundColor: Color.fromRGBO(0, 164, 216, 0.2),
                      child: Text("PM",
                          style: TextStyle(
                              color: Color.fromRGBO(0, 164, 216, 1),
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'SFProText')),
                    ),
                    Positioned(
                        top: 2,
                        right: 2,
                        child: Container(
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(0, 216, 9, 1),
                          ),
                        ))
                  ]),
                  title: Text(
                    "Priya Maheta",
                    style: TextStyle(
                      fontFamily: 'SFProText',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  subtitle: Text("PHP",
                      style: TextStyle(
                          fontFamily: 'SFProText',
                          fontWeight: FontWeight.w400,
                          fontSize: 12)),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '18/08/2024',
                            style: TextStyle(
                                color: Color.fromRGBO(24, 24, 24, 1),
                                fontFamily: 'SFProText',
                                fontSize: 8,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.red,
                        child: Icon(
                          Icons.navigate_next,
                          size: 17,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )),
              Divider(),
              ListTile(
                  leading: Stack(children: [
                    CircleAvatar(
                      backgroundColor: Color.fromRGBO(0, 216, 9, 0.2),
                      child: Text("PC",
                          style: TextStyle(
                              color: Color.fromRGBO(0, 216, 9, 1),
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'SFProText')),
                    ),
                    Positioned(
                        top: 2,
                        right: 2,
                        child: Container(
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(0, 216, 9, 1),
                          ),
                        ))
                  ]),
                  title: Text(
                    "Puja Chuhan",
                    style: TextStyle(
                      fontFamily: 'SFProText',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  subtitle: Text("PHP",
                      style: TextStyle(
                          fontFamily: 'SFProText',
                          fontWeight: FontWeight.w400,
                          fontSize: 12)),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '20/08/2024',
                            style: TextStyle(
                                color: Color.fromRGBO(24, 24, 24, 1),
                                fontFamily: 'SFProText',
                                fontSize: 8,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.red,
                        child: Icon(
                          Icons.navigate_next,
                          size: 17,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )),
              Divider(),
              ListTile(
                  leading: Stack(children: [
                    CircleAvatar(
                      backgroundColor: Color.fromRGBO(17, 0, 216, 0.2),
                      child: Text("KP",
                          style: TextStyle(
                              color: Color.fromRGBO(17, 0, 216, 1),
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'SFProText')),
                    ),
                    Positioned(
                        top: 2,
                        right: 2,
                        child: Container(
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(0, 216, 9, 1),
                          ),
                        ))
                  ]),
                  title: Text(
                    "Kashyp Parikh",
                    style: TextStyle(
                      fontFamily: 'SFProText',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  subtitle: Text("Tally",
                      style: TextStyle(
                          fontFamily: 'SFProText',
                          fontWeight: FontWeight.w400,
                          fontSize: 12)),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '15/08/2024',
                            style: TextStyle(
                                color: Color.fromRGBO(24, 24, 24, 1),
                                fontFamily: 'SFProText',
                                fontSize: 8,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.red,
                        child: Icon(
                          Icons.navigate_next,
                          size: 17,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )),
              Divider(),
              ListTile(
                  leading: Stack(children: [
                    CircleAvatar(
                      backgroundColor: Color.fromRGBO(0, 164, 216, 0.2),
                      child: Text("PM",
                          style: TextStyle(
                              color: Color.fromRGBO(0, 164, 216, 1),
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'SFProText')),
                    ),
                    Positioned(
                        top: 2,
                        right: 2,
                        child: Container(
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(232, 0, 14, 1),
                          ),
                        ))
                  ]),
                  title: Text(
                    "Priya Maheta",
                    style: TextStyle(
                      fontFamily: 'SFProText',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  subtitle: Text("PHP",
                      style: TextStyle(
                          fontFamily: 'SFProText',
                          fontWeight: FontWeight.w400,
                          fontSize: 12)),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '18/08/2024',
                            style: TextStyle(
                                color: Color.fromRGBO(24, 24, 24, 1),
                                fontFamily: 'SFProText',
                                fontSize: 8,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.red,
                        child: Icon(
                          Icons.navigate_next,
                          size: 17,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )),
              Divider(),
              ListTile(
                  leading: Stack(children: [
                    CircleAvatar(
                      backgroundColor: Color.fromRGBO(0, 216, 9, 0.2),
                      child: Text("PC",
                          style: TextStyle(
                              color: Color.fromRGBO(0, 216, 9, 1),
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'SFProText')),
                    ),
                    Positioned(
                        top: 2,
                        right: 2,
                        child: Container(
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(232, 0, 14, 1),
                          ),
                        ))
                  ]),
                  title: Text(
                    "Puja Chuhan",
                    style: TextStyle(
                      fontFamily: 'SFProText',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  subtitle: Text("PHP",
                      style: TextStyle(
                          fontFamily: 'SFProText',
                          fontWeight: FontWeight.w400,
                          fontSize: 12)),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '20/08/2024',
                            style: TextStyle(
                                color: Color.fromRGBO(24, 24, 24, 1),
                                fontFamily: 'SFProText',
                                fontSize: 8,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.red,
                        child: Icon(
                          Icons.navigate_next,
                          size: 17,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
