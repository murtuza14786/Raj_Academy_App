import 'package:flutter/material.dart';
import 'custom_bottom_nav_bar.dart';

class StudentDetails extends StatelessWidget
{
  const StudentDetails({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 248, 248, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        title: Text("Kishan Ravaliya",style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: 'SFProText',
            color: Color.fromRGBO(24, 24, 24, 1)
        ),),
        elevation: 0,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none)),
          IconButton(onPressed: (){}, icon: Icon(Icons.menu))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0,bottom: 8.0,top: 8.0,right: 4.0),
          child: Column(
            children: [
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 2),
                  Stack(
                      children: [
                        SizedBox(
                          height: 58,
                          width: 58,
                          child: CircleAvatar(
                            backgroundColor: Color.fromRGBO(216,0,39,0.2),
                            child: Text("KR",style: TextStyle(color: Color.fromRGBO(216,0,39,1),fontSize: 21.22,fontWeight: FontWeight.w500,fontFamily: 'SFProText')),
                          ),
                        ),
                        Positioned(top: 5,right: 5,child: Container(
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(0, 216, 9, 1),
                          ),
                        ))
                      ]
                  ),
                  SizedBox(width: 10),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Kishan Ravaliya",style: TextStyle(color: Color.fromRGBO(24, 24, 24, 1),fontSize: 18,fontFamily: 'SFProText',fontWeight: FontWeight.w400),),
                        Text("kishanravaliya1997@gmail.com",style: TextStyle(color: Color.fromRGBO(24, 24, 24, 1),fontSize: 14,fontFamily: 'SFProText',fontWeight: FontWeight.w400),)
                      ],
                    ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                  width: 430,
                  color: Color.fromRGBO(255, 255, 255, 1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Row(
                        children: [

                          Text("Student ID: 738946237842",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,fontFamily: 'SFProText',color: Color.fromRGBO(24, 24, 24, 1)),),
                        ],
                      ),
                      Divider(thickness: 0.5,),
                      Row(
                        children: [

                          Text("Individual course: Java Core",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,fontFamily: 'SFProText',color: Color.fromRGBO(24, 24, 24, 1)),),
                        ],
                      ),
                      Divider(thickness: 0.5,),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          Image.asset("assets/call-calling.png",height: 18,width: 18,),
                          SizedBox(width: 5,),
                          Text("+91 8999721050",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,fontFamily: 'SFProText'),),
                          SizedBox(width: 100),
                          ElevatedButton(
                            onPressed: () {
                              // Your call logic here
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(216, 0, 39,1),
                              
                            ),
                            child: Text('Call now',style: TextStyle(color: Colors.white,fontSize: 11,fontWeight: FontWeight.w500,fontFamily: 'SFProText'),),
                          ),
                        ],
                      ),
                      Divider(thickness: 0.5,),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          Image.asset("assets/Whatsapp.png",height: 17,width: 16.92,),
                          SizedBox(width: 5,),
                          Text("+91 8999721050",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,fontFamily: 'SFProText'),)
                        ],
                      ),
                      Divider(thickness: 0.5,),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          Image.asset("assets/calendar-edit.png",height: 18,width: 18,),
                          SizedBox(width: 5,),
                          Text("DOB: 21/08/1997",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,fontFamily: 'SFProText'),)
                        ],
                      ),
                      Divider(thickness: 0.5,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text("Address:",style: TextStyle(color: Color.fromRGBO(24, 24, 24, 1),fontSize: 14,fontWeight: FontWeight.bold,fontFamily: 'SFProText'),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2.0),
                            child: Text("Citygate, 720, New, near Vishala Restaurant, Shantabag Society, Rehnuma Society, Vasna, Ahmedabad, Gujarat 380007",style: TextStyle(fontFamily: 'SFProText',color: Color.fromRGBO(24, 24, 24, 1),fontSize: 14,fontWeight: FontWeight.w400),),
                          ),
                        ],
                      ),
                      Divider(thickness: 0.5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Start date: 5/06/2024",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,fontFamily: 'SFProText'),),
                          VerticalDivider(thickness: 0.5,),
                          Text("End date: 5/09/2024",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,fontFamily: 'SFProText'),)
                        ],
                      ),
                      Divider(thickness: 0.5,),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset("assets/clock.png",height: 18,width: 18,),
                          SizedBox(width: 5),
                          Text("Batch timing: 07:00 PM To 08:00 PM",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,fontFamily: 'SFProText'),)
                        ],
                      ),
                      Divider(thickness: 0.5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
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
                            padding: const EdgeInsets.only( top: 8.0, bottom: 8.0),
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
                            padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
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
                            padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
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
                            child: Text("Payment Status",style: TextStyle(
                              color: Color.fromRGBO(24, 24, 24, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'SFProText',
                            )),
                          ),
                          Text("₹ 7,000/- ",style: TextStyle(
                            color: Color.fromRGBO(24,24,24, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'SFProText',
                          ))
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                radius: 7,
                                backgroundColor: Color.fromRGBO(62, 191, 143, 1),
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 10,
                                ),
                              ),
                              SizedBox(width: 2,),
                              Padding(
                                padding: const EdgeInsets.only(right: 60.0,top: 8.0,bottom: 8.0),
                                child: Text("EMI 1 Completed by 5/07/2024",style: TextStyle(
                                  color: Color.fromRGBO(18, 18, 18, 1),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'SFProText',
                                )),
                              ),
                              Text("₹ 1,750 /- ",style: TextStyle(
                                color: Color.fromRGBO(0,186,79,1),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'SFProText',
                              ))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                radius: 7,
                                backgroundColor: Color.fromRGBO(62, 191, 143, 1),
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 10,
                                ),
                              ),
                              SizedBox(width: 2),
                              Padding(
                                padding: const EdgeInsets.only(right: 58.0,top: 8.0,bottom: 8.0),
                                child: Text("EMI 2 Completed by 5/08/2024",style: TextStyle(
                                  color: Color.fromRGBO(18, 18, 18, 1),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'SFProText',
                                )),
                              ),
                              Text("₹ 1,750 /- ",style: TextStyle(
                                color: Color.fromRGBO(0,186,79,1),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'SFProText',
                              ))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                radius: 7,
                                backgroundColor:Color.fromRGBO(154, 154, 154, 1),
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 10,
                                ),
                              ),
                              SizedBox(width: 2),
                              Padding(
                                padding: const EdgeInsets.only(right:90.0,top: 8.0,bottom: 8.0),
                                child: Text("Upcoming EMI 5/09/2024",style: TextStyle(
                                  color: Color.fromRGBO(154,154,154, 1),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'SFProText',
                                )),
                              ),
                              Text("₹ 1,750 /- ",style: TextStyle(
                                color: Color.fromRGBO(0,186,79,1),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'SFProText',
                              ))
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              SizedBox(width: 10),
                              Container(
                                height: 25,
                                width: 125,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),

                                  border: Border.all(
                                    color: Color.fromRGBO(24, 24, 24, 0.05),
                                    width: 1.0,
                                  )
                                ),
                                child: InkWell(
                                    child: Center(child: Text("Download receipt",style: TextStyle(color: Color.fromRGBO(24, 24, 24, 0.4),fontFamily: 'SFProText',fontSize: 11,fontWeight: FontWeight.w500),))),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      )
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedIndex: 0, parentContext: context),
    );
  }

}