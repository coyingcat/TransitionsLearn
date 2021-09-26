//
//  LYNavBaseCustomAnimator.m
//  LYCustomTransitionDemo
//
//  Created by liyang on 2017/2/22.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "LYNavBaseCustomAnimatorPush.h"

@implementation LYNavBaseCustomAnimatorPush
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.4;
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    //转场过渡的容器view
    UIView *containerView = [transitionContext containerView];
    
    //FromVC
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *fromView = fromViewController.view;
    fromView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    
    //ToVC
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = toViewController.view;
    toView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    

        [containerView addSubview:fromView];
        [containerView addSubview:toView];//push,这里的toView 相当于secondVC的view
        toView.frame = CGRectMake(kScreenWidth, 0, kScreenWidth, kScreenHeight);

    //因为secondVC的view在firstVC的view之上，所以要后添加到containerView中
    
    //动画
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{

            toView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
  
    } completion:^(BOOL finished) {
        BOOL wasCancelled = [transitionContext transitionWasCancelled];
        //设置transitionContext通知系统动画执行完毕
        [transitionContext completeTransition:!wasCancelled];
    }];
}

@end
