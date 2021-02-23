import '../main.dart';

class NetImageCache extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final double radius;

  const NetImageCache(
    this.imageUrl, {
    this.width = 120,
    this.height = 90,
    this.radius = 5,
  });

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
            errorWidget: (_, __, ___) {
              return Container(
                width: width,
                height: height,
                padding: EdgeInsets.symmetric(horizontal: width / 3),
                color: const Color(0xffE8EAE9),
                child: Opacity(
                  opacity: 0.6,
                  child: Image.asset('assets/image_placeholder.png'),
                ),
              );
            },
          )

          // Image.network(
          //   imageUrl,
          //   fit: BoxFit.cover,
          //   errorBuilder: (_, __, ___) {
          //     return Container(
          //       width: 120,
          //       height: 90,
          //       padding: const EdgeInsets.symmetric(horizontal: 25),
          //       color: const Color(0xffE8EAE9),
          //       child: Opacity(
          //         opacity: 0.6,
          //         child: Image.asset('assets/image_placeholder.png'),
          //       ),
          //     );
          //   },
          // ),
          ),
    );
  }
}
