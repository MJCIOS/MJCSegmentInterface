//
//  MJCDemoVC1.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/2.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCDemoVC0.h"
#import "MJCPrefixHeader.pch"



@interface MJCDemoVC0 ()<MJCSegmentDelegate>

@property (nonatomic,strong) NSArray *mainArr;

@end

@implementation MJCDemoVC0

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *titlesArr = @[@"荣耀",@"联盟",@"DNF",@"CF",@"飞车",@"炫舞",@"天涯"];
    MJCTestViewController *vc1 = [[MJCTestViewController alloc]init];
    MJCTestTableViewController *vc2 = [[MJCTestTableViewController alloc]init];
    MJCTestCollectVC *vc4 = [[MJCTestCollectVC alloc]init];
    MJCTestViewController1 *vc3 = [[MJCTestViewController1 alloc]init];
    MJCTestViewController *vc5 = [[MJCTestViewController alloc]init];
    MJCTestViewController *vc6 = [[MJCTestViewController alloc]init];
    MJCTestViewController *vc7 = [[MJCTestViewController alloc]init];
    NSArray *vcarrr = @[vc1,vc2,vc4,vc3,vc5,vc6,vc7];
    for (int i = 0 ; i < vcarrr.count; i++) {//赋值标题
        UIViewController *vc = vcarrr[i];
        vc.title = titlesArr[i];
    }
    
    
    MJCSegmentInterface *interFace =  [MJCSegmentInterface jc_initWithFrame:CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64) interFaceStyleToolsBlock:^(MJCSegmentStylesTools *jc_tools) {
        jc_tools.jc_titleBarStyles(MJCTitlesScrollStyle).
        jc_indicatorColor([UIColor orangeColor]).
        jc_childScollAnimalEnabled(YES).
        jc_childScollEnabled(YES).
        jc_childsContainerBackColor([UIColor whiteColor]).
        jc_titlesViewBackColor([UIColor whiteColor]).
        jc_itemTextNormalColor([UIColor redColor]).
        jc_itemTextSelectedColor([UIColor purpleColor]).
        jc_itemTextFontSize(13).
        jc_ItemDefaultShowCount(5);
    }];
    interFace.delegate= self;
    [self.view addSubview:interFace];
    [interFace intoTitlesArray:titlesArr hostController:self];
    [interFace intoChildControllerArray:vcarrr];
    
}

-(void)dealloc
{
    NSLog(@"%@销毁",self);
}

@end
