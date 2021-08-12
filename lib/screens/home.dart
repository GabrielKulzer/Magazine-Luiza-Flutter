import 'package:flutter/material.dart';
import 'package:magazine_luiza/models/product.dart';
import 'package:magazine_luiza/provider/products.dart';
import 'package:magazine_luiza/style.dart';

class Home extends StatefulWidget {
  @override
  createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Ofertas do dia",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          leading: Image.asset(
            'assets/images/logo.jpg',
          ),
          backgroundColor: blueTheme,
        ),
        body: Column(children: [
          Image.asset(
            'assets/images/linha.jpg',
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 15),
              itemBuilder: builder,
              itemCount: listOfproducts.length,
            ),
          )
        ]));
  }

  Widget builder(BuildContext context, int index) {
    Product product = listOfproducts.elementAt(index);
    return ListTile(
      leading: Image.asset(product.photos),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.name,
            style: TextStyle(
                fontSize: 13, color: (grayTheme), fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 7),
          Text(
            product.descrition,
            style: TextStyle(
              fontSize: 13,
              color: (grayTheme),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 10),
          Row(children: [
            Text(
              "R\$",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              product.price,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.bold),
            ),
          ]),
          Row(children: [
            Text(
              product.plots,
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "R\$",
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              product.value,
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.bold),
            ),
          ]),
          SizedBox(height: 20),
        ],
      ),
      trailing: IconButton(
        icon: Icon(
          // ? - se for true (verdadeiro)
          // ? - se for false (falso)
          (product.islove) ? Icons.favorite : Icons.favorite_border,
          color: purpleTheme,
          size: 20,
        ),
        onPressed: () {
          // Reconstruir a tela
          setState(() {
            product.islove = !product.islove;
          });
        },
      ),
    );
  }
}
