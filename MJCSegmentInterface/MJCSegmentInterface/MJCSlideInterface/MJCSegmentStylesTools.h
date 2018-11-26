//
//  MJCSegmentStylesTools.h
//  MJCSegmentInterface
//
//  Created by mjc on 2017/11/6.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/* 标题栏样式 */
typedef NS_OPTIONS(NSUInteger,MJCTitleBarStyles) {
    MJCTitlesClassicStyle = 0,    /** 固定无滚动标签样式 */
    MJCTitlesScrollStyle = 1      /** 滚动标签样式 */
} ;

/* 底部指示器样式 */
typedef NS_OPTIONS(NSUInteger,MJCIndicatorStyles) {
    MJCIndicatorEqualItemEffect = 0,  /** 指示器与标签的宽度相同的效果 */
    MJCIndicatorEqualTextEffect = 1 /** 指示器与文字宽度宽度相同的效果 */
};

/* 标签文字与图片的样式 */
typedef NS_OPTIONS(NSUInteger,MJCItemTextImageStyle) {
    MJCLeftRightEffect = 0,  /** 图片和文字左右位置效果 */
    MJCUpDownEffect = 1,  /** 图片和文字上下位置效果 */
    MJCCenterEffect = 2  /** 图片和文字中心位置效果 */
};

typedef struct MJCItemEdgeInsets {
    CGFloat maxTop, maxLeft, maxBottom, maxRight,lineMargin;
} MJCItemEdgeInsets;

UIKIT_STATIC_INLINE MJCItemEdgeInsets MJCItemEdgeInsetsMake(CGFloat maxTop, CGFloat maxLeft, CGFloat maxBottom, CGFloat maxRight,CGFloat lineMargin) {
    MJCItemEdgeInsets edgeInsets  = {maxTop, maxLeft, maxBottom, maxRight,lineMargin};
    return edgeInsets;
}

@interface MJCSegmentStylesTools : NSObject

+(instancetype)jc_initWithSegmentStylestoolsBlock:(void(^)(MJCSegmentStylesTools *jc_tools))toolsBlock;

#pragma mark -- 通用设置的设置
/** 是否启用比例布局 */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_scaleLayoutEnabled)(BOOL scaleLayoutEnabled);
@property (nonatomic,assign,readonly) BOOL  scaleLayoutEnabled;

/** 是否加载全部的子界面 */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_loadAllChildViewEnabled)(BOOL loadAllChildViewEnabled);
@property (nonatomic,assign,readonly) BOOL  loadAllChildViewEnabled;


/**自定义子视图的背景控件 */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_customChildBackView)(UIView *customChildBackView);
@property (nonatomic,strong,readonly) UIView *customChildBackView;

#pragma mark -- 子界面效果的设置

/** (子视图)是否开启手拽滑动反弹的效果 */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_childScollBouncesEnabled)(BOOL childScollBouncesEnabled);
@property (nonatomic,assign,readonly) BOOL childScollBouncesEnabled;

/** (子视图)滚动是否有动画 */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_childScollAnimalEnabled)(BOOL childScollAnimalEnabled);
@property(nonatomic,assign,readonly) BOOL childScollAnimalEnabled;
/** (子视图)是否开启手拽滑动 */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_childScollEnabled)(BOOL childScollEnabled);
@property (nonatomic,assign,readonly) BOOL childScollEnabled;
/** (子视图)主容器的背景色 */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_childsContainerBackColor)(UIColor *childsContainerBackColor);
@property (nonatomic,strong,readonly) UIColor *childsContainerBackColor;


#pragma mark -- 标题栏设置

/** (标题栏)启用穿透效果 */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_titlesViewPenetrationEnabled)(BOOL titlesViewPenetrationEnabled);
@property (nonatomic,assign,readonly) BOOL  titlesViewPenetrationEnabled;

/** 标题栏样式 */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_titleBarStyles)(MJCTitleBarStyles);
@property (nonatomic,assign,readonly) MJCTitleBarStyles titleBarStyles;

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

/** 指示器的颜色等于文字选中状态下的颜色启用(默认为NO) */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_indicatorColorEqualTextColorEnabled)(BOOL indicatorColorEqualTextColorEnabled);
@property (nonatomic,assign,readonly) BOOL indicatorColorEqualTextColorEnabled;

