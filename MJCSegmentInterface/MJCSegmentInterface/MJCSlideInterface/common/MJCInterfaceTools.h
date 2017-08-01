//
//  MJCToolClasses.h
//  MJCSegmentInterface
//
//  Created by mjc on 17/2/22.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MJCInterfaceTools : NSObject

+ (MJCInterfaceTools *)toolClasses;

- (void)selectedTitleCenter:(UIButton *)button titlesScrollView:(UIScrollView *)titlesScrollView;

-(void)setupIndicatorViewCenterAndWidthIsAnimal:(BOOL)isChildScollAnimal indicatorStyles:(NSUInteger)indicatorStyles selectedTitleButton:(UIButton*)selectedTitleButton indicatorFrame:(CGRect)indicatorFrame indicatorView:(UIButton*)indicatorView;


@end
