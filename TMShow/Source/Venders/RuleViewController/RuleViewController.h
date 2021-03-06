//
//  RuleViewController.h
//  Demo
//
//  Created by 杜晓星 on 15/11/20.
//  Copyright © 2015年 杜晓星. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RuleViewControllerRuleChangeDelegate <NSObject>

@optional

- (void)ruleDidChange:(CGFloat)current;


@end


@interface RuleViewController : UIViewController


@property(nonatomic,assign)id delegate;

@property(nonatomic,assign)CGFloat ruleMin;
@property(nonatomic,assign)CGFloat ruleMax;

- (instancetype)initWithRuleMin:(CGFloat)min ruleMax:(CGFloat)max delegate:(id)delegate;



@end
