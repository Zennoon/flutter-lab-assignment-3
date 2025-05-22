import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../data/models/photo.dart';

class PhotosCarousel extends StatelessWidget {
  final List<Photo> photos;
  const PhotosCarousel({super.key, required this.photos});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 400,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        enlargeCenterPage: true 
      ),
      items: photos.map((photo) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              child: Image.network('https://imgs.search.brave.com/92YRDoLfo8pjQDtxwbM4_UvoTTwOi9GSUWeSlFCrMR0/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/YWVzdGhldGljd2Fs/bGRlY29yLmNvbS9j/ZG4vc2hvcC9maWxl/cy9ud2Etc3RyYWln/aHQtb3V0dGEtY29t/cHRvbi1yYXAtbXVz/aWMtYWxidW0tY292/ZXItd2FsbC1hcnQt/cG9zdGVyLWFlc3Ro/ZXRpYy13YWxsLWRl/Y29yLmpwZz92PTE2/OTI1NTYwNjImd2lk/dGg9MTQ0NQ', fit: BoxFit.cover),
            );
          }
        );
      }).toList(),
    );
  }
}
