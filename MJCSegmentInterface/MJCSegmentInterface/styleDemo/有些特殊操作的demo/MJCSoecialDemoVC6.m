//
//  MJCSoecialDemoVC6.m
//  MJCSegmentInterface
//
//  Created by mjc on 2017/8/31.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCSoecialDemoVC6.h"
#import "MJCPrefixHeader.pch"

@interface MJCSoecialDemoVC6 ()

@property (nonatomic,strong) NSArray *mainArr;

@end

@implementation MJCSoecialDemoVC6

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    [self.navigationController setNavigationBarHidden:YES];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"jiameng" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    _mainArr =  dic[@"data"][@"rootArray"];
 
    NSMutableArray *titlesArr = [NSMutableArray array];
    for (int i = 0 ; i < _mainArr.count; i++) {
        NSMutableDictionary *dic = _mainArr[i];
        [titlesArr addObject:dic[@"userNm"]];
    }
    //创建添加控制器对象
    NSMutableArray *vcArr = [NSMutableArray array];
    for (int i = 0 ; i < titlesArr.count; i++) {//赋值标题
        MJCTestTableViewController *vc = [MJCTestTableViewController new];
        vc.title = titlesArr[i];
        [vcArr addObject:vc];
    }

    MJCSegmentStylesTools *tools = [MJCSegmentStylesTools jc_initWithSegmentStylestoolsBlock:^(MJCSegmentStylesTools *jc_tools)
                                      {
                                          jc_tools.
                                          jc_titleBarStyles(MJCTitlesScrollStyle).
                                          jc_titlesViewFrame(CGRectMake(0,0,self.view.jc_width,60)).
                                          jc_indicatorStyles(MJCIndicatorEqualTextEffect).
                                          jc_defaultItemShowCount(4).
                                          jc_titlesViewBackColor([UIColor blueColor]).
                                          jc_itemTextFontSize(13).
                                          jc_itemTextNormalColor([UIColor redColor]).
                                          jc_itemTextSelectedColor([UIColor purpleColor]).
                                          jc_itemBackColorNormal([UIColor whiteColor]).
                                          jc_indicatorHidden(NO).
                                          jc_childScollEnabled(YES).
                                          jc_childScollAnimalEnabled(YES).
                                          jc_indicatorFollowEnabled(YES).
                                          jc_itemImagesEdgeInsets(UIEdgeInsetsMake(10,0,10,0)).
                                          jc_itemTextsEdgeInsets(UIEdgeInsetsMake(10,10,10,10)).
                                          jc_itemTextImageStyle(MJCLeftRightEffect).
                                          jc_itemTextGradientEnabled(YES).
                                          jc_itemTextZoomEnabled(YES, 18);
                                      }];
    MJCSegmentInterface *interFace = [MJCSegmentInterface initWithFrame:CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64) interFaceStyletools:tools];
    [self.view addSubview:interFace];
    [interFace intoTitlesArray:titlesArr intoChildControllerArray:vcArr hostController:self];

    
}



@end
