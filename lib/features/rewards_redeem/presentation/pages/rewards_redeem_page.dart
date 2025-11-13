import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/theme_extensions.dart';
import '../../../coupon_generation/presentation/pages/coupon_generation_page.dart';

class RewardsRedeemPage extends StatefulWidget {
  const RewardsRedeemPage({super.key});

  @override
  State<RewardsRedeemPage> createState() => _RewardsRedeemPageState();
}

class _RewardsRedeemPageState extends State<RewardsRedeemPage> {
  final _searchController = TextEditingController();
  String _searchQuery = '';
  String? _selectedCategory;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Filtrar por categorÃ­a',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: context.primaryBlue,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildFilterOption('Restaurantes'),
              _buildFilterOption('Supermercado'),
              _buildFilterOption('Viajes'),
              _buildFilterOption('Cine'),
              _buildFilterOption('Comercios'),
              const Divider(),
              _buildFilterOption('Todos', isAll: true),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFilterOption(String category, {bool isAll = false}) {
    final isSelected = isAll
        ? _selectedCategory == null
        : _selectedCategory == category;

    return ListTile(
      title: Text(
        category,
        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          color: isSelected ? context.primaryBlue : context.darkNavy,
        ),
      ),
      trailing: isSelected
          ? Icon(Icons.check, color: context.primaryBlue)
          : null,
      onTap: () {
        setState(() {
          _selectedCategory = isAll ? null : category;
        });
        Navigator.of(context).pop();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            _buildSearchField(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: _buildBrandGrid(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: context.surface,
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back, color: context.primaryBlue),
            onPressed: () => Navigator.of(context).pop(),
          ),
          Expanded(
            child: Text(
              'Redimir Premios',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: context.primaryBlue,
              ),
            ),
          ),
          Image.asset(
            'assets/images/logo.png',
            height: 40,
          ),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: TextField(
        controller: _searchController,
        onChanged: (value) {
          setState(() {
            _searchQuery = value.toLowerCase();
          });
        },
        style: GoogleFonts.poppins(
          fontSize: 16,
          color: context.darkNavy,
        ),
        decoration: InputDecoration(
          hintText: 'Buscar marca...',
          hintStyle: GoogleFonts.poppins(
            fontSize: 16,
            color: context.textLight,
          ),
          prefixIcon: IconButton(
            icon: Icon(
              Icons.filter_list,
              color: _selectedCategory != null
                  ? context.primaryBlue
                  : context.textLight,
            ),
            onPressed: _showFilterDialog,
          ),
          suffixIcon: _searchQuery.isNotEmpty
              ? IconButton(
                  icon: Icon(Icons.clear, color: context.textLight),
                  onPressed: () {
                    _searchController.clear();
                    setState(() {
                      _searchQuery = '';
                    });
                  },
                )
              : Icon(
                  Icons.search,
                  color: context.primaryBlue,
                ),
          filled: true,
          fillColor: context.surface,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: context.background,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: context.primaryBlue,
              width: 2,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 18,
          ),
        ),
      ),
    );
  }

  Widget _buildBrandGrid() {
    final allBrands = [
      {'name': 'cinecolombia', 'color': const Color(0xFFFFFFFF), 'category': 'Cine'},
      {'name': 'calzatodo', 'color': const Color(0xFFFFFFFF), 'category': 'Comercios'},
      {'name': 'directv', 'color': const Color(0xFFFFFFFF), 'category': 'Comercios'},
      {'name': 'decathlon', 'color': const Color(0xFFFFFFFF), 'category': 'Comercios'},
      {'name': 'dafiti', 'color': const Color(0xFFFFFFFF), 'category': 'Comercios'},
      {'name': 'cromantic', 'color': const Color(0xFFFFFFFF), 'category': 'Comercios'},
      {'name': 'crepeswaffles', 'color': const Color(0xFFFFFFFF), 'category': 'Restaurantes'},
      {'name': 'babyfresh', 'color': const Color(0xFFFFFFFF), 'category': 'Comercios'},
      {'name': 'beerstation', 'color': const Color(0xFFFFFFFF), 'category': 'Restaurantes'},
      {'name': 'aviatur', 'color': const Color(0xFFFFFFFF), 'category': 'Viajes'},
      {'name': 'burgerking', 'color': const Color(0xFFFFFFFF), 'category': 'Restaurantes'},
      {'name': 'alkosto', 'color': const Color(0xFFFFFFFF), 'category': 'Supermercado'},
      {'name': 'exito', 'color': const Color(0xFFFFEB00), 'category': 'Supermercado'},
      {'name': 'falabella', 'color': const Color(0xFFB8D62E), 'category': 'Comercios'},
      {'name': 'surtimax', 'color': const Color(0xFF106D35), 'category': 'Supermercado'},
      {'name': 'makro', 'color': const Color(0xFFFFFFFF), 'category': 'Supermercado'},
      {'name': 'daviplata', 'color': const Color(0xFFE91E2C), 'category': 'Comercios'},
      {'name': 'carulla', 'color': const Color(0xFF5DBD01), 'category': 'Supermercado'},
      {'name': 'superinter', 'color': const Color(0xFF980000), 'category': 'Supermercado'},
      {'name': 'mayorista', 'color': const Color(0xFFFFFFFF), 'category': 'Supermercado'},
    ];

    var filteredBrands = allBrands;

    // Filter by category
    if (_selectedCategory != null) {
      filteredBrands = filteredBrands
          .where((brand) => brand['category'] == _selectedCategory)
          .toList();
    }

    // Filter by search query
    if (_searchQuery.isNotEmpty) {
      filteredBrands = filteredBrands
          .where((brand) =>
              (brand['name'] as String).toLowerCase().contains(_searchQuery))
          .toList();
    }

    if (filteredBrands.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Text(
            'No se encontraron marcas',
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: context.textSecondary,
            ),
          ),
        ),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.0,
      ),
      itemCount: filteredBrands.length,
      itemBuilder: (context, index) {
        final brand = filteredBrands[index];
        return _buildBrandCard(
          brand['name'] as String,
          brand['color'] as Color,
        );
      },
    );
  }

  Widget _buildBrandCard(String brandName, Color bgColor) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CouponGenerationPage(
              brandName: brandName,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              'assets/images/brands/$brandName.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
