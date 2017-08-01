//
//  MJCToolClasses.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/2/22.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCInterfaceTools.h"
#import "UIView+MJCClassExtension.h"
#import "MJCSegmentInterface.h"

static CGFloat const animalTime= 0.25;//动画时间

@implementation MJCInterfaceTools

static MJCInterfaceTools *toolClasses = nil;
+ (MJCInterfaceTools *)toolClasses
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (toolClasses == nil) {
            toolClasses = [[self alloc] init];
        }
    });
    return toolClasses;
}


- (void)selectedTitleCenter:(UIButton *)button titlesScrollView:(UIScrollView *)titlesScrollView;
{
    // 本质:修改titleScrollView偏移量
    CGFloat offsetX = button.center.x - titlesScrollView.frame.size.width * 0.7;
    //    CGFloat offsetX = button.center.x - MJCScreenWidth * 0.5;
    
    if (offsetX < 0) {
        offsetX = 0;
    }
    
    CGFloat maxOffsetX = titlesScrollView.contentSize.width - titlesScrollView.frame.size.width;
    //    CGFloat maxOffsetX = self.titlesScrollView.contentSize.width - MJCScreenWidth + _titleCenterMargin;
    
    if (offsetX > maxOffsetX) {
        offsetX = maxOffsetX;
    }
    
    [titlesScrollView setContentOffset: CGPointMake(offsetX, 0) animated:YES];
}

-(void)setupIndicatorViewCenterAndWidthIsAnimal:(BOOL)isChildScollAnimal indicatorStyles:(NSUInteger)indicatorStyles selectedTitleButton:(UIButton*)selectedTitleButton indicatorFrame:(CGRect)indicatorFrame indicatorView:(UIButton*)indicatorView
{
    if (isChildScollAnimal) {
        if (indicatorStyles == MJCIndicatorItemTextStyle) {
            [selectedTitleButton.titleLabel sizeToFit];
            [UIView animateWithDuration:animalTime animations:^{
                indicatorView.jc_width = selectedTitleButton.titleLabel.jc_width;
                indicatorView.jc_centerX = selectedTitleButton.jc_centerX;
            }];
        }else{
            CGFloat indiCatorNewW;
            if (indicatorFrame.size.width == 0) {
                indiCatorNewW = selectedTitleButton.jc_width;
            }else{
                indiCatorNewW = indicatorFrame.size.width;
            }
            [UIView animateWithDuration:animalTime animations:^{
                indicatorView.jc_width = indiCatorNewW;
                indicatorView.jc_centerX = selectedTitleButton.jc_centerX;
            }];;
        }
    }else{
        if (indicatorStyles == MJCIndicatorItemTextStyle) {
            [selectedTitleButton.titleLabel sizeToFit];
            indicatorView.jc_width = selectedTitleButton.titleLabel.jc_width;
            indicatorView.jc_centerX = selectedTitleButton.jc_centerX;
        }else{
            if (indicatorFrame.size.width == 0) {
                indicatorView.jc_width = selectedTitleButton.jc_width;
            }else{
                indicatorView.jc_width = indicatorFrame.size.width;
            }
            indicatorView.jc_centerX = selectedTitleButton.jc_centerX;
        }
    }
}


@end
