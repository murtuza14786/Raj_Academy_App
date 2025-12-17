import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:google_fonts/google_fonts.dart';

class oldCollection extends StatefulWidget{
  const oldCollection({super.key});

  @override
  State<oldCollection> createState() => _oldCollectionState();
}

class _oldCollectionState extends State<oldCollection> {
  bool changebutton = false;
  @override
  Widget build(BuildContext context) {
      return Scaffold(

        backgroundColor: Color.fromRGBO(248,248,248,1),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          title: Text("Old Collection",style: TextStyle(
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12),
              Container(
                height: 228,
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
                          SizedBox(width: 14),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Old collection",style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'SFProText',
                                  color: Color.fromRGBO(24, 24, 24, 1)
                              ),),
                              Text("₹ 1,56,420",
                                style: TextStyle(fontSize: 14, color: Colors.black54),),
                              Text("Date: 5/07/2024 To 5/08/2024",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,fontFamily: 'SFProText'),)

                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 14),
                      Divider(thickness: 0.5),
                      Expanded(
                        child: GestureDetector(
                          onTap: (){

                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
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
                        ),
                      ),
                    ]
                ),
              ),
              SizedBox(height: 10),
              ListTile(
                leading:Stack(
                    children:[
                      CircleAvatar(
                        backgroundColor: Color.fromRGBO(216,0, 39, 0.2),
                        child: Text("KR",style: TextStyle(color: Color.fromRGBO(216,0, 39, 1),fontSize: 15,fontWeight: FontWeight.w500,fontFamily: 'SFProText')),
                      ),

                    ]
                ),
                title: Text("Kishan Ravaliya",style: TextStyle(fontFamily: 'SFProText',fontWeight: FontWeight.w400,fontSize: 14),),
                subtitle: Text("Web Designing",style: TextStyle(fontFamily: 'SFProText',fontWeight: FontWeight.w400,fontSize: 12)),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '15/08/2024',
                          style: TextStyle(color: Color.fromRGBO(24, 24, 24, 1),fontFamily: 'SFProText',fontSize: 8,fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(width: 8,),
                    GestureDetector(
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.red,
                        child: Icon(Icons.navigate_next,size: 17,color: Colors.white,),
                      ),
                      onTap: () async{
                        setState(() {
                          changebutton=true;
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
                leading:  Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color.fromRGBO(17, 0, 216, 0.2),
                        child: Text("KP",style: TextStyle(color: Color.fromRGBO(17, 0, 216, 1),fontSize: 15,fontWeight: FontWeight.w500,fontFamily: 'SFProText')),
                      ),

                    ]
                ),
                title: Text("Kashyp Parikh",style: TextStyle(fontFamily: 'SFProText',fontWeight: FontWeight.w400,fontSize: 14,)),
                subtitle: Text("Tally",style: TextStyle(fontFamily: 'SFProText',fontWeight: FontWeight.w400,fontSize: 12)),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '15/08/2024',
                          style: TextStyle(color: Color.fromRGBO(24, 24, 24, 1),fontFamily: 'SFProText',fontSize: 8,fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(width: 8,),
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.red,
                      child: Icon(Icons.navigate_next,size: 17,color: Colors.white,),
                    ),
                  ],
                ),
              ),
              Divider(),
              ListTile(
                leading:Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color.fromRGBO(0, 164, 216, 0.2),
                        child: Text("PM",style: TextStyle(color: Color.fromRGBO(0,164, 216, 1),fontSize: 15,fontWeight: FontWeight.w500,fontFamily: 'SFProText')),
                      ),

                    ]
                ),
                title: Text("Priya Mehta",style: TextStyle(fontFamily: 'SFProText',fontWeight: FontWeight.w400,fontSize: 14,),),
                subtitle: Text("PHP",style: TextStyle(fontFamily: 'SFProText',fontWeight: FontWeight.w400,fontSize: 12)),
                trailing:Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '15/08/2024',
                          style: TextStyle(color: Color.fromRGBO(24, 24, 24, 1),fontFamily: 'SFProText',fontSize: 8,fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(width: 8,),
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.red,
                      child: GestureDetector(child: Icon(Icons.navigate_next,size: 17,color: Colors.white,),
                        onTap: () async{
                          setState(() {
                            changebutton = true;
                          });

                          // Navigate to Inquiries
                          await Future.delayed(Duration(seconds: 1));
                          await Navigator.pushNamed(context, '/StudentDetails');

                          setState(() {
                            changebutton = false;
                          });
                        },),
                    ),

                  ],
                ),
              ),
              Divider(),
              ListTile(
                leading:Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color.fromRGBO(0,216,9,0.2),
                        child: Text("PC",style: TextStyle(color: Color.fromRGBO(0,216,9,1),fontSize: 15,fontWeight: FontWeight.w500,fontFamily: 'SFProText')),
                      ),

                    ]
                ),
                title: Text("Puja Chuhan",style: TextStyle(fontFamily: 'SFProText',fontWeight: FontWeight.w400,fontSize: 14,),),
                subtitle: Text("PHP",style: TextStyle(fontFamily: 'SFProText',fontWeight: FontWeight.w400,fontSize: 12)),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text(
                          '15/08/2024',
                          style: TextStyle(color: Color.fromRGBO(24, 24, 24, 1),fontFamily: 'SFProText',fontSize: 8,fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(width: 8,),
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.red,
                      child: Icon(Icons.navigate_next,size: 17,color: Colors.white,),
                    ),

                  ],
                ),
              ),
              Divider(),
            ],
          ),

        ),


      );
  }
}