//
//  MJCSegmentStylesTools.m
//  MJCSegmentInterface
//
//  Created by mjc on 2017/11/6.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCSegmentStylesTools.h"

@interface MJCSegmentStylesTools()

@end

@implementation MJCSegmentStylesTools
+(instancetype)jc_initWithSegmentStylestoolsBlock:(void(^)(MJCSegmentStylesTools *jc_tools))toolsBlock;
{
    MJCSegmentStylesTools *tools = [[MJCSegmentStylesTools alloc]init];
    toolsBlock(tools);
    return tools;
}

#pragma mark -- 通用的设置
-(MJCSegmentStylesTools *(^)(BOOL))jc_scaleLayoutEnabled
{
    return ^MJCSegmentStylesTools *(BOOL scaleLayoutEnabled)
    {
        _scaleLayoutEnabled = scaleLayoutEnabled;
        return self;
    };
}

#pragma mark -- 子界面效果的设置

-(MJCSegmentStylesTools *(^)(BOOL))jc_childScollAnimalEnabled
{
    return ^MJCSegmentStylesTools *(BOOL  childScollAnimalEnabled)
    {
        _childScollAnimalEnabled = childScollAnimalEnabled;
        return self;
    };
}

-(MJCSegmentStylesTools *(^)(BOOL))jc_childScollEnabled
{
    return ^MJCSegmentStylesTools *(BOOL  childScollEnabled)
    {
        _childScollEnabled = childScollEnabled;
        return self;
    };
}

-(MJCSegmentStylesTools *(^)(UIColor *))jc_childsContainerBackColor
{
    return ^MJCSegmentStylesTools *(UIColor * childsContainerBackColor)
    {
        _childsContainerBackColor = childsContainerBackColor;
        return self;
    };
}

#pragma mark -- 标题栏设置

-(MJCSegmentStylesTools *(^)(BOOL))jc_titlesViewPenetrationEnabled
{
    return ^MJCSegmentStylesTools *(BOOL titlesViewPenetrationEnabled)
    {
        _titlesViewPenetrationEnabled = titlesViewPenetrationEnabled;
        return self;
    };
}

-(MJCSegmentStylesTools *(^)(MJCTitleBarStyles))jc_titleBarStyles
{
    return ^MJCSegmentStylesTools *(MJCTitleBarStyles titleBarStyles)
    {
        _titleBarStyles = titleBarStyles;
        return self;
    };
}

-(MJCSegmentStylesTools *(^)(UIColor *))jc_titlesViewBackColor
{
    return ^MJCSegmentStylesTools *(UIColor *titlesViewBackColor)
    {
        _titlesViewBackColor = titlesViewBackColor;
        return self;
    };
}

-(MJCSegmentStylesTools *(^)(UIImage *))jc_titlesViewBackImage
{
    return ^MJCSegmentStylesTools *(UIImage *titlesViewBackImage)
    {
        _titlesViewBackImage = titlesViewBackImage;
        return self;
    };
}
-(MJCSegmentStylesTools* (^)(CGRect))jc_titlesViewFrame
{
    return ^MJCSegmentStylesTools * (CGRect titlesViewFrame)
    {
        _titlesViewFrame = titlesViewFrame;
        return self;
    };
}

#pragma mark -- 指示器设置

-(MJCSegmentStylesTools *(^)(BOOL))jc_indicatorColorEqualTextColorEnabled
{
    return ^MJCSegmentStylesTools * (BOOL indicatorColorEqualTextColorEnabled)
    {
        _indicatorColorEqualTextColorEnabled = indicatorColorEqualTextColorEnabled;
        return self;
    };
}

-(MJCSegmentStylesTools *(^)(BOOL))jc_indicatorsAnimalsEnabled
{
    return ^MJCSegmentStylesTools * (BOOL indicatorsAnimalsEnabled)
    {
        _indicatorsAnimalsEnabled = indicatorsAnimalsEnabled;
        return self;
    };
}

-(MJCSegmentStylesTools *(^)(NSInteger))jc_itemSelectedSegmentIndex
{
    return ^MJCSegmentStylesTools * (NSInteger itemSelectedSegmentIndex)
    {
        _itemSelectedSegmentIndex = itemSelectedSegmentIndex;
        return self;
    };
}

-(MJCSegmentStylesTools *(^)(BOOL))jc_indicatorFollowEnabled
{
    return ^MJCSegmentStylesTools * (BOOL indicatorFollowEnabled)
    {
        _indicatorFollowEnabled = indicatorFollowEnabled;
        return self;
    };
}

