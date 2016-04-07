//
//  RuleViewController.m
//  Demo
//
//  Created by 杜晓星 on 15/11/20.
//  Copyright © 2015年 杜晓星. All rights reserved.
//

#import "RuleViewController.h"

#import "RuleTableViewCell.h"

#import "RuleViewControllerHeader.h"

#import "RDVTabBarController.h"

@interface RuleViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *taleView;

@property(nonatomic,strong)NSMutableArray *sourceArray;

@property(nonatomic,assign)NSInteger       mistake;

@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UIImageView *messageBackgroundView;

@end

@implementation RuleViewController

- (instancetype)initWithRuleMin:(CGFloat)min ruleMax:(CGFloat)max delegate:(id)delegate
{
    self = [super init];
    if (self) {
        self.ruleMin = min;
        self.ruleMax = max;
        self.delegate = delegate;
    }
    return self;
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
      [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
    self.messageBackgroundView.image = [UIImage imageNamed:RuleViewControllerSrcName(@"indicator_frame_growth_record_orange_1")];
    // Do any additional setup after loading the view from its nib.
    [self.taleView registerNib:[UINib nibWithNibName:@"RuleTableViewCell" bundle:nil] forCellReuseIdentifier:@"RuleTableViewCell"];
    self.sourceArray = [NSMutableArray array];
    [self configSource];
    
    CGFloat screenHeight = CGRectGetHeight([UIApplication sharedApplication].keyWindow.bounds);
    
    UIEdgeInsets insets = UIEdgeInsetsMake(screenHeight - 229 - 74, 0, 229, 0);
    
    _taleView.contentInset = insets;
    _taleView.contentOffset = CGPointMake(0, -insets.top);
}


- (void)configSource
{
    if (_ruleMin <=0 ) {
        _ruleMin = 0 ;
    }
    if (_ruleMax <= 0) {
        _ruleMax = 0;
    }
    if (_ruleMin >= _ruleMax) {
        _ruleMax = _ruleMin + 10 ;
    }
    _mistake = ((NSInteger)(_ruleMax - _ruleMin)) * 10;
    
    CGFloat kRuleMax = _ruleMax;
    
    for (int i = 0; i <= _mistake; i ++) {
        RuleTableViewCellModel *model = [[RuleTableViewCellModel alloc]init];
        model.rule = kRuleMax ;
        
        kRuleMax -= 0.1;

        [_sourceArray addObject:model];
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _sourceArray.count ;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(RuleTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell configCell:_sourceArray[indexPath.row]];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RuleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RuleTableViewCell"];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat screenHeight = CGRectGetHeight([UIApplication sharedApplication].keyWindow.bounds);
    CGFloat offset =  scrollView.contentOffset.y + (screenHeight - 229 - 74);
    CGFloat rule = _ruleMax - offset*0.1/10;
    
    _messageLabel.text = [NSString stringWithFormat:@"%.2lf",rule];
    
    if ([_delegate respondsToSelector:@selector(ruleDidChange:)]) {
        [_delegate ruleDidChange:rule];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
