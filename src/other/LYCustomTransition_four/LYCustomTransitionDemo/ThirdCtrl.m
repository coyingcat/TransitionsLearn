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
    
    
    
    self.view.layer.masksToBounds = YES;
    UIImage *image = [UIImage imageNamed:@"Base"];
    CGSize size = [self backImageSize:image];
    UIImageView * _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, (kScreenHeight - size.height) * 0.5, size.width, size.height)];
    _imgView.image = image;
    _imgView.userInteractionEnabled = YES;
    [self.view addSubview:_imgView];
    
    _imgView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(popX)];
    [_imgView addGestureRecognizer:tap];
}


- (CGSize)backImageSize:(UIImage *)image{
    
    CGSize size = image.size;
    CGSize newSize;
    newSize.width = kScreenWidth;
    newSize.height = newSize.width / size.width * size.height;
    
    return newSize;
}


- (void)popX{
    [self.navigationController popViewControllerAnimated: YES];
}
@end
