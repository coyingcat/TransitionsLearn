//
//  LYNavBaseVC.m
//  LYCustomTransitionDemo
//
//  Created by liyang on 2017/2/22.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "LYNavBaseVC.h"
#import "LYNavBaseSecondVC.h"


#import "LYNavBaseCustomAnimatorPush.h"
#import "LYNavBaseCustomAnimatorPop.h"

@interface LYNavBaseVC () <UINavigationControllerDelegate>

@property (nonatomic, strong) LYNavBaseCustomAnimatorPush *customAnimatorPush;

@property (nonatomic, strong) LYNavBaseCustomAnimatorPop *customAnimatorPop;

@end

@implementation LYNavBaseVC

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    self.navigationController.delegate = nil;
}
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
    
    //1. 设置代理
    self.navigationController.delegate = self;
    
    //2.push跳转
    LYNavBaseSecondVC *second = [[LYNavBaseSecondVC alloc] init];
    [self.navigationController pushViewController:second animated:YES];
}



#pragma mark - UINavigationControllerDelegate

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC{
    if (operation == UINavigationControllerOperationPush) {
        return self.customAnimatorPush;
        
    }else if (operation == UINavigationControllerOperationPop){
        return self.customAnimatorPop;
    }
    return nil;
}

- (LYNavBaseCustomAnimatorPush *)customAnimatorPush
{
    if (_customAnimatorPush == nil) {
        _customAnimatorPush = [[LYNavBaseCustomAnimatorPush alloc]init];
    }
    return _customAnimatorPush;
}


- (LYNavBaseCustomAnimatorPop *)customAnimatorPop
{
    if (_customAnimatorPop == nil) {
        _customAnimatorPop = [[LYNavBaseCustomAnimatorPop alloc]init];
    }
    return _customAnimatorPop;
}
@end
