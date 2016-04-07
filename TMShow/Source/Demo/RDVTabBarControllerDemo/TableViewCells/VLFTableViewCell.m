//
//  VLFTableViewCell.m
//  TMShow
//
//  Created by 杜晓星 on 16/4/7.
//  Copyright © 2016年 杜晓星. All rights reserved.
//

#import "VLFTableViewCell.h"

@implementation VLFTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self buildSubViews];
    }
    return self;
}



- (void)buildSubViews
{
    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectZero];
    self.detailLabel = label;
    [self.contentView addSubview:_detailLabel];
    _detailLabel.font = [UIFont systemFontOfSize:17];
    _detailLabel.numberOfLines = 0 ;
    label.translatesAutoresizingMaskIntoConstraints = NO;
    NSArray *vlfH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[label]-10-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(label)];
    NSArray *vlfV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[label]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(label)];
    [self.contentView addConstraints:vlfH];
    [self.contentView addConstraints:vlfV];
    
    
}

@end
