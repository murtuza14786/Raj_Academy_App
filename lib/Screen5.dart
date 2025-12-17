import 'package:flutter/material.dart';
import 'custom_bottom_nav_bar.dart';

class InquiriesPage extends StatefulWidget{
  const InquiriesPage({super.key});

  @override
  State<InquiriesPage> createState() => _InquiriesPageState();
}

class _InquiriesPageState extends State<InquiriesPage> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Color.fromRGBO(248, 248, 248, 1),
    appBar: AppBar(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      title: Text("Inquiries",style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
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
                hintText: 'Search inquiries',
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
     body: SingleChildScrollView(
       child: Column(
         children: [
           ListTile(
               leading:CircleAvatar(
                 backgroundColor: Color.fromRGBO(216,0, 39, 0.2),
                 child: Text("KR",style: TextStyle(color: Color.fromRGBO(216,0, 39, 1),fontSize: 15,fontWeight: FontWeight.w500,fontFamily: 'SFProText')),
               ),
               title: Text("Kishan Ravaliya",style: TextStyle(fontFamily: 'SFProText',fontWeight: FontWeight.w400,fontSize: 14),),
               subtitle: Text("Web Designing",softWrap: false,overflow: TextOverflow.visible,style: TextStyle(fontFamily: 'SFProText',fontWeight: FontWeight.w400,fontSize: 12)),
               trailing: Row(
                 mainAxisSize: MainAxisSize.min,
                 children: [
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.end,
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text(
                         'Out of Date',
                         style: TextStyle(color: Color.fromRGBO(24, 24, 24, 1),fontFamily: 'SFProText',fontSize: 10,fontWeight: FontWeight.w400),
                       ),
                       Text(
                         '7/08/2024',
                         style: TextStyle(color: Color.fromRGBO(24, 24, 24, 1),fontFamily: 'SFProText',fontSize: 8,fontWeight: FontWeight.w400),
                       ),
                     ],
                   ),
                  SizedBox(width: 8,),
                   ElevatedButton(
                     onPressed: () {
                       // Your call logic here
                     },
                     style: ElevatedButton.styleFrom(
                       backgroundColor: Color.fromRGBO(216, 0, 39, 1),
                     ),
                     child: Text('Call now',style: TextStyle(color: Colors.white,fontSize: 11,fontWeight: FontWeight.w500,fontFamily: 'SFProText'),),
                   ),
                 ],
               ),
           ),
           Divider(),
           ListTile(
                 leading:  CircleAvatar(
                   backgroundColor: Color.fromRGBO(17, 0, 216, 0.2),
                   child: Text("KP",style: TextStyle(color: Color.fromRGBO(17, 0, 216, 1),fontSize: 15,fontWeight: FontWeight.w500,fontFamily: 'SFProText')),
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
                           'Out of Date',
                           style: TextStyle(color: Color.fromRGBO(24, 24, 24, 1),fontFamily: 'SFProText',fontSize: 10,fontWeight: FontWeight.w400),
                         ),
                         Text(
                           '8/08/2024',
                           style: TextStyle(color: Color.fromRGBO(24, 24, 24, 1),fontFamily: 'SFProText',fontSize: 8,fontWeight: FontWeight.w400),
                         ),
                       ],
                     ),
                     SizedBox(width: 8,),
                     ElevatedButton(
                       onPressed: () {
                         // Your call logic here
                       },
                       style: ElevatedButton.styleFrom(
                         backgroundColor: Color.fromRGBO(216, 0, 39, 1),
                       ),
                       child: Text('Call now',style: TextStyle(color: Colors.white,fontSize: 11,fontWeight: FontWeight.w500,fontFamily: 'SFProText'),),
                     ),
                   ],
                 ),
            ),
          Divider(),
          ListTile(
             leading:CircleAvatar(
               backgroundColor: Color.fromRGBO(0, 164, 216, 0.2),
               child: Text("PM",style: TextStyle(color: Color.fromRGBO(0,164, 216, 1),fontSize: 15,fontWeight: FontWeight.w500,fontFamily: 'SFProText')),
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
                       'Out of Date',
                       style: TextStyle(color: Color.fromRGBO(24, 24, 24, 1),fontFamily: 'SFProText',fontSize: 10,fontWeight: FontWeight.w400),
                     ),
                     Text(
                       '9/08/2024',
                       style: TextStyle(color: Color.fromRGBO(24, 24, 24, 1),fontFamily: 'SFProText',fontSize: 8,fontWeight: FontWeight.w400),
                     ),
                   ],
                 ),
                 SizedBox(width: 8,),
                 ElevatedButton(
                   onPressed: () {
                     // Your call logic here
                   },
                   style: ElevatedButton.styleFrom(
                     backgroundColor: Color.fromRGBO(216, 0, 39, 1),
                   ),
                   child: Text('Call now',style: TextStyle(color: Colors.white,fontSize: 11,fontWeight: FontWeight.w500,fontFamily: 'SFProText'),),
                 ),
               ],
             ),
            ),
           Divider(),
           ListTile(
               leading:CircleAvatar(
                 backgroundColor: Color.fromRGBO(0,216,9,0.2),
                 child: Text("PC",style: TextStyle(color: Color.fromRGBO(0,216,9,1),fontSize: 15,fontWeight: FontWeight.w500,fontFamily: 'SFProText')),
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
                         'Out of Date',
                         style: TextStyle(color: Color.fromRGBO(24, 24, 24, 1),fontFamily: 'SFProText',fontSize: 10,fontWeight: FontWeight.w400),
                       ),
                       Text(
                         '10/08/2024',
                         style: TextStyle(color: Color.fromRGBO(24, 24, 24, 1),fontFamily: 'SFProText',fontSize: 8,fontWeight: FontWeight.w400),
                       ),
                     ],
                   ),
                   SizedBox(width: 8,),
                   ElevatedButton(
                     onPressed: () {
                       // Your call logic here
                     },
                     style: ElevatedButton.styleFrom(
                       backgroundColor: Color.fromRGBO(216, 0, 39, 1),
                     ),
                     child: Text('Call now',style: TextStyle(color: Colors.white,fontSize: 11,fontWeight: FontWeight.w500,fontFamily: 'SFProText'),),
                   ),
                 ],
               ),
           ),
           Divider(),
           ListTile(
               leading:CircleAvatar(
                 backgroundColor: Color.fromRGBO(17,0,216,0.2),
                 child: Text("KP",style: TextStyle(color: Color.fromRGBO(17,0,216,1),fontSize: 15,fontWeight: FontWeight.w500,fontFamily: 'SFProText')),
               ),
               title: Text("Kashyp Parikh",style: TextStyle(fontFamily: 'SFProText',fontWeight: FontWeight.w400,fontSize: 14,),),
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
               )
           ),
           Divider(),
           ListTile(
               leading:CircleAvatar(
                 backgroundColor: Color.fromRGBO(0, 164, 216, 0.2),
                 child: Text("PM",style: TextStyle(color: Color.fromRGBO(0,164, 216, 1),fontSize: 15,fontWeight: FontWeight.w500,fontFamily: 'SFProText')),
               ),
               title: Text("Priya Maheta",style: TextStyle(fontFamily: 'SFProText',fontWeight: FontWeight.w400,fontSize: 14,),),
               subtitle: Text("PHP",style: TextStyle(fontFamily: 'SFProText',fontWeight: FontWeight.w400,fontSize: 12)),
               trailing:  Row(
                 mainAxisSize: MainAxisSize.min,
                 children: [
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
                     radius: 12,
                     backgroundColor: Colors.red,
                     child: Icon(Icons.navigate_next,size: 17,color: Colors.white,),
                   ),
                 ],
               )
           ),
           Divider(),
           ListTile(
               leading:CircleAvatar(
                 backgroundColor: Color.fromRGBO(0,216,9,0.2),
                 child: Text("PC",style: TextStyle(color: Color.fromRGBO(0,216,9,1),fontSize: 15,fontWeight: FontWeight.w500,fontFamily: 'SFProText')),
               ),
               title: Text("Puja Chuhan",style: TextStyle(fontFamily: 'SFProText',fontWeight: FontWeight.w400,fontSize: 14,),),
               subtitle: Text("PHP",style: TextStyle(fontFamily: 'SFProText',fontWeight: FontWeight.w400,fontSize: 12)),
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
                     radius: 12,
                     backgroundColor: Colors.red,
                     child: Icon(Icons.navigate_next,size: 17,color: Colors.white,),
                   ),
                 ],
               )
           ),
           Divider(),
           ListTile(
               leading:CircleAvatar(
                 backgroundColor: Color.fromRGBO(17,0,216,0.2),
                 child: Text("KP",style: TextStyle(color: Color.fromRGBO(17,0,216,1),fontSize: 15,fontWeight: FontWeight.w500,fontFamily: 'SFProText')),
               ),
               title: Text("Kashyp Parikh",style: TextStyle(fontFamily: 'SFProText',fontWeight: FontWeight.w400,fontSize: 14,),),
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
               )
           ),
           Divider(),
           ListTile(
               leading:CircleAvatar(
                 backgroundColor: Color.fromRGBO(0, 164, 216, 0.2),
                 child: Text("PM",style: TextStyle(color: Color.fromRGBO(0,164, 216, 1),fontSize: 15,fontWeight: FontWeight.w500,fontFamily: 'SFProText')),
               ),
               title: Text("Priya Maheta",style: TextStyle(fontFamily: 'SFProText',fontWeight: FontWeight.w400,fontSize: 14,),),
               subtitle: Text("PHP",style: TextStyle(fontFamily: 'SFProText',fontWeight: FontWeight.w400,fontSize: 12)),
               trailing:  Row(
                 mainAxisSize: MainAxisSize.min,
                 children: [
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
                     radius: 12,
                     backgroundColor: Colors.red,
                     child: Icon(Icons.navigate_next,size: 17,color: Colors.white,),
                   ),
                 ],
               )
           ),
           Divider(),
           ListTile(
               leading:CircleAvatar(
                 backgroundColor: Color.fromRGBO(0,216,9,0.2),
                 child: Text("PC",style: TextStyle(color: Color.fromRGBO(0,216,9,1),fontSize: 15,fontWeight: FontWeight.w500,fontFamily: 'SFProText')),
               ),
               title: Text("Puja Chuhan",style: TextStyle(fontFamily: 'SFProText',fontWeight: FontWeight.w400,fontSize: 14,),),
               subtitle: Text("PHP",style: TextStyle(fontFamily: 'SFProText',fontWeight: FontWeight.w400,fontSize: 12)),
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
                     radius: 12,
                     backgroundColor: Colors.red,
                     child: Icon(Icons.navigate_next,size: 17,color: Colors.white,),
                   ),
                 ],
               )
           ),
           Divider(),
           SizedBox(height: 10,)

         ],
       ),
     ),
    bottomNavigationBar: CustomBottomNavBar(selectedIndex: 0, parentContext: context),
     );
  }
}