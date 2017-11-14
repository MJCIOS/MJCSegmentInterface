//
//  MJCSoecialDemoVC12.m
//  MJCSegmentInterface
//
//  Created by mjc on 2017/10/10.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCSoecialDemoVC12.h"
#import "MJCPrefixHeader.pch"

@interface MJCSoecialDemoVC12 ()

@end

@implementation MJCSoecialDemoVC12

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *titlesArr = @[@"荣耀",@"联盟",@"地下城与勇士",@"CF",@"飞车",@"炫舞",@"天涯明月刀"];
    NSMutableArray *vcArr = [NSMutableArray array];
    for (int i = 0 ; i < titlesArr.count; i++) {//循环创建控制器对象
        MJCTestTableViewController *vc = [[MJCTestTableViewController alloc]init];
        vc.title = titlesArr[i];
        [vcArr addObject:vc];
    }
    
    [self setupBasicUIWithTitlesArr:titlesArr vcArr:vcArr];
}

-(void)setupBasicUIWithTitlesArr:(NSArray*)titlesArr vcArr:(NSArray*)vcArr
{
    MJCSegmentStylesTools *tools = [MJCSegmentStylesTools jc_initWithjc_toolsBlock:^(MJCSegmentStylesTools *jc_tools)
                                      {
                                          jc_tools.
                                          jc_titleBarStyles(MJCTitlesScrollStyle).
                                          jc_titlesViewFrame(CGRectMake(0,0,MJCScreenWidth,50)).
                                          jc_itemSelectedSegmentIndex(0).
                                          jc_ItemDefaultShowCount(3).
                                          jc_itemTextNormalColor([UIColor redColor]).
                                          jc_itemTextSelectedColor([UIColor purpleColor]).
                                          jc_titlesViewBackColor([UIColor blueColor]).
                                          jc_itemBackColor([UIColor whiteColor]).
                                          jc_itemEdgeinsets(MJCEdgeInsetsMake(15,15,15,15,15)).
                                          jc_tabItemSizeToFitIsEnabled(YES, YES, YES).
                                          jc_tabItemTextZoomBigEnabled(YES, 17).
                                          jc_itemTextFontSize(15).
                                          jc_itemSelectedSegmentIndex(0).
                                          jc_childsContainerBackColor([UIColor purpleColor]).
                                          jc_scaleLayoutEnabled(NO);
                                      }];
    MJCSegmentInterface *interFace = [[MJCSegmentInterface alloc]init];
    interFace.frame = CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64);
    interFace.tools = tools;
    [self.view addSubview:interFace];
    [interFace intoTitlesArray:titlesArr intoChildControllerArray:vcArr hostController:self];
}


@end
