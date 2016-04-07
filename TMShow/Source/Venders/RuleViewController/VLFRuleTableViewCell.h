//
//  VLFRuleTableViewCell.h
//  TMShow
//
//  Created by 杜晓星 on 16/4/7.
//  Copyright © 2016年 杜晓星. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VLFRuleTableViewCell : UITableViewCell

@property(nonatomic,assign)NSInteger ruleTableViewCellState;

@property(nonatomic,strong)UILabel *ruleLabel;

@property(nonatomic,strong)UIImageView *cellNormalState;


@end
