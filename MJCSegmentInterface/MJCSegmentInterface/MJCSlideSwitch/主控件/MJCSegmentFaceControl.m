//
//  MJCSegmentsInterface.m
//  MJCSegmentInterface
//
//  Created by mjc on 16/12/16.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "MJCSegmentFaceControl.h"
#import "MJCSegmentInterface.h"

@interface MJCSegmentFaceControl ()

/** <#  注释  #> */
@property (nonatomic,strong) MJCSegmentInterface *segerntInterface;


@end



@implementation MJCSegmentFaceControl


////有导航栏或者tabbar时,保证标题栏不会被覆盖,(直接把这句代码复制控制器中就OK了)
//if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
//    self.edgesForExtendedLayout = UIRectEdgeNone;
//}



-(UIView *)intoFaceView
{
    MJCSegmentInterface *segernsinterface = [[MJCSegmentInterface alloc]init];
    _segerntInterface = segernsinterface;
    _segerntInterface.frame = MJCScreenbound;
    [segernsinterface setSegmentInterFaceStyle:SegMentInterfaceStyleClassic];
    
    return _segerntInterface;
}

-(void)intoTitlesArray:(NSArray *)titlesArray
{
    [_segerntInterface intoTitlesArray:titlesArray];
}

-(void)intoChildViewController:(UIViewController *)childViewController;
{
    [_segerntInterface intoChildViewController:childViewController];
}

-(void)setInterFaceControlStyle:(MJCSegmentInterfaceStyle)interFaceControlStyle
{
    _segerntInterface.SegmentInterFaceStyle = interFaceControlStyle;
}


-(void)setInterFacesStyle:(MJCSegmentInterfaceStyle)interFacesStyle
{
    _segerntInterface.SegmentInterFaceStyle = interFacesStyle;
    
}

-(void)setScrollTitlesEnabled:(BOOL)scrollTitlesEnabled
{
    _segerntInterface.scrollTitlesEnabled = scrollTitlesEnabled;
}

-(void)setChildScollEnabled:(BOOL)childScollEnabled
{
    _segerntInterface.childViewEnabled = childScollEnabled;
}

-(void)setupFaceViewFrame:(CGRect)faceViewFrame;
{
    _segerntInterface.frame = faceViewFrame;
}

-(void)setTitlesViewframe:(CGRect)titlesViewframe
{
    [_segerntInterface isTitlesViewframe:YES titlesViewframe:titlesViewframe];
}

-(void)setTitlesViewColor:(UIColor *)titlesViewColor
{
    _segerntInterface.titlesViewColor = titlesViewColor;
}

-(void)setTitleScrollframe:(CGRect)titleScrollframe
{
    [_segerntInterface isTitlesScrollframe:YES titlesScrollframe:titleScrollframe];
}

-(void)setTitleScrollColor:(UIColor *)titleScrollColor
{
    _segerntInterface.titleScrollColor = titleScrollColor;
}

-(void)setChildViewframe:(CGRect)childViewframe
{
    [_segerntInterface isChildViewframe:YES childViewframe:childViewframe];
}

-(void)setChildViewScollAnimal:(BOOL)childViewScollAnimal
{
    [_segerntInterface setChildViewScollAnimal:childViewScollAnimal];
}



-(void)setIndicatorWidth:(CGFloat)indicatorWidth
{
    _segerntInterface.indicatorWidth = indicatorWidth;
}

-(void)setIndicatorColor:(UIColor *)indicatorColor
{
    _segerntInterface.indicatorColor = indicatorColor;
}

-(void)setIndicatorHidden:(BOOL)indicatorHidden
{
    _segerntInterface.indicatorHidden = indicatorHidden;
}

-(void)setIndicatorFrame:(CGRect)indicatorFrame
{
    [_segerntInterface isindicatorFrame:YES indicatorFrame:indicatorFrame];
}



-(void)setTopViewHidden:(BOOL)topViewHidden
{
    _segerntInterface.topViewHidden = topViewHidden;
}

-(void)setTopViewColor:(UIColor *)topViewColor
{
    _segerntInterface.topViewColor = topViewColor;
}

-(void)setTopViewHegiht:(CGFloat)topViewHegiht
{
    _segerntInterface.topViewHegiht = topViewHegiht;
}

-(void)setTopViewFrame:(CGRect)topViewFrame
{
    [_segerntInterface isTopViewFrame:YES setTopViewFrame:topViewFrame];
}



-(void)setBottomViewHidden:(BOOL)bottomViewHidden
{
    _segerntInterface.bottomViewHidden = bottomViewHidden;
}

-(void)setBottomViewColor:(UIColor *)bottomViewColor
{
    _segerntInterface.bottomViewColor = bottomViewColor;
}

-(void)setBottomViewHegiht:(CGFloat)bottomViewHegiht
{
    _segerntInterface.bottomViewHegiht = bottomViewHegiht;
}

-(void)setBottomViewFrame:(CGRect)bottomViewFrame
{
    [_segerntInterface isBottomViewFrame:YES setBottomViewFrame:bottomViewFrame];
}




-(void)setTabItemBackColor:(UIColor *)tabItemBackColor
{
    _segerntInterface.tabItemBackColor = tabItemBackColor;
}

