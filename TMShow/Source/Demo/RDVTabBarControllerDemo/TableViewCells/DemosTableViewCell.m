//
//  DemosTableViewCell.m
//  TMShow
//
//  Created by 杜晓星 on 16/3/29.
//  Copyright © 2016年 杜晓星. All rights reserved.
//

#import "DemosTableViewCell.h"

@implementation DemosTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.msgLabel.numberOfLines = 0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
