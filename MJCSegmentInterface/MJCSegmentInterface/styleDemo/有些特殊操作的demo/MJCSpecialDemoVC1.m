//
//  MJCDemoNewVC.m
//  MJCSegmentInterface
//
//  Created by mjc on 2017/8/30.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCSpecialDemoVC1.h"
#import "MJCPrefixHeader.pch"

@interface MJCSpecialDemoVC1 ()<MJCSegmentDelegate>

{
    MJCSegmentInterface *interFace;
}


@property (nonatomic,strong) NSArray *mainArr;

@property (nonatomic,strong) NSMutableArray *titlesArr;

@property (nonatomic,strong) NSMutableArray *vcArr;

@end

@implementation MJCSpecialDemoVC1


- (NSMutableArray*)titlesArr
{
    if (!_titlesArr) {
        _titlesArr = [NSMutableArray arrayWithObjects:@"荣耀",@"联盟",@"DNF",@"CF",@"飞车",@"炫舞",@"天涯明月刀", nil];
    }
    return _titlesArr;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    _vcArr = [NSMutableArray array];
    [_vcArr removeAllObjects];
    
    NSInteger count = self.titlesArr.count;
    
    for (int i = 0 ; i < count; i++) {//循环创建控制器对象
        MJCTestTableViewController *vc = [[MJCTestTableViewController alloc]init];
        vc.title = _titlesArr[i];
        [_vcArr addObject:vc];
    }
    
    [self setupBasicUIWithTitlesArr:_titlesArr vcArr:_vcArr];

}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_titlesArr removeObjectAtIndex:0];
    [_vcArr removeObjectAtIndex:0];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"jiameng" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    _mainArr =  dic[@"data"][@"rootArray"];

    NSArray *titlesArr = @[@"荣耀",@"联盟",@"DNF",@"CF",@"飞车",@"炫舞",@"天涯明月刀"];
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
    if(interFace == nil)
    {
        MJCSegmentStylesTools *tools = [MJCSegmentStylesTools jc_initWithSegmentStylestoolsBlock:^(MJCSegmentStylesTools *jc_tools) {
            jc_tools.
            jc_titleBarStyles(MJCTitlesScrollStyle).
            jc_titlesViewBackColor([UIColor whiteColor]).
            jc_itemTextSelectedColor([UIColor blueColor]).
            jc_itemTextNormalColor([UIColor redColor]).
            jc_itemTextFontSize(11).
            jc_defaultItemShowCount(5).
            jc_childsContainerBackColor([UIColor purpleColor]).
            jc_indicatorColor([UIColor purpleColor]).
            jc_indicatorHidden(NO).
            jc_indicatorsAnimalsEnabled(YES).
            jc_itemSelectedSegmentIndex(3);
        }];
        
        interFace = [[MJCSegmentInterface alloc]init];
        interFace.jc_stylesTools = tools;
        interFace.frame = CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64);
        [self.view addSubview:interFace];
        interFace.delegate= self;
        [interFace intoTitlesArray:titlesArr intoChildControllerArray:vcArr hostController:self];
    }
    
    [interFace jc_reviseSegmentInterfaceTitleArr:titlesArr childsViewControllerArr:vcArr stylesTools:nil];
}

-(void)mjc_ClickEventWithItem:(UIButton *)tabItem childsController:(UIViewController *)childsController segmentInterface:(MJCSegmentInterface *)segmentInterface
{
    MJCTestTableViewController *vc = (MJCTestTableViewController *)childsController;
    NSMutableDictionary *dic =  _mainArr[tabItem.tag];
    [vc beginLoadNewData:dic];
}
    
-(void)mjc_scrollDidEndDeceleratingWithItem:(UIButton *)tabItem childsController:(UIViewController *)childsController indexPage:(NSInteger)indexPage segmentInterface:(MJCSegmentInterface *)segmentInterface
{
    MJCTestTableViewController *vc = (MJCTestTableViewController *)childsController;
    NSMutableDictionary *dic =  _mainArr[tabItem.tag];
    [vc beginLoadNewData:dic];
}

@end
