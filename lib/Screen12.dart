import 'package:flutter/material.dart';

class certificateRequest extends StatefulWidget{
  const certificateRequest({super.key});

  @override
  State<certificateRequest> createState() => _certificateRequestState();
}

class _certificateRequestState extends State<certificateRequest> {
  bool changebutton = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 248, 248, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        title: Text("Certificate Request",style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: 'SFProText',
            color: Color.fromRGBO(24, 24, 24, 1)
        ),),
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
                  hintStyle: TextStyle(color: Color.fromRGBO(24,24,24,0.3),fontFamily:'AktivGroteskCorp',fontSize: 14,fontWeight: FontWeight.w400),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 12,horizontal: 12),
                ),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none)),
          IconButton(onPressed: (){}, icon: Icon(Icons.menu))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                leading:CircleAvatar(
                  backgroundColor: Color.fromRGBO(216,0, 39, 0.2),
                  child: Text("KR",style: TextStyle(color: Color.fromRGBO(216,0, 39, 1),fontSize: 15,fontWeight: FontWeight.w500,fontFamily: 'SFProText')),
                ),
                title: Text("Kishan Ravaliya",style: TextStyle(fontFamily: 'SFProText',fontWeight: FontWeight.w400,fontSize: 12),),
                subtitle: Text("Web Designing",style: TextStyle(fontFamily: 'SFProText',fontWeight: FontWeight.w400,fontSize: 11)),
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
                        radius: 10,
                        backgroundColor: Colors.red,
                        child: Icon(Icons.navigate_next,size: 15,color: Colors.white,),
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
              Divider(thickness: 0.5,),
              ListTile(
                leading:  CircleAvatar(
                  backgroundColor: Color.fromRGBO(17, 0, 216, 0.2),
                  child: Text("KP",style: TextStyle(color: Color.fromRGBO(17, 0, 216, 1),fontSize: 15,fontWeight: FontWeight.w500,fontFamily: 'SFProText')),
                ),
                title: Text("Kashyp Parikh",style: TextStyle(fontFamily: 'SFProText',fontWeight: FontWeight.w400,fontSize: 12,)),
                subtitle: Text("Tally",style: TextStyle(fontFamily: 'SFProText',fontWeight: FontWeight.w400,fontSize: 11)),
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
                      radius: 10,
                      backgroundColor: Colors.red,
                      child: Icon(Icons.navigate_next,size: 15,color: Colors.white,),
                    ),
                  ],
                ),
              ),
              Divider(thickness: 0.5,),
              ListTile(
                leading:CircleAvatar(
                  backgroundColor: Color.fromRGBO(0, 164, 216, 0.2),
                  child: Text("PM",style: TextStyle(color: Color.fromRGBO(0,164, 216, 1),fontSize: 15,fontWeight: FontWeight.w500,fontFamily: 'SFProText')),
                ),
                title: Text("Priya Mehta",style: TextStyle(fontFamily: 'SFProText',fontWeight: FontWeight.w400,fontSize: 12,),),
                subtitle: Text("PHP",style: TextStyle(fontFamily: 'SFProText',fontWeight: FontWeight.w400,fontSize: 11)),
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
                      radius: 10,
                      backgroundColor: Colors.red,
                      child: GestureDetector(child: Icon(Icons.navigate_next,size: 15,color: Colors.white,),
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
              Divider(thickness: 0.5,),
              ListTile(
                leading:CircleAvatar(
                  backgroundColor: Color.fromRGBO(0,216,9,0.2),
                  child: Text("PC",style: TextStyle(color: Color.fromRGBO(0,216,9,1),fontSize: 15,fontWeight: FontWeight.w500,fontFamily: 'SFProText')),
                ),
                title: Text("Puja Chuhan",style: TextStyle(fontFamily: 'SFProText',fontWeight: FontWeight.w400,fontSize: 12,),),
                subtitle: Text("PHP",style: TextStyle(fontFamily: 'SFProText',fontWeight: FontWeight.w400,fontSize: 11)),
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
                      radius: 10,
                      backgroundColor: Colors.red,
                      child: Icon(Icons.navigate_next,size: 15,color: Colors.white,),
                    ),
          
                  ],
                ),
              ),
              Divider(thickness: 0.5,),
              ListTile(
                  leading:CircleAvatar(
                    backgroundColor: Color.fromRGBO(17,0,216,0.2),
                    child: Text("KP",style: TextStyle(color: Color.fromRGBO(17,0,216,1),fontSize: 15,fontWeight: FontWeight.w500,fontFamily: 'SFProText')),
                  ),
                  title: Text("Kashyp Parikh",style: TextStyle(fontFamily: 'SFProText',fontWeight: FontWeight.w400,fontSize: 12,),),
                  subtitle: Text("Tally",style: TextStyle(fontFamily: 'SFProText',fontWeight: FontWeight.w400,fontSize: 11)),
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
                        radius: 10,
                        backgroundColor: Colors.red,
                        child: Icon(Icons.navigate_next,size: 15,color: Colors.white,),
                      ),
                    ],
                  )
              ),
              Divider(thickness: 0.5,),
              ListTile(
                  leading:CircleAvatar(
                    backgroundColor: Color.fromRGBO(0, 164, 216, 0.2),
                    child: Text("PM",style: TextStyle(color: Color.fromRGBO(0,164, 216, 1),fontSize: 15,fontWeight: FontWeight.w500,fontFamily: 'SFProText')),
                  ),
                  title: Text("Priya Maheta",softWrap:false,overflow: TextOverflow.visible,style: TextStyle(fontFamily: 'SFProText',fontWeight: FontWeight.w400,fontSize: 12,),),
                  subtitle: Text("PHP",style: TextStyle(fontFamily: 'SFProText',fontWeight: FontWeight.w400,fontSize: 11)),
                  trailing:  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 75,
                            height: 25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                  color: Color.fromRGBO(24, 24, 24, 0.05),
                                  width: 1.0,
                                )
                            ),
                            child: InkWell(
                                child: Center(child: Text(" Payment due",softWrap:false,overflow:TextOverflow.visible,style: TextStyle(color: Color.fromRGBO(24, 24, 24, 0.4),fontFamily: 'SFProText',fontSize: 8,fontWeight: FontWeight.w400),))),
                          ),
                        ],
                      ),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '18/08/2024',
                            style: TextStyle(color: Color.fromRGBO(24, 24, 24, 1),fontFamily: 'SFProText',fontSize: 8,fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(width: 8,),
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.red,
                        child: Icon(Icons.navigate_next,size: 15,color: Colors.white,),
                      ),
                    ],
                  )
              ),
              Divider(thickness: 0.5,),
              ListTile(
                  leading:CircleAvatar(
                    backgroundColor: Color.fromRGBO(0,216,9,0.2),
                    child: Text("PC",style: TextStyle(color: Color.fromRGBO(0,216,9,1),fontSize: 15,fontWeight: FontWeight.w500,fontFamily: 'SFProText')),
                  ),
                  title: Text("Puja Chuhan",style: TextStyle(fontFamily: 'SFProText',fontWeight: FontWeight.w400,fontSize: 12,),),
                  subtitle: Text("PHP",style: TextStyle(fontFamily: 'SFProText',fontWeight: FontWeight.w400,fontSize: 11)),
                  trailing:  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '20/08/2024',
                            style: TextStyle(color: Color.fromRGBO(24, 24, 24, 1),fontFamily: 'SFProText',fontSize: 8,fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(width: 8,),
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.red,
                        child: Icon(Icons.navigate_next,size: 15,color: Colors.white,),
                      ),
                    ],
                  )
              ),
              Divider(thickness: 0.5,),
              ListTile(
                  leading:CircleAvatar(
                    backgroundColor: Color.fromRGBO(17,0,216,0.2),
                    child: Text("KP",style: TextStyle(color: Color.fromRGBO(17,0,216,1),fontSize: 15,fontWeight: FontWeight.w500,fontFamily: 'SFProText')),
                  ),
                  title: Text("Kashyp Parikh",softWrap:false,overflow:TextOverflow.visible,style: TextStyle(fontFamily: 'SFProText',fontWeight: FontWeight.w400,fontSize: 12,),),
                  subtitle: Text("Tally",style: TextStyle(fontFamily: 'SFProText',fontWeight: FontWeight.w400,fontSize: 11)),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 75,
                            height: 25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                  color: Color.fromRGBO(24, 24, 24, 0.05),
                                  width: 1.0,
                                )
                            ),
                            child: InkWell(
                                child: Center(child: Text(" Payment due",softWrap:false,overflow:TextOverflow.visible,style: TextStyle(color: Color.fromRGBO(24, 24, 24, 0.4),fontFamily: 'SFProText',fontSize: 8,fontWeight: FontWeight.w400),))),
                          ),
                        ],
                      ),
                      SizedBox(width: 8),
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
                        radius: 10,
                        backgroundColor: Colors.red,
                        child: Icon(Icons.navigate_next,size: 15,color: Colors.white,),
                      ),
                    ],
                  )
              ),
              Divider(thickness: 0.5,),
              ListTile(
                  leading:CircleAvatar(
                    backgroundColor: Color.fromRGBO(0, 164, 216, 0.2),
                    child: Text("PM",style: TextStyle(color: Color.fromRGBO(0,164, 216, 1),fontSize: 15,fontWeight: FontWeight.w500,fontFamily: 'SFProText')),
                  ),
                  title: Text("Priya Maheta",softWrap: false,overflow:TextOverflow.visible,style: TextStyle(fontFamily: 'SFProText',fontWeight: FontWeight.w400,fontSize: 12,),),
                  subtitle: Text("PHP",style: TextStyle(fontFamily: 'SFProText',fontWeight: FontWeight.w400,fontSize: 11)),
                  trailing:  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 75,
                        height: 25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: Color.fromRGBO(24, 24, 24, 0.05),
                              width: 1.0,
                            )
                        ),
                        child: InkWell(
                            child: Center(child: Text(" Payment due",softWrap:false,overflow:TextOverflow.visible,style: TextStyle(color: Color.fromRGBO(24, 24, 24, 0.4),fontFamily: 'SFProText',fontSize: 8,fontWeight: FontWeight.w400),))),
                      ),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '18/08/2024',
                            style: TextStyle(color: Color.fromRGBO(24, 24, 24, 1),fontFamily: 'SFProText',fontSize: 8,fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(width: 8,),
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.red,
                        child: Icon(Icons.navigate_next,size: 15,color: Colors.white,),
                      ),
                    ],
                  )
              ),
              Divider(thickness: 0.5,),
              ListTile(
                  leading:CircleAvatar(
                    backgroundColor: Color.fromRGBO(0,216,9,0.2),
                    child: Text("PC",style: TextStyle(color: Color.fromRGBO(0,216,9,1),fontSize: 15,fontWeight: FontWeight.w500,fontFamily: 'SFProText')),
                  ),
                  title: Text("Puja Chuhan",softWrap:false,overflow:TextOverflow.visible,style: TextStyle(fontFamily: 'SFProText',fontWeight: FontWeight.w400,fontSize: 12,),),
                  subtitle: Text("PHP",style: TextStyle(fontFamily: 'SFProText',fontWeight: FontWeight.w400,fontSize: 11)),
                  trailing:  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 75,
                        height: 25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: Color.fromRGBO(24, 24, 24, 0.05),
                              width: 1.0,
                            )
                        ),
                        child: InkWell(
                            child: Center(child: Text(" Payment due",softWrap:false,overflow:TextOverflow.visible,style: TextStyle(color: Color.fromRGBO(24, 24, 24, 0.4),fontFamily: 'SFProText',fontSize: 8,fontWeight: FontWeight.w400),))),
                      ),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '20/08/2024',
                            style: TextStyle(color: Color.fromRGBO(24, 24, 24, 1),fontFamily: 'SFProText',fontSize: 8,fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(width: 8,),
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.red,
                        child: Icon(Icons.navigate_next,size: 15,color: Colors.white,),
                      ),
                    ],
                  )
              ),
              Divider(thickness: 0.5,),
            ],
          ),
        ),
      ),
    );
  }
}