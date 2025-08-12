import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:marketool_financer/src/controllers/operation_controller.dart';
import 'package:marketool_financer/src/controllers/search_assets_controller.dart';
import 'package:marketool_financer/src/models/asset_model.dart';
import 'package:marketool_financer/src/models/operation_model.dart';
import 'package:marketool_financer/src/services/auth_service.dart';
import 'package:marketool_financer/src/widgets/custom_button.dart';
import 'package:marketool_financer/src/widgets/custom_date_picker.dart';
import 'package:marketool_financer/src/widgets/custom_form_field.dart';
import 'package:marketool_financer/src/widgets/custom_select_operation.dart';
import 'package:marketool_financer/src/widgets/custom_text_field.dart';

class OperationView extends StatefulWidget {
  const OperationView({super.key});

  @override
  State<OperationView> createState() => _OperationViewState();
}

class _OperationViewState extends State<OperationView> {
  final List<AssetModel> _assets = [];
  final _operationController = OperationController();
  final _searchcontroller = SearchAssetsController();
  final _tickerController = TextEditingController();
  final _searchController = TextEditingController();
  final _dateController = TextEditingController();
  final _quantityController = TextEditingController();
  final _unitPriceController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _operationType;
  DateTime _selectedDate = DateTime.now();
  double totalPrice = 0;
  Timer? _debounce;

  final formatter = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    _quantityController.addListener(_calculateTotalPrice);
    _unitPriceController.addListener(_calculateTotalPrice);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _quantityController.removeListener(_calculateTotalPrice);
    _quantityController.dispose();
    _unitPriceController.removeListener(_calculateTotalPrice);
    _unitPriceController.dispose();
    super.dispose();
  }

  void _resetFields() {
    _tickerController.clear();
    _searchController.clear();
    _quantityController.clear();
    _unitPriceController.clear();
    setState(() {
      totalPrice = 0;
      _selectedDate = DateTime.now();
      _operationType = null;
    });
  }

  void _handleOperation() async {
    final inputDate = _dateController.text;
    final parsedDate = DateFormat("dd/MM/yyyy").parse(inputDate);
    final isoDate = DateFormat("yyyy-MM-dd").format(parsedDate);
    final operation = OperationModel(
      ticker: _tickerController.text,
      operationType: _operationType!,
      operationDate: isoDate,
      quantity: int.parse(_quantityController.text),
      unitPrice: double.parse(_unitPriceController.text.replaceAll(",", ".")),
      totalPrice: totalPrice,
      userId: AuthService.userId!,
    );

    final register = await _operationController.registerOperation(operation);

    if (!mounted) return;

    if (register) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          duration: Duration(milliseconds: 1800),
          backgroundColor: Colors.green,
          content: Text("Operação registrada com sucesso"),
        ),
      );
      await Future.delayed(Duration(seconds: 1));
      _resetFields();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          showCloseIcon: true,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          content: Text("Falha ao registrar operação"),
        ),
      );
    }
  }

  void _calculateTotalPrice() {
    final quantityText = _quantityController.text;
    final unitPriceText = _unitPriceController.text;

    final quantity = double.tryParse(quantityText) ?? 0;
    final unitPrice = double.tryParse(unitPriceText.replaceAll(',', '.')) ?? 0;

    final total = quantity * unitPrice;

    setState(() {
      totalPrice = total;
    });
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () async {
      if (_searchController.text.length < 3) return;

      final search = _searchController.text.trim();

      try {
        final results = await _searchcontroller.getAssets(search);
        setState(() {
          _assets
            ..clear()
            ..addAll(results);
        });
      } catch (e) {
        // tratar erro
      }
    });
  }

  void _openSearchDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            _searchController.addListener(() async {
              if (_debounce?.isActive ?? false) _debounce!.cancel();
              _debounce = Timer(const Duration(milliseconds: 400), () async {
                if (_searchController.text.length < 3) return;

                final search = _searchController.text.trim();

                try {
                  final results = await _searchcontroller.getAssets(search);
                  setStateDialog(() {
                    _assets
                      ..clear()
                      ..addAll(results);
                  });
                } catch (e) {
                  // tratar erro
                } 
              });
            });

            return Dialog(
              backgroundColor: const Color(0xFF001F1A),
              child: Container(
                width: 320,
                height: 400,
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextField(
                      isObscure: false,
                      icon: const Icon(Icons.search, color: Colors.white70),
                      text: "Busque pelo Ticker",
                      inputController: _searchController,
                      autoFocus: true,
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: _assets.isEmpty
                          ? Center(
                              child: const Text(
                                "Informe o Ticker do ativo para adicionar",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: _assets.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(
                                    _assets[index].ticker,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                  leading: _assets[index].logo.endsWith('.svg')
                                      ? SvgPicture.network(
                                          _assets[index].logo,
                                          width: 40,
                                          placeholderBuilder: (context) =>
                                              CircularProgressIndicator(),
                                        )
                                      : Image.network(
                                          _assets[index].logo,
                                          width: 40,
                                          errorBuilder:
                                              (context, error, stackTrace) =>
                                                  Icon(Icons.broken_image),
                                        ),
                                  onTap: () {
                                    _tickerController.text =
                                        _assets[index].ticker;
                                    Navigator.pop(context);
                                  },
                                );
                              },
                            ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    ).whenComplete(() {
      // Ao fechar o diálogo:
      _searchController.clear();
      setState(() {
        _assets.clear();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: ListView(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                GestureDetector(
                  onTap: _openSearchDialog,
                  child: AbsorbPointer(
                    child: CustomFormField(
                      text: "Ticker do Ativo",
                      icon: Icon(Icons.share, color: Colors.white70),
                      type: TextInputType.text,
                      isObscure: false,
                      inputController: _tickerController,
                      inputValidator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Informe o Ticker do ativo";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(height: 15),
                CustomSelectOperation(
                  label: "Tipo de Operação",
                  icon: const Icon(Icons.swap_horiz, color: Colors.white),
                  value: _operationType,
                  options: [
                    DropdownOption(value: "COMPRA", label: "Compra"),
                    DropdownOption(value: "VENDA", label: "Venda"),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _operationType = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Selecione o tipo da operação";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                CustomDatePicker(
                  controller: _dateController,
                  selectedDate: _selectedDate,
                  label: "Data da Operação",
                  initialDate: _selectedDate,
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                  icon: Icon(Icons.calendar_today, color: Colors.white70),
                  onChanged: (newDate) {
                    setState(() {
                      _selectedDate = newDate;
                    });
                    final formatter = DateFormat('dd/MM/yyyy');
                    _dateController.text = formatter.format(_selectedDate);
                  },
                ),
                SizedBox(height: 15),
                CustomFormField(
                  text: "Quantidade",
                  icon: Icon(
                    Icons.production_quantity_limits,
                    color: Colors.white,
                  ),
                  type: TextInputType.number,
                  inputController: _quantityController,
                  inputValidator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Informe a quantidade";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                CustomFormField(
                  text: "Preço Unitário",
                  icon: Icon(Icons.price_change, color: Colors.white),
                  type: TextInputType.number,
                  inputController: _unitPriceController,
                  inputValidator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Informe o preço unitário";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                Text(
                  formatter.format(totalPrice),
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 10),
                CustomButton(
                  label: "Registrar",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _handleOperation();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
