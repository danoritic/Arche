import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> mainNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> bottomNavKey = GlobalKey<NavigatorState>();

void avoid_print(Object? o) {}
void custom_print(Object? o, String about) {}

String imageBaseUrl = "https://image.tmdb.org/t/p/original/";