/** 指示器延迟动画效果启用(默认为NO) */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_indicatorsAnimalsEnabled)(BOOL indicatorsAnimalsEnabled);
@property(nonatomic,assign,readonly) BOOL indicatorsAnimalsEnabled;

/** 指示器跟随滚动启用(默认为NO) */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_indicatorFollowEnabled)(BOOL indicatorFollowEnabled);
@property (nonatomic,assign,readonly) BOOL indicatorFollowEnabled;

/** 指示器宽度的样式(默认为:MJCIndicatorEqualItemEffect) */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_indicatorStyles)(MJCIndicatorStyles indicatorStyles);
@property (nonatomic,assign,readonly) MJCIndicatorStyles indicatorStyles;

/** 指示器的位置大小设置(无法设置它的X值) */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_indicatorFrame)(CGRect indicatorFrame);
@property (nonatomic,assign,readonly) CGRect indicatorFrame;

/** 指示器背景色 */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_indicatorColor)(UIColor *indicatorColor);
@property (nonatomic,strong,readonly) UIColor *indicatorColor;

/** 指示器图片(设置了图片的话,此控件是根据图片本身的大小自适应的) */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_indicatorImage)(UIImage *indicatorImage);
@property (nonatomic,strong,readonly) UIImage *indicatorImage;

/** 指示器是否隐藏(默认为NO) */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_indicatorHidden)(BOOL indicatorHidden);
@property (nonatomic,assign,readonly) BOOL indicatorHidden;

#pragma mark -- item设置

/** item滑动颜色渐变启用(默认为NO) */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_itemTextGradientEnabled)(BOOL itemTextGradientEnabled);
@property (nonatomic,assign,readonly) BOOL itemTextGradientEnabled;

/** item标题文字是否隐藏(默认为NO) */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_itemTextHidden)(BOOL itemTextHidden);
@property(nonatomic,assign,readonly) BOOL itemTextHidden;

/** item默认选中的页码索引(默认为0) */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_itemSelectedSegmentIndex)(NSInteger itemSelectedSegmentIndex);
@property (nonatomic,assign,readonly) NSInteger itemSelectedSegmentIndex;

/** 默认显示多少个item (默认显示4个) */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_defaultItemShowCount)(NSInteger defaultItemShowCount);
@property (nonatomic,assign,readonly) NSInteger defaultItemShowCount;

/** item文字的边缘边距 */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_itemTextsEdgeInsets)(UIEdgeInsets);
@property(nonatomic,readonly)   UIEdgeInsets itemTextsEdgeInsets;

/** item图片的边缘边距 */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_itemImagesEdgeInsets)(UIEdgeInsets);
@property(nonatomic,readonly)   UIEdgeInsets itemImagesEdgeInsets;

/** item之间的边距间距的设置(如果是item高度自适应,设置top和bottom无效) */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_itemEdgeinsets)(MJCItemEdgeInsets itemEdgeinsets);
@property (nonatomic,readonly) MJCItemEdgeInsets itemEdgeinsets;

/** item文字与图片的效果样式(默认:MJCLeftRightEffect) */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_itemTextImageStyle)(MJCItemTextImageStyle itemTextImageStyle);
@property (nonatomic,assign,readonly) MJCItemTextImageStyle itemTextImageStyle;

/** item背景颜色(普通状态下) */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_itemBackColorNormal)(UIColor *itemBackColorNormal);
@property (nonatomic,strong,readonly) UIColor *itemBackColorNormal;

/** item背景颜色(选中状态下) */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_itemBackColorSelected)(UIColor *itemBackColorSelected);
@property (nonatomic,strong,readonly) UIColor *itemBackColorSelected;

/** item文字颜色(普通状态下) */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_itemTextNormalColor)(UIColor *itemTextNormalColor);
@property (nonatomic,strong,readonly) UIColor *itemTextNormalColor;

/** item文字颜色(选中状态下) */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_itemTextSelectedColor)(UIColor *itemTextSelectedColor);
@property (nonatomic,strong,readonly) UIColor *itemTextSelectedColor;

/** item文字大小(默认为14的字体大小) */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_itemTextFontSize)(CGFloat itemTextFontSize);
@property (nonatomic,assign,readonly) CGFloat itemTextFontSize;

