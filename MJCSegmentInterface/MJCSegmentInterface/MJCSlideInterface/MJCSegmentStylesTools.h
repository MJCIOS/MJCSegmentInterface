//
//  MJCSegmentStylesTools.h
//  MJCSegmentInterface
//
//  Created by mjc on 2017/11/6.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//标题样式
typedef NS_OPTIONS(NSUInteger,MJCTitleBarStyles) {
    MJCTitlesClassicStyle = 0,      //经典标题样式
    MJCTitlesScrollStyle = 1       //滚动标题栏样式
} ;
//底部指示器样式
typedef NS_OPTIONS(NSUInteger,MJCIndicatorStyles) {
    MJCIndicatorItemStyle = 0,  //普通的指示器样式(与item宽度一样)
    MJCIndicatorItemTextStyle = 1  //指示器与文字宽度一样的样式
};

//按钮图片样式
typedef NS_OPTIONS(NSUInteger,MJCImageEffectStyles) {
    MJCImageClassicStyle = 0,  //普通的图片文字样式,左右样式
    MJCImageUpDownStyle = 1,  //图片和文字上下的样式
    MJCImageCenterStyle = 2  //图片和文字都在中间的样式
};

typedef struct MJCEdgeInsets {
    CGFloat maxTop, maxLeft, maxBottom, maxRight,lineMargin;
} MJCEdgeInsets;

UIKIT_STATIC_INLINE MJCEdgeInsets MJCEdgeInsetsMake(CGFloat maxTop, CGFloat maxLeft, CGFloat maxBottom, CGFloat maxRight,CGFloat lineMargin) {
    MJCEdgeInsets edgeInsets  = {maxTop, maxLeft, maxBottom, maxRight,lineMargin};
    return edgeInsets;
}


@interface MJCSegmentStylesTools : NSObject

+(instancetype)jc_initWithjc_toolsBlock:(void(^)(MJCSegmentStylesTools *jc_tools))toolsBlock;

#pragma mark -- 通用设置的设置
/** 是否启用比例布局 */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_scaleLayoutEnabled)(BOOL scaleLayoutEnabled);
@property (nonatomic,assign) BOOL  scaleLayoutEnabled;



#pragma mark -- 子界面效果的设置

/** (子视图)滚动是否有动画 */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_childScollAnimalEnabled)(BOOL childScollAnimalEnabled);
@property(nonatomic,assign) BOOL childScollAnimalEnabled;
/** (子视图)是否开启手拽滑动 */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_childScollEnabled)(BOOL childScollEnabled);
@property (nonatomic,assign) BOOL childScollEnabled;
/** (子视图)主容器的背景色 */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_childsContainerBackColor)(UIColor *childsContainerBackColor);
@property (nonatomic,strong) UIColor *childsContainerBackColor;


#pragma mark -- 标题栏设置

/** (标题栏)启用穿透效果 */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_titlesViewPenetrationEnabled)(BOOL titlesViewPenetrationEnabled);
@property (nonatomic,assign) BOOL  titlesViewPenetrationEnabled;

/** 标题栏样式 */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_titleBarStyles)(MJCTitleBarStyles);
@property (nonatomic,assign) MJCTitleBarStyles titleBarStyles;

/** 标题栏颜色 */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_titlesViewBackColor)(UIColor *titlesViewBackColor);
@property (nonatomic,strong,readonly) UIColor *titlesViewBackColor;
/** 标题栏frame */
@property (nonatomic,assign,readonly) CGRect titlesViewFrame;
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_titlesViewFrame)(CGRect titlesViewFrame);
/** 标题栏背景图片 */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_titlesViewBackImage)(UIImage *titlesViewBackImage);
@property (nonatomic,strong,readonly) UIImage *titlesViewBackImage;

#pragma mark -- 指示器设置

/** 指示器的颜色是否与文字颜色一样 */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_indicatorColorEqualTextColorEnabled)(BOOL indicatorColorEqualTextColorEnabled);
@property (nonatomic,assign) BOOL indicatorColorEqualTextColorEnabled;

/** (指示器)启用动画效果 */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_indicatorsAnimalsEnabled)(BOOL indicatorsAnimalsEnabled);
@property(nonatomic,assign) BOOL indicatorsAnimalsEnabled;
/** 底部指示器是否跟随滚动 */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_indicatorFollowEnabled)(BOOL indicatorFollowEnabled);
@property (nonatomic,assign) BOOL indicatorFollowEnabled;
/** 底部指示器大小样式 */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_indicatorStyles)(MJCIndicatorStyles);
@property (nonatomic,assign) MJCIndicatorStyles indicatorStyles;

/** 可设置指示器的Y值和高度,其余不允许自己设置 */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_indicatorFrame)(CGRect indicatorFrame);
@property (nonatomic,assign) CGRect indicatorFrame;
/** 底部指示器背景色 */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_indicatorColor)(UIColor *indicatorColor);
@property (nonatomic,strong) UIColor *indicatorColor;
/** 底部指示器图片(设置了图片的话,此控件是根据图片本身的大小自适应的) */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_indicatorImage)(UIImage *indicatorImage);
@property (nonatomic,strong) UIImage *indicatorImage;
/** 底部指示器是否隐藏 */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_indicatorHidden)(BOOL indicatorHidden);
@property (nonatomic,assign) BOOL indicatorHidden;

