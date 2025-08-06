import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:marketool_financer/src/controllers/data_price_controller.dart';
import 'package:marketool_financer/src/models/data_price_model.dart';
import 'package:marketool_financer/src/models/asset_model.dart';

class CustomAssetChart extends StatefulWidget {
  const CustomAssetChart({super.key});

  @override
  State<CustomAssetChart> createState() => _CustomAssetChartState();
}

class _CustomAssetChartState extends State<CustomAssetChart> {
  late Future<List<DataPriceModel>> _historicalData;

  final ZoomPanBehavior _zoomPanBehavior = ZoomPanBehavior(
    enablePinching: true,
    enablePanning: true,
    zoomMode: ZoomMode.x,
    enableMouseWheelZooming: true,
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final asset = ModalRoute.of(context)!.settings.arguments as AssetModel;

    final controller = DataPriceController();
    _historicalData = controller.historicalDataPrice(asset.ticker);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DataPriceModel>>(
      future: _historicalData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            height: 300,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError ||
            snapshot.data == null ||
            snapshot.data!.isEmpty) {
          return const SizedBox(
            height: 300,
            child: Center(
              child: Text(
                "Erro ao carregar dados",
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        }

        final data = snapshot.data!;

        return Container(
          width: double.infinity,
          height: 300,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF1C1C1E),
            borderRadius: BorderRadius.circular(20),
          ),
          child: SfCartesianChart(
            backgroundColor: Colors.transparent,
            plotAreaBorderWidth: 0,
            primaryXAxis: DateTimeAxis(
              edgeLabelPlacement: EdgeLabelPlacement.shift,
              dateFormat: DateFormat('dd/MM'),
              majorGridLines: const MajorGridLines(width: 0),
              labelStyle: const TextStyle(color: Colors.white),
            ),
            primaryYAxis: NumericAxis(
              opposedPosition: true,
              majorGridLines: const MajorGridLines(width: 0),
              labelStyle: const TextStyle(color: Colors.white),
            ),
            series: <CandleSeries<DataPriceModel, DateTime>>[
              CandleSeries<DataPriceModel, DateTime>(
                dataSource: data,
                xValueMapper: (dp, _) => dp.date,
                lowValueMapper: (dp, _) => dp.low,
                highValueMapper: (dp, _) => dp.high,
                openValueMapper: (dp, _) => dp.open,
                closeValueMapper: (dp, _) => dp.close,
                bearColor: Colors.red,
                bullColor: Colors.green,
              ),
            ],
            tooltipBehavior: TooltipBehavior(enable: true),
            zoomPanBehavior: _zoomPanBehavior,
          ),
        );
      },
    );
  }
}
