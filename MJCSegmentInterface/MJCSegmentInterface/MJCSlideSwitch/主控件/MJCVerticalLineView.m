//
//  MJCRightView.m
//  MJCSlideSwitch
//
//  Created by mjc on 16/10/26.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "MJCVerticalLineView.h"

@interface MJCVerticalLineView ()


@end

@implementation MJCVerticalLineView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.5];
        self.hidden = YES;
    }
    
    return self;
}

-(void)setRightViewHidden:(BOOL)rightViewHidden
{
    _rightViewHidden = rightViewHidden;
    
    self.hidden = rightViewHidden;
}

-(void)setRightBackgroundColor:(UIColor *)rightBackgroundColor
{
    _rightBackgroundColor = rightBackgroundColor;
    self.backgroundColor = rightBackgroundColor;
}

-(void)setupRightHeght:(CGFloat)rightHeght titlesButton:(UIButton *)titlesButton
{
    self.mjc_x = titlesButton.mjc_width-0.1;
    
    if (rightHeght == kNilOptions) {
        self.mjc_height = titlesButton.mjc_height;
    }else{
        self.mjc_height = rightHeght;
    }
    self.mjc_centerY = titlesButton.mjc_centerY;
    self.mjc_width = 0.5;
}

-(void)inter:(NSUInteger)inter titlesArr:(NSArray *)titlesArr rightViewHidden:(BOOL)rightViewHidden
{
    if (inter+1 == titlesArr.count) {
        self.hidden = YES;
    }else{
        self.hidden = rightViewHidden;
    }
}




@end
