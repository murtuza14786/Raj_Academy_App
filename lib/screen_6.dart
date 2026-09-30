import 'package:flutter/material.dart';
import 'custom_bottom_nav_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddInquiry extends StatefulWidget{
  const AddInquiry({super.key});

  @override
  State<AddInquiry> createState() => _AddInquiryState();
}

class _AddInquiryState extends State<AddInquiry> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final whatsappController = TextEditingController();
  final emailController = TextEditingController();
  final _dateController = TextEditingController();
  String? selectedCourse;

  String responseMessage = '';

  Future<void> submitInquiry()async{
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');

    final body =jsonEncode({
      'name':nameController.text,
      'mobile':mobileController.text,
      'whatsapp':whatsappController.text,
      'email':emailController.text,
      'dob':_dateController.text,
      'course':selectedCourse
    });
    print(body);
    try
    {
      final response= await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: body,
      );
      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        setState(() {
          responseMessage = 'Inquiry submitted successfully! ID: ${data['name']}';
        });
        _formKey.currentState!.reset();
        selectedCourse = null;
      } else {
        setState(() {
          responseMessage = 'Failed to submit: ${response.statusCode}';
        });
      }
    }catch(e){
      setState(() {
        responseMessage='Error:$e';
      });
    }

  }
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
        backgroundColor: Colors.white,
        title: Text("Add inquiry",style: TextStyle(
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
      body: SingleChildScrollView(
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
                )
            ),
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
                    controller: _controller,
                    validator: (value) =>
                    value!.isEmpty ? 'Please select course' : null,
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
              ),
              SizedBox(height: 10,),
              SizedBox(
                width: 369,
                height: 44,
                child: ElevatedButton(onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    submitInquiry();
                  }
                }, style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(237, 50, 55, 1)
                ),child: Text("Submit inquiry",style: TextStyle(
                    fontFamily: 'SFProText',
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500
                ),)),
              ),
              SizedBox(height: 10),
              Text(responseMessage,style: TextStyle(color: Colors.green),)
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: 1,
        parentContext: context,
      ),
    );
  }
}