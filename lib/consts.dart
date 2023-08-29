import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

const Color lightGreen = Color(0xFFBFF922);
const Color white = Color(0xFFFFFFFF);
const Color black = Color(0xFF000000);
const Color red = Color(0xFFEB4B42);
const Color purple = Color(0xFF792BA0);
const Color darkGreen = Color(0xFF77A025);
const Color orange = Color(0xFFEFA085);
const Color grey = Color(0xFFE6E9EC);
const Color green = Color(0xFF89CB6F);
final poppins = GoogleFonts.poppins(color: black);
List<Color> availableColor = [lightGreen, red, darkGreen, purple, orange];
NumberFormat currencyFormatter = NumberFormat.compactCurrency(
  locale: 'id_ID',
  symbol: 'Rp. ',
  decimalDigits: 0,
);
List<String> sizeType = ['US', 'UK', 'EU'];

List<int> availableSize = [37, 38, 39, 40, 41, 42, 43, 44, 45];

List<String> categories = [
  'All',
  'Shoes',
  'Clothes',
  'Family',
  'Watches',
  'Fashion'
];
