import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'custom_bottom_nav_bar.dart';

class EditProfile extends StatefulWidget{
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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