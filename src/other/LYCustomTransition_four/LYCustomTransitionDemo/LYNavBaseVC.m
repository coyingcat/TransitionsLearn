//
//  LYNavBaseVC.m
//  LYCustomTransitionDemo
//
//  Created by liyang on 2017/2/22.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "LYNavBaseVC.h"
#import "LYNavBaseSecondVC.h"



@interface LYNavBaseVC () 

@end

@implementation LYNavBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Base";
    self.view.backgroundColor = bgColor;
    self.view.layer.masksToBounds = YES;
    
    UIImageView * _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 120, 120)];
    _imgView.center = self.view.center;
    _imgView.image = [UIImage imageNamed:@"Base"];
    _imgView.userInteractionEnabled = YES;
    [self.view addSubview:_imgView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushSecond)];
    [_imgView addGestureRecognizer:tap];
}

- (void)pushSecond{

    //2.push跳转
    LYNavBaseSecondVC *second = [[LYNavBaseSecondVC alloc] init];
    [self.navigationController pushViewController:second animated:YES];
}



@end
