//
//  MJCDemoPenetrationVC.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/30.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCSpecialDemoVC0.h"
#import "MJCPrefixHeader.pch"

@interface MJCSpecialDemoVC0 ()

@end

@implementation MJCSpecialDemoVC0

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MJCTestViewController *vc1 = [[MJCTestViewController alloc]init];
    MJCTestTableViewController *vc2 = [[MJCTestTableViewController alloc]init];
    MJCTestViewController1 *vc3 = [[MJCTestViewController1 alloc]init];
    MJCTestCollectVC *vc4 = [[MJCTestCollectVC alloc]init];
    MJCTestViewController *vc5 = [[MJCTestViewController alloc]init];
    MJCTestViewController *vc6 = [[MJCTestViewController alloc]init];
    NSArray *vcarrr = @[vc4,vc2,vc1,vc3,vc5,vc6];
    NSArray *titlesArr = @[@"天涯明月刀",@"联盟",@"我的运单",@"CF",@"飞车"];
    
    for (int i = 0 ; i < titlesArr.count; i++) {//赋值标题
        UIViewController *vc = vcarrr[i];
        vc.title = titlesArr[i];
    }
    
    
    MJCSegmentStylesTools *tools = [MJCSegmentStylesTools jc_initWithjc_toolsBlock:^(MJCSegmentStylesTools *jc_tools) {
        jc_tools.jc_titleBarStyles(MJCTitlesClassicStyle).
        jc_childScollAnimalEnabled(YES).
        jc_titlesViewPenetrationEnabled(YES).
        jc_indicatorsAnimalsEnabled(YES).
        jc_indicatorFollowEnabled(YES).
        jc_titlesViewBackColor([[UIColor blueColor]colorWithAlphaComponent:0.3]).
        jc_itemTextNormalColor( [UIColor redColor]).
        jc_itemTextSelectedColor([UIColor orangeColor]).
        jc_indicatorColor([UIColor redColor]).
        jc_itemTextFontSize(12).
        jc_indicatorStyles(MJCIndicatorItemTextStyle);
    }];
    MJCSegmentInterface *interFace =  [MJCSegmentInterface initWithFrame:CGRectMake(0, 64, self.view.jc_width, self.view.jc_height - 64) interFaceStyleTools:tools];
    [self.view addSubview:interFace];
    [interFace intoTitlesArray:titlesArr intoChildControllerArray:vcarrr hostController:self];
}

-(void)dealloc
{
    NSLog(@"销毁了");
}

@end
