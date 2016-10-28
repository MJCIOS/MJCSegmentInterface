//
//  MJCChildScrollView.m
//  MJCSlideSwitch
//
//  Created by mjc on 16/10/26.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "MJCChildScrollView.h"

@implementation MJCChildScrollView


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

-(void)isChildFrame:(BOOL)isChildFrame setChildFrame:(CGRect)childFrame SegmentInterFaceStyle:(MJCSegmentInterfaceStyle)SegmentInterFaceStyle
{
    //如果不同意用户设置frame
    if (isChildFrame == kNilOptions) {
        //如果是默认样式(设置界面样式)
        if (SegmentInterFaceStyle ==  SegMentInterfaceStyleClassic) {
            //子界面位置()
            self.frame = CGRectMake(0,MJCTitlesViewH,MJCScreenWidth,MJCScreenHeight-(MJCTitlesViewH+MJCNavMaxY));
        }else if (SegmentInterFaceStyle == SegMentInterfaceStyleLess){
            //那就给它设置了frame
            self.frame =  CGRectMake(0,MJCTitlesViewH,MJCScreenWidth,MJCScreenHeight - (MJCTitlesViewH+MJCNavMaxY));
        }else if(SegmentInterFaceStyle == SegMentInterfaceStyleMoreUse){
            self.frame =  CGRectMake(0,0,MJCScreenWidth,MJCScreenHeight-(MJCNavMaxY));
        
        }else if(SegmentInterFaceStyle == SegMentInterfaceStylePenetrate){
            self.frame =  CGRectMake(0,0,MJCScreenWidth,MJCScreenHeight-(MJCNavMaxY));
        
        }else if(SegmentInterFaceStyle == SegMentInterfaceStyleExceedUse){
            //子界面位置()
            self.frame = CGRectMake(0,MJCTitlesViewH,MJCScreenWidth,MJCScreenHeight-(MJCTitlesViewH));
        }else{
            //子界面位置()
            self.frame = CGRectMake(0,MJCTitlesViewH,MJCScreenWidth,MJCScreenHeight - (MJCTitlesViewH+MJCNavMaxY));
        }
        
    }else{
        //传入用户设置的frame
        self.frame = childFrame;
    }
}


@end
