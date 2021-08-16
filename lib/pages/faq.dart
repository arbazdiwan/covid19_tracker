import 'package:covid19_tracker/datasource.dart';
import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQs', style: TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
          itemCount: DataSource.questionAnswers.length,
          itemBuilder: (context, index) {
            return ExpansionTile(
              title: Text(
                DataSource.questionAnswers[index]['question'].toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              children: [
                Container(
                    padding: EdgeInsets.all(15),
                    child: Text(
                        DataSource.questionAnswers[index]['answer'].toString()))
              ],
            );
          }),
    );
  }
}
