//
//  MJCSoecialDemoVC13.m
//  MJCSegmentInterface
//
//  Created by mjc on 2017/11/15.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCSoecialDemoVC13.h"
#import "MJCPrefixHeader.pch"

@interface MJCSoecialDemoVC13 ()

@end

@implementation MJCSoecialDemoVC13

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
    
   MJCSegmentInterface *interFace = [MJCSegmentInterface jc_initWithFrame:CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64) interFaceStyleToolsBlock:^(MJCSegmentStylesTools *jc_tools) {
        jc_tools.
        jc_titleBarStyles(MJCTitlesScrollStyle).
        jc_titlesViewFrame(CGRectMake(0,0,MJCScreenWidth,50)).
        jc_itemSelectedSegmentIndex(0).
        jc_defaultItemShowCount(3).
        jc_itemTextNormalColor([UIColor redColor]).
        jc_itemTextSelectedColor([UIColor purpleColor]).
        jc_titlesViewBackColor([UIColor blueColor]).
        jc_itemBackColorNormal([UIColor whiteColor]).
        jc_itemEdgeinsets(MJCItemEdgeInsetsMake(5,5,5,5,5)).
        jc_tabItemSizeToFitIsEnabled(YES, YES, YES).
        jc_itemTextZoomEnabled(YES, 17).
        jc_itemTextFontSize(15).
        jc_itemSelectedSegmentIndex(0).
        jc_childsContainerBackColor([UIColor purpleColor]).
        jc_scaleLayoutEnabled(NO).
        jc_tabItemExcessSize(CGSizeMake(15, 15));
    }];
    [self.view addSubview:interFace];
    [interFace intoTitlesArray:titlesArr intoChildControllerArray:vcArr hostController:self];
}

@end
