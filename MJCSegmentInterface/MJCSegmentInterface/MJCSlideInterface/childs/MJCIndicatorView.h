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

-(void)setupDefaultFrame:(CGRect)indicatorFrame tabItemBtn:(UIButton*)tabItemBtn;

@end
