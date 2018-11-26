
//
//  MJCDemoVC4.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/3.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCSpecialDemoVC2.h"
#import "MJCPrefixHeader.pch"

@interface MJCSpecialDemoVC2 ()<MJCSegmentDelegate>

@property (weak, nonatomic) IBOutlet MJCSegmentInterface *interFace;

@end

@implementation MJCSpecialDemoVC2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    MJCTestViewController *vc1 = [[MJCTestViewController alloc]init];
    MJCTestTableViewController *vc2 = [[MJCTestTableViewController alloc]init];
    MJCTestViewController1 *vc3 = [[MJCTestViewController1 alloc]init];
    MJCTestCollectVC *vc4 = [[MJCTestCollectVC alloc]init];
    MJCTestViewController *vc5 = [[MJCTestViewController alloc]init];
    MJCTestViewController *vc6 = [[MJCTestViewController alloc]init];
    MJCTestViewController *vc7 = [[MJCTestViewController alloc]init];
    MJCTestViewController *vc8 = [[MJCTestViewController alloc]init];
    NSArray *vcarrr = @[vc1,vc2,vc3,vc4,vc5,vc6,vc7,vc8];
    NSArray *titlesArr = @[@"荣耀",@"联盟",@"DNF",@"CF",@"诛仙世界",@"飞车",@"炫舞",@"天涯"];
    NSArray *imageArr =@[@"bulb-2",@"cloud-2",@"diamond-2",@"food-2",@"heart-2"];
    NSArray *imageArr1 = @[@"bulb",@"cloud",@"diamond",@"food",@"heart"];
    NSArray *backimageArr =@[@"111",@"222",@"1111",@"234",@"567",@"666",@"888"];
    NSArray *backimageArr1 = @[@"123",@"333",@"345",@"456",@"777",@"999",@"555"];
    for (int i = 0 ; i < vcarrr.count; i++) {//赋值标题
        UIViewController *vc = vcarrr[i];
        vc.title = titlesArr[i];
    }
    
    NSArray *colorArr = @[[UIColor redColor],[UIColor blackColor],[UIColor purpleColor],[UIColor lightGrayColor],[UIColor orangeColor]];
    NSArray *colorArr1 = @[[UIColor blackColor],[UIColor redColor],[UIColor lightGrayColor],[UIColor purpleColor],[UIColor yellowColor]];

    
    MJCSegmentStylesTools *tools = [MJCSegmentStylesTools jc_initWithSegmentStylestoolsBlock:^(MJCSegmentStylesTools *jc_tools) {
        jc_tools.
        jc_titlesViewFrame(CGRectMake(0, 0, self.view.jc_width, 100)).
        jc_titleBarStyles(MJCTitlesScrollStyle).
        jc_indicatorStyles(MJCIndicatorEqualItemEffect).
        jc_itemTextImageStyle(MJCLeftRightEffect).
        jc_itemSelectedSegmentIndex(4).
        jc_defaultItemShowCount(3).
        jc_itemTextFontSize(13).
        jc_titlesViewBackColor([UIColor orangeColor]).
        jc_itemTextNormalColor([UIColor redColor]).
        jc_itemTextSelectedColor([UIColor purpleColor]).
        jc_titlesViewBackImage([UIImage imageNamed:@"back"]).
        jc_itemBackImageNormal([UIImage imageNamed:@"222"]).
        jc_itemBackImageSelected([UIImage imageNamed:@"456"]).
        jc_itemBackImageArraySelected(backimageArr).
        jc_itemBackImageArrayNormal(backimageArr1).
        jc_itemImageSelected([UIImage imageNamed:@"food-2"]).
        jc_itemImageNormal([UIImage imageNamed:@"food"]).
        jc_itemImageArrayNormal(imageArr).
        jc_itemImageArraySelected(imageArr1).
        jc_indicatorColor([UIColor redColor]).
        jc_indicatorImage([UIImage imageNamed:@"箭头"]).
        jc_indicatorHidden(NO).
        jc_childScollEnabled(YES).
        jc_childScollAnimalEnabled(YES).
        jc_indicatorFollowEnabled(YES).
        jc_tabItemSizeToFitIsEnabled(YES, NO, NO).
        jc_itemEdgeinsets(MJCItemEdgeInsetsMake(0, 10, 0, 10, 10)).
        jc_itemImagesEdgeInsets(UIEdgeInsetsMake(10,10,10,0)).
        jc_itemTextsEdgeInsets(UIEdgeInsetsMake(10,10,10,10)).
        jc_itemTextGradientEnabled(YES).
        jc_itemTextHidden(NO).
        jc_titlesViewPenetrationEnabled(NO).
        jc_indicatorColorEqualTextColorEnabled(YES).
        jc_childsContainerBackColor([UIColor redColor]).
        jc_itemImageSize(CGSizeMake(15, 15)).
        jc_indicatorFrame(CGRectMake(0,jc_tools.titlesViewFrame.size.height - 10,30,10)).
        jc_itemTextZoomEnabled(YES, 14).
        jc_itemTextColorArrayNormal(colorArr).jc_itemTextColorArraySelected(colorArr1).
        jc_indicatorsAnimalsEnabled(YES).
        jc_scaleLayoutEnabled(NO).
        jc_itemBackColorNormal([UIColor redColor]);
    }];
    
    _interFace.jc_stylesTools = tools;
    [_interFace intoTitlesArray:titlesArr intoChildControllerArray:vcarrr hostController:self];
    
}


-(void)dealloc
{
    NSLog(@"销毁了");
}


@end
