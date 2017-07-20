//
//  UIView+jcExtension.m

//
//  Created by majiachen on 16/11/6.
//  Copyright © 2016年 majiachen. All rights reserved.
//

#import "UIView+MJCClassExtension.h"

@implementation UIView (MJCClassExtension)

- (CGSize)jc_size
{
    return self.frame.size;
}

- (void)setJc_size:(CGSize)jc_size
{
    CGRect frame = self.frame;
    frame.size = jc_size;
    self.frame = frame;
}

- (CGFloat)jc_width
{
    return self.frame.size.width;
}

- (void)setJc_width:(CGFloat)jc_width
{
    CGRect frame = self.frame;
    frame.size.width = jc_width;
    self.frame = frame;
}


- (CGFloat)jc_height
{
    return self.frame.size.height;
}

- (void)setJc_height:(CGFloat)jc_height
{
    CGRect frame = self.frame;
    frame.size.height = jc_height;
    self.frame = frame;
}

- (CGFloat)jc_x
{
    return self.frame.origin.x;
}

- (void)setJc_x:(CGFloat)jc_x
{
    CGRect frame = self.frame;
    frame.origin.x = jc_x;
    self.frame = frame;
}

- (CGFloat)jc_y
{
    return self.frame.origin.y;
}

- (void)setJc_y:(CGFloat)jc_y
{
    CGRect frame = self.frame;
    frame.origin.y = jc_y;
    self.frame = frame;
}
- (CGFloat)jc_centerX
{
    return self.center.x;
}
- (void)setJc_centerX:(CGFloat)jc_centerX
{
    CGPoint center = self.center;
    center.x = jc_centerX;
    self.center = center;
}
- (CGFloat)jc_centerY
{
    return self.center.y;
}

- (void)setJc_centerY:(CGFloat)jc_centerY
{
    CGPoint center = self.center;
    center.y = jc_centerY;
    self.center = center;
}

- (CGFloat)jc_right
{
    return CGRectGetMaxX(self.frame);
}

- (void)setJc_right:(CGFloat)jc_right
{
    self.jc_x = jc_right - self.jc_width;
}


- (CGFloat)jc_bottom
{
    return CGRectGetMaxY(self.frame);
}
- (void)setJc_bottom:(CGFloat)jc_bottom
{
    self.jc_y = jc_bottom - self.jc_height;
}
@end
