//
//  DolphinGoodsCollectionViewCell.m
//  ZYCarouselScroller
//
//  Created by zhiyi on 16/11/22.
//  Copyright © 2016年 zhiyi. All rights reserved.
//

#import "DolphinGoodsCollectionViewCell.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"

@interface DolphinGoodsCollectionViewCell ()
@property (strong, nonatomic) UIImageView *mainImageView;
@property (copy, nonatomic) NSArray *imageViewList;
@property (copy, nonatomic) NSArray *titleLabelList;
@property (copy, nonatomic) NSArray *priceLabelList;

@property (copy, nonatomic) NSArray *goodsImageUrlList;
@property (copy, nonatomic) NSArray *bigImageUrlList;
@end

@implementation DolphinGoodsCollectionViewCell
+ (NSString *)getCellIdentifier {
    return @"DolphinGoodsCollectionViewCell";
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _goodsImageUrlList = [self generateGoodsImageUrlList];
        _bigImageUrlList = [self generateBigImageUrlList];
        [self setupCell];
    }
    return self;
}

- (void)updateCellWithDataDict:(NSDictionary *)dataDict {
    
}

- (void)setupCell {
    self.mainImageView = [[UIImageView alloc] init];
    [_mainImageView sd_setImageWithURL:[self randomBigImageUrl]];
    [self.contentView addSubview:_mainImageView];
    
    NSMutableArray *imageArray = [NSMutableArray array];
    UIImageView *firstImageView = [[UIImageView alloc] init];
    [firstImageView sd_setImageWithURL:[self randomGoodsImageUrl]];
    [self.contentView addSubview:firstImageView];
    [imageArray addObject:firstImageView];
    UIImageView *secondImageView = [[UIImageView alloc] init];
    [secondImageView sd_setImageWithURL:[self randomGoodsImageUrl]];
    [self.contentView addSubview:secondImageView];
    [imageArray addObject:secondImageView];
    UIImageView *thirdImageView = [[UIImageView alloc] init];
    [thirdImageView sd_setImageWithURL:[self randomGoodsImageUrl]];
    [self.contentView addSubview:thirdImageView];
    [imageArray addObject:thirdImageView];
    self.imageViewList = [imageArray copy];
    
    NSMutableArray *titleLabelArray = [NSMutableArray array];
    UILabel *firstTitleLabel = [[UILabel alloc] init];
    [self.contentView addSubview:firstTitleLabel];
    [titleLabelArray addObject:firstTitleLabel];
    UILabel *secondTitleLabel = [[UILabel alloc] init];
    [self.contentView addSubview:secondTitleLabel];
    [titleLabelArray addObject:secondTitleLabel];
    UILabel *thirdTitleLabel = [[UILabel alloc] init];
    [self.contentView addSubview:thirdTitleLabel];
    [titleLabelArray addObject:thirdTitleLabel];
    self.titleLabelList = [titleLabelArray copy];
    //虚拟
    [firstTitleLabel setText:@"标题"];
    [secondTitleLabel setText:@"标题"];
    [thirdTitleLabel setText:@"标题"];
    
    NSMutableArray *priceLabelArray = [NSMutableArray array];
    UILabel *firstPriceLabel = [[UILabel alloc] init];
    [self.contentView addSubview:firstPriceLabel];
    [priceLabelArray addObject:firstPriceLabel];
    UILabel *secondPriceLabel = [[UILabel alloc] init];
    [self.contentView addSubview:secondPriceLabel];
    [priceLabelArray addObject:secondPriceLabel];
    UILabel *thirdPriceLabel = [[UILabel alloc] init];
    [self.contentView addSubview:thirdPriceLabel];
    [priceLabelArray addObject:thirdPriceLabel];
    self.priceLabelList = [priceLabelArray copy];
    //虚拟
    [firstPriceLabel setText:@"价格"];
    [secondPriceLabel setText:@"价格"];
    [thirdPriceLabel setText:@"价格"];
    
    __weak __typeof(&*self)weakSelf = self;
    [_mainImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(weakSelf).multipliedBy(0.4);
        make.top.equalTo(weakSelf.contentView);
        make.leading.and.trailing.equalTo(weakSelf.contentView);
    }];
    [firstImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(weakSelf.contentView);
        make.trailing.equalTo(secondImageView.mas_leading);
        make.top.equalTo(weakSelf.mainImageView.mas_bottom).offset(10);
        make.height.equalTo(firstImageView.mas_width);
    }];
    [secondImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(thirdImageView.mas_leading);
        make.top.equalTo(firstImageView);
        make.width.equalTo(firstImageView);
        make.height.equalTo(secondImageView.mas_width);
    }];
    [thirdImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(weakSelf.contentView);
        make.top.equalTo(firstImageView);
        make.width.equalTo(firstImageView);
        make.height.equalTo(thirdImageView.mas_width);
    }];
    [firstTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(firstImageView.mas_bottom);
        make.centerX.equalTo(firstImageView);
        make.width.equalTo(firstImageView);
    }];
    [secondTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(firstTitleLabel);
        make.centerX.equalTo(secondImageView);
        make.width.equalTo(secondImageView);
    }];
    [thirdTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(firstTitleLabel);
        make.centerX.equalTo(thirdImageView);
        make.width.equalTo(thirdImageView);
    }];
    [firstPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(firstTitleLabel.mas_bottom);
        make.centerX.equalTo(firstTitleLabel);
    }];
    [secondPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(firstPriceLabel);
        make.centerX.equalTo(secondTitleLabel);
    }];
    [thirdPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(firstPriceLabel);
        make.centerX.equalTo(thirdTitleLabel);
    }];
}

