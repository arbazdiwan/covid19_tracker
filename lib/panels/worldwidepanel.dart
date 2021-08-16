import 'package:flutter/material.dart';

class WorldWidePanel extends StatelessWidget {
  final Map worldData;

  const WorldWidePanel({Key key, this.worldData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 2),
      children: [
        StatusPanel(
          panelColor: Colors.red.shade200,
          textColor: Colors.red.shade900,
          title: 'Confirmed',
          count: worldData['cases'].toString(),
        ),
        StatusPanel(
          panelColor: Colors.blue.shade200,
          textColor: Colors.blue.shade900,
          title: 'Active',
          count: worldData['active'].toString(),
        ),
        StatusPanel(
          panelColor: Colors.green.shade200,
          textColor: Colors.green.shade900,
          title: 'Recovered',
          count: worldData['recovered'].toString(),
        ),
        StatusPanel(
          panelColor: Colors.grey.shade400,
          textColor: Colors.grey.shade900,
          title: 'Deaths',
          count: worldData['deaths'].toString(),
        ),
      ],
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel(
      {Key key, this.panelColor, this.textColor, this.title, this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: 60,
      width: width / 2,
      margin: EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: panelColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: textColor),
          ),
          Text(
            count,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: textColor),
          ),
        ],
      ),
    );
  }
}
