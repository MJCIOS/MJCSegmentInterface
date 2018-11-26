//
//  MJCDemoVC4.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/13.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCDemoVC3.h"
#import "MJCPrefixHeader.pch"

@interface MJCDemoVC3 ()<MJCSegmentDelegate>

@end

@implementation MJCDemoVC3

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MJCTestViewController *vc1 = [[MJCTestViewController alloc]init];
    MJCTestTableViewController *vc2 = [[MJCTestTableViewController alloc]init];
    MJCTestViewController1 *vc3 = [[MJCTestViewController1 alloc]init];
    MJCTestCollectVC *vc4 = [[MJCTestCollectVC alloc]init];
    MJCTestViewController *vc5 = [[MJCTestViewController alloc]init];
    MJCTestViewController *vc6 = [[MJCTestViewController alloc]init];
    MJCTestViewController *vc7 = [[MJCTestViewController alloc]init];
    NSArray *vcarrr = @[vc1,vc2,vc3,vc4,vc5,vc6,vc7];
    NSArray *titlesArr = @[@"荣耀",@"联盟",@"DNF",@"CF",@"飞车",@"炫舞",@"天涯"];
    for (int i = 0 ; i < vcarrr.count; i++) {//赋值标题
        UIViewController *vc = vcarrr[i];
        vc.title = titlesArr[i];
    }

    MJCSegmentInterface *interFace =  [MJCSegmentInterface jc_initWithFrame:CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64) interFaceStyleToolsBlock:^(MJCSegmentStylesTools *jc_tools) {
        jc_tools.jc_titleBarStyles(MJCTitlesScrollStyle).
        jc_indicatorFrame(CGRectMake(0,0,0,50)).
        jc_indicatorFollowEnabled(YES).
        jc_childScollEnabled(YES).
        jc_itemSelectedSegmentIndex(3).
        jc_indicatorColor([[UIColor redColor]colorWithAlphaComponent:0.1]).
        jc_itemTextZoomEnabled(YES, 22).
        jc_itemTextFontSize(17).
        jc_itemTextNormalColor([UIColor purpleColor]).
        jc_itemTextSelectedColor([UIColor orangeColor]).
        jc_itemTextFontSize(13).
        jc_itemTextZoomEnabled(YES, 18).
        jc_indicatorHidden(NO).
        jc_indicatorsAnimalsEnabled(YES).
        jc_defaultItemShowCount(5).
        jc_itemBackColorNormal([UIColor whiteColor]).
        jc_itemTextGradientEnabled(NO);
    }];
    [self.view addSubview:interFace];
    [interFace intoTitlesArray:titlesArr intoChildControllerArray:vcarrr hostController:self];
}


@end
