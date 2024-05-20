import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddMyAnimalPage extends StatefulWidget {
  const AddMyAnimalPage({super.key});

  @override
  State<AddMyAnimalPage> createState() => _AddMyAnimalPageState();
}

class _AddMyAnimalPageState extends State<AddMyAnimalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hayvan Kayıt"),),
    );
  }
}
