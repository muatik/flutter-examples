import 'package:flutter/material.dart';
import 'package:shopApp/screens/product_detail_screen.dart';

import 'screens/product_list_screen.dart';

const ROUTE_HOME = '/';
const ROUTE_PRODUCT_LIST = '/products';
const ROUTE_PRODUCT_DETAIL = '/product';

Map<String, WidgetBuilder> ROUTES = {
  '/': (settings) {
    return ProductListScreen();
  },
  ROUTE_PRODUCT_LIST: (settings) {
    return ProductListScreen();
  },
  ROUTE_PRODUCT_DETAIL: (settings) {
    return ProductDetailScreen();
  }
};
