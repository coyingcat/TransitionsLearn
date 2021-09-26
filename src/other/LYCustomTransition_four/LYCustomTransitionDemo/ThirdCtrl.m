//
//  ThirdCtrl.m
//  LYCustomTransitionDemo
//
//  Created by Jz D on 2021/9/26.
//  Copyright © 2021 liyang. All rights reserved.
//

#import "ThirdCtrl.h"

@interface ThirdCtrl ()

@end

@implementation ThirdCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Xxx";
    self.view.backgroundColor = UIColor.magentaColor;
    
    self.view.userInteractionEnabled = YES;

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(popX)];
    [self.view addGestureRecognizer:tap];
}



- (void)popX{
    [self.navigationController popViewControllerAnimated: YES];
}
@end
