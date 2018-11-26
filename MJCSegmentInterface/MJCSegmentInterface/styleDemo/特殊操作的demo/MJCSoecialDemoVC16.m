//
//  MJCSoecialDemoVC16.m
//  MJCSegmentInterface
//
//  Created by mjc on 2018/11/26.
//  Copyright © 2018年 MJC. All rights reserved.
//

#import "MJCSoecialDemoVC16.h"
#import "MJCPrefixHeader.pch"

@interface MJCSoecialDemoVC16 ()
@property (nonatomic,weak) MJCSegmentInterface *interFace;
@end

@implementation MJCSoecialDemoVC16

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"试试" style:UIBarButtonItemStylePlain target:self action:@selector(test)];
    
    self.view.backgroundColor = [UIColor whiteColor];

    
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
    
    MJCSegmentInterface *interFace =  [MJCSegmentInterface jc_initWithFrame:CGRectMake(0,64,self.view.jc_width, self.view.jc_height - 64) titlesArray:titlesArr childControllerArray:vcarrr interFaceStyleToolsBlock:^(MJCSegmentStylesTools *jc_tools) {
        [self setupToolsWith:jc_tools index:2];
    } hostController:self];
    [self.view addSubview:interFace];
    _interFace = interFace;
}


-(void)test
{
    
    MJCSegmentStylesTools *tools = [[MJCSegmentStylesTools alloc]init];
    
    tools = [self setupToolsWith:tools index:0];
    
    NSArray *titlesArr = @[@"荣耀",@"联盟",@"DNF",@"CF",@"飞车",@"炫舞"];
    MJCTestViewController *vc1 = [[MJCTestViewController alloc]init];
    MJCTestTableViewController *vc2 = [[MJCTestTableViewController alloc]init];
    MJCTestCollectVC *vc4 = [[MJCTestCollectVC alloc]init];
    MJCTestViewController1 *vc3 = [[MJCTestViewController1 alloc]init];
    MJCTestViewController *vc5 = [[MJCTestViewController alloc]init];
    MJCTestViewController *vc6 = [[MJCTestViewController alloc]init];
    NSArray *vcarrr = @[vc1,vc2,vc4,vc3,vc5,vc6];
    for (int i = 0 ; i < vcarrr.count; i++) {//赋值标题
        UIViewController *vc = vcarrr[i];
        vc.title = titlesArr[i];
    }
    
    [_interFace jc_reviseSegmentInterfaceTitleArr:titlesArr childsViewControllerArr:vcarrr stylesTools:tools];
}



-(MJCSegmentStylesTools *)setupToolsWith:(MJCSegmentStylesTools*)jc_tools index:(NSInteger)index
{
    jc_tools.jc_titleBarStyles(MJCTitlesScrollStyle).
    jc_itemSelectedSegmentIndex(index).
    jc_indicatorHidden(YES).
    jc_indicatorColor([UIColor orangeColor]).
    jc_childScollAnimalEnabled(YES).
    jc_childScollEnabled(YES).
    jc_loadAllChildViewEnabled(YES).
    jc_childsContainerBackColor([UIColor whiteColor]).
    jc_titlesViewBackColor([UIColor whiteColor]).
    jc_itemTextNormalColor([UIColor redColor]).
    jc_itemTextSelectedColor([UIColor purpleColor]).
    jc_itemTextFontSize(13).
    jc_itemTextBoldFontSizeSelected(15).
    jc_defaultItemShowCount(5);
    return jc_tools;
}



@end
