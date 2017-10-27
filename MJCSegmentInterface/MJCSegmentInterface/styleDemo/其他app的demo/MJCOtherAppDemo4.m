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
    MJCSegmentInterface *interFace = [MJCSegmentInterface showInterfaceWithTitleBarFrame:CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64) Styles:MJCTitlesScrollStyle];
    interFace.titlesViewFrame = CGRectMake(0, 0, interFace.jc_width,40);
    interFace.titlesViewBackColor = MJCRGBColor(212, 0, 52, 1.0);
    interFace.itemTextSelectedColor = [[UIColor whiteColor]colorWithAlphaComponent:0.7];
    interFace.itemTextNormalColor = [[UIColor whiteColor]colorWithAlphaComponent:0.7];
    interFace.isIndicatorColorEqualTextColor = YES;
    [interFace tabItemTitlezoomBigEnabled:YES tabItemTitleMaxfont:15];
    [interFace tabItemSizeToFitIsEnabled:YES heightToFitIsEnabled:NO widthToFitIsEnabled:YES];
    interFace.itemMaxEdgeinsets = MJCEdgeInsetsMake(0,15, 0,15, 30);
    interFace.itemTextFontSize = 13;
    interFace.isIndicatorsAnimals = YES;
    interFace.indicatorStyles = MJCIndicatorItemTextStyle;
    interFace.isChildScollAnimal = YES;
    [self.view addSubview:interFace];
    [interFace intoTitlesArray:titlesArr intoChildControllerArray:vcArr hostController:self];
}



@end
