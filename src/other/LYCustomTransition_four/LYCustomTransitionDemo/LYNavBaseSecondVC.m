//
//  LYNavBaseSecondVC.m
//  LYCustomTransitionDemo
//
//  Created by liyang on 2017/2/22.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "LYNavBaseSecondVC.h"

#import "LYNavBaseCustomAnimatorPop.h"
@interface LYNavBaseSecondVC ()<UINavigationControllerDelegate>

@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) LYNavBaseCustomAnimatorPop *customAnimatorPop;
@end

@implementation LYNavBaseSecondVC
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"BaseSecond";
    self.view.backgroundColor = [UIColor blackColor];
    self.view.layer.masksToBounds = YES;
    UIImage *image = [UIImage imageNamed:@"Base"];
    CGSize size = [self backImageSize:image];
    _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, (kScreenHeight - size.height) * 0.5, size.width, size.height)];
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
    
    //1. 设置代理
    self.navigationController.delegate = self;
    
    //2.push跳转
    LYNavBaseSecondVC *second = [[LYNavBaseSecondVC alloc] init];
    [self.navigationController pushViewController:second animated:YES];
}

- (LYNavBaseCustomAnimatorPop *)customAnimatorPop
{
    if (_customAnimatorPop == nil) {
        _customAnimatorPop = [[LYNavBaseCustomAnimatorPop alloc]init];
    }
    return _customAnimatorPop;
}




#pragma mark - UINavigationControllerDelegate

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC{
    if (operation == UINavigationControllerOperationPush) {
        
        
        NSLog(@" 111 ");
        
    }else if (operation == UINavigationControllerOperationPop){
        NSLog(@" 222 ");
        
    }else if (operation == UINavigationControllerOperationNone){
        NSLog(@" 333 ");
        return self.customAnimatorPop;
    }
    return nil;
}

@end
