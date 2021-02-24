import '../main.dart';

class NetImageCache extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final double radius;
  final String placeholderPath;

  const NetImageCache(this.imageUrl,
      {this.width = 120,
      this.height = 90,
      this.radius = 5,
      this.placeholderPath = 'assets/placeholder_image.png'});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          fadeInDuration: Duration.zero,
          fadeOutDuration: Duration.zero,
          placeholder: (_, __) {
            return Image.asset(
              placeholderPath,
              fit: BoxFit.cover,
            );
          },
          errorWidget: (_, __, ___) {
            return Image.asset(
              placeholderPath,
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }
}
