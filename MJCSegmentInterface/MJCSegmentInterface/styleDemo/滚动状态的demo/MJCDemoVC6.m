//
//  MJCDemoVC8.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/13.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCDemoVC6.h"
#import "MJCPrefixHeader.pch"

@interface MJCDemoVC6 ()

@end

@implementation MJCDemoVC6

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
    NSArray *titlesArr = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7"];
    for (int i = 0 ; i < vcarrr.count; i++) {//赋值标题
        UIViewController *vc = vcarrr[i];
        vc.title = titlesArr[i];
    }
    NSArray *imageArr =@[@"bulb-2",@"cloud-2",@"diamond-2",@"food-2",@"heart-2",@"phone-2",@"heart-2"];
    NSArray *imageArr1 = @[@"bulb",@"cloud",@"diamond",@"food",@"heart",@"phone",@"heart"];

    MJCSegmentInterface *interFace =  [MJCSegmentInterface jc_initWithFrame:CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64) interFaceStyleToolsBlock:^(MJCSegmentStylesTools *jc_tools) {
        jc_tools.
        jc_titlesViewBackColor([UIColor redColor]).
        jc_titleBarStyles(MJCTitlesScrollStyle).
        jc_itemImageEffectStyles(MJCImageUpDownStyle).
        jc_indicatorFollowEnabled(YES).
        jc_itemBackColor([UIColor whiteColor]).
        jc_itemBackColor([UIColor purpleColor]).
        jc_itemSelectedSegmentIndex(3).
        jc_itemTextSelectedColor([UIColor blackColor]).
        jc_itemTextNormalColor([UIColor redColor]).
        jc_itemImageArraySelected(imageArr1).
        jc_itemImageArrayNormal(imageArr).
        jc_itemImagesEdgeInsets(UIEdgeInsetsMake(10, 0,0,0)).
        jc_itemTextsEdgeInsets(UIEdgeInsetsMake(0,0,30,0)).
        jc_itemTextFontSize(13).
        jc_ItemDefaultShowCount(5).
        jc_childsContainerBackColor([UIColor purpleColor]);
    }];
    [self.view addSubview:interFace];
    [interFace intoTitlesArray:titlesArr intoChildControllerArray:vcarrr hostController:self];
    
}

@end
