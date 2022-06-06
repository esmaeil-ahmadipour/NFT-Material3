import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nft_material/models.dart';
import 'package:nft_material/open_container_wrapper.dart';
import 'package:nft_material/pages/auction_item.dart';
import 'package:simple_animations/simple_animations.dart';

class AuctionItemsWidget extends StatelessWidget {
  const AuctionItemsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 430,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0),
        child: PageView.builder(
          pageSnapping: false,
          controller: PageController(viewportFraction: 0.8),
          itemBuilder: (_, index) {
            return PlayAnimation<double>(
              builder: (_, child, position) {
                return Transform.translate(
                  offset: Offset(position, 0),
                  child: child ?? Container(),
                );
              },
              tween: Tween<double>(begin: 200, end: 0),
              delay: Duration(milliseconds: 100 + index * 10),
              duration: kThemeAnimationDuration,
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: OpenContainerWrapper(
                  openChild: AuctionItemPage(
                    item: auctionItems[index],
                  ),
                  closedChild: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).dividerColor,
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              Text(
                                auctionItems[index].owner,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                auctionItems[index].title.toUpperCase(),
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              const Spacer(),
                              Text(
                                auctionItems[index].userName,
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: CachedNetworkImage(
                            imageUrl: auctionItems[index].imageLink,
                            height: 250,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    auctionItems[index].timeLeft,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  Text(
                                    'Remaining Time',
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    auctionItems[index].price,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  Text(
                                    'Highest Bid',
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: auctionItems.length,
        ),
      ),
    );
  }
}