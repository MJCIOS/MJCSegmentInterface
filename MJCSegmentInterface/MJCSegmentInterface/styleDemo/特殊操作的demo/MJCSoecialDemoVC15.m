//
//  MJCSoecialDemoVC15.m
//  MJCSegmentInterface
//
//  Created by mjc on 2018/4/2.
//  Copyright © 2018年 MJC. All rights reserved.
//

#import "MJCSoecialDemoVC15.h"
#import "MJCPrefixHeader.pch"

@interface MJCSoecialDemoVC15 ()<MJCSegmentDelegate>
@property (nonatomic,weak) MJCSegmentInterface *interFace;
@end

@implementation MJCSoecialDemoVC15

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
    NSArray *titlesArr = @[@"荣耀",@"联盟",@"DNF",@"CF",@"飞车",@"炫舞",@"天涯",@"诛仙世界"];
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
    
    MJCSegmentInterface *interFace =  [MJCSegmentInterface jc_initWithFrame:CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64) interFaceStyleToolsBlock:^(MJCSegmentStylesTools *jc_tools) {
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
        jc_loadAllChildViewEnabled(YES).
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
    interFace.delegate = self;
    [self.view addSubview:interFace];
    [interFace intoTitlesArray:titlesArr intoChildControllerArray:vcarrr hostController:self];
    _interFace = interFace;
}
-(void)mjc_tabitemDataWithTabitemArray:(NSArray<UIButton *> *)tabItemArray childsVCAarray:(NSArray<UIViewController *> *)childsVCAarray segmentInterface:(MJCSegmentInterface *)segmentInterface
{
    NSLog(@"%@",tabItemArray);
    NSLog(@"%@",childsVCAarray);
    NSLog(@"%@",segmentInterface);
}


-(void)mjc_ClickEventWithItem:(UIButton *)tabItem childsController:(UIViewController *)childsController segmentInterface:(MJCSegmentInterface *)segmentInterface
{
    NSLog(@"%ld",tabItem.tag);
    NSLog(@"%@",childsController);
    NSLog(@"%@",segmentInterface);
}
-(void)mjc_scrollDidEndDeceleratingWithItem:(UIButton *)tabItem childsController:(UIViewController *)childsController indexPage:(NSInteger)indexPage segmentInterface:(MJCSegmentInterface *)segmentInterface
{
    NSLog(@"%ld",tabItem.tag);
    NSLog(@"%ld",indexPage);
    NSLog(@"%@",childsController);
    NSLog(@"%@",segmentInterface);
}
-(void)mjc_cancelClickEventWithItem:(UIButton *)tabItem childsController:(UIViewController *)childsController segmentInterface:(MJCSegmentInterface *)segmentInterface
{
    NSLog(@"%ld",tabItem.tag);
    NSLog(@"%@",childsController);
    NSLog(@"%@",segmentInterface);
}

-(void)dealloc
{
    NSLog(@"%@销毁了",self);
}


@end
