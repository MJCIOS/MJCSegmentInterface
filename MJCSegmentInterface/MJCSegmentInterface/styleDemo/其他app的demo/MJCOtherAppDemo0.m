//
//  MJCOtherAppDemo0.m
//  MJCSegmentInterface
//
//  Created by mjc on 2017/10/25.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCOtherAppDemo0.h"
#import "MJCPrefixHeader.pch"

@interface MJCOtherAppDemo0 ()

@end

@implementation MJCOtherAppDemo0

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *titlesArr = @[@"推荐",@"手游",@"娱乐",@"游戏",@"趣玩"];
    MJCTestViewController *vc1 = [[MJCTestViewController alloc]init];
    MJCTestTableViewController *vc2 = [[MJCTestTableViewController alloc]init];
    MJCTestCollectVC *vc4 = [[MJCTestCollectVC alloc]init];
    MJCTestViewController1 *vc3 = [[MJCTestViewController1 alloc]init];
    MJCTestViewController *vc5 = [[MJCTestViewController alloc]init];
    MJCTestViewController *vc6 = [[MJCTestViewController alloc]init];
    MJCTestViewController *vc7 = [[MJCTestViewController alloc]init];
    NSArray *vcarrr = @[vc1,vc2,vc4,vc3,vc5,vc6,vc7];
    for (int i = 0 ; i < titlesArr.count; i++) {
        UIViewController *vc =vcarrr[i];
        vc.title = titlesArr[i];
    }

    [self setupSegmentWithTitlesArr:titlesArr vcArr:vcarrr];
}

-(void)setupSegmentWithTitlesArr:(NSArray *)titlesArr vcArr:(NSArray *)vcArr
{
    MJCSegmentInterface *interface = [MJCSegmentInterface jc_initWithFrame:CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64) interFaceStyleToolsBlock:^(MJCSegmentStylesTools *jc_tools) {
        jc_tools.jc_titleBarStyles(MJCTitlesClassicStyle).
        jc_titlesViewFrame(CGRectMake(0, 0, self.view.jc_width, 40)).
        jc_titlesViewBackColor([UIColor whiteColor]).
        jc_childScollEnabled(YES).
        jc_indicatorsAnimalsEnabled(YES).
        jc_itemTextNormalColor([UIColor blackColor]).
        jc_itemTextSelectedColor([UIColor orangeColor]).
        jc_indicatorColor([UIColor orangeColor]).
        jc_itemTextGradientEnabled(YES).
        jc_indicatorFrame(CGRectMake(0, 40-3, self.view.jc_width/titlesArr.count - 15, 3)).
        jc_itemTextFontSize(15).
        jc_indicatorFollowEnabled(YES).
        jc_childScollAnimalEnabled(YES);
    }];
    [self.view addSubview:interface];
    [interface intoTitlesArray:titlesArr intoChildControllerArray:vcArr hostController:self];
}


@end
