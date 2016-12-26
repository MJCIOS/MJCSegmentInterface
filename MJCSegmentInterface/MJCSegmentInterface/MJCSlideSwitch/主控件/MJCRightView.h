//
//  MJCRightView.h
//  MJCSlideSwitch
//
//  Created by mjc on 16/10/26.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJCSegmentInterface.h"

@interface MJCRightView : UIView



@property (nonatomic,strong) UIColor *rightBackgroundColor;

-(void)setRightHeght:(CGFloat)rightHeght titlesButton:(UIButton *)titlesButton;


-(void)setRightViewHidden:(BOOL)rightViewHidden inter:(NSUInteger)inter titlesArr:(NSArray *)titlesArr;



@end
