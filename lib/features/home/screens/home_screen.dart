import 'package:flutter/material.dart';

import '../../../core/local_variable.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List santa=[
    "https://i.pinimg.com/originals/1e/04/3f/1e043fa1f78929ef380b8454e8bc30fe.gif",
    "https://media.tenor.com/8xtWwC9YRWcAAAAM/p%C3%A8re-no%C3%ABl.gif",
    "https://img1.picmix.com/output/pic/normal/3/1/3/8/5728313_fe9ba.gif"
  ];

  List gift=[
    {
      "img":"https://www.picsy.in/images/contentimages/images/Blog_77_Banner_1.jpg",
      "name":"gift1",
    },
    {
      "img":"https://i5.walmartimages.com/asr/8cd88096-0f7a-41df-a8f1-62749f05c485.451f7f5631e622bfa98ee331e9cd78a3.jpeg?odnHeight=2000&odnWidth=2000&odnBg=FFFFFF",
      "name":"gift2",
    },
    {
      "img":"https://down-my.img.susercontent.com/file/sg-11134201-7rbmw-lmty39osggf722_tn",
      "name":"gift3",
    },
    {
      "img":"https://i.ebayimg.com/images/g/7VAAAOSwgqxfcXVR/s-l1200.jpg",
      "name":"gift4",
    },
    {
      "img":"https://down-my.img.susercontent.com/file/sg-11134201-7rbl1-lm4d8rejlmqh9b",
      "name":"gift5",
    },
    {
      "img":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaXF4lwVDmI-Me_-U7uBz6Whwk6GwmKq1JuTzTsl-2dG1jKrh6T5YQGpf3RinvfLUorx8&usqp=CAU",
      "name":"gift6",
    },
    {
      "img":"https://down-my.img.susercontent.com/file/sg-11134201-7rbmw-lmty39osggf722_tn",
      "name":"gift7",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: height*0.25,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("SNOWGRAM",
                style: TextStyle(color: Colors.white),),
              background: Image.network(
                "https://i.pinimg.com/originals/a2/e7/0e/a2e70ee9920b35d55f9fc6d4b5af21aa.gif",
                fit: BoxFit.cover,),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 200,
              width: 500,
              child: CarouselView(
                  itemExtent: height*0.2,
                itemSnapping: true,
                children: List.generate(santa.length, (index) {
                  return Container(
                    height: height*0.2,
                    width:width*0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width*0.03),
                      image: DecorationImage(image: NetworkImage(santa[index]),
                      fit: BoxFit.cover,
                      )
                    ),
                  );
                },),


                        ),
            ),),
          SliverGrid(delegate:
          SliverChildBuilderDelegate(

            childCount: gift.length,
                (context, index) {

            return Container(
              height: height*0.25,
              width: width*0.45,
              margin: EdgeInsets.all(width*0.015),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width*0.03),
                  gradient: LinearGradient(colors: [
                    Colors.red,
                  Colors.white,
                    Colors.red

                  ])
              ),
              child: Column(
                children: [
                  Container(
                    height: height*0.15,
                    width: width*0.4,
                    margin: EdgeInsets.all(width*0.015),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width*0.03),
                        color: Colors.green,
                      image: DecorationImage(image: NetworkImage(gift[index]["img"]),
                      fit: BoxFit.cover),
                    ),
                  ),
                  Text(gift[index]["name"])
                ],
              ),
            );
          },), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
          mainAxisSpacing: width*0.03,
          crossAxisSpacing: width*0.03),
          )
        ],
      ),
    );
  }
}