-(void)setTabItemTitlesfont:(UIFont *)tabItemTitlesfont
{
    _segerntInterface.tabItemTitlesfont = tabItemTitlesfont;
}

-(void)setTabItemWidth:(CGFloat)tabItemWidth
{
    _segerntInterface.tabItemWidth = tabItemWidth;
}

-(void)setTabItemFrame:(CGRect)tabItemFrame
{
    [_segerntInterface isTabItemFrame:YES tabItemFrame:tabItemFrame];
}

-(void)setTabItemTitleNormalColor:(UIColor *)tabItemTitleNormalColor
{
    _segerntInterface.tabItemTitleNormalColor = tabItemTitleNormalColor;
}

-(void)setTabItemTitleSelectedColor:(UIColor *)tabItemTitleSelectedColor
{
    _segerntInterface.tabItemTitleSelectedColor = tabItemTitleSelectedColor;
}

-(void)setTabItemImageNormal:(UIImage *)tabItemImageNormal
{
    _segerntInterface.tabItemImageNormal = tabItemImageNormal;
}

-(void)setTabItemImageSelected:(UIImage *)tabItemImageSelected
{
    _segerntInterface.tabItemImageSelected = tabItemImageSelected;
}

-(void)setTabItemImageNormalArray:(NSArray *)tabItemImageNormalArray
{
    _segerntInterface.tabItemImageNormalArray = tabItemImageNormalArray;
}

-(void)setTabItemImageSelectedArray:(NSArray *)tabItemImageSelectedArray
{
    _segerntInterface.tabItemImageSelectedArray = tabItemImageSelectedArray;
}



-(void)setVerticalLineShow:(BOOL)verticalLineShow
{
    _segerntInterface.rightViewShow = verticalLineShow;
}

-(void)setVerticalLineColor:(UIColor *)verticalLineColor
{
    _segerntInterface.rightColor = verticalLineColor;
}

-(void)setVerticalLineHegiht:(CGFloat)verticalLineHegiht
{
    _segerntInterface.rightViewHegiht = verticalLineHegiht;
}
-(void)setVerticalLineHidden:(BOOL)verticalLineHidden
{
    _segerntInterface.rightViewHidden = verticalLineHidden;
}



-(void)setRightMostBtnShow:(BOOL)rightMostBtnShow
{
    _segerntInterface.rightMostBtnShow = rightMostBtnShow;
}

-(void)setRightMostBtnColor:(UIColor *)rightMostBtnColor
{
    _segerntInterface.rightMostBtnColor = rightMostBtnColor;
}

-(void)setRightMostBtnImage:(UIImage *)rightMostBtnImage
{
    _segerntInterface.rightMostBtnImage = rightMostBtnImage;
}

-(void)setRightMostBtnFrame:(CGRect)rightMostBtnFrame
{
    [_segerntInterface isRigthMostFrame:YES rightMostBtnFrame:rightMostBtnFrame];
}

-(void)setMostLeftPosition:(UIImage *)mostLeftPosition
{
    _segerntInterface.mostLeftPosition = mostLeftPosition;
}

-(void)setMostRightPosition:(UIImage *)mostRightPosition
{
    _segerntInterface.mostRightPosition = mostRightPosition;
}

-(void)setIsOpenJump:(BOOL)isOpenJump
{
    _segerntInterface.isOpenJump = isOpenJump;
}

-(void)setSlideDelegate:(id<MJCSlideSwitchViewDelegate>)slideDelegate
{
    _segerntInterface.slideDelegate = slideDelegate;
}




#pragma mark -- 工具方法
-(void)setTitleCenterMargin:(CGFloat)titleCenterMargin
{
    _segerntInterface.titleCenterMargin = titleCenterMargin;
}

-(void)setRightBtnTopMargin:(CGFloat)rightBtnTopMargin
{
    _segerntInterface.rightBtnTopMargin = rightBtnTopMargin;
}

-(void)setRightBtnRightMargin:(CGFloat)rightBtnRightMargin
{
    _segerntInterface.rightBtnRightMargin = rightBtnRightMargin;
}

-(void)setRightBtnBottomMargin:(CGFloat)rightBtnBottomMargin
{
    _segerntInterface.rightBtnBottomMargin = rightBtnBottomMargin;
}

// 图片转换颜色
+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect1 = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    UIGraphicsBeginImageContext(rect1.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect1);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

/*!
 *  通过16进制计算颜色
 *  16机制
 *  颜色对象
 */
+ (UIColor *)colorFromHexRGB:(NSString *)inColorString
{
    UIColor *result = nil;
    unsigned int colorCode = 0;
    unsigned char redByte, greenByte, blueByte;
    
    if (nil != inColorString)
    {
        NSScanner *scanner = [NSScanner scannerWithString:inColorString];
        (void) [scanner scanHexInt:&colorCode]; // ignore error
    }
    redByte = (unsigned char) (colorCode >> 16);
    greenByte = (unsigned char) (colorCode >> 8);
    blueByte = (unsigned char) (colorCode); // masks off high bits
    result = [UIColor
              colorWithRed: (float)redByte / 0xff
              green: (float)greenByte/ 0xff
              blue: (float)blueByte / 0xff
              alpha:1.0];
    return result;
}


@end
