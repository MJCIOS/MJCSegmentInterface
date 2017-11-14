//
//  MJCSoecialDemoVC5.m
//  MJCSegmentInterface
//
//  Created by mjc on 2017/8/31.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCSoecialDemoVC5.h"
#import "MJCPrefixHeader.pch"

@interface MJCSoecialDemoVC5 ()

@property (nonatomic,strong) NSArray *mainArr;

@end

@implementation MJCSoecialDemoVC5

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"jiameng" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    _mainArr =  dic[@"data"][@"rootArray"];
    
    
    //标题数据
    NSArray *titlesArr = @[@"荣耀",@"联盟",@"DNF",@"CF",@"飞车",@"炫舞",@"天涯"];
    
    //创建添加控制器对象
    NSMutableArray *vcArr = [NSMutableArray array];
    for (int i = 0 ; i < titlesArr.count; i++) {//赋值标题
        MJCTestTableViewController *vc = [MJCTestTableViewController new];
        vc.title = titlesArr[i];
        vc.mainDataArr = _mainArr;
        [vcArr addObject:vc];
    }

    
    //    //    有新手反应看不懂上方的写法,特地写了一份这种的最笨的写法...
//    NSMutableDictionary *testdic;
//    MJCTestTableViewController *vc1 = [[MJCTestTableViewController alloc]init];
//    vc1.title = titlesArr[0];
//    testdic = _mainArr[0];
//    vc1.testData = testdic[@"userNm"];
//    MJCTestTableViewController *vc2 = [[MJCTestTableViewController alloc]init];
//    vc2.title = titlesArr[1];
//    testdic = _mainArr[1];
//    vc2.testData = testdic[@"userNm"];
//    MJCTestTableViewController *vc3 = [[MJCTestTableViewController alloc]init];
//    vc3.title = titlesArr[2];
//    testdic = _mainArr[2];
//    vc3.testData = testdic[@"userNm"];
//    MJCTestTableViewController *vc4 = [[MJCTestTableViewController alloc]init];
//    vc4.title = titlesArr[3];
//    testdic = _mainArr[3];
//    vc4.testData = testdic[@"userNm"];
//    MJCTestTableViewController *vc5 = [[MJCTestTableViewController alloc]init];
//    vc5.title = titlesArr[4];
//    testdic = _mainArr[4];
//    vc5.testData = testdic[@"userNm"];
//    MJCTestTableViewController *vc6 = [[MJCTestTableViewController alloc]init];
//    vc6.title = titlesArr[5];
//    testdic = _mainArr[5];
//    vc6.testData = testdic[@"userNm"];
//    MJCTestTableViewController *vc7 = [[MJCTestTableViewController alloc]init];
//    vc7.title = titlesArr[6];
//    testdic = _mainArr[6];
//    vc7.testData = testdic[@"userNm"];
//    NSArray *vcarrr = @[vc1,vc2,vc3,vc4,vc5,vc6,vc7];

    MJCSegmentStylesTools *tools = [MJCSegmentStylesTools jc_initWithjc_toolsBlock:^(MJCSegmentStylesTools *jc_tools)
    {
        jc_tools.
        jc_titleBarStyles(MJCTitlesScrollStyle).
        jc_titlesViewFrame(CGRectMake(0,0,self.view.jc_width,60)).
        jc_indicatorStyles(MJCIndicatorItemTextStyle).
        jc_ItemDefaultShowCount(4).
        jc_titlesViewBackColor([UIColor blueColor]).
        jc_itemTextFontSize(13).
        jc_itemTextNormalColor([UIColor redColor]).
        jc_itemTextSelectedColor([UIColor purpleColor]).
        jc_itemBackColor([UIColor whiteColor]).
        jc_indicatorHidden(NO).
        jc_childScollEnabled(YES).
        jc_childScollAnimalEnabled(YES).
        jc_indicatorFollowEnabled(YES).
        jc_itemImagesEdgeInsets(UIEdgeInsetsMake(10,0,10,0)).
        jc_itemTextsEdgeInsets(UIEdgeInsetsMake(10,10,10,10)).
        jc_itemImageEffectStyles(MJCImageClassicStyle).
        jc_itemTextGradientEnabled(YES).
        jc_tabItemTextZoomBigEnabled(YES, 18);
    }];
    MJCSegmentInterface *interFace = [MJCSegmentInterface initWithFrame:CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64) interFaceStyleTools:tools];
    [self.view addSubview:interFace];
    [interFace intoTitlesArray:titlesArr intoChildControllerArray:vcArr hostController:self];
}



@end
