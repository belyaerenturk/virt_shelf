import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:virt_shelf/items/constants.dart';

class StatisticsScreen extends StatefulWidget {
  final Widget child;

  StatisticsScreen({Key key, this.child}) : super(key: key);

  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  List<charts.Series<Rate, String>> _seriesData;
  List<charts.Series<Task, String>> _seriesPieData;
  List<charts.Series<Read, int>> _seriesLineData;

  _generateData() {
    var data1 = [
      new Rate(1980, 'Amerika', 30),
      new Rate(1980, 'Asya', 40),
      new Rate(1980, 'Avrupa', 10),
    ];
    var data2 = [
      new Rate(1985, 'Amerika', 100),
      new Rate(1980, 'Asya', 150),
      new Rate(1985, 'Avrupa', 80),
    ];
    var data3 = [
      new Rate(1985, 'Amerika', 200),
      new Rate(1980, 'Asya', 300),
      new Rate(1985, 'Avrupa', 180),
    ];

    var piedata = [
      new Task('Okumuyor', 53, Color(0xff3366cc)),
      new Task('Ayda birden az', 11, Color(0xff990099)),
      new Task('2-3 haftada bir', 10, Color(0xff109618)),
      new Task('Haftada 1-3 gün', 12, Color(0xfffdbe19)),
      new Task('Haftada 3\'ten fazla', 14, Color(0xffff9900)),
    ];

    var linesalesdata = [
      new Read(0, 45),
      new Read(1, 56),
      new Read(2, 55),
      new Read(3, 60),
      new Read(4, 61),
      new Read(5, 70),
    ];
    var linesalesdata1 = [
      new Read(0, 35),
      new Read(1, 46),
      new Read(2, 45),
      new Read(3, 50),
      new Read(4, 51),
      new Read(5, 60),
    ];

    var linesalesdata2 = [
      new Read(0, 20),
      new Read(1, 24),
      new Read(2, 25),
      new Read(3, 40),
      new Read(4, 45),
      new Read(5, 60),
    ];

    _seriesData.add(
      charts.Series(
        domainFn: (Rate pollution, _) => pollution.place,
        measureFn: (Rate pollution, _) => pollution.quantity,
        id: '2017',
        data: data1,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Rate pollution, _) =>
            charts.ColorUtil.fromDartColor(Color(0xff990099)),
      ),
    );

    _seriesData.add(
      charts.Series(
        domainFn: (Rate pollution, _) => pollution.place,
        measureFn: (Rate pollution, _) => pollution.quantity,
        id: '2018',
        data: data2,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Rate pollution, _) =>
            charts.ColorUtil.fromDartColor(Color(0xff109618)),
      ),
    );

    _seriesData.add(
      charts.Series(
        domainFn: (Rate pollution, _) => pollution.place,
        measureFn: (Rate pollution, _) => pollution.quantity,
        id: '2019',
        data: data3,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Rate pollution, _) =>
            charts.ColorUtil.fromDartColor(Color(0xffff9900)),
      ),
    );

    _seriesPieData.add(
      charts.Series(
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskvalue,
        colorFn: (Task task, _) =>
            charts.ColorUtil.fromDartColor(task.colorval),
        id: 'Air Pollution',
        data: piedata,
        labelAccessorFn: (Task row, _) => '${row.taskvalue}',
      ),
    );

    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff990099)),
        id: 'Air Pollution',
        data: linesalesdata,
        domainFn: (Read sales, _) => sales.yearval,
        measureFn: (Read sales, _) => sales.salesval,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff109618)),
        id: 'Air Pollution',
        data: linesalesdata1,
        domainFn: (Read sales, _) => sales.yearval,
        measureFn: (Read sales, _) => sales.salesval,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xffff9900)),
        id: 'Air Pollution',
        data: linesalesdata2,
        domainFn: (Read sales, _) => sales.yearval,
        measureFn: (Read sales, _) => sales.salesval,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _seriesData = List<charts.Series<Rate, String>>();
    _seriesPieData = List<charts.Series<Task, String>>();
    _seriesLineData = List<charts.Series<Read, int>>();
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: mdDarkPink,
            //backgroundColor: Color(0xff1976d2),
            //backgroundColor: Color(0xff308e1c),
            bottom: TabBar(
              indicatorColor: Color(0xff9962D0),
              tabs: [
                Tab(
                  icon: Icon(FontAwesomeIcons.solidChartBar),
                ),
                Tab(icon: Icon(FontAwesomeIcons.chartPie)),
                Tab(icon: Icon(FontAwesomeIcons.chartLine)),
              ],
            ),
            title: Text('İstatistikler'),
          ),
          body: TabBarView(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Ülkelere Göre Okuma Oranı',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
                        Expanded(
                          child: charts.BarChart(
                            _seriesData,
                            animate: true,
                            barGroupingType: charts.BarGroupingType.grouped,
                            //behaviors: [new charts.SeriesLegend()],
                            animationDuration: Duration(seconds: 5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Kitap Okuma Sıklığı',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10.0,),
                        Expanded(
                          child: charts.PieChart(
                              _seriesPieData,
                              animate: true,
                              animationDuration: Duration(seconds: 5),
                              behaviors: [
                                new charts.DatumLegend(
                                  outsideJustification: charts.OutsideJustification.endDrawArea,
                                  horizontalFirst: false,
                                  desiredMaxRows: 2,
                                  cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
                                  entryTextStyle: charts.TextStyleSpec(
                                      color: charts.MaterialPalette.purple.shadeDefault,
                                      fontFamily: 'Georgia',
                                      fontSize: 11),
                                )
                              ],
                              defaultRenderer: new charts.ArcRendererConfig(
                                  arcWidth: 100,
                                  arcRendererDecorators: [
                                    new charts.ArcLabelDecorator(
                                        labelPosition: charts.ArcLabelPosition.inside)
                                  ])),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'İlk 5 Yıl İçin Okunma Oranı',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
                        Expanded(
                          child: charts.LineChart(
                              _seriesLineData,
                              defaultRenderer: new charts.LineRendererConfig(
                                  includeArea: true, stacked: true),
                              animate: true,
                              animationDuration: Duration(seconds: 5),
                              behaviors: [
                                new charts.ChartTitle('Yıllar',
                                    behaviorPosition: charts.BehaviorPosition.bottom,
                                    titleOutsideJustification:charts.OutsideJustification.middleDrawArea),
                                new charts.ChartTitle('Okunma',
                                    behaviorPosition: charts.BehaviorPosition.start,
                                    titleOutsideJustification: charts.OutsideJustification.middleDrawArea),
                                new charts.ChartTitle('Yazarlar',
                                  behaviorPosition: charts.BehaviorPosition.end,
                                  titleOutsideJustification:charts.OutsideJustification.middleDrawArea,
                                )
                              ]
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Rate {
  String place;
  int year;
  int quantity;

  Rate(this.year, this.place, this.quantity);
}

class Task {
  String task;
  double taskvalue;
  Color colorval;

  Task(this.task, this.taskvalue, this.colorval);
}

class Read {
  int yearval;
  int salesval;

  Read(this.yearval, this.salesval);
}
