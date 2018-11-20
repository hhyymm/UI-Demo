//
//  HHRoundCornerImageView.m
//  Swift
//
//  Created by Heym on 2018/11/20.
//  Copyright © 2018 HHYYMM. All rights reserved.
//

#import "HHRoundCornerImageView.h"

@implementation HHRoundCornerImageView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setup];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    //    self.opaque = YES;
    self.backgroundColor = [UIColor clearColor];
}

- (void)setImage:(UIImage *)image {
    _image = image;
    [self setNeedsDisplay];
}

#pragma mark - draw

- (void)drawRect:(CGRect)rect {
    CGContextRef contex = UIGraphicsGetCurrentContext();
    CGContextClearRect(contex,rect);
    //    CGContextSaveGState(contex);
    
    CGFloat width = CGRectGetWidth(rect);
    CGFloat height = CGRectGetHeight(rect);
    
    
    CGContextScaleCTM(contex, 1, -1);
    CGContextTranslateCTM(contex, 0, -rect.size.height);
    CGContextDrawImage(contex, rect, self.image.CGImage);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(width, height)];
    UIBezierPath *path2 = [path bezierPathByReversingPath];
    
    CGContextSetFillColorWithColor(contex, [UIColor colorWithRed:0 green:0 blue:0 alpha:0.0000].CGColor);
    
    [path2 appendPath:[UIBezierPath bezierPathWithRect:rect]];
    [path2 fillWithBlendMode:kCGBlendModeCopy alpha:1];
    
    [super drawRect:rect];
}

@end
