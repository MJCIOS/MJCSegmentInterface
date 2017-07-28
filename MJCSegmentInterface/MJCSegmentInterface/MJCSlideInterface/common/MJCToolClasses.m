//
//  MJCToolClasses.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/2/22.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCToolClasses.h"
#import "UIView+MJCClassExtension.h"
#import "MJCSegmentInterface.h"

static CGFloat const animalTime= 0.25;//动画时间

@implementation MJCToolClasses

static MJCToolClasses *toolClasses = nil;
+ (MJCToolClasses *)toolClasses
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (toolClasses == nil) {
            toolClasses = [[self alloc] init];
        }
    });
    return toolClasses;
}


//防止导航栏挡住的方法
-(void)useNavOrTabbarNotBeCover:(UIViewController *)controllers rectEdge:(UIRectEdge)rectEdge;
{
    if ([controllers respondsToSelector:@selector(edgesForExtendedLayout)]) {
        controllers.edgesForExtendedLayout = rectEdge;
    }
}


//选中滚动标题居中效果的方法的效果
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


//设置点击的item下方指示器的位置
-(void)setupIndicatorViewCenterAndWidthIsAnimal:(BOOL)isChildScollAnimal indicatorStyles:(NSUInteger)indicatorStyles selectedTitleButton:(UIButton*)selectedTitleButton indicatorFrame:(CGRect)indicatorFrame indicatorView:(UIButton*)indicatorView
{
    if (isChildScollAnimal) {//是否有动画
        if (indicatorStyles == MJCIndicatorItemTextStyle) {//指示器类型
            [selectedTitleButton.titleLabel sizeToFit];
            [UIView animateWithDuration:animalTime animations:^{
                indicatorView.jc_width = selectedTitleButton.titleLabel.jc_width;//修改指示器宽度
                indicatorView.jc_centerX = selectedTitleButton.jc_centerX;
            }];
        }else{
            CGFloat indiCatorNewW;//指示器新的宽度
            if (indicatorFrame.size.width == 0) {
                indiCatorNewW = selectedTitleButton.jc_width;//获取到按钮的宽度
            }else{
                indiCatorNewW = indicatorFrame.size.width;//获取到外界设置的宽度
            }
            [UIView animateWithDuration:animalTime animations:^{//实行动画
                indicatorView.jc_width = indiCatorNewW;
                indicatorView.jc_centerX = selectedTitleButton.jc_centerX;
            }];;
        }
    }else{//没有动画
        if (indicatorStyles == MJCIndicatorItemTextStyle) {//指示器类型
            [selectedTitleButton.titleLabel sizeToFit];
            indicatorView.jc_width = selectedTitleButton.titleLabel.jc_width;//修改指示器宽度
            indicatorView.jc_centerX = selectedTitleButton.jc_centerX;
        }else{
            if (indicatorFrame.size.width == 0) {
                indicatorView.jc_width = selectedTitleButton.jc_width;//获取到按钮的宽度
            }else{
                indicatorView.jc_width = indicatorFrame.size.width;//获取到外界设置的宽度
            }
            indicatorView.jc_centerX = selectedTitleButton.jc_centerX;
        }
    }
}




@end
