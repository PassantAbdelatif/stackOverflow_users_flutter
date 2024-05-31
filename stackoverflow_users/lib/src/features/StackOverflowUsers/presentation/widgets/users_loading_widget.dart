import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stackoverflow_users/src/core/widgets/separator.dart';
import 'package:stackoverflow_users/src/styles/colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      itemBuilder: (c, i) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: SizedBox(
          child: Card(
            elevation: 4,
            surfaceTintColor: Colors.grey,
            color: OkayColors.lightGrayBackgroundColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      shimmerBuilder(
                        Container(
                          height: 10,
                          width: 150,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          shimmerBuilder(
                            Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                color: OkayColors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(5)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              shimmerBuilder(
                                Container(
                                  height: 10,
                                  width: 80,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              shimmerBuilder(
                                Container(
                                  height: 10,
                                  width: 80,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              shimmerBuilder(
                                Container(
                                  height: 10,
                                  width: 100,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              shimmerBuilder(
                                Container(
                                  height: 10,
                                  width: 100,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      shimmerBuilder(Separator()),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              shimmerBuilder(
                                Container(
                                  height: 10,
                                  width: 180,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              shimmerBuilder(
                                Container(
                                  height: 10,
                                  width: 180,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              shimmerBuilder(
                                Container(
                                  height: 10,
                                  width: 180,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      shimmerBuilder(Separator()),
                      Row(
                        children: [
                          Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              shimmerBuilder(
                                Container(
                                  height: 10,
                                  width: 80,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 80,
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              shimmerBuilder(
                                Container(
                                  height: 10,
                                  width: 80,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              shimmerBuilder(
                                Container(
                                  height: 40,
                                  width: size.width * 0.25,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              shimmerBuilder(
                                Container(
                                  height: 40,
                                  width: size.width * 0.55,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      itemCount: 5,
    );
  }

  Shimmer shimmerBuilder(child) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: child,
    );
  }
}
