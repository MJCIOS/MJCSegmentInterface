//
//  MJCTitlesScollView.m
//  MJCSlideSwitch
//
//  Created by mjc on 16/11/21.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "MJCTitlesView.h"
#import "UIView+MJCClassExtension.h"

@interface MJCTitlesView ()

@property (nonatomic,weak) UIImageView *backgroudView;

@end

@implementation MJCTitlesView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.backgroundColor = [UIColor whiteColor];
        UIImageView *backgroudView = [[UIImageView alloc]init];
        backgroudView.hidden = YES;
        [self addSubview:backgroudView];
        _backgroudView = backgroudView;
    }
    return self;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.backgroundColor = [UIColor whiteColor];
    UIImageView *backgroudView = [[UIImageView alloc]init];
    backgroudView.hidden = YES;
    [self addSubview:backgroudView];
    _backgroudView = backgroudView;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    _backgroudView.frame = self.bounds;
}

-(void)setBackgroudImage:(UIImage *)backgroudImage
{
    _backgroudView.hidden  = NO;
    _backgroudImage = backgroudImage;
    _backgroudView.image = backgroudImage;
}

-(void)setSelectedTitletabitem:(UIButton *)selectedTitletabitem
{
    _selectedTitletabitem = selectedTitletabitem;
    
    // 本质:修改titleScrollView偏移量
    CGFloat offsetX = selectedTitletabitem.center.x - self.frame.size.width * 0.7;
    //    CGFloat offsetX = button.center.x - MJCScreenWidth * 0.5;
    
    if (offsetX < 0) {
        offsetX = 0;
    }
    
    CGFloat maxOffsetX = self.contentSize.width - self.frame.size.width;
    //    CGFloat maxOffsetX = self.titlesScrollView.contentSize.width - MJCScreenWidth + _titleCenterMargin;
    
    if (offsetX > maxOffsetX) {
        offsetX = maxOffsetX;
    }
    
    [self setContentOffset: CGPointMake(offsetX, 0) animated:YES];
}


@end