#pragma mark -- item设置
/** (item)启用滑动颜色渐变 */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_itemTextGradientEnabled)(BOOL itemTextGradientEnabled);
@property (nonatomic,assign) BOOL itemTextGradientEnabled;

/** 是否显示标题文字 */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_itemTextHidden)(BOOL itemTextHidden);
@property(nonatomic,assign) BOOL itemTextHidden;
/** 默认选中的item */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_itemSelectedSegmentIndex)(NSInteger itemSelectedSegmentIndex);
@property (nonatomic,assign) NSInteger itemSelectedSegmentIndex;
/** 默认显示多少个item (初始显示4个) */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_ItemDefaultShowCount)(NSInteger ItemDefaultShowCount);
@property (nonatomic,assign) NSInteger ItemDefaultShowCount;

/** item文字的内边距 */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_itemTextsEdgeInsets)(UIEdgeInsets);
@property(nonatomic)   UIEdgeInsets itemTextsEdgeInsets;
/** item图片的内边距 */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_itemImagesEdgeInsets)(UIEdgeInsets);
@property(nonatomic)   UIEdgeInsets itemImagesEdgeInsets;

/** item最大内边距和两个item之间的间距(如果是item高度自适应,设置top和bottom无效) */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_itemEdgeinsets)(MJCEdgeInsets);
@property (nonatomic) MJCEdgeInsets itemEdgeinsets;

/** item图片效果样式 */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_itemImageEffectStyles)(MJCImageEffectStyles);
@property (nonatomic,assign) MJCImageEffectStyles itemImageEffectStyles;

/** item背景颜色 */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_itemBackColor)(UIColor *itemBackColor);
@property (nonatomic,strong,readonly) UIColor *itemBackColor;
/** item普通状态下文字颜色 */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_itemTextNormalColor)(UIColor *itemTextNormalColor);
@property (nonatomic,strong,readonly) UIColor *itemTextNormalColor;
/** item高亮状态下文字颜色 */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_itemTextSelectedColor)(UIColor *itemTextSelectedColor);
@property (nonatomic,strong,readonly) UIColor *itemTextSelectedColor;
/** item文字大小 */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_itemTextFontSize)(CGFloat itemTextFontSize);
@property (nonatomic,assign,readonly) CGFloat itemTextFontSize;
/** item普通状态下的图片 */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_itemImageNormal)(UIImage *itemImageNormal);
@property (nonatomic,strong,readonly) UIImage *itemImageNormal;
/** item点击状态下的图片 */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_itemImageSelected)(UIImage *itemImageSelected);
@property (nonatomic,strong,readonly) UIImage *itemImageSelected;
/** item普通状态下图片数组 */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_itemImageArrayNormal)(NSArray *itemImageArrayNormal);
@property (nonatomic,strong,readonly) NSArray *itemImageArrayNormal;
/** item点击状态下图片数组 */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_itemImageArraySelected)(NSArray *itemImageArraySelected);
@property (nonatomic,strong,readonly) NSArray *itemImageArraySelected;
/** item普通状态下背景图片 */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_itemBackImageNormal)(UIImage *itemBackImageNormal);
@property (nonatomic,strong,readonly) UIImage *itemBackImageNormal;
/** item点击状态下背景图片 */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_itemBackImageSelected)(UIImage *itemBackImageSelected);
@property (nonatomic,strong,readonly) UIImage *itemBackImageSelected;
/** item普通状态下背景图片数组 */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_itemBackImageArrayNormal)(NSArray *itemBackImageArrayNormal);
@property (nonatomic,strong,readonly) NSArray *itemBackImageArrayNormal;
/** item点击状态下背景图片数组 */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_itemBackImageArraySelected)(NSArray *itemBackImageArraySelected);
@property (nonatomic,strong,readonly) NSArray *itemBackImageArraySelected;
/** item的图片大小(不能设置背景图片) */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_itemImageSize)(CGSize itemImageSize);
@property (nonatomic,assign,readonly) CGSize itemImageSize;
/** item普通状态下文字颜色数组(可以让文字显示不同的颜色)(不支持颜色渐变) */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_itemTextColorArrayNormal)(NSArray *itemTextColorArrayNormal);
@property (nonatomic,strong,readonly) NSArray *itemTextColorArrayNormal;
/** item点击状态下文字颜色数组(可以让文字显示不同的颜色)(不支持颜色渐变) */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_itemTextColorArraySelected)(NSArray *itemTextColorArraySelected);
@property (nonatomic,strong,readonly) NSArray *itemTextColorArraySelected;

/** tabitem内容自适应:(高度自适应或宽度自适应)(如果是item高度自适应,设置内边距top和bottom无效)*/
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_tabItemSizeToFitIsEnabled)(BOOL sizeToFitIsEnabled,BOOL heightToFitIsEnabled, BOOL widthToFitIsEnabled);
@property (nonatomic,assign) BOOL itemSizeToFitIsEnabled;
@property (nonatomic,assign) BOOL itemHeightToFitIsEnabled;
@property (nonatomic,assign) BOOL itemWidthToFitIsEnabled;
/** 用于缩放功能的修改字体的属性 */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_tabItemTextZoomBigEnabled)(BOOL zoomBigEnabled,CGFloat itemTextMaxfontSize);
@property (nonatomic,assign) BOOL itemTextZoomBigEnabled;
@property (nonatomic,assign) CGFloat itemTextMaxfontSize;



@end