-(MJCSegmentStylesTools *(^)(MJCIndicatorStyles))jc_indicatorStyles
{
    return ^MJCSegmentStylesTools * (MJCIndicatorStyles indicatorStyles)
    {
        _indicatorStyles = indicatorStyles;
        return self;
    };
}

-(MJCSegmentStylesTools *(^)(CGRect ))jc_indicatorFrame
{
    return ^MJCSegmentStylesTools * (CGRect indicatorFrame)
    {
        _indicatorFrame = indicatorFrame;
        return self;
    };
}
-(MJCSegmentStylesTools *(^)(BOOL))jc_indicatorHidden
{
    return ^MJCSegmentStylesTools * (BOOL indicatorHidden)
    {
        _indicatorHidden = indicatorHidden;
        return self;
    };
}

-(MJCSegmentStylesTools *(^)(UIColor *))jc_indicatorColor
{
    return ^MJCSegmentStylesTools * (UIColor *indicatorColor)
    {
        _indicatorColor = indicatorColor;
        return self;
    };
}
-(MJCSegmentStylesTools *(^)(UIImage *))jc_indicatorImage
{
    return ^MJCSegmentStylesTools * (UIImage *indicatorImage)
    {
        _indicatorImage = indicatorImage;
        return self;
    };
}

#pragma mark -- item设置

-(MJCSegmentStylesTools *(^)(BOOL))jc_itemTextGradientEnabled
{
    return ^MJCSegmentStylesTools *(BOOL itemTextGradientEnabled)
    {
        _itemTextGradientEnabled = itemTextGradientEnabled;
        return self;
    };
}

-(MJCSegmentStylesTools *(^)(BOOL))jc_itemTextHidden
{
    return ^MJCSegmentStylesTools *(BOOL itemTextHidden)
    {
        _itemTextHidden = itemTextHidden;
        return self;
    };
}

-(MJCSegmentStylesTools *(^)(NSInteger))jc_ItemDefaultShowCount
{
    return ^MJCSegmentStylesTools *(NSInteger ItemDefaultShowCount)
    {
        _ItemDefaultShowCount = ItemDefaultShowCount;
        return self;
    };
}

-(MJCSegmentStylesTools *(^)(UIEdgeInsets))jc_itemImagesEdgeInsets
{
    return ^MJCSegmentStylesTools *(UIEdgeInsets itemImagesEdgeInsets)
    {
        _itemImagesEdgeInsets = itemImagesEdgeInsets;
        return self;
    };

}

-(MJCSegmentStylesTools *(^)(UIEdgeInsets))jc_itemTextsEdgeInsets
{
    return ^MJCSegmentStylesTools *(UIEdgeInsets itemTextsEdgeInsets)
    {
        _itemTextsEdgeInsets = itemTextsEdgeInsets;
        return self;
    };
}

-(MJCSegmentStylesTools *(^)(MJCImageEffectStyles))jc_itemImageEffectStyles
{
    return ^MJCSegmentStylesTools *(MJCImageEffectStyles itemImageEffectStyles)
    {
        _itemImageEffectStyles = itemImageEffectStyles;
        return self;
    };

}

-(MJCSegmentStylesTools *(^)(UIColor *))jc_itemBackColor
{
    return ^MJCSegmentStylesTools *(UIColor *itemBackColor)
    {
        _itemBackColor = itemBackColor;
        return self;
    };
}
-(MJCSegmentStylesTools *(^)(CGFloat))jc_itemTextFontSize
{
    return ^MJCSegmentStylesTools* (CGFloat itemTextFontSize)
    {
        _itemTextFontSize = itemTextFontSize;
        return self;
    };
}

-(MJCSegmentStylesTools *(^)(UIColor *))jc_itemTextNormalColor
{
    return ^MJCSegmentStylesTools *(UIColor *itemTextNormalColor)
    {
        _itemTextNormalColor = itemTextNormalColor;
        return self;
    };
}
-(MJCSegmentStylesTools *(^)(UIColor *))jc_itemTextSelectedColor
{
    return ^MJCSegmentStylesTools *(UIColor *itemTextSelectedColor)
    {
        _itemTextSelectedColor = itemTextSelectedColor;
        return self;
    };
}
-(MJCSegmentStylesTools *(^)(UIImage *))jc_itemImageNormal
{
    return ^MJCSegmentStylesTools *(UIImage *itemImageNormal)
    {
        _itemImageNormal = itemImageNormal;
        return self;
    };
}
-(MJCSegmentStylesTools *(^)(UIImage *))jc_itemImageSelected
{
    return ^MJCSegmentStylesTools *(UIImage *itemImageSelected)
    {
        _itemImageSelected = itemImageSelected;
        return self;
    };
}