- (NSArray *)generateGoodsImageUrlList {
    return @[
             @"http://assets.haituncun.com/media/catalog/product/f/b/fbajphus60010003x.jpg?imageView2/0/w/232/h/232",
             @"http://assets.haituncun.com/media/catalog/product/f/b/fbajpcos10010038_1.jpg?imageView2/0/w/232/h/232",
             @"http://assets.haituncun.com/media/catalog/product/b/l/blmnzspl30020018x2.jpg?imageView2/0/w/232/h/232",
             @"http://assets.haituncun.com/media/catalog/product/r/e/red-seal-molasses-500g2_1.jpg?imageView2/0/w/232/h/232",
             @"http://assets.haituncun.com/media/catalog/product/s/w/swiauspl30020011x3.jpg?imageView2/0/w/232/h/232",
             @"http://assets.haituncun.com/media/catalog/product/f/b/fbagbspl30010016x2_1_1.jpg?imageView2/0/w/232/h/232",
             @"http://assets.haituncun.com/media/catalog/product/c/h/chiusspl30010002_1.jpg?imageView2/0/w/232/h/232",
             @"http://assets.haituncun.com/media/catalog/product/r/s/rslauspl30020002x3.jpg?imageView2/0/w/232/h/232",
             @"http://assets.haituncun.com/media/catalog/product/w/l/wldusbbya0030003.jpg?imageView2/0/w/232/h/232",
             @"http://assets.haituncun.com/media/catalog/product/f/b/fbakrcos10010003.jpg?imageView2/0/w/200/h/200",
             @"http://assets.haituncun.com/media/catalog/product/f/b/fbakrcos10010058x6_1.jpg?imageView2/0/w/200/h/200",
             @"http://assets.haituncun.com/media/catalog/product/f/b/fbakrcos10010062__1.jpg?imageView2/0/w/200/h/200",
             @"http://assets.haituncun.com/media/catalog/product/f/b/fbajpcos10010023.jpg?imageView2/0/w/200/h/200",
             @"http://assets.haituncun.com/media/catalog/product/f/b/fbagbcos10010005x2.jpg?imageView2/0/w/200/h/200",
             @"http://assets.haituncun.com/media/catalog/product/o/v/ovdauspl30010008x2.jpg?imageView2/0/w/200/h/200",
             @"http://assets.haituncun.com/media/catalog/product/f/b/fbadespl30020004x2.jpg?imageView2/0/w/200/h/200"
             ];
}

