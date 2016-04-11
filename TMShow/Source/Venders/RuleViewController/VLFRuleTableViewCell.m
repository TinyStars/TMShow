//
//  VLFRuleTableViewCell.m
//  TMShow
//
//  Created by 杜晓星 on 16/4/7.
//  Copyright © 2016年 杜晓星. All rights reserved.
//

#import "VLFRuleTableViewCell.h"

@implementation VLFRuleTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self buildSubViews];
    }
    return self;
}

- (void)buildSubViews
{
    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
    UIView *ruleBackgroundView = [UIView new];
    [self.contentView addSubview:ruleBackgroundView];
    NSArray *ruleBackgroundViewH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[ruleBackgroundView=(152)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(ruleBackgroundView)];
    NSArray *ruleBackgroundViewV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[ruleBackgroundView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(ruleBackgroundView)];
    [self.contentView addConstraints:@[ruleBackgroundViewH,ruleBackgroundViewV]];
    ruleBackgroundView.backgroundColor = [UIColor whiteColor];
    UILabel *ruleLabel = [UILabel new];
    [ruleBackgroundView addSubview:ruleLabel];
    ruleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    ruleLabel.font = [UIFont systemFontOfSize:12];
    
    NSLayoutConstraint *ruleLabelCenterX = [NSLayoutConstraint constraintWithItem:ruleLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:ruleBackgroundView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    NSLayoutConstraint *ruleLabelCenterY= [NSLayoutConstraint constraintWithItem:ruleLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:ruleBackgroundView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
//    [rule]
    
    
}


@end
