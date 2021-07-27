import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MaseengerScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,

        title: Row(
          children: [
            CircleAvatar(
                radius: 15.0,
                backgroundImage: NetworkImage("https://pbs.twimg.com/profile_images/1412094537082806274/Mg98MRka.jpg")
            ),
            SizedBox(width: 15.0,),

            Text("Chat",
              style: TextStyle(
                color:Colors.black87,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.camera_alt,
                size: 16.0,
                color: Colors.white,
              ),
            ),
            onPressed: (){},
          ),
          IconButton(
            icon: CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.blue,
              child: Icon(Icons.edit,
                size: 16.0,
                color: Colors.white,
              ),
            ),
            onPressed: (){},
          ),
        ],
      ) ,

      body:
      Padding(padding:const EdgeInsets.all(20.0),
        child:
        SingleChildScrollView(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration
                (
                borderRadius: BorderRadius.circular(10.0,
                ),
                color: Colors.grey[300],
              ),
              padding: EdgeInsets.all(10.0),

              child: Row(
                children: [
                  Icon(Icons.search,),
                  SizedBox(width: 15.0,),
                  Text("Search",),

                ],
              ),
            ),
            SizedBox(height: 15.0,),
            Container(
              height: 100.0,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,

                shrinkWrap: true,
                itemBuilder: (context,index)=> buildStoryItem(),
                separatorBuilder:(context,index)=> SizedBox(width: 15.0,),
                itemCount:8,
              ),
            ),
            SizedBox(height: 20.0,),

            ListView.separated(
                physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
                itemBuilder:(context,index)=> buildChatItem(),
                separatorBuilder: (context,index)=>SizedBox(height: 10.0,),
                 itemCount: 20)
          ],
        ),
      ),
      ),
    );
  }

  Widget buildChatItem() =>Row(

    children: [
      CircleAvatar(
        radius: 30.0,
        backgroundImage: NetworkImage("https://pbs.twimg.com/profile_images/1412094537082806274/Mg98MRka.jpg"),
      ),
      SizedBox(width: 20.0,),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Ahmed Elqaneshy",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Text("متتاخرش",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),

                Padding(padding:const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ) ),
                Text("7:30 am",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 10.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ],

  );

  Widget buildStoryItem()=> Container(
    width: 60.0,
    child: Column(
      children:
      [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children:
          [
            CircleAvatar(
              radius:30.0 ,
              backgroundImage: NetworkImage("https://pbs.twimg.com/profile_images/1412094537082806274/Mg98MRka.jpg"),
            ),

            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 3.0,
                end: 3.0,
              ),

              child: CircleAvatar(
                radius: 7.0,
                backgroundColor: Colors.green,


              ),
            ),
          ],
        ),
        SizedBox(height: 6.0,),

        Text("Ahmed Elqaneshy",
          maxLines: 2,
          overflow:TextOverflow.ellipsis ,
        )

      ],
    ),
  );


}
