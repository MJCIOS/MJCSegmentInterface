//
//  MJCDemoVC10.m
//  MJCSegmentInterface
//
//  Created by mjc on 2017/8/30.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCDemoVC4.h"
#import "MJCPrefixHeader.pch"

@interface MJCDemoVC4 ()<MJCSegmentDelegate>

@end

@implementation MJCDemoVC4

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *titlesArr = @[@"荣耀",@"联盟",@"DNF",@"CF",@"飞车",@"炫舞",@"天涯明月刀"];
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
    
    [self setupBasicUIWithTitlesArr:titlesArr vcArr:vcarrr];
}

-(void)setupBasicUIWithTitlesArr:(NSArray*)titlesArr vcArr:(NSArray*)vcArr
{
    
    NSArray *imageArr =@[@"bulb-2",@"cloud-2",@"diamond-2",@"food-2",@"heart-2",@"phone-2",@"heart-2"];
    NSArray *imageArr1 = @[@"bulb",@"cloud",@"diamond",@"food",@"heart",@"phone",@"heart"];
    
    MJCSegmentStylesTools *tools = [MJCSegmentStylesTools jc_initWithjc_toolsBlock:^(MJCSegmentStylesTools *jc_tools) {
        jc_tools.
        jc_itemImageArrayNormal(imageArr).
        jc_itemImageArraySelected(imageArr1).
        jc_titlesViewBackColor([UIColor redColor]).
        jc_titleBarStyles(MJCTitlesScrollStyle).
        jc_itemBackColor([UIColor purpleColor]).
        jc_itemTextSelectedColor([UIColor blackColor]).
        jc_itemTextNormalColor([UIColor redColor]).
        jc_itemTextFontSize(13).
        jc_ItemDefaultShowCount(5).
        jc_childsContainerBackColor([UIColor purpleColor]);
    }];

    
    MJCSegmentInterface *interFace = [MJCSegmentInterface initWithFrame: CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64) interFaceStyleTools:tools];
    interFace.delegate= self;
    [interFace intoTitlesArray:titlesArr hostController:self];
    [self.view addSubview:interFace];
    [interFace intoChildControllerArray:vcArr];
    
}

-(void)mjc_ClickEventWithItem:(UIButton *)tabItem childsController:(UIViewController *)childsController segmentInterface:(MJCSegmentInterface *)segmentInterface
{
    NSLog(@"%@",tabItem);
    NSLog(@"%@",childsController);
    NSLog(@"%@",segmentInterface);
}




@end
