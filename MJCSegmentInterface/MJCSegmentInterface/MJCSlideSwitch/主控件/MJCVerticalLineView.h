//
//  MJCRightView.h
//  MJCSlideSwitch
//
//  Created by mjc on 16/10/26.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJCSegmentInterface.h"

@interface MJCVerticalLineView : UIView


@property (nonatomic,strong) UIColor *rightBackgroundColor;

@property (nonatomic,assign) BOOL rightViewHidden;

-(void)setupRightHeght:(CGFloat)rightHeght titlesButton:(UIButton *)titlesButton;


-(void)inter:(NSUInteger)inter titlesArr:(NSArray *)titlesArr rightViewHidden:(BOOL)rightViewHidden;



@end
