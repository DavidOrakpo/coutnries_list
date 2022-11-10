import 'package:coutnries_list/core/services/DataClass/countries_model.dart';
import 'package:coutnries_list/core/utility/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../common_widgets/constants.dart';

class ImageCard extends StatefulWidget {
  ImageCard({
    Key? key,
    required this.countriesList,
  }) : super(key: key);
  CountriesList countriesList;
  @override
  State<ImageCard> createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  var controller = PageController();
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          // alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            PageView(
              controller: controller,
              onPageChanged: (value) {
                setState(() {
                  selectedIndex = value;
                });
              },
              children: [
                Image.network(
                  widget.countriesList.flags!.png!,
                  fit: Responsive.isLandScape(context)
                      ? BoxFit.fitHeight
                      : BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                ),
                (widget.countriesList.coatOfArms!.png == null)
                    ? const Center(child: Text("No coat of arms present"))
                    : Image.network(
                        widget.countriesList.coatOfArms!.png!,
                        fit: BoxFit.fitHeight,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                      ),
              ],
            ),
            Align(
              alignment: const Alignment(-0.9, 0),
              child: GestureDetector(
                  onTap: () {
                    controller.previousPage(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeIn);
                  },
                  child: selectedIndex == 0
                      ? const CircleAvatar(
                          foregroundColor: Color.fromARGB(255, 255, 255, 255),
                          backgroundColor: Color.fromRGBO(238, 238, 238, 0.2),
                          radius: 18,
                          child: Center(
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: 15,
                              color: Constants.primaryWhite,
                            ),
                          ),
                        )
                      // ignore: prefer_const_constructors
                      : CircleAvatar(
                          foregroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          backgroundColor:
                              const Color.fromRGBO(238, 238, 238, 0.5),
                          radius: 20,
                          child: const Center(
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Constants.primaryWhite,
                            ),
                          ),
                        )),
            ),
            Align(
              alignment: const Alignment(0.9, 0),
              child: GestureDetector(
                  onTap: () {
                    controller.nextPage(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeIn);
                  },
                  child: selectedIndex == 1
                      ? const CircleAvatar(
                          foregroundColor: Color.fromARGB(255, 255, 255, 255),
                          backgroundColor: Color.fromRGBO(238, 238, 238, 0.2),
                          radius: 18,
                          child: Center(
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Constants.primaryWhite,
                              size: 15,
                            ),
                          ),
                        )
                      : const CircleAvatar(
                          foregroundColor: Color.fromARGB(255, 255, 255, 255),
                          backgroundColor: Color.fromRGBO(238, 238, 238, 0.5),
                          radius: 20,
                          child: Center(
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Constants.primaryWhite,
                            ),
                          ),
                        )),
            ),
            Align(
              alignment: const Alignment(0, 0.8),
              child: SmoothPageIndicator(
                controller: controller,
                count: 2,
                onDotClicked: (value) {
                  controller.animateToPage(value,
                      duration: const Duration(milliseconds: 350),
                      curve: Curves.easeIn);
                },
                effect: const ScrollingDotsEffect(
                    // expansionFactor: 2.2,
                    dotWidth: 8,
                    dotHeight: 8,
                    activeDotColor: Constants.primaryWhite),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