/** item文字加粗大小(选中状态) */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_itemTextBoldFontSizeSelected)(CGFloat itemTextBoldFontSizeSelected);
@property (nonatomic,assign,readonly) CGFloat itemTextBoldFontSizeSelected;

/** item图片(普通状态) */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_itemImageNormal)(UIImage *itemImageNormal);
@property (nonatomic,strong,readonly) UIImage *itemImageNormal;

/** item图片(点击状态) */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_itemImageSelected)(UIImage *itemImageSelected);
@property (nonatomic,strong,readonly) UIImage *itemImageSelected;

/** item图片数组,可显示不同的图片(普通状态) */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_itemImageArrayNormal)(NSArray *itemImageArrayNormal);
@property (nonatomic,strong,readonly) NSArray *itemImageArrayNormal;

/** item图片数组,可显示不同的图片(点击状态下) */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_itemImageArraySelected)(NSArray *itemImageArraySelected);
@property (nonatomic,strong,readonly) NSArray *itemImageArraySelected;

/** item背景图片(普通状态下) */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_itemBackImageNormal)(UIImage *itemBackImageNormal);
@property (nonatomic,strong,readonly) UIImage *itemBackImageNormal;

/** item背景图片(点击状态下) */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_itemBackImageSelected)(UIImage *itemBackImageSelected);
@property (nonatomic,strong,readonly) UIImage *itemBackImageSelected;

/** item背景图片数组,可显示不同的图片(普通状态下) */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_itemBackImageArrayNormal)(NSArray *itemBackImageArrayNormal);
@property (nonatomic,strong,readonly) NSArray *itemBackImageArrayNormal;

/** item背景图片数组,可显示不同的图片(点击状态下) */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_itemBackImageArraySelected)(NSArray *itemBackImageArraySelected);
@property (nonatomic,strong,readonly) NSArray *itemBackImageArraySelected;

/** item图片大小(不可改变背景图片的图片大小) */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_itemImageSize)(CGSize itemImageSize);
@property (nonatomic,assign,readonly) CGSize itemImageSize;

/** item文字颜色数组(可以让文字显示不同的颜色)(不支持颜色渐变)(普通状态下) */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_itemTextColorArrayNormal)(NSArray *itemTextColorArrayNormal);
@property (nonatomic,strong,readonly) NSArray *itemTextColorArrayNormal;

/** item文字颜色数组(可以让文字显示不同的颜色)(不支持颜色渐变)(点击状态下) */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_itemTextColorArraySelected)(NSArray *itemTextColorArraySelected);
@property (nonatomic,strong,readonly) NSArray *itemTextColorArraySelected;

/** 缩放并改变缩放字体大小启用(默认为NO,一旦设为YES那就需要设置缩放字体大小) */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_itemTextZoomEnabled)(BOOL itemTextZoomEnabled,CGFloat itemTextZoomFontSize);
@property (nonatomic,assign,readonly) BOOL itemTextZoomEnabled;
@property (nonatomic,assign,readonly) CGFloat itemTextZoomFontSize;

/** tabItem内容宽高自适应:(高度自适应或宽度自适应)(如果是item高度自适应,设置内边距top和bottom无效)*/
@property (nonatomic,copy,readonly
           ) MJCSegmentStylesTools *(^jc_tabItemSizeToFitIsEnabled)(BOOL sizeToFitIsEnabled,BOOL heightToFitIsEnabled, BOOL widthToFitIsEnabled);
@property (nonatomic,assign,readonly) BOOL itemSizeToFitIsEnabled;
@property (nonatomic,assign,readonly) BOOL itemHeightToFitIsEnabled;
@property (nonatomic,assign,readonly) BOOL itemWidthToFitIsEnabled;

/** 给tabitem自适应大小增加超量的尺寸(只有在自适应frame的情况下才有效果) */
@property (nonatomic,copy,readonly) MJCSegmentStylesTools *(^jc_tabItemExcessSize)(CGSize itemExcessSize);
@property (nonatomic,assign,readonly) CGSize itemExcessSize;
//@property (nonatomic,assign,readonly) CGFloat itemExcessWidth;
//@property (nonatomic,assign,readonly) CGFloat itemExcessHeight;

@end

