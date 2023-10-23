import 'package:bls/pages/organization/pages/analytics/org_analytics_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class OrganizationAnalyticsPage extends StatefulWidget {
  const OrganizationAnalyticsPage({super.key});

  @override
  State<OrganizationAnalyticsPage> createState() =>
      _OrganizationAnalyticsPageState();
}

class _OrganizationAnalyticsPageState extends State<OrganizationAnalyticsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Overall Analytics"),
      ),
      body: ListView(
        children: [
          GridView.custom(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverQuiltedGridDelegate(
              crossAxisCount: 4,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
              repeatPattern: QuiltedGridRepeatPattern.inverted,
              pattern: [
                const QuiltedGridTile(1, 2),
                // const QuiltedGridTile(2, 2),
                // const QuiltedGridTile(2, 1),
                // const QuiltedGridTile(1, 1),
              ],
            ),
            childrenDelegate: SliverChildBuilderDelegate(
              childCount: orgAnalyticsCount.length,
              (context, index) {
                AnalyticsCount analyticsCount =
                    orgAnalyticsCount.elementAt(index);
                return showAnalyticsCount(analyticsCount);
              },
            ),
          ),
          SfCartesianChart(
              // Initialize category axis
              primaryXAxis: CategoryAxis(),
              title: ChartTitle(text: "Topics Completed"),
              series: <ColumnSeries<AnalyticsCount, String>>[
                ColumnSeries<AnalyticsCount, String>(
                    // Bind data source
                    enableTooltip: true,
                    gradient: const LinearGradient(
                        colors: [Colors.blue, Colors.indigo]),
                    dataSource: orgAnalyticsCount,
                    xValueMapper: (AnalyticsCount sales, _) => sales.text,
                    yValueMapper: (AnalyticsCount sales, _) =>
                        int.parse(sales.total))
              ])
        ],
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
