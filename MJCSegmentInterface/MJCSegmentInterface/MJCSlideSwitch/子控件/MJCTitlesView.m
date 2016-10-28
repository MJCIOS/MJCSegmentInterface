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
    //如果用户没设置颜色
    if (titlesViewColor == kNilOptions) {
        //设置穿透样式和格子穿透样式,背景颜色透明
        if (SegmentInterFaceStyle == SegMentInterfaceStylePenetrate) {
            
            self.backgroundColor = [[UIColor whiteColor]colorWithAlphaComponent:0.4];
            
        }else if(SegmentInterFaceStyle == SegMentInterfaceStyleMoreUse){
            
            self.backgroundColor = [[UIColor whiteColor]colorWithAlphaComponent:0.4];
            
        }else{
            //其余白色
            self.backgroundColor = [UIColor whiteColor];
        };
    }else{
        
        self.backgroundColor = titlesViewColor;
    }
}

-(void)isTitlesViewframe:(BOOL)isTitlesViewframe titlesViewframe:(CGRect)titlesViewframe
{
    //如果用户没开启自己设置frame
    if (isTitlesViewframe == kNilOptions) {
        //默认给它设置的高度为50
        self.frame = CGRectMake(0, 0,MJCScreenWidth,MJCTitlesViewH);
    }else{
        //用户设置的位置
        self.frame = titlesViewframe;
    }
    
}



@end
