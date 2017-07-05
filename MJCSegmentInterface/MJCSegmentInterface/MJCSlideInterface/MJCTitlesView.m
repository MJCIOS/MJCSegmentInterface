//
//  MJCTitlesView.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/4.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCTitlesView.h"

@interface MJCTitlesView ()


@end

@implementation MJCTitlesView


-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.backgroundColor = [UIColor whiteColor];
    }    
    return self;
}

@end
