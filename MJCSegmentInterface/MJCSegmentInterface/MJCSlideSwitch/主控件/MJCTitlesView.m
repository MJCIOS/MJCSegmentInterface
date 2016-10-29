//
//  MJCTitlesView.m
//  MJCSlideSwitch
//
//  Created by mjc on 16/10/26.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "MJCTitlesView.h"

@implementation MJCTitlesView

//重写方法 通过代码自定义控件,都要重写这个方法
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
    }
    
    
    return self;
    
}


//获取子控件(重写方法,保证能赋值成功)
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
    
}



-(void)setTitlesViewColor:(UIColor *)titlesViewColor SegmentInterFaceStyle:(MJCSegmentInterfaceStyle)SegmentInterFaceStyle
{
    if (titlesViewColor == kNilOptions) {
        if (SegmentInterFaceStyle == SegMentInterfaceStylePenetrate) {
            
            self.backgroundColor = [[UIColor whiteColor]colorWithAlphaComponent:0.4];
            
        }else if(SegmentInterFaceStyle == SegMentInterfaceStyleMoreUse){
            
            self.backgroundColor = [[UIColor whiteColor]colorWithAlphaComponent:0.4];
            
        }else{
            self.backgroundColor = [UIColor whiteColor];
        };
    }else{
        
        self.backgroundColor = titlesViewColor;
    }
}

-(void)isTitlesViewframe:(BOOL)isTitlesViewframe titlesViewframe:(CGRect)titlesViewframe
{
    if (isTitlesViewframe == kNilOptions) {

        self.frame = CGRectMake(0, 0,MJCScreenWidth,MJCTitlesViewH);
    }else{
    
        self.frame = titlesViewframe;
    }
    
}



@end
