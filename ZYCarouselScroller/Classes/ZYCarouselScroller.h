//
//  ZYCarouselScroller.h
//  ZYCarouselScroller
//
//  Created by zhiyi on 16/11/21.
//  Copyright © 2016年 zhiyi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^UpdateCarouselCellBlock)(UICollectionViewCell *cell, NSDictionary *dataDict);
typedef CGSize (^DynamicCarouselCellSizeBlock)(UICollectionView *collectionView, NSIndexPath *indexPath, NSArray *dataList);

@interface ZYCarouselScroller : UIView
@property (copy, nonatomic) NSArray *dataList;
@property (copy, nonatomic) UpdateCarouselCellBlock updateCarouselCellBlock;
@property (copy, nonatomic) DynamicCarouselCellSizeBlock dynamicCarouselCellSizeBlock;
- (instancetype)initWithFrame:(CGRect)frame
      collectionViewCellClazz:(NSString *)cellClazz
               cellIdentifier:(NSString *)cellIdentifier
                     cellSize:(CGSize)cellSize
                      cellGap:(CGFloat)cellGap
      updateCarouselCellBlock:(UpdateCarouselCellBlock)updateCarouselCellBlock;
@end
