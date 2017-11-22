//
//  MJCDemoVC10.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/13.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCDemoVC8.h"
#import "MJCPrefixHeader.pch"

@interface MJCDemoVC8 ()

@end

@implementation MJCDemoVC8

- (void)viewDidLoad {
    [super viewDidLoad];
    

    UIView *view = [[UIView alloc]init];
    view.frame = CGRectMake(0, 64, self.view.jc_width,200);
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    NSArray *imageArr =@[@"bulb-2",@"cloud-2",@"diamond-2",@"food-2",@"heart-2"];
    NSArray *imageArr1 = @[@"bulb",@"cloud",@"diamond",@"food",@"heart"];
    NSArray *imageBackArr =@[@"111",@"222",@"567",@"1111",@"567"];
    NSArray *imageBackArr1 = @[@"567",@"111",@"222",@"1111",@"111"];
    NSArray *titlesArr = @[@"荣耀",@"联盟",@"DNF",@"CF",@"飞车",@"炫舞",@"天涯"];
    MJCTestViewController *vc1 = [[MJCTestViewController alloc]init];
    MJCTestTableViewController *vc2 = [[MJCTestTableViewController alloc]init];
    MJCTestViewController1 *vc3 = [[MJCTestViewController1 alloc]init];
    MJCTestCollectVC *vc4 = [[MJCTestCollectVC alloc]init];
    MJCTestViewController *vc5 = [[MJCTestViewController alloc]init];
    MJCTestViewController *vc6 = [[MJCTestViewController alloc]init];
    MJCTestViewController *vc7 = [[MJCTestViewController alloc]init];
    NSArray *vcarrr = @[vc1,vc2,vc3,vc4,vc5,vc6,vc7];
    for (int i = 0 ; i < vcarrr.count; i++) {//赋值标题
        UIViewController *vc = vcarrr[i];
        vc.title = titlesArr[i];
    }
    
    MJCSegmentInterface *interFace =  [MJCSegmentInterface jc_initWithFrame: CGRectMake(0,CGRectGetMaxY(view.frame),self.view.jc_width, self.view.jc_height-CGRectGetMaxY(view.frame)) interFaceStyleToolsBlock:^(MJCSegmentStylesTools *jc_tools) {
        jc_tools.jc_titleBarStyles(MJCTitlesScrollStyle).
        jc_indicatorStyles(MJCIndicatorItemStyle).
        jc_itemTextNormalColor([UIColor redColor]).
        jc_itemTextSelectedColor([UIColor purpleColor]).
        jc_itemSelectedSegmentIndex(0).
        jc_ItemDefaultShowCount(4).
        jc_indicatorFollowEnabled(YES).
        jc_indicatorColor([UIColor redColor]).
        jc_itemBackColor([UIColor whiteColor]).
        jc_itemTextFontSize(13).
        jc_childScollAnimalEnabled(YES).
        jc_itemImageSelected([UIImage imageNamed:@"food-2"]).
        jc_itemImageNormal([UIImage imageNamed:@"food"]).
        jc_ItemDefaultShowCount(3).
        jc_titlesViewFrame(CGRectMake(0, 0, self.view.jc_width,50)).
        jc_itemImageSelected([UIImage imageNamed:@"food-2"]).
        jc_itemImageSelected([UIImage imageNamed:@"food-2"]).
        jc_itemBackImageNormal([UIImage imageNamed:@"222"]).
        jc_itemBackImageSelected( [UIImage imageNamed:@"456"]).
        jc_itemBackImageArrayNormal(imageBackArr).
        jc_itemBackImageArraySelected(imageBackArr).
        jc_itemImageSize(CGSizeMake(20,20)).
        jc_itemImageEffectStyles(MJCImageClassicStyle).
        jc_itemTextsEdgeInsets(UIEdgeInsetsMake(0,0,10,10)).
        jc_itemImagesEdgeInsets(UIEdgeInsetsMake(10,10,0,0)).
        jc_itemImageArrayNormal(imageArr).
        jc_itemImageArraySelected(imageArr1).
        jc_indicatorColor([UIColor redColor]).
        jc_indicatorImage([UIImage imageNamed:@"箭头"]).
        jc_indicatorHidden(YES).
        jc_childScollEnabled(YES).
        jc_childScollAnimalEnabled(YES).
        jc_tabItemTextZoomBigEnabled(YES, 20).
        jc_indicatorFrame(CGRectMake(0,0,50,30));
    }];
    
    [self.view addSubview:interFace];
    [interFace intoTitlesArray:titlesArr intoChildControllerArray:vcarrr hostController:self];
    
}


@end
