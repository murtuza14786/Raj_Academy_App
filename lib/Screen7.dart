import 'package:flutter/material.dart';
import 'custom_bottom_nav_bar.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';

class profile extends StatefulWidget {
  final bool openDrawer;
  const profile({super.key, this.openDrawer = false});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  File? selectedFile;

  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image, // or FileType.any
      allowMultiple: false,
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      int sizeInBytes = await file.length();

      if (sizeInBytes <= 1024 * 1024) {
        // File is under 1MB
        setState(() {
          selectedFile = file;
        });
      } else {
        // Show warning
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("File size must be under 1MB")),
        );
      }
    }
  }
  bool changebutton = false;


  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

      if (args != null && args['openDrawer'] == true) {
        _scaffoldKey.currentState?.openDrawer();
      }
    });
  }


  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Logout"),
          content: Text("Are you sure you want to logout?"),
          actions: [
            TextButton(
              child: Text("No"),
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
            ),
            ElevatedButton(
              child: Text("Yes"),
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                // Perform logout operation
                Navigator.pushReplacementNamed(context, '/loginpage'); // example
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     key: _scaffoldKey,
     backgroundColor: Color.fromRGBO(248, 248, 248, 1),
     appBar: AppBar(
       backgroundColor: Colors.white,
       title: Text("Edit Profile",style: TextStyle(
           fontSize: 16,
           fontWeight: FontWeight.w400,
           fontFamily: 'SFProText',
           color: Color.fromRGBO(24, 24, 24, 1)
       ),),
       actions: [
         IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none)),
         IconButton(onPressed: (){}, icon: Icon(Icons.menu))
       ],
     ),
     drawer: Drawer(
       backgroundColor: Color.fromRGBO(255, 255, 255, 1),
       child: DrawerHeader(
           child: Stack(
             children:[
               Text("Profile",style: TextStyle(
                 fontFamily: 'Montserrat',
                 fontWeight: FontWeight.bold,
                 fontSize: 17,
                 color: Colors.black
               ),),
               Align(
                 alignment: Alignment.topLeft,
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     SizedBox(height: 50),
                     Row(
                       children: [
                         SizedBox(
                           height: 64,
                           width: 64,
                           child: CircleAvatar(
                             backgroundColor: Color.fromRGBO(216,0,39,1),
                             child: Text("KN",style: TextStyle(color: Color.fromRGBO(255,255,255,1),fontSize: 21.22,fontWeight: FontWeight.w500,fontFamily: 'SFProText')),
                           ),
                         ),
                         SizedBox(width: 10),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text("Kazim Noorani",style: TextStyle(color: Color.fromRGBO(24, 24, 24, 1),fontSize: 15,fontFamily: 'SFProText',fontWeight: FontWeight.w500),),
                             Text("+91 8999721050",style: TextStyle(color: Color.fromRGBO(67, 67, 67, 1),fontSize: 11,fontFamily: 'SFProText',fontWeight: FontWeight.w500),)
                           ],
                         ),
                         SizedBox(width: 30),
                         InkWell(
                           onTap: ()async {
                             setState(() {
                               changebutton = true;
                             });

                             // Navigate to Inquiries
                             await Future.delayed(Duration(seconds: 1));
                             await Navigator.pushNamed(context, '/profile');

                             setState(() {
                               changebutton = false;
                             });
                           },
                             child: Text("Edit",style: TextStyle(color:Color.fromRGBO(67, 67, 67, 1),fontWeight: FontWeight.w500,fontSize: 11,decoration: TextDecoration.underline,decorationStyle: TextDecorationStyle.solid,),))
                       ],
                     ),
                     SizedBox(height: 30),
                     InkWell(
                       onTap: ()async {
                         setState(() {
                           changebutton = true;
                         });

                         // Navigate to Inquiries
                         await Future.delayed(Duration(seconds: 1));
                         await Navigator.pushNamed(context, '/profile', arguments: {'openDrawer': true});


                         setState(() {
                           changebutton = false;
                         });
                       },
                       child: ListTile(
                           leading:Container(
                             height: 40,
                             width: 40,
                             decoration: BoxDecoration(
                               color: Color.fromRGBO(255, 192, 90, 0.15),
                               borderRadius: BorderRadius.circular(9),
                             ),
                             child: Image.asset("assets/drawer_home.png",height: 20,width: 20,)
                           ),
                           title: Text("Home",style: TextStyle(fontFamily: 'SFProText',fontWeight: FontWeight.w400,fontSize: 13,),),
                           trailing:  Row(
                             mainAxisSize: MainAxisSize.min,
                             children: [
                               Icon(Icons.navigate_next,size: 25,color: Color.fromRGBO(18, 18, 18, 1),),
                             ],
                           )
                       ),
                     ),
                     Divider(thickness: 0.5),
                     InkWell(
                       onTap: ()async {
                         setState(() {
                           changebutton = true;
                         });

                         // Navigate to Inquiries
                         await Future.delayed(Duration(seconds: 1));
                         await Navigator.pushNamed(context, '/AddInquiry');

                         setState(() {
                           changebutton = false;
                         });
                       },
                       child: ListTile(
                           leading:Container(
                               height: 40,
                               width: 40,
                               decoration: BoxDecoration(
                                 color: Color.fromRGBO(255,90,90,0.15),
                                 borderRadius: BorderRadius.circular(9),

                               ),
                               child: Image.asset("assets/drawer_user-tag.png",height: 20,width: 20,)
                           ),
                           title: Text("Add Inquiry",style: TextStyle(fontFamily: 'SFProText',fontWeight: FontWeight.w400,fontSize: 13,),),
                           trailing:  Row(
                             mainAxisSize: MainAxisSize.min,
                             children: [
                               Icon(Icons.navigate_next,size: 25,color: Color.fromRGBO(18, 18, 18, 1),),
                             ],
                           )
                       ),
                     ),
                     Divider(thickness: 0.5),
                     InkWell(
                       onTap: ()async {
                         setState(() {
                           changebutton = true;
                         });

                         // Navigate to Inquiries
                         await Future.delayed(Duration(seconds: 1));
                         await Navigator.pushNamed(context, '/newAdmission');

                         setState(() {
                           changebutton = false;
                         });
                       },
                       child: ListTile(
                           leading:Container(
                               height: 40,
                               width: 40,
                               decoration: BoxDecoration(
                                 color: Color.fromRGBO(90,127,255,0.15),
                                 borderRadius: BorderRadius.circular(9),
                               ),
                               child: Image.asset("assets/drawer_user-circle-add.png",height: 20,width: 20,)
                           ),
                           title: Text("Admission",style: TextStyle(fontFamily: 'SFProText',fontWeight: FontWeight.w400,fontSize: 13,),),
                           trailing:  Row(
                             mainAxisSize: MainAxisSize.min,
                             children: [
                               Icon(Icons.navigate_next,size: 25,color: Color.fromRGBO(18, 18, 18, 1),),
                             ],
                           )
                       ),
                     ),
                     Divider(thickness: 0.5),
                     InkWell(
                       onTap: ()async {
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
                       child: ListTile(
                           leading:Container(
                               height: 40,
                               width: 40,
                               decoration: BoxDecoration(
                                 color: Color.fromRGBO(202,90,255,0.15),
                                 borderRadius: BorderRadius.circular(9),
                               ),
                               child: Image.asset("assets/drawer_inquiries.png",height: 20,width: 20,)
                           ),
                           title: Text("Inquiries",style: TextStyle(fontFamily: 'SFProText',fontWeight: FontWeight.w400,fontSize: 13,),),
                           trailing:  Row(
                             mainAxisSize: MainAxisSize.min,
                             children: [
                               Icon(Icons.navigate_next,size: 25,color: Color.fromRGBO(18, 18, 18, 1),),
                             ],
                           )
                       ),
                     ),
                     Divider(thickness: 0.5),
                     InkWell(
                       onTap: ()async {
                         setState(() {
                           changebutton = true;
                         });

                         // Navigate to Inquiries
                         await Future.delayed(Duration(seconds: 1));
                         await Navigator.pushNamed(context, '/certificateRequest');

                         setState(() {
                           changebutton = false;
                         });
                       },
                       child: ListTile(
                           leading:Container(
                               height: 40,
                               width: 40,
                               decoration: BoxDecoration(
                                 color: Color.fromRGBO(78,255,181,0.15),
                                 borderRadius: BorderRadius.circular(9),
                               ),
                               child: Image.asset("assets/drawer_certificate-request.png",height: 6,width: 6,)
                           ),
                           title: Text("Certificate request",softWrap: false,overflow: TextOverflow.visible,style: TextStyle(fontFamily: 'SFProText',fontWeight: FontWeight.w400,fontSize: 13,),),
                           trailing:  Row(
                             mainAxisSize: MainAxisSize.min,
                             children: [
                               Icon(Icons.navigate_next,size: 25,color: Color.fromRGBO(18, 18, 18, 1),),
                             ],
                           )
                       ),
                     ),
                     Divider(thickness: 0.5),
                     ListTile(
                       onTap: (){
                         _showLogoutDialog(context);
                       },
                         leading:Container(
                             height: 40,
                             width: 40,
                             decoration: BoxDecoration(
                               color: Color.fromRGBO(78,187,255,0.15),
                               borderRadius: BorderRadius.circular(9),
                             ),
                             child: Image.asset("assets/drawer_logout.png",height: 16,width: 16,)
                         ),
                         title: Text("Logout",style: TextStyle(fontFamily: 'SFProText',fontWeight: FontWeight.w400,fontSize: 13,),),
                         trailing:  Row(
                           mainAxisSize: MainAxisSize.min,
                           children: [
                             Icon(Icons.navigate_next,size: 25,color: Color.fromRGBO(18, 18, 18, 1),),
                           ],
                         )
                     ),
                   ],
                 ),
               )
             ]
           )),
     ),
     body: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
           children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Padding(
                   padding: const EdgeInsets.only(left: 2.0,right: 8.0,top: 8.0),
                   child: Text("Upload Student Photo",style: TextStyle(
                     color: Color.fromRGBO(24, 24, 24, 1),
                     fontSize: 15,
                     fontWeight: FontWeight.w400,
                     fontFamily: 'SFProText',
                   )),
                 ),
               ],
             ),

             Padding(
               padding: const EdgeInsets.only(right:20.0),
               child: Text("Select and upload the files of your choice",style: TextStyle(
                 color: Color.fromRGBO(18, 18, 18, 0.4),
                 fontSize: 14,
                 fontWeight: FontWeight.w400,
                 fontFamily: 'SFProText',
               ),),
             ),
             SizedBox(height: 5,),
             Container(
               width: 370,
               height: 190,
               decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(12.0),
                   border: Border.all(
                       color: Color.fromRGBO(24, 24, 24, 0.05),
                       width: 1.0
                   )
               ),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   SizedBox(height: 4),
                   Image.asset("assets/cloud-add.jpg"),
                   SizedBox(height: 10),
                   Text("Choose a file or drag & drop it here",style: TextStyle(
                     color: Colors.black,
                     fontSize: 15,
                     fontWeight: FontWeight.w400,
                     fontFamily: 'SFProText',
                   ),),
                   Text("JPEG, PNG formats, up to 1MB",style: TextStyle(
                     color: Color.fromRGBO(18, 18, 18, 0.4),
                     fontSize: 15,
                     fontWeight: FontWeight.w400,
                   ),),
                   selectedFile != null
                       ? Image.file(selectedFile!, height: 150)
                       : Text("No file selected"),
                   SizedBox(height: 20),
                   ElevatedButton(
                     onPressed: pickFile,style: ElevatedButton.styleFrom(
                       side: BorderSide.none,
                       foregroundColor: Color.fromRGBO(24, 24, 24, 0.05),
                       padding: EdgeInsets.only(top: 6,right: 7,bottom: 6,left: 7)
                   ),
                     child: Text("Browse File",style: TextStyle(
                         color: Color.fromRGBO(24, 24, 24, 0.4),
                         fontSize: 11,
                         fontWeight: FontWeight.w500,
                         fontFamily: 'SFProText'
                     ),),)
                 ],
               ),
             ),
             SizedBox(height: 5.0),
             Container(
               height: 75,
               width: 370,
               decoration: BoxDecoration(
                 color: Color.fromRGBO(238, 241, 247, 1),
                 borderRadius: BorderRadius.circular(12.0),
               ),
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Padding(
                   padding: const EdgeInsets.only(left: 14.0,right: 8.0,top: 8.0,bottom: 8.0),
                   child: Text("Full Name",style: TextStyle(
                     color: Color.fromRGBO(24, 24, 24, 1),
                     fontSize: 15,
                     fontWeight: FontWeight.w400,
                     fontFamily: 'SFProText',
                   )),
                 )],
             ),
             SizedBox(
                 width: 370,
                 child: TextFormField(
                     style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),
                     decoration: InputDecoration(
                       hintText: 'Enter your name',
                       hintStyle: TextStyle(color: Colors.black),
                       filled: true,
                       fillColor: Colors.white.withOpacity(0.9),
                       border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(12),
                           borderSide: BorderSide.none
                       ),
                       enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(12),
                         borderSide: BorderSide.none,
                       ),
                       focusedBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(12),
                         borderSide: BorderSide.none,
                       ),)
                 )),
             Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Padding(
                   padding: const EdgeInsets.only(left: 14.0,right: 8.0,top: 8.0,bottom: 8.0),
                   child: Text("Mobile Number",style: TextStyle(
                     color: Color.fromRGBO(24, 24, 24, 1),
                     fontSize: 15,
                     fontWeight: FontWeight.w400,
                     fontFamily: 'SFProText',
                   )),
                 ),
               ],
             ),
             SizedBox(
                 width: 370,
                 child: TextFormField(
                     style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),
                     decoration: InputDecoration(
                       hintText: 'Enter your mobile number',
                       hintStyle: TextStyle(color: Colors.black),
                       filled: true,
                       fillColor: Colors.white.withOpacity(0.9),
                       border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(12),
                           borderSide: BorderSide.none
                       ),
                       enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(12),
                         borderSide: BorderSide.none,
                       ),
                       focusedBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(12),
                         borderSide: BorderSide.none,
                       ),)
                 )
             ),
             SizedBox(height: 20 ),
             SizedBox(
               width: 369,
               height: 44,
               child: ElevatedButton(onPressed: () {
                 print("Profile Updated successfully");
               }, style: ElevatedButton.styleFrom(
                   backgroundColor: Color.fromRGBO(237, 50, 55, 1)
               ),child: Text("Update",style: TextStyle(
                   fontFamily: 'SFProText',
                   color: Colors.white,
                   fontSize: 15,
                   fontWeight: FontWeight.w500
               ),)),
             )
           ],
         )
     ),
     bottomNavigationBar: CustomBottomNavBar(
       selectedIndex: 3,
       parentContext: context,
     ),
   );

  }
}
