import 'package:animai/data/entity/animals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimalDetailScreen extends StatefulWidget {
  Animals  animal;
  AnimalDetailScreen({required this.animal});

  @override
  State<AnimalDetailScreen> createState() => _AnimalDetailScreenState();
}

class _AnimalDetailScreenState extends State<AnimalDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animals Detail"),),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(padding: EdgeInsets.only(top:16.0, bottom: 20.0),
                child: Image.network(widget.animal.animalImageUrl)
            ),
            Padding(padding:EdgeInsets.all(16.0) ,
              child: Card(
                child: Padding( padding:EdgeInsets.all(16.0) ,
                  child: Column(
                    children: [
                      Padding(padding:EdgeInsets.only(bottom: 16.0, top: 6.0),
                          child: Text(
                              widget.animal.animalName,
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF008580))
                          ),
                      ),
                      Text(
                          widget.animal.animalDetail,
                          textAlign: TextAlign.justify,
                        style:TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
            )

          ],
        ),

      ),
    );
  }
}
