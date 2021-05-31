import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:puby/puby_page.dart';

class CacheImage extends StatefulWidget {
  final url;
  final placeholder;
  final width;
  final height;
  final borderRadius;

  const CacheImage(
      {Key key,
      @required this.url,
      this.placeholder = 'assets/images/animationImage.gif',
      this.width,
      this.height,
      this.borderRadius})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CacheImageState();
  }
}

class _CacheImageState extends State<CacheImage>
    with SingleTickerProviderStateMixin {
  // AnimationController _animationController;

  @override
  void initState() {
    // _animationController = AnimationController(
    //     vsync: this,
    //     duration: Duration(milliseconds: 2200),
    //     lowerBound: 0.0,
    //     upperBound: 1.0);
    super.initState();
  }

  @override
  void dispose() {
    // _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ClipRRect(
            borderRadius: widget.borderRadius,
            child: ExtendedImage.network(
              widget.url,
              width: widget.width ?? null,
              height: widget.height ?? null,
              fit: BoxFit.cover,
              cache: true,
              enableLoadState: true,
              // ignore: missing_return
              loadStateChanged: (state) {
                switch (state.extendedImageLoadState) {
                  case LoadState.loading:
                    // _animationController.reset();
                    return Image.asset(
                      widget.placeholder,
                      fit: BoxFit.cover,
                    );
                    break;
                  case LoadState.completed:
                    // _animationController.forward();
                    return ExtendedRawImage(
                      image: state.extendedImageInfo.image,
                      fit: BoxFit.cover,
                    );
                    // return FadeTransition(
                    //     opacity: _animationController,
                    //     child: ExtendedRawImage(
                    //       image: state.extendedImageInfo.image,
                    //       fit: BoxFit.cover,
                    //     ));
                    break;
                  case LoadState.failed:
                    // _animationController.reset();
                    state.imageProvider.evict();
                    return GestureDetector(
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Lottie.asset(
                            'assets/json/error2.json',
                            width: 66,
                            height: 66,
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                          Positioned(
                            bottom: 6.0,
                            left: 0.0,
                            right: 0.0,
                            child: Text(
                              '图片加载失败，点击重试',
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                      onTap: () {
                        state.reLoadImage();
                      },
                    );
                  default:
                }
              },
            ));
      },
    );
  }
}
