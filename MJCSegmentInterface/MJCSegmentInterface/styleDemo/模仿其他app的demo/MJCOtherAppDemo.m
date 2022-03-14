//
//  MJCOtherAppDemo.m
//  MJCSegmentInterface
//
//  Created by mjc on 2017/10/25.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCOtherAppDemo.h"
#import "MJCPrefixHeader.pch"

@interface MJCOtherAppDemo ()

@property (nonatomic,strong) NSArray *mainArr;

@end

@implementation MJCOtherAppDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"otherApp" ofType:@"plist"];
    _mainArr = [NSArray arrayWithContentsOfFile:path];
    
    self.tableView.backgroundColor = MJCRandomColor;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
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
    UIViewController *vc = [MJCInterfacetools setupViewControllersStr:_mainArr[indexPath.row][@"viewControllers"]];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
