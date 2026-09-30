import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'custom_bottom_nav_bar.dart';

class newAdmission extends StatefulWidget{
  const newAdmission({super.key});

  @override
  State<newAdmission> createState() => _newAdmissionState();
}

class _newAdmissionState extends State<newAdmission> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  final nameController = TextEditingController();
  final addressline1Controller = TextEditingController();
  final addressline2Controller = TextEditingController();
  final mobileController = TextEditingController();
  final whatsappController = TextEditingController();
  final pincodeController = TextEditingController();
  final emailController = TextEditingController();
  final _dateController = TextEditingController();


  List<String> emiOptions = ['3 Months', '6 Months', '9 Months', '12 Months'];

  void _openEmiSelection() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            children: emiOptions.map((option) {
              return GestureDetector(
                onTap: () {
                  _controller.text = option;
                  Navigator.pop(context);
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      option,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
  File? selectedFile;

  void pickFile() async {
    PlatformFile? result = await FilePicker.pickFile(
  type: FileType.image,
);

    if (result != null && result.path != null) {
  File file = File(result.path!);
  int sizeInBytes = await file.length();

  if (sizeInBytes <= 1024 * 1024) {
    // File is under 1MB
    setState(() {
      selectedFile = file;
    });
  } else {
    // Show warning
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("File size must be under 1MB"),
      ),
    );
   }
  }
  }

  final Map<String, bool> days = {
  'Monday': false,
  'Tuesday': false,
  'Wednesday': false,
  'Thursday': false,
  'Friday': false,
  'Saturday': false,
  'Sunday': false,
  };
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }
  final TextEditingController _timeController = TextEditingController();

  Future<void> _selectTime() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      // Format time like "10:30 AM"
      final localizations = MaterialLocalizations.of(context);
      final formattedTime = localizations.formatTimeOfDay(picked);

      setState(() {
        _timeController.text = formattedTime;
      });
    }
  }



  void _openCitySelection() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          children: ['Mahuva', 'Bhavnagar', 'Talaja','Rajula'].map((item) {
            return ListTile(
              title: Text(item),
              onTap: () {
                setState(() {
                  _controller.text = item;
                });
                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }
  void _openOccupationSelection() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          children: ['Business', 'Job','Part-time'].map((item) {
            return ListTile(
              title: Text(item),
              onTap: () {
                setState(() {
                  _controller.text = item;
                });
                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }
  void _openCourseTypeSelection() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          children: ['Designing', 'Web Development', 'App Development','Full-Stack Development'].map((item) {
            return ListTile(
              title: Text(item),
              onTap: () {
                setState(() {
                  _controller.text = item;
                });
                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }
  void _openCourseSelection() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          children: ['PHP', 'Web Designing', 'Tally','Java'].map((item) {
            return ListTile(
              title: Text(item),
              onTap: () {
                setState(() {
                  _controller.text = item;
                });
                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 248, 248, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        title: Text("New Admission",style: TextStyle(
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
      body:SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                Padding(
                    padding: const EdgeInsets.only(left: 14.0,right: 8.0,top: 8.0,bottom: 8.0),
                    child: Text("Full Name",style: TextStyle(
                    color: Color.fromRGBO(24, 24, 24, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                        fontFamily: 'SFProText',
                )),
                )],
              ),
              SizedBox(
              width: 370,
              child: TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  validator: (value) =>
                  value!.isEmpty ? 'Please enter your name' : null,
                style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),
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
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'SFProText',
                    )),
                  ),
                ],
              ),

            SizedBox(
                width: 370,
                child: TextFormField(
                    controller: mobileController,
                    keyboardType: TextInputType.phone,
                    validator: (value) =>
                    value!.isEmpty ? 'Please enter mobile number' : null,
                    style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0,right: 8.0,top: 8.0,bottom: 8.0),
                    child: Text("Whatsapp Number",style: TextStyle(
                      color: Color.fromRGBO(24, 24, 24, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'SFProText',
                    )),
                  ),
                ],
              ),

              SizedBox(
                  width: 370,
                  child: TextFormField(
                      controller: whatsappController,
                      keyboardType: TextInputType.phone,
                      validator: (value) =>
                      value!.isEmpty ? 'Please enter whatsapp number' : null,
                      style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        hintText: 'Enter your whatsapp number',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0,right: 8.0,top: 8.0,bottom: 8.0),
                    child: Text("Email Address (optional)",style: TextStyle(
                      color: Color.fromRGBO(24, 24, 24, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'SFProText',
                    )),
                  ),
                ],
              ),

              SizedBox(
                  width: 370,
                  child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        hintText: 'Enter your email',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0,right: 8.0,top: 8.0,bottom: 8.0),
                    child: Text("DOB",style: TextStyle(
                      color: Color.fromRGBO(24, 24, 24, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'SFProText',
                    )),
                  ),
                ],
              ),

              SizedBox(
                  width: 370,
                  child: TextFormField(
                      style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),
                      controller: _dateController,
                      validator: (value) =>
                      value!.isEmpty ? 'Please enter DOB' : null,
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: 'Enter your DOB',
                        hintStyle: TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.9),
                        suffixIcon: Icon(Icons.calendar_today_outlined),

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
                        ),),
                    onTap: () => _selectDate(context),
                  )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0,right: 8.0,top: 8.0,bottom: 8.0),
                    child: Text("Address line 1",style: TextStyle(
                      color: Color.fromRGBO(24, 24, 24, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'SFProText',
                    )),
                  ),
                ],
              ),

              SizedBox(
                  width: 370,
                  child: TextFormField(
                      controller: addressline1Controller,
                      keyboardType: TextInputType.text,
                      validator: (value) =>
                      value!.isEmpty ? 'Please enter your address' : null,
                      style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        hintText: '',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0,right: 8.0,top: 8.0,bottom: 8.0),
                    child: Text("Address line 2 (Optional)",style: TextStyle(
                      color: Color.fromRGBO(24, 24, 24, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'SFProText',
                    )),
                  ),
                ],
              ),
              SizedBox(
                  width: 370,
                  child: TextFormField(
                      controller: addressline2Controller,
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        hintText: '',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0,right: 8.0,top: 8.0,bottom: 8.0),
                    child: Text("Select City",style: TextStyle(
                      color: Color.fromRGBO(24, 24, 24, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'SFProText',
                    )),
                  ),
                ],
              ),

              SizedBox(
                  width: 370,
                  child: TextFormField(
                      controller: _controller,
                      validator: (value) =>
                      value!.isEmpty ? 'Please select city' : null,
                      readOnly: true,
                      style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        hintText: 'Tap to Select',
                        suffixIcon: Icon(Icons.navigate_next),
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
                        ),),
                    onTap: _openCitySelection,
                  )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0,right: 8.0,top: 8.0,bottom: 8.0),
                    child: Text("Pincode",style: TextStyle(
                      color: Color.fromRGBO(24, 24, 24, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'SFProText',
                    )),
                  ),
                ],
              ),
              SizedBox(
                  width: 370,
                  child: TextFormField(
                      controller: pincodeController,
                      keyboardType: TextInputType.phone,
                      validator: (value) =>
                      value!.isEmpty ? 'Please enter pincode' : null,
                      style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        hintText: 'Enter pincode',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0,right: 8.0,top: 8.0,bottom: 8.0),
                    child: Text("Occupation",style: TextStyle(
                      color: Color.fromRGBO(24, 24, 24, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'SFProText',
                    )),
                  ),
                ],
              ),

              SizedBox(
                  width: 370,
                  child: TextFormField(
                    controller: _controller,
                    validator: (value) =>
                    value!.isEmpty ? 'Please select occupation' : null,
                    readOnly: true,
                    style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                      hintText: 'Tap to Select',
                      suffixIcon: Icon(Icons.navigate_next),
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
                      ),),
                    onTap: _openOccupationSelection,
                  )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0,right: 8.0,top: 8.0,bottom: 8.0),
                    child: Text("Course Type",style: TextStyle(
                      color: Color.fromRGBO(24, 24, 24, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'SFProText',
                    )),
                  ),
                ],
              ),

              SizedBox(
                  width: 370,
                  child: TextFormField(
                    controller: _controller,
                    readOnly: true,
                    validator: (value) =>
                    value!.isEmpty ? 'Please select course type' : null,
                    style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                      hintText: 'Tap to Select',
                      suffixIcon: Icon(Icons.navigate_next),
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
                      ),),
                    onTap: _openCourseTypeSelection,
                  )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0,right: 8.0,top: 8.0,bottom: 8.0),
                    child: Text("Select Course",style: TextStyle(
                      color: Color.fromRGBO(24, 24, 24, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'SFProText',
                    )),
                  ),
                ],
              ),

              SizedBox(
                  width: 370,
                  child: TextFormField(
                    validator: (value) =>
                    value!.isEmpty ? 'Please select course' : null,
                    controller: _controller,
                    readOnly: true,
                    style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                      hintText: 'Tap to Select',
                      suffixIcon: Icon(Icons.navigate_next),
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
                      ),),
                    onTap: _openCourseSelection,
                  )
              ),Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0,right: 8.0,top: 8.0,bottom: 8.0),
                    child: Text("Select Date",style: TextStyle(
                      color: Color.fromRGBO(24, 24, 24, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'SFProText',
                    )),
                  ),
                ],
              ),

              SizedBox(
                  width: 370,
                  child: TextFormField(
                    style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),
                    controller: _dateController,
                    readOnly: true,
                    validator: (value) =>
                    value!.isEmpty ? 'Please enter joining date' : null,
                    decoration: InputDecoration(
                      hintText: 'Enter joining date',
                      hintStyle: TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.9),
                      suffixIcon: Icon(Icons.calendar_today_outlined),

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
                      ),),
                    onTap: () => _selectDate(context),
                  )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0,right: 8.0,top: 8.0,bottom: 8.0),
                    child: Text("Batch Details",style: TextStyle(
                      color: Color.fromRGBO(24, 24, 24, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'SFProText',
                    )),
                  ),
                ],
              ),
              Wrap(
                spacing: 25,
                runSpacing: 10,
                children: days.entries.map((entry) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        value: entry.value,
                        onChanged: (bool? newValue) {
                          setState(() {
                            days[entry.key] = newValue!;
                          });
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      Text(entry.key),
                    ],
                  );
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0,right: 8.0,top: 8.0,bottom: 8.0),
                    child: Text("Batch Timing",style: TextStyle(
                      color: Color.fromRGBO(24, 24, 24, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'SFProText',
                    )),
                  ),
                ],
              ),
              SizedBox(
                  width: 370,
                  child: TextFormField(
                    style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),
                    controller: _timeController,
                    readOnly: true,
                    validator: (value) =>
                    value!.isEmpty ? 'Please enter batch timings' : null,
                    decoration: InputDecoration(
                      hintText: 'Enter batch timing',
                      hintStyle: TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.9),
                      suffixIcon: Icon(Icons.access_time),
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
                      ),),
                    onTap: () => _selectTime(),
                  )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0,right: 8.0,top: 8.0,bottom: 8.0),
                    child: Text("Upload Student Photo",style: TextStyle(
                      color: Color.fromRGBO(24, 24, 24, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'SFProText',
                    )),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right:32.0),
                child: Text("Select and upload the files of your choice",style: TextStyle(
                  color: Color.fromRGBO(18, 18, 18, 0.4),
                  fontSize: 13,
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
                  borderRadius: BorderRadius.circular(12.0)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.cloud_upload_outlined),
                    SizedBox(height: 10),
                    Text("Choose a file or drag & drop it here",style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'SFProText',
                    ),),
                    Text("JPEG, PNG formats, up to 1MB",style: TextStyle(
                      color: Color.fromRGBO(18, 18, 18, 0.4),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),),
                  SizedBox(height: 5),
                  selectedFile != null
                      ? Image.file(selectedFile!, height: 150)
                      : Text("No file selected",style: TextStyle(fontSize: 13),),
                  SizedBox(height: 20),
                    ElevatedButton(onPressed: pickFile,style: ElevatedButton.styleFrom(
                      side: BorderSide.none,
                      foregroundColor: Color.fromRGBO(24, 24, 24, 0.05),
                      padding: EdgeInsets.only(top: 6,right: 7,bottom: 6,left: 7)
                    ), child: Text("Browse File",style: TextStyle(
                      color: Color.fromRGBO(24, 24, 24, 0.4),
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'SFProText'
                    ),),)
                  ],
                ),

              ),
              SizedBox(
                height: 10,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0,right: 8.0,top: 8.0,bottom: 8.0),
                    child: Text("Down Payment",style: TextStyle(
                      color: Color.fromRGBO(24, 24, 24, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'SFProText',
                    )),
                  ),
                ],
              ),
              SizedBox(
                  width: 370,
                  child: TextFormField(
                      style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        hintText: 'Enter your down payment amount',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0,right: 8.0,top: 8.0,bottom: 8.0),
                    child: Text("EMI Payment",style: TextStyle(
                      color: Color.fromRGBO(24, 24, 24, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'SFProText',
                    )),
                  ),
                ],
              ),
              SizedBox(
                  width: 370,
                  child: TextFormField(
                    controller: _controller,
                    readOnly: true,
                    style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                      hintText: 'Select EMI',
                      suffixIcon: Icon(Icons.navigate_next),
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
                      ),),
                    onTap: _openEmiSelection,
                  )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0,right: 8.0,top: 8.0,bottom: 8.0),
                    child: Text("Discount(%)",style: TextStyle(
                      color: Color.fromRGBO(24, 24, 24, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'SFProText',
                    )),
                  ),
                ],
              ),
              SizedBox(
                  width: 370,
                  child: TextFormField(
                      style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        hintText: 'Enter discount',
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
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0,right: 8.0,top: 8.0,bottom: 8.0),
                    child: Text("Total Payment",style: TextStyle(
                      color: Color.fromRGBO(24, 24, 24, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'SFProText',
                    )),
                  ),
                  Text("₹ 10,000/- ",style: TextStyle(
                    color: Color.fromRGBO(24, 24, 24, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'SFProText',
                    ))
                ],
              ),
              Divider(thickness: 0.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0, top: 8.0, bottom: 8.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(3, 138, 0, 0.1),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Text(
                        "Discount 10%",
                        style: TextStyle(
                          color: Color.fromRGBO(3, 138, 0, 1),
                          fontFamily: 'SFProText',
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 14.0),
                    child: Text(
                      "-₹ 1,000/-",
                      style: TextStyle(
                        color: Color.fromRGBO(216, 0, 39, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'SFProText',
                      ),
                    ),
                  ),
                ],
              ),
              Divider(thickness: 0.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0,right: 8.0,top: 8.0,bottom: 8.0),
                    child: Text("Down Payment",style: TextStyle(
                      color: Color.fromRGBO(24, 24, 24, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'SFProText',
                    )),
                  ),
                  Text("₹ 2,000/- ",style: TextStyle(
                    color: Color.fromRGBO(0, 186,79, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'SFProText',
                  ))
                ],
              ),
              Divider(thickness: 0.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0,right: 8.0,top: 8.0,bottom: 8.0),
                    child: Text("EMI X 4",style: TextStyle(
                      color: Color.fromRGBO(24, 24, 24, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'SFProText',
                    )),
                  ),
                  Text("₹ 1,750/- ",style: TextStyle(
                    color: Color.fromRGBO(24,24,24, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'SFProText',
                  ))
                ],
              ),
              Divider(thickness: 0.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0,right: 8.0,top: 8.0,bottom: 8.0),
                    child: Text("Total Payment",style: TextStyle(
                      color: Color.fromRGBO(24, 24, 24, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'SFProText',
                    )),
                  ),
                  Text("₹ 7,000/- ",style: TextStyle(
                    color: Color.fromRGBO(0,186,79, 1),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'SFProText',
                  ))
                ],
              ),
              SizedBox(height: 10,),
              SizedBox(
                width: 369,
                height: 44,
                child: ElevatedButton(onPressed: () {
                  print("Application submitted successfully..");
                }, style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(237, 50, 55, 1)
                ),child: Text("Submit Application",style: TextStyle(
                  fontFamily: 'SFProText',
                    color: Colors.white,
                    fontSize: 15,
                  fontWeight: FontWeight.w500
                ),)),
              ),
              SizedBox(height: 12)
            ]
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: 2,
        parentContext: context,
      ),
    );
  }
}