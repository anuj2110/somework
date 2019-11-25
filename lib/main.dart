import 'package:flutter/material.dart';
import 'shop.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget _dialogBuilder(BuildContext context, Shop shop) {
    ThemeData localtheme = Theme.of(context);
    return SimpleDialog(
      contentPadding: EdgeInsets.zero,
      children: <Widget>[
        Image.network(
          shop.imgurl,
          fit: BoxFit.fill,
          scale: 0.3,
          width: 150,
          height: 250,
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                shop.shopname,
                style: localtheme.textTheme.display1,
              ),
              SizedBox(height: 15.0),
              Text(
                shop.shopdesc,
                style: localtheme.textTheme.subhead,
              ),
              SizedBox(height: 25),
              Align(
                alignment: Alignment.centerRight,
                child: Wrap(
                  children: <Widget>[
                    FlatButton(
                      child: Text("BEKAAR HAI"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    RaisedButton(
                      splashColor: Colors.amber,
                      child: Text("LIKED THIS"),
                      onPressed: () {},
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _listItemBuilder(BuildContext context, int index) {
    return ListTile(
      onTap: () => showDialog(
          context: context,
          builder: (context) => _dialogBuilder(context, list[index])),
      leading: Container(
          width: 40.0,
          height: 40.0,
          decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                  fit: BoxFit.fill, image: NetworkImage(list[index].imgurl)))),
      title: Text(list[index].shopname),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        buttonColor: Colors.deepOrange,
        buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("HELLO"),
        ),
        body: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: DraggableScrollableSheet(
              
              minChildSize: 0.4,
              maxChildSize: 1.0,
              builder: (context, ScrollController scrollController) => Card(
                elevation: 5.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: list.length,
                    itemBuilder: _listItemBuilder,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
