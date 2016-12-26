//
//  MJCRightView.m
//  MJCSlideSwitch
//
//  Created by mjc on 16/10/26.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "MJCRightView.h"

@interface MJCRightView ()

/** s */
@property (nonatomic,assign) NSInteger intrer1;


@end

@implementation MJCRightView

//重写方法 通过代码自定义控件,都要重写这个方法
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.hidden = YES;
    }
    
    return self;
}

-(void)setRightBackgroundColor:(UIColor *)rightBackgroundColor
{
    if (rightBackgroundColor == kNilOptions) {
        self.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.5];
    }else{
        self.backgroundColor = rightBackgroundColor;
    }
    
}

-(void)setRightHeght:(CGFloat)rightHeght titlesButton:(UIButton *)titlesButton
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


-(void)setRightViewHidden:(BOOL)rightViewHidden inter:(NSUInteger)inter titlesArr:(NSArray *)titlesArr
{
    if (rightViewHidden == kNilOptions) {
        if (inter+1 == titlesArr.count) {
            self.hidden = YES;
        }else{
            self.hidden = NO;
        }
    }else{
        self.hidden = rightViewHidden;
    }
}




@end
