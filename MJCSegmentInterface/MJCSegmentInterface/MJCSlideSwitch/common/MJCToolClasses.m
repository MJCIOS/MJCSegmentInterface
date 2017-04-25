//
//  MJCToolClasses.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/2/22.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCToolClasses.h"
#import "UIView+MJCExtenSion.h"

#define minFont 14
#define maxFont 18


@implementation MJCToolClasses

//防止导航栏挡住的方法
+(void)useNavOrTabbarNotBeCover:(UIViewController *)controllers rectEdge:(UIRectEdge)rectEdge;
{
    if ([controllers respondsToSelector:@selector(edgesForExtendedLayout)]) {
        controllers.edgesForExtendedLayout = rectEdge;
    }
}


//选中滚动标题居中效果的方法的效果
+ (void)selectedTitleCenter:(UIButton *)button titlesScrollView:(UIScrollView *)titlesScrollView
{
    // 本质:修改titleScrollView偏移量
    CGFloat offsetX = button.center.x - titlesScrollView.mjc_width * 0.4;
    //    CGFloat offsetX = button.center.x - MJCScreenWidth * 0.5;
    
    if (offsetX < 0) {
        offsetX = 0;
    }
    
    CGFloat maxOffsetX = titlesScrollView.contentSize.width - titlesScrollView.mjc_width;
    //    CGFloat maxOffsetX = self.titlesScrollView.contentSize.width - MJCScreenWidth + _titleCenterMargin;
    
    if (offsetX > maxOffsetX) {
        offsetX = maxOffsetX;
    }
    
    [titlesScrollView setContentOffset: CGPointMake(offsetX, 0) animated:YES];
}



@end
