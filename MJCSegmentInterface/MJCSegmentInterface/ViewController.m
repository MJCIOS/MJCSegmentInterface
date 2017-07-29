//  代码地址:https://github.com/MJCIOS/MJCSegmentInterface
//  ViewController.m
//  MJCSegmentInterface
//
//  Created by mjc on 16/10/28.
//  Copyright © 2016年 MJC. All rights reserved.
//
//  有啥问题加我QQ: 292251588 一起交流,我是菜菜..求大神指教

#import "ViewController.h"
#import "MJCPrefixHeader.pch"

#import "MJCAlertMessage.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@property (nonatomic,strong) NSArray *mainArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [MJCAlertMessage showMessageViewTitle:@"感谢" message:@"谢谢大家抽空打开我的项目" cancelButtonTitle:@"不用谢"];
    
    self.mainTableView.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"appStartBackImage"]];
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"mainData" ofType:@"plist"];
    _mainArr = [NSArray arrayWithContentsOfFile:path];
}

#pragma mark - UITableviewdatasource,UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _mainArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.textLabel.text = _mainArr[indexPath.row][@"titles"];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *vc = [MJCInterfaceTools setupViewControllersStr:_mainArr[indexPath.row][@"viewControllers"]];
    [self.navigationController pushViewController:vc animated:YES];
}



@end
