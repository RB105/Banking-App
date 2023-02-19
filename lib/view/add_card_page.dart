import 'package:bankingapp/provider/add_card_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddCardPage extends StatefulWidget {
  const AddCardPage({super.key});

  @override
  State<AddCardPage> createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  @override
  Widget build(BuildContext context) {
    AddCardProvider provider = Provider.of<AddCardProvider>(context);
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(create: (context) => AddCardProvider(),builder: (context, child) {
      return Scaffold(
      appBar: AppBar(
        title: const Text("Add Card"),
      ),
      body: Center(
        child: Container(
          height: size.height * 0.3,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.black12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                controller: provider.cardNumberController,
                decoration: InputDecoration(
                  hintText: "Card number",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              TextFormField(
                controller: provider.dateController,
                decoration: InputDecoration(
                  hintText: "Expiry date",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: ()async{
       provider.addCards();
      },child: const Text("Add Card"),),
    );
    },);
  }
}
