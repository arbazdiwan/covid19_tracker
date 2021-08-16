import 'package:covid19_tracker/pages/search.dart';
import 'package:flutter/material.dart';

import '../datasource.dart';

class AllCountries extends StatelessWidget {
  final List countryData;

  const AllCountries({Key key, this.countryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryBlack,
        title: Text(
          'Regional Data',
          style: TextStyle(color: Colors.white),
        ),
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            onTap: () {
              showSearch(context: context, delegate: Search(countryData));
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: countryData.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              elevation: 20,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 80,
                          child: Text(
                            countryData[index]['country'],
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        SizedBox(height: 5),
                        Image.network(
                          countryData[index]['countryInfo']['flag'],
                          width: 60,
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Total Cases: ' +
                                countryData[index]['cases'].toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.red)),
                        Text(
                            'Active Cases: ' +
                                countryData[index]['active'].toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.blue)),
                        Text(
                            'Recovered: ' +
                                countryData[index]['recovered'].toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.green)),
                        Text(
                            'Deaths: ' +
                                countryData[index]['deaths'].toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.grey.shade900)),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 30,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
