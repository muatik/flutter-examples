import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:storage/providers/entry.dart';

class EntryPhotoView extends StatelessWidget {
  const EntryPhotoView({Key key, @required this.entry, this.swipeImage = false})
      : super(key: key);

  final Entry entry;
  final bool swipeImage;

  static Image imageBuilder(file) {
    return Image.file(file, fit: BoxFit.cover);
  }

  @override
  Widget build(BuildContext context) {
    final photos = entry.photos;
    print(photos.length);
    return Expanded(
      child: Container(
          height: 200,
          width: double.infinity,
          child: photos.isNotEmpty
              ? photos.length > 1 && swipeImage
                  ? Swiper(
                      itemBuilder: (BuildContext context, int index) =>
                          imageBuilder(photos[index]),
                      indicatorLayout: PageIndicatorLayout.SCALE,
                      autoplay: false,
                      itemCount: photos.length,
                      pagination: SwiperPagination(),
                      control: null,
                    )
                  : imageBuilder(photos.first)
              : Image.asset(
                  'assets/images/box.jpeg',
                  fit: BoxFit.cover,
                )),
    );
  }
}
