import 'package:flutter/material.dart';
import 'package:netflix_responsive_ui_app/models/content_model.dart';

class ContentList extends StatelessWidget {
  final String? title;
  final List<Content>? contentList;
  final bool? isOriginals;
  ContentList(
      {Key? key, this.title, this.contentList, this.isOriginals = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              title!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: isOriginals == true ? 500 : 220,
            child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: contentList!.length,
                itemBuilder: (BuildContext context, int index) {
                  final Content content = contentList![index];
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      height: isOriginals == true ? 400 : 200,
                      width: isOriginals == true ? 200 : 130,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage(content.imageUrl as String),
                        fit: BoxFit.cover,
                      )),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
