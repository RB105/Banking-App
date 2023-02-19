import 'package:bankingapp/core/widgets/loading_widget.dart';
import 'package:bankingapp/data/service/card_service.dart';
import 'package:bankingapp/provider/get_card_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    GetCardProvider provider = Provider.of<GetCardProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => GetCardProvider(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Card Page"),
            actions: [
              IconButton(onPressed: (){
                Navigator.pushNamed(context, 'add_card');
              }, icon: const Icon(Icons.add))
            ],
          ),
          body: RefreshIndicator(
            onRefresh: CardService().getCards,
            child: Builder(
              builder: (context) {
                if (provider.isLoading) {
                  return Center(
                    child: loadingWidget(),
                  );
                } else if (provider.error.isNotEmpty) {
                  return Center(
                    child: Text(provider.error),
                  );
                } else {
                  return ListView.builder(
                    itemCount: (provider.data as List).length,
                    itemBuilder: (context, index) {
                    return ListTile(title: Text(provider.data[index]['number'].toString()),
                    subtitle: Text(provider.data[index]['user'].toString()),); 
                  },);
                }
              },
            ),
          ),
        );
      },
    );
  }
}
