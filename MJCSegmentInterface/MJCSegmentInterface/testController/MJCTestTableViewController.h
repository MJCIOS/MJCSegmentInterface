//
//  MJCTestTableViewController.h
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/2.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MJCTestTableViewController : UITableViewController

-(void)beginLoadNewData:(NSMutableDictionary *)dicData;

/** 传输的数据 */
@property (nonatomic,copy) NSString* testData;

@property (weak, nonatomic)  NSLayoutConstraint *heightLayout;

@end
