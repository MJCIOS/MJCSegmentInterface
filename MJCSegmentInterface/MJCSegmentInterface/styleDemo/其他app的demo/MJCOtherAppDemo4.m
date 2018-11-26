//
//  MJCOtherAppDemo4.m
//  MJCSegmentInterface
//
//  Created by mjc on 2017/10/27.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCOtherAppDemo4.h"
#import "MJCPrefixHeader.pch"

@interface MJCOtherAppDemo4 ()

@end

@implementation MJCOtherAppDemo4

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSArray *titlesArr = @[@"推荐",@"视频",@"图片",@"段子",@"排行",@"社会",@"影视分享",@"游戏",@"8090",@"互动区",@"搞笑GIF"];

    MJCTestTableViewController *vc1 = [[MJCTestTableViewController alloc]init];
    MJCTestCollectVC *vc2 = [[MJCTestCollectVC alloc]init];
    MJCTestViewController1 *vc3 = [[MJCTestViewController1 alloc]init];
    NSMutableArray  *vcarrr = [NSMutableArray arrayWithObjects:vc1,vc2,vc3, nil];
    NSInteger vcCount = titlesArr.count-vcarrr.count;
    for (int i = 0 ; i < vcCount ; i++) {
        MJCTestViewController *vc = [[MJCTestViewController alloc]init];;
        [vcarrr addObject:vc];//将元素添加到数组末尾
    }
    for (int i = 0 ; i < titlesArr.count; i++) {
        UIViewController *vc =vcarrr[i];
        vc.title = titlesArr[i];
    }
    
    
    [self setupSegmentWithTitlesArr:titlesArr vcArr:vcarrr];
    
}

-(void)setupSegmentWithTitlesArr:(NSArray *)titlesArr vcArr:(NSArray *)vcArr
{
    
    MJCSegmentInterface *interface = [MJCSegmentInterface jc_initWithFrame:CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64) interFaceStyleToolsBlock:^(MJCSegmentStylesTools *jc_tools) {
        jc_tools.jc_titleBarStyles(MJCTitlesScrollStyle).
        jc_titlesViewFrame(CGRectMake(0, 0, self.view.jc_width, 40)).
        jc_titlesViewBackColor(MJCRGBColor(212, 0, 52, 1.0)).
        jc_childScollEnabled(YES).
        jc_indicatorsAnimalsEnabled(YES).
        jc_itemTextNormalColor([[UIColor whiteColor]colorWithAlphaComponent:0.7]).
        jc_itemTextSelectedColor([[UIColor whiteColor]colorWithAlphaComponent:0.7]).
        jc_indicatorColor([UIColor orangeColor]).
        jc_indicatorFrame(CGRectMake(0, jc_tools.titlesViewFrame.size.height - 3, 20, 3)).
        jc_itemTextZoomEnabled(YES, 15).
        jc_itemTextFontSize(13).
        jc_indicatorColorEqualTextColorEnabled(YES).
        jc_tabItemSizeToFitIsEnabled(YES, NO, YES).
        jc_itemEdgeinsets(MJCItemEdgeInsetsMake(0,15, 0,15, 30)).
        jc_indicatorStyles(MJCIndicatorEqualTextEffect).
        jc_childScollAnimalEnabled(YES);
    }];
    [self.view addSubview:interface];
    [interface intoTitlesArray:titlesArr intoChildControllerArray:vcArr hostController:self];
}



@end
