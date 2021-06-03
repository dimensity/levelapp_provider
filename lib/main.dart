import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (_) => Data(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: MyText(),
          ),
          body: Level1(),
        ),
      ),
    );
  }
}

class Level1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('*********** Level  1 Called *********');
    return Container(
      child: Level2(),
    );
  }
}

class Level2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('*********** Level 2 Called *********');

    return Container(
      child: Column(
        children: [
          MyTextField(),
          Level3(),
        ],
      ),
    );
  }
}

class Level3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('*********** Level 3 Called *********');

    return Text(Provider.of<Data>(context, listen: true).data);
  }
}

class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<Data>(context, listen: true).data);
  }
}

class MyTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (newValue) {
        Provider.of<Data>(context,listen: false).changeString(newValue);
      },
    );
  }
}

class Data extends ChangeNotifier {
  String data = 'Top Secret Code 787878';

  void changeString(newString) {
    data = newString;
    notifyListeners();
  }
}
