//
//  ViewController.h
//  BlockDemo
//
//  Created by 胡晓桥 on 15/2/27.
//  Copyright (c) 2015年 Qian100. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  点击按钮的回调
 *
 *  @param selectIndex selectIndex 点击的索引值
 */
typedef void(^DialogViewCompleteHandle)(NSUInteger selectIndex);

@interface ViewController : UIViewController

@property (nonatomic,copy) DialogViewCompleteHandle completeHandle;

- (void)showDialogViewWithHandle:(void (^)(NSUInteger selectIndex)) handler;

@end

