//
//  MJCIndicatorView.h
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/27.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MJCIndicatorView : UIButton

@property (nonatomic,strong) UIImage *indicatorImage;
-(void)setupIndicatorViewCenterAndWidthIsAnimal:(BOOL)isIndicatorsAnimals indicatorStyles:(NSUInteger)indicatorStyles selectedTitleButton:(UIButton*)selectedTitleButton indicatorFrame:(CGRect)indicatorFrame;
@end
