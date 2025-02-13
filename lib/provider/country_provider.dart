import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../models/datamodel.dart';

class CountryProvider with ChangeNotifier {
  List<Country> _countries = [];
  List<Country> _filteredCountries = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Country> get countries => _filteredCountries.isNotEmpty ? _filteredCountries : _countries;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchCountries() async {
    _isLoading = true;
    notifyListeners();

    const url = 'https://restfulcountries.com/api/v1/countries';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer 2135|FMEn1Ro46sEgwGS4MNvtFFLzpo1hXDQvd5qgY6BN',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['data'];
        _countries = data.map((country) => Country.fromJson(country)).toList();
        _filteredCountries = [];
        _errorMessage = null;
      } else {
        _errorMessage = 'Failed to load countries';
      }
    } catch (e) {
      _errorMessage = 'Error: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void searchCountries(String query) {
    if (query.isEmpty) {
      _filteredCountries = [];
    } else {
      _filteredCountries = _countries
          .where((country) => country.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
