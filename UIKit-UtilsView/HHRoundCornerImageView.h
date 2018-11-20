//
//  HHRoundCornerImageView.h
//  Swift
//
//  Created by Heym on 2018/11/20.
//  Copyright © 2018 HHYYMM. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

IB_DESIGNABLE
@interface HHRoundCornerImageView : UIView
@property (strong, nonatomic) IBInspectable UIImage *image;
@property (assign, nonatomic) CGFloat cornerR;
@end

NS_ASSUME_NONNULL_END
