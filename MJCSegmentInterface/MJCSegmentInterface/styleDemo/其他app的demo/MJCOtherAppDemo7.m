//
//  MJCOtherAppDemo7.m
//  MJCSegmentInterface
//
//  Created by mjc on 2017/10/27.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCOtherAppDemo7.h"
#import "MJCPrefixHeader.pch"
#import "MJCAlertMessage.h"

@interface MJCOtherAppDemo7 ()

@end

@implementation MJCOtherAppDemo7

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSArray *titlesArr = @[@"精选",@"",@"直播",@"订阅",@"视频购",@"问答",@"清单",@"社区",@"生活",@"数码",@"亲子",@"风尚",@"美食"];
    
    MJCTestTableViewController *vc1 = [[MJCTestTableViewController alloc]init];
    MJCTestCollectVC *vc2 = [[MJCTestCollectVC alloc]init];
    MJCTestViewController1 *vc3 = [[MJCTestViewController1 alloc]init];
    NSMutableArray  *vcarrr = [NSMutableArray arrayWithObjects:vc1,vc2,vc3, nil];
    NSInteger vcCount = titlesArr.count-vcarrr.count;
    for (int i = 0 ; i < vcCount ; i++) {
        MJCTestViewController *vc = [[MJCTestViewController alloc]init];;
        [vcarrr addObject:vc];//将元素添加到数组末尾
    }
    for (int i = 0 ; i < titlesArr.count; i++) {
        UIViewController *vc =vcarrr[i];
        vc.title = titlesArr[i];
    }

    [self setupSegmentWithTitlesArr:titlesArr vcArr:vcarrr];
}

-(void)setupSegmentWithTitlesArr:(NSArray *)titlesArr vcArr:(NSArray *)vcArr
{
    NSArray *imageNArr =@[@"",@"美妆个护",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@""];
    
    MJCSegmentInterface *interface = [MJCSegmentInterface jc_initWithFrame:CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64) interFaceStyleToolsBlock:^(MJCSegmentStylesTools *jc_tools) {
        jc_tools.
        jc_titleBarStyles(MJCTitlesScrollStyle).
        jc_titlesViewFrame(CGRectMake(0, 0, self.view.jc_width-50, 40)).
        jc_titlesViewBackColor([UIColor groupTableViewBackgroundColor]).
        jc_itemTextNormalColor([UIColor darkGrayColor]).
        jc_itemTextSelectedColor([UIColor redColor]).
        jc_itemImageArrayNormal(imageNArr).
        jc_indicatorColor([UIColor redColor]).
        jc_tabItemSizeToFitIsEnabled(YES, NO, YES ).
        jc_itemEdgeinsets(MJCItemEdgeInsetsMake(0, 15, 0, 15, 20)).
        jc_itemTextFontSize(15).
        jc_childScollEnabled(YES).
        jc_indicatorsAnimalsEnabled(YES).
        jc_indicatorStyles(MJCIndicatorEqualTextEffect).
        jc_childScollAnimalEnabled(YES);
    }];
    [self.view addSubview:interface];
    [interface intoTitlesArray:titlesArr intoChildControllerArray:vcArr hostController:self];

    [self liebiaoUI:interface.jc_stylesTools];
}


-(void)liebiaoUI:(MJCSegmentStylesTools*)tools
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(tools.titlesViewFrame), 64,50,tools.titlesViewFrame.size.height)];
    view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:view];
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0,8,1, view.jc_height-16)];
    lineView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.1];
    [view addSubview:lineView];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.frame = CGRectMake(lineView.jc_width, 0,view.jc_width, view.jc_height);
    [btn setImage:[UIImage imageNamed:@"加号"] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [btn addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn];
}

-(void)test
{
    [MJCAlertMessage showMessageViewTitle:@"提示" message:@"没这个功能" cancelButtonTitle:@"知道了"];
}


@end
