import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TextSpan> textSpans = const <TextSpan>[
    TextSpan(text: 'Find the ', style: TextStyle(fontSize: 25)),
    TextSpan(text: 'BEST ', style: TextStyle(color: Colors.amber)),
    TextSpan(
        text: '                                Clothes for ',
        style: TextStyle(fontSize: 25)),
    TextSpan(text: ' YOU..', style: TextStyle(color: Colors.amber)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,

// creating icon as a title of an application

        title: Container(
          child: SizedBox(
            height: 42,
            width: 50,
            child: Image.asset(
              'assets/images/titleimage.png',
              color: Colors.white,
            ),
          ),
        ),
        centerTitle: true,

// creating shopping category--action
        actions: [
          Container(
              padding: const EdgeInsets.only(right: 12),
              child: const Icon(Icons.shopping_bag_outlined))
        ],
      ),
      drawer: const Drawer(),
      body: Column(children: [
        // tagline of an application
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.white, fontSize: 27),
              children: textSpans,
            ),
            maxLines: 5,
            textAlign: TextAlign.left,
          ),
        ),

// searching field ---button
        Container(
          color: Colors.white60,
          padding: EdgeInsets.all(8),
          child: TextFormField(
            decoration: new InputDecoration(
              hintText: 'Search',
              icon: new Icon(Icons.search),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: const Text(
            'Shop by',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),

// creating two buttons that consists of brand and occassion
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 50),
                child: ButtonBar(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.white38),
                      onPressed: () {},
                      child: Text(
                        'Occassion',
                        style: TextStyle(
                            color: Colors.amber, 
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.white38),
                        onPressed: () {},
                        child: Text(
                          'Brand',
                          style: TextStyle(
                              color: Colors.amber, 
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

// displaying products as a recommendation

        Card(
          child: ,
        ),


       
      ]),
      backgroundColor: Colors.blueGrey,
    );
  }
}
