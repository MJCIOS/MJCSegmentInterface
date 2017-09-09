//
//  MJCTestPushVC.m
//  MJCSegmentInterface
//
//  Created by mjc on 2017/9/6.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCTestPushVC.h"
#import "MJCAlertMessage.h"

@interface MJCTestPushVC ()
    
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
    
@property(copy,nonatomic) void (^sureBtnClickBlock)();

@end

@implementation MJCTestPushVC


-(instancetype)jc_initWithSureBtnClickBlock:(void(^)())sureBtnClickBlock;
{
    if (self == [super init]) {
        self.sureBtnClickBlock = sureBtnClickBlock;
    }
    return self;
}

    
- (void)viewDidLoad {
    [super viewDidLoad];
    
}
    
- (IBAction)sureBtnClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    [MJCAlertMessage showMessageViewTitle:@"提示" message:@"切换成功,✌️" cancelButtonTitle:@"知道了"];
    _sureBtnClickBlock(sender);
}

-(void)dealloc
{
    NSLog(@"销毁了");
}

@end
