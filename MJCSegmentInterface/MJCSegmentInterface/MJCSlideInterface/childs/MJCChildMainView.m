//
//  MJCChildScrollView.m
//  MJCSlideSwitch
//
//  Created by mjc on 16/10/26.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "MJCChildMainView.h"
#import "UIView+MJCClassExtension.h"

static CGFloat const animalTime= 0.25;//动画时间
@interface MJCChildMainView ()


@end


@implementation MJCChildMainView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.pagingEnabled = YES;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        self.bounces = YES;
//        self.directionalLockEnabled = YES;
//        self.scrollsToTop = NO; // 点击状态栏的时候，这个scrollView不会滚动到最顶部
    }
    return self;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    self.backgroundColor = [UIColor whiteColor];
    self.pagingEnabled = YES;
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    self.bounces = YES;
}

-(void)setupChildViewScollAnimal:(UIButton *)titleButton isChildScollAnimal:(BOOL)isChildScollAnimal
{
    if (isChildScollAnimal == YES) {
        [UIView animateWithDuration:animalTime animations:^{
            CGPoint offset = self.contentOffset;
            offset.x = titleButton.tag * self.jc_width;
            [self setContentOffset:offset animated:NO];
        }];
    }else{
        CGPoint offset = self.contentOffset;
        offset.x = titleButton.tag * self.jc_width;
        [self setContentOffset:offset animated:NO];
    }
}


@end
