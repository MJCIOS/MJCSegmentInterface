//
//  MJCSoecialDemoVC14.m
//  MJCSegmentInterface
//
//  Created by mjc on 2017/11/15.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCSoecialDemoVC14.h"
#import "MJCPrefixHeader.pch"

@interface MJCSoecialDemoVC14 ()

@property (nonatomic,strong) MJCSegmentInterface *interface;

@property (nonatomic,strong) NSArray *mainArr;

@property (nonatomic,strong) NSMutableArray *titlesArr;

@property (nonatomic,strong) NSMutableArray *vcArr;

@end

@implementation MJCSoecialDemoVC14

- (MJCSegmentInterface*)interface
{
    if (!_interface) {
        _interface = [MJCSegmentInterface jc_initWithFrame:CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64) interFaceStyleToolsBlock:^(MJCSegmentStylesTools *jc_tools) {
            jc_tools.
            jc_titleBarStyles(MJCTitlesScrollStyle).
            jc_titlesViewBackColor([UIColor whiteColor]).
            jc_itemTextSelectedColor([UIColor blueColor]).
            jc_itemTextNormalColor([UIColor redColor]).
            jc_itemTextFontSize(11).
            jc_ItemDefaultShowCount(5).
            jc_childsContainerBackColor([UIColor purpleColor]).
            jc_indicatorColor([UIColor purpleColor]).
            jc_indicatorHidden(NO).
            jc_indicatorsAnimalsEnabled(YES).
            jc_itemSelectedSegmentIndex(3);
        }];
        [_interface intoTitlesArray:_titlesArr intoChildControllerArray:_vcArr hostController:self];
    }
    return _interface;
}
- (NSMutableArray*)titlesArr
{
    if (!_titlesArr) {
        _titlesArr = [NSMutableArray arrayWithObjects:@"荣耀",@"联盟",@"DNF",@"CF",@"飞车",@"炫舞",@"天涯明月刀", nil];
    }
    return _titlesArr;
}

- (NSMutableArray*)vcArr
{
    if (!_vcArr) {
        _vcArr = [NSMutableArray  array];
    }
    return _vcArr;
}


-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_titlesArr removeObjectAtIndex:0];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"jiameng" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    _mainArr =  dic[@"data"][@"rootArray"];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.vcArr removeAllObjects];
    NSInteger count = self.titlesArr.count;
    for (int i = 0 ; i < count; i++) {//循环创建控制器对象
        MJCTestTableViewController *vc = [[MJCTestTableViewController alloc]init];
        vc.title = _titlesArr[i];
        [_vcArr addObject:vc];
    }
    
    [self.view addSubview:self.interface];
    [_interface jc_reviseSegmentInterfaceTitleArr:_titlesArr childsViewControllerArr:_vcArr];
}

@end
