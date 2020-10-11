import 'package:storage/screens/entry_detail_screen.dart';
import 'package:storage/screens/entry_form_screen.dart';
import 'package:storage/screens/entry_overview_screen.dart';

const ROUTE_HOME = '/';
const ROUTE_ENTRY_FORM = '/entry-form';
const ROUTE_ENTRY_DETAIL = '/entry-detail';

final ROUTES = {
  ROUTE_HOME: (context) => EntryOverviewScreen(),
  ROUTE_ENTRY_FORM: (context) => EntryFormScreen(),
  ROUTE_ENTRY_DETAIL: (context) => EntryDetailScreen(),
};