- (NSArray *)generateBigImageUrlList {
    return @[
             @"http://app-img.haituncun.com/uploads/images/recommend/bannner/6c3f5e0ca91367d9d35f2afc7db7f1ee.jpg",
             @"http://app-img.haituncun.com/uploads/images/recommend/bannner/2299e0ee63407d8d3d454c3e99acea61.jpg",
             @"http://app-img.haituncun.com/uploads/images/recommend/bannner/6566fb1cfe55d5f5f39d11097156efa7.jpg",
             @"http://app-img.haituncun.com/uploads/images/recommend/bannner/6855eb4cc29edc52c7f6961d21e1ca44.jpg",
             @"http://app-img.haituncun.com/uploads/images/recommend/bannner/9574777713406cae924043fd63452b3a.jpg"
             ];
}

- (NSURL *)randomGoodsImageUrl {
    NSString *urlString = [_goodsImageUrlList objectAtIndex:arc4random()%_goodsImageUrlList.count];
    return [NSURL URLWithString:urlString];
}

- (NSURL *)randomBigImageUrl {
    NSString *urlString = [_bigImageUrlList objectAtIndex:arc4random()%_bigImageUrlList.count];
    return [NSURL URLWithString:urlString];
}
@end


//商品图片url:
//http://assets.haituncun.com/media/catalog/product/f/b/fbajphus60010003x.jpg?imageView2/0/w/232/h/232
//URL	http://assets.haituncun.com/media/catalog/product/f/b/fbajpcos10010038_1.jpg?imageView2/0/w/232/h/232
//URL	http://assets.haituncun.com/media/catalog/product/b/l/blmnzspl30020018x2.jpg?imageView2/0/w/232/h/232
//URL	http://assets.haituncun.com/media/catalog/product/r/e/red-seal-molasses-500g2_1.jpg?imageView2/0/w/232/h/232
//URL	http://assets.haituncun.com/media/catalog/product/s/w/swiauspl30020011x3.jpg?imageView2/0/w/232/h/232
//URL	http://assets.haituncun.com/media/catalog/product/f/b/fbagbspl30010016x2_1_1.jpg?imageView2/0/w/232/h/232
//URL	http://assets.haituncun.com/media/catalog/product/c/h/chiusspl30010002_1.jpg?imageView2/0/w/232/h/232
//URL	http://assets.haituncun.com/media/catalog/product/r/s/rslauspl30020002x3.jpg?imageView2/0/w/232/h/232
//URL	http://assets.haituncun.com/media/catalog/product/w/l/wldusbbya0030003.jpg?imageView2/0/w/232/h/232
//URL	http://assets.haituncun.com/media/catalog/product/f/b/fbakrcos10010003.jpg?imageView2/0/w/200/h/200
//URL	http://assets.haituncun.com/media/catalog/product/f/b/fbakrcos10010058x6_1.jpg?imageView2/0/w/200/h/200
//URL	http://assets.haituncun.com/media/catalog/product/f/b/fbakrcos10010062__1.jpg?imageView2/0/w/200/h/200
//URL	http://assets.haituncun.com/media/catalog/product/f/b/fbajpcos10010023.jpg?imageView2/0/w/200/h/200
//URL	http://assets.haituncun.com/media/catalog/product/f/b/fbagbcos10010005x2.jpg?imageView2/0/w/200/h/200
//URL	http://assets.haituncun.com/media/catalog/product/o/v/ovdauspl30010008x2.jpg?imageView2/0/w/200/h/200
//URL	http://assets.haituncun.com/media/catalog/product/f/b/fbadespl30020004x2.jpg?imageView2/0/w/200/h/200



//国家馆图片url:
//URL	http://app-img.haituncun.com/uploads/images/recommend/bannner/6c3f5e0ca91367d9d35f2afc7db7f1ee.jpg
//URL	http://app-img.haituncun.com/uploads/images/recommend/bannner/2299e0ee63407d8d3d454c3e99acea61.jpg
//URL	http://app-img.haituncun.com/uploads/images/recommend/bannner/6566fb1cfe55d5f5f39d11097156efa7.jpg
//URL	http://app-img.haituncun.com/uploads/images/recommend/bannner/6855eb4cc29edc52c7f6961d21e1ca44.jpg
//URL	http://app-img.haituncun.com/uploads/images/recommend/bannner/9574777713406cae924043fd63452b3a.jpg
//