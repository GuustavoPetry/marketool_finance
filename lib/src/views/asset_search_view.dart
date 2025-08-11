import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:marketool_financer/src/controllers/search_assets_controller.dart';
import 'package:marketool_financer/src/models/asset_model.dart';
import 'package:marketool_financer/src/widgets/custom_text_field.dart';

class AssetSearchView extends StatefulWidget {
  const AssetSearchView({super.key});

  @override
  State<AssetSearchView> createState() => _AssetSearchViewState();
}

class _AssetSearchViewState extends State<AssetSearchView> {
  final _controller = SearchAssetsController();
  final _searchController = TextEditingController();
  final List<AssetModel> _assets = [];
  Timer? _debounce;
  bool _isLoading = true;

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(seconds: 1), () async {
      final search = _searchController.text.trim();

      setState(() => _isLoading = true);

      try {
        final results = await _controller.getAssets(search);
        setState(() {
          _assets
            ..clear()
            ..addAll(results);
        });
      } catch (e) {
        return;
      } finally {
        setState(() => _isLoading = false);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _onSearchChanged();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  Widget _buildAssetTile(AssetModel asset) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: ListTile(
        leading: asset.logo.endsWith('.svg')
            ? SvgPicture.network(
                asset.logo,
                width: 40,
                placeholderBuilder: (context) => CircularProgressIndicator(),
              )
            : Image.network(
                asset.logo,
                width: 40,
                errorBuilder: (context, error, stackTrace) =>
                    Icon(Icons.broken_image),
              ),
        title: Text(
          asset.ticker,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        subtitle: Text(
          "R\$ ${asset.close.toStringAsFixed(2)}",
          style: TextStyle(color: Colors.green, fontSize: 16),
        ),
        trailing: Text(
          "${asset.change.toStringAsFixed(2)}%",
          style: TextStyle(
            color: asset.change >= 0 ? Colors.green : Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, "/asset-detail", arguments: asset);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF001F1A), Color(0xFF0E1E1B)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 20),
            CustomTextField(
              isObscure: false,
              icon: Icon(Icons.search, color: Colors.white70),
              text: "Digite o Ticker",
              inputController: _searchController,
            ),
            const SizedBox(height: 5),
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _assets.isEmpty
                  ? const Center(
                      child: Text(
                        "Nenhum ativo encontrado",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _assets.length,
                      itemBuilder: (context, index) =>
                          _buildAssetTile(_assets[index]),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 15),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.close, size: 30, color: Colors.green),
                    SizedBox(width: 5),
                    Text(
                      "Sair da Busca",
                      style: TextStyle(fontSize: 24, color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
