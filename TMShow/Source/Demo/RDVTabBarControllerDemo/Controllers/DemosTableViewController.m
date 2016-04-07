//
//  DemosTableViewController.m
//  TMShow
//
//  Created by 杜晓星 on 16/3/29.
//  Copyright © 2016年 杜晓星. All rights reserved.
//

#import "DemosTableViewController.h"
#import "DemosTableViewCell.h"
#import "UITableView+Extension.h"
#import "RuleViewController.h"


#import "RDVTabBarController.h"

#define kScreenWidth CGRectGetWidth([UIScreen mainScreen].bounds)

@interface DemosTableViewController ()

@property(nonatomic,strong)NSArray *srcArray;

@end

@implementation DemosTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    [self.tableView registerCellWithNib:@"DemosTableViewCell"];
    self.srcArray = @[
                      @"展示直尺功能\n    ControllerName:\n       RuleViewController"
                      ];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _srcArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self stringHeightWithFont:17 totalWidth:(kScreenWidth - 20)  string:_srcArray[indexPath.row]] + (10+10);
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *title = _srcArray[indexPath.row];
    DemosTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DemosTableViewCell" forIndexPath:indexPath];

    cell.msgLabel.text = title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        RuleViewController *ruleVC = [[RuleViewController alloc]initWithRuleMin:10 ruleMax:100 delegate:self];
        [self.navigationController pushViewController:ruleVC animated:YES];
    }
}

- (CGFloat)stringHeightWithFont:(CGFloat)font totalWidth:(CGFloat)w string:(NSString*)string
{
    CGSize resultSize = [self stringSizeWithFont:font totalWidth:w string:string];
    
    return  resultSize.height ;
}

- (CGSize)stringSizeWithFont:(CGFloat)font totalWidth:(CGFloat)w string:(NSString*)string
{
    CGRect rect = [string boundingRectWithSize:CGSizeMake(w, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:font], NSFontAttributeName,nil] context:nil];
    
    CGSize resultSize = CGSizeMake(CGRectGetWidth(rect)+1, CGRectGetHeight(rect)+1);
    
    return  resultSize ;
}


@end
