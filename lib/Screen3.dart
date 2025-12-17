import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:raj_academy/Screen4.dart';
import 'package:raj_academy/Screen7.dart';
import 'custom_bottom_nav_bar.dart';

import 'Screen6.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;


  final List<Widget> _screens = [
    HomePage(),
    AddInquiry(),
    newAdmission(),
    profile(),
  ];

  final List<Map<String, String>> _navItems = [
    {
      'icon': 'assets/home.png',
      'label': 'Home',
    },
    {
      'icon': 'assets/user-tag.png',
      'label': 'Add inquiry',
    },
    {
      'icon': 'assets/user-cirlce-add.png',
      'label': 'Admission',
    },
    {
      'icon': 'assets/user-square.png',
      'label': 'Profile',
    },
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  bool changebutton = false;

  @override
  Widget build(BuildContext context) {
   return Form(
     child: Scaffold(
       backgroundColor: Color.fromRGBO(248, 248, 248, 1),
       appBar: AppBar(
         backgroundColor: Colors.white,
         leading: (
           Padding(
             padding: EdgeInsets.all(10),
           child: InkWell(
             child: CircleAvatar(
               backgroundColor: Color.fromRGBO(216, 0, 39, 1),
                 child: Text("KN",style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1),fontSize: 15,fontWeight: FontWeight.w500,fontFamily: 'SFProText')),
             ),onTap: ()async {
            setState(() {
              changebutton = true;
           });

           // Navigate to Inquiries
           await Future.delayed(Duration(seconds: 0));
           await Navigator.pushNamed(context, '/profile');

           setState(() {
           changebutton = false;
           });
           },
           ),)
         ),
         actions: [
           IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none)),
           IconButton(onPressed: (){}, icon: Icon(Icons.menu))
         ],
         title: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text("Hello, Kazim Noorani",style: TextStyle(color: Color.fromRGBO(24, 24, 24, 1),fontWeight: FontWeight.w500,fontSize: 14,fontFamily: 'SFProText')),
             Padding(
               padding: const EdgeInsets.only(right:50.0),
               child: Text("Good Morning🌤️",style: TextStyle(color:Color.fromRGBO(24, 24, 24, 0.7),fontSize: 12,fontWeight: FontWeight.w500,fontFamily: 'SFProText'),textAlign: TextAlign.left,),
             )
           ],
         ),
       ),
       body: Padding(
         padding: const EdgeInsets.all(8.0),
         child: SafeArea(
           child: SingleChildScrollView(
             child: Padding(
               padding: const EdgeInsets.all(10.0),
               child: Column(
                 children: [
                   Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: Row(
                       children: [
                         Expanded(
                           child: Container(
                             height:53,
                             width: 166.3,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(12),
                               color: Color.fromRGBO(255, 255, 255, 1),
                             ),
                             child: InkWell(
                               onTap: () async{
                                 setState(() {
                                   changebutton=true;
                                 });
                                 await Future.delayed(Duration(seconds: 1));
                                 await Navigator.pushNamed(context, '/AddInquiry');

                                 setState(() {
                                   changebutton = false;
                                 });
                               },
                               child: Row(
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Image.asset("assets/newinquiry.jpg",height:27,width:25,alignment: Alignment.center),
                                   ),
                                   SizedBox(width: 2,),
                                   Text("New Inquiry",style: TextStyle(fontSize: 14,fontFamily: 'SFProText'),),
                                 ],
                               ),
                             )
                           ),
                         ),
                         SizedBox(width: 5,),
                         Expanded(
                           child: Container(
                               height:53,
                               width: 166.3,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(12),
                                 color: Color.fromRGBO(255, 255, 255, 1),
                               ),
                               child: InkWell(
                                 onTap: () async{
                                   setState(() {
                                     changebutton=true;
                                   });
                                   await Future.delayed(Duration(seconds: 1));
                                   await Navigator.pushNamed(context, '/newAdmission');

                                   setState(() {
                                     changebutton = false;
                                   });
                                 },
                                 child: Row(
                                   children: [
                                     Padding(
                                       padding: const EdgeInsets.all(2.0),
                                       child: Image.asset("assets/newadmission.jpg",height:27,width:26,alignment: Alignment.center),
                                     ),
                                     SizedBox(width: 5,),
                                     Text("New admission",style: TextStyle(fontSize: 14,fontFamily: 'SFProText'),),
                                   ],
                                 ),
                               ),
                           ),
                         ),
                       ],
                     ),
                   ),
                   SizedBox(height: 2),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text("Today’s total collection",
                         style: TextStyle(fontSize: 16,fontWeight:FontWeight.w500,color: Color.fromRGBO(24, 24, 24, 1)),
                         textAlign: TextAlign.left,),
                      SizedBox(height: 8),
                       Container(
                         height: 232,
                         width: 370,
                         decoration: BoxDecoration(
                           color: Colors.white,
                           borderRadius: BorderRadius.circular(18.0)
                         ),
                         padding: EdgeInsets.all(8.0),
                         child: Column(
                           children: [
                             Row(
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                 Text("Today’s total collection | ",style: TextStyle(
                                   fontFamily: 'SFProText',
                                   fontWeight: FontWeight.w500,
                                   fontSize: 14,
                                   color: Color.fromRGBO(24, 24, 24, 1)
                                 ),),
                                 Text("₹2,12,840",style: TextStyle(
                                     fontFamily: 'SFProText',
                                     fontWeight: FontWeight.w500,
                                     fontSize: 14,
                                     color: Colors.green,
                                 ),)
                               ],
                             ),
                             SizedBox(height: 16),
                             Row(
                               children: [
                                 CircularPercentIndicator(
                                   radius: 59.04,
                                   lineWidth: 6.37,
                                   percent: 0.89,
                                   center: Text("89%",style: GoogleFonts.montserrat(textStyle: TextStyle(
                                     fontSize: 30,
                                     fontWeight: FontWeight.w600,
                                     color: Color.fromRGBO(0, 186, 79, 1),
                                   )),),
                                   progressColor: Colors.green,
                                   backgroundColor: Colors.grey[300]!,
                                   circularStrokeCap: CircularStrokeCap.round,
                                 ),
                                 SizedBox(width: 20,),
                                 Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text("New collection",style: TextStyle(
                                       fontSize: 14,
                                       fontWeight: FontWeight.w500,
                                       fontFamily: 'SFProText',
                                     ),),
                                     Text("₹ 1,56,420",
                                         style: TextStyle(fontSize: 14, color: Colors.black54),),
                                     SizedBox(height: 12),
                                     Text("Old collection",style: TextStyle(
                                       fontSize: 14,
                                       fontWeight: FontWeight.w500,
                                       fontFamily: 'SFProText',
                                     ),),
                                     Text("₹ 56,420",
                                       style: TextStyle(fontSize: 14, color: Colors.black54),),
                                   ],
                                 )
                               ],
                             ),
                             SizedBox(height: 16),
                             Divider(),
                             Expanded(
                               child: GestureDetector(
                                 onTap: (){

                                 },
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Text("Pending collection | ₹ 23,700",style: TextStyle(
                                       fontSize: 14,
                                       fontWeight: FontWeight.w400,
                                       color: Color.fromRGBO(216, 0, 39, 1)
                                     ),),
                                    CircleAvatar(
                                      radius: 12,
                                      backgroundColor: Colors.red,
                                      child: Icon(Icons.navigate_next,size: 17,color: Colors.white,),
                                    )
                                   ],
                                 ),
                               ),
                             )
                           ],
                         ),
                       ),
                       SizedBox(height: 10),
                       Text("Today’s Follow up inquiries",style: TextStyle(
                         fontSize: 16,
                         fontWeight: FontWeight.w500,
                       ),),
                       SizedBox(height: 10),
                       Container(
                         width: 370,
                         height:264,
                         decoration: BoxDecoration(
                           color: Color.fromRGBO(255, 255, 255, 1),
                           borderRadius: BorderRadius.circular(18.0)
                         ),
                         child: Column(
                           children: [
                             ListTile(
                               leading:CircleAvatar(
                                 backgroundColor: Color.fromRGBO(216, 0, 39, 0.2),
                                 child: Text("KR",style: TextStyle(color: Color.fromRGBO(216, 0, 39, 1),fontSize: 15,fontWeight: FontWeight.w500,fontFamily: 'SFProText')),
                               ),
                               title: Text("Kishan Ravaliya",style: TextStyle(fontSize: 14),),
                               subtitle: Text("Web Designing",style: TextStyle(fontSize: 12),),
                               trailing: CircleAvatar(
                                 radius: 10,
                                 backgroundColor: Colors.red,
                                 child: Icon(Icons.navigate_next,size: 15,color: Colors.white,),
                               )
                             ),
                             Divider(),
                             ListTile(
                               leading:  CircleAvatar(
                                 backgroundColor: Color.fromRGBO(17, 0, 216, 0.2),
                                 child: Text("KP",style: TextStyle(color: Color.fromRGBO(17, 0, 216, 1),fontSize: 15,fontWeight: FontWeight.w500,fontFamily: 'SFProText')),
                               ),
                               title: Text("Kashyp Parikh",style: TextStyle(fontSize: 14),),
                               subtitle: Text("Tally",style: TextStyle(fontSize: 12),),
                               trailing: CircleAvatar(
                                 radius: 10,
                                 backgroundColor: Colors.red,
                                 child: Icon(Icons.navigate_next,size: 15,color: Colors.white,),
                               )
                             ),
                             Divider(),
                             ListTile(
                               leading:CircleAvatar(
                                 backgroundColor: Color.fromRGBO(0, 164, 216, 0.2),
                                 child: Text("PM",style: TextStyle(color: Color.fromRGBO(0,164, 216, 1),fontSize: 15,fontWeight: FontWeight.w500,fontFamily: 'SFProText')),
                               ),
                               title: Text("Priya Mehta",style: TextStyle(fontSize: 14),),
                               subtitle: Text("PHP",style: TextStyle(fontSize: 12),),
                               trailing: CircleAvatar(
                                 radius: 10,
                                 backgroundColor: Colors.red,
                                 child: Icon(Icons.navigate_next,size: 15,color: Colors.white,),
                               )
                             ),
                           ],
                         ),
                       ),
                       SizedBox(
                         height: 7,
                       ),
                       SizedBox(
                         width: 369,
                         height: 44,
                         child: ElevatedButton(
                           onPressed: () async {
                             setState(() {
                               changebutton = true;
                             });

                             // Navigate to Inquiries
                             await Future.delayed(Duration(seconds: 1));
                             await Navigator.pushNamed(context, '/InquiriesPage');

                             setState(() {
                               changebutton = false;
                             });
                           },
                           style: ElevatedButton.styleFrom(
                             backgroundColor: Color.fromRGBO(237, 50, 55, 1),
                           ),
                           child: Text(
                             "Explore more",
                             style: TextStyle(
                               fontFamily: 'SFProText',
                               color: Colors.white,
                               fontSize: 15,
                               fontWeight: FontWeight.w500,
                             ),
                           ),
                         ),
                       ),
                       SizedBox(height: 10,),
                       SizedBox(
                         width: 370,
                         height: 53,
                         child: ElevatedButton(
                           onPressed: () async {
                             setState(() {
                               changebutton = true;
                             });

                             // Navigate to Inquiries
                             await Future.delayed(Duration(seconds: 1));
                             await Navigator.pushNamed(context, '/ActiveStudent');

                             setState(() {
                               changebutton = false;
                             });
                           },
                           style: ElevatedButton.styleFrom(
                             backgroundColor: Color.fromRGBO(255,255,255,1),
                           ),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               SizedBox(
                                 height: 25,
                                 width: 25,
                                 child: Image.asset("assets/user-octagon.png"),
                               ),
                               SizedBox(width: 7,),
                               Text(
                                 "Active Student",
                                 style: TextStyle(
                                   fontFamily: 'SFProText',
                                   color: Color.fromRGBO(24, 24, 24, 1),
                                   fontSize: 14,
                                   fontWeight: FontWeight.w500,
                                 ),
                               ),
                             ],
                           ),
                         ),
                       ),
                       SizedBox(height: 8,),
                       Row(
                         children: [
                           Expanded(
                             child: SizedBox(
                               width: 184,
                               height: 53,
                               child: ElevatedButton(
                                 onPressed: () async {
                                   setState(() {
                                     changebutton = true;
                                   });

                                   await Future.delayed(Duration(seconds: 1));
                                   await Navigator.pushNamed(context, '/newCollection');

                                   setState(() {
                                     changebutton = false;
                                   });
                                 },
                                 style: ElevatedButton.styleFrom(
                                   backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                                 ),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     Image.asset("assets/group.png", height: 23, width: 23),
                                     SizedBox(width: 7),
                                     Flexible(
                                       child: Text(
                                         "New Collection",
                                         overflow: TextOverflow.visible,
                                         softWrap: false,
                                         style: TextStyle(
                                           fontFamily: 'SFProText',
                                           color: Color.fromRGBO(24, 24, 24, 1),
                                           fontSize: 13,
                                           fontWeight: FontWeight.w500,
                                         ),
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                             ),
                           ),
                           SizedBox(width: 4),
                           Expanded(
                             child: SizedBox(
                               width: 177,
                               height: 53,
                               child: ElevatedButton(
                                 onPressed: () async {
                                   setState(() {
                                     changebutton = true;
                                   });

                                   await Future.delayed(Duration(seconds: 1));
                                   await Navigator.pushNamed(context, '/oldCollection');

                                   setState(() {
                                     changebutton = false;
                                   });
                                 },
                                 style: ElevatedButton.styleFrom(
                                   backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                                 ),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     Image.asset("assets/old-collection.png", height: 23, width: 23),
                                     SizedBox(width: 7),
                                     Flexible(
                                       child: Text(
                                         "Old Collection",
                                         overflow: TextOverflow.visible,
                                         softWrap: false,
                                         style: TextStyle(
                                           fontFamily: 'SFProText',
                                           color: Color.fromRGBO(24, 24, 24, 1),
                                           fontSize: 13,
                                           fontWeight: FontWeight.w500,
                                         ),
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                             ),
                           ),
                         ],
                       ),

                       SizedBox(height: 10,),
                       SizedBox(
                         width: 370,
                         height: 53,
                         child: ElevatedButton(
                           onPressed: () async {
                             setState(() {
                               changebutton = true;
                             });

                             // Navigate to Inquiries
                             await Future.delayed(Duration(seconds: 1));
                             await Navigator.pushNamed(context, '/DailyReport');

                             setState(() {
                               changebutton = false;
                             });
                           },
                           style: ElevatedButton.styleFrom(
                             backgroundColor: Color.fromRGBO(255,255,255,1),
                           ),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               SizedBox(
                                 height: 25,
                                 width: 25,
                                 child: Image.asset("assets/receipt-search.png"),
                               ),
                               SizedBox(width: 7,),
                               Text(
                                 "Daily Report",
                                 style: TextStyle(
                                   fontFamily: 'SFProText',
                                   color: Color.fromRGBO(24, 24, 24, 1),
                                   fontSize: 14,
                                   fontWeight: FontWeight.w500,
                                 ),
                               ),
                             ],
                           ),
                         ),
                       ),

                     ],
                   ),
                 ],
               ),
             ),
           ),
         ),
       ),
    bottomNavigationBar: CustomBottomNavBar(
      selectedIndex: 0,
      parentContext: context,
    ),
     ),
   );
  }
}