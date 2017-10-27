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
    MJCSegmentInterface *interFace = [MJCSegmentInterface showInterfaceWithTitleBarFrame:CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64) Styles:MJCTitlesClassicStyle];
    interFace.titlesViewFrame = CGRectMake(0, 0, interFace.jc_width, 40);
    interFace.titlesViewBackColor = [UIColor whiteColor];
    interFace.isIndicatorsAnimals  = YES;
    interFace.itemTextSelectedColor = [UIColor orangeColor];
    interFace.itemTextNormalColor = [UIColor blackColor];
    interFace.indicatorColor = [UIColor orangeColor];
    interFace.isFontGradient = YES;
    interFace.indicatorFrame = CGRectMake(0, 40-3, interFace.jc_width/titlesArr.count - 15, 3);
    interFace.itemTextFontSize = 15;
    interFace.isIndicatorFollow = YES;
    interFace.isChildScollAnimal = YES;
    [self.view addSubview:interFace];
    [interFace intoTitlesArray:titlesArr intoChildControllerArray:vcArr hostController:self];
}


@end
