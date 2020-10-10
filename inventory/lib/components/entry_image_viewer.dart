import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:inventory/providers/entry.dart';
import 'package:provider/provider.dart';

class EntryImageViewer extends StatelessWidget {
  final bool swipeImage;

  EntryImageViewer({this.swipeImage = false});

  final imageBuilder = (file) => Image.file(file, fit: BoxFit.cover);

  @override
  Widget build(BuildContext context) {
    final entry = Provider.of<Entry>(context);
    return Container(
        height: 200,
        width: double.infinity,
        child: entry.images.isNotEmpty
            ? entry.images.length > 1 && swipeImage
                ? Swiper(
                    itemBuilder: (BuildContext context, int index) =>
                        imageBuilder(entry.images[index]),
                    indicatorLayout: PageIndicatorLayout.SCALE,
                    autoplay: false,
                    itemCount: entry.images.length,
                    pagination: SwiperPagination(),
                    control: null,
                  )
                : imageBuilder(entry.images.first)
            : Image.asset(
                'assets/images/box.jpeg',
                fit: BoxFit.cover,
              ));
  }
}
