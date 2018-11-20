//
//  ViewController.m
//  OC
//
//  Created by Heym on 2018/11/20.
//  Copyright © 2018 HHYYMM. All rights reserved.
//

#import "ViewController.h"
#import "../UIKit-UtilsView/HHRoundCornerImageView.h"
#import "../UIKit-UtilsView/HHRoundCornerImageView+WebCache.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet HHRoundCornerImageView *roundCornerImageView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  

    // Do any additional setup after loading the view, typically from a nib.
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSString *url = @"https://github.com/hhyymm/UI-Demo/blob/master/My_Workspace_Setup.jpg?raw=true";
    [self.roundCornerImageView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"IMG"]];
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"IMG"]];
}

@end
