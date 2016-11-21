//
//  MJCTitlesScollView.m
//  MJCSlideSwitch
//
//  Created by mjc on 16/11/21.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "MJCTitlesScollView.h"

@implementation MJCTitlesScollView

//设置标题颜色
-(void)setTitlesScrollViewColor:(UIColor *)titlesScrollViewColor SegmentInterFaceStyle:(MJCSegmentInterfaceStyle)SegmentInterFaceStyle;
{
    //如果用户没设置颜色
    if (titlesScrollViewColor == kNilOptions) {
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
        
        self.backgroundColor = titlesScrollViewColor;
    }
}


-(void)isTitlesScrollViewframe:(BOOL)isTitlesScrollViewframe titlesViewframe:(CGRect)titlesScrollViewframe
{
    //如果用户没开启自己设置frame
    if (isTitlesScrollViewframe == kNilOptions) {
        //默认给它设置的高度为50
        self.frame = CGRectMake(0, 0,MJCScreenWidth,MJCTitlesViewH);
    }else{
        //用户设置的位置
        self.frame = titlesScrollViewframe;
    }
    
}


@end