-(MJCSegmentStylesTools *(^)(NSArray *))jc_itemImageArrayNormal
{
    return ^MJCSegmentStylesTools *(NSArray *itemImageArrayNormal)
    {
        _itemImageArrayNormal = itemImageArrayNormal;
        return self;
    };
}
-(MJCSegmentStylesTools *(^)(NSArray *))jc_itemImageArraySelected
{
    return ^MJCSegmentStylesTools *(NSArray *itemImageArraySelected)
    {
        _itemImageArraySelected = itemImageArraySelected;
        return self;
    };
}
-(MJCSegmentStylesTools *(^)(UIImage *))jc_itemBackImageNormal
{
    return ^MJCSegmentStylesTools *(UIImage *itemBackImageNormal)
    {
        _itemBackImageNormal = itemBackImageNormal;
        return self;
    };
}
-(MJCSegmentStylesTools *(^)(UIImage *))jc_itemBackImageSelected
{
    return ^MJCSegmentStylesTools *(UIImage *itemBackImageSelected)
    {
        _itemBackImageSelected = itemBackImageSelected;
        return self;
    };
}

-(MJCSegmentStylesTools *(^)(NSArray *))jc_itemBackImageArrayNormal
{
    return ^MJCSegmentStylesTools *(NSArray *itemBackImageArrayNormal)
    {
        _itemBackImageArrayNormal = itemBackImageArrayNormal;
        return self;
    };
}
-(MJCSegmentStylesTools *(^)(NSArray *))jc_itemBackImageArraySelected
{
    return ^MJCSegmentStylesTools *(NSArray *itemBackImageArraySelected)
    {
        _itemBackImageArraySelected = itemBackImageArraySelected;
        return self;
    };
}
-(MJCSegmentStylesTools *(^)(CGSize))jc_itemImageSize
{
    return ^MJCSegmentStylesTools *(CGSize itemImageSize)
    {
        _itemImageSize = itemImageSize;
        return self;
    };
}
-(MJCSegmentStylesTools *(^)(NSArray *))jc_itemTextColorArrayNormal
{
    return ^MJCSegmentStylesTools *(NSArray *itemTextColorArrayNormal)
    {
        _itemTextColorArrayNormal = itemTextColorArrayNormal;
        return self;
    };
}
-(MJCSegmentStylesTools *(^)(NSArray *))jc_itemTextColorArraySelected
{
    return ^MJCSegmentStylesTools *(NSArray *itemTextColorArraySelected)
    {
        _itemTextColorArraySelected = itemTextColorArraySelected;
        return self;
    };
}

-(MJCSegmentStylesTools *(^)(BOOL, BOOL, BOOL))jc_tabItemSizeToFitIsEnabled
{
    return ^MJCSegmentStylesTools*(BOOL sizeToFitIsEnabled,BOOL heightToFitIsEnabled,BOOL widthToFitIsEnabled)
    {
        _itemSizeToFitIsEnabled = sizeToFitIsEnabled;
        _itemHeightToFitIsEnabled = heightToFitIsEnabled;
        _itemWidthToFitIsEnabled = widthToFitIsEnabled;
        return self;
    };
}

-(MJCSegmentStylesTools *(^)(BOOL, CGFloat))jc_tabItemTextZoomBigEnabled
{
    return ^MJCSegmentStylesTools*(BOOL itemTextZoomBigEnabled,CGFloat itemTextMaxfontSize)
    {
        _itemTextMaxfontSize = itemTextMaxfontSize;
        _itemTextZoomBigEnabled = itemTextZoomBigEnabled;
        return self;
    };

}

-(MJCSegmentStylesTools *(^)(MJCEdgeInsets))jc_itemEdgeinsets
{
    return ^MJCSegmentStylesTools*(MJCEdgeInsets itemEdgeinsets)
    {
        _itemEdgeinsets = itemEdgeinsets;
        return self;
    };
}

-(MJCSegmentStylesTools *(^)(CGFloat, CGFloat))jc_tabItemExcessSize
{
    return ^MJCSegmentStylesTools *(CGFloat excessWidth,CGFloat excessHeight)
    {
        _itemExcessWidth = excessWidth;
        _itemExcessHeight = excessHeight;
        return self;
    };
}

@end
