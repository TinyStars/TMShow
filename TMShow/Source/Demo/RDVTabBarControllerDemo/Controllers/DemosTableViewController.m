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


@interface DemosTableViewController ()

@property(nonatomic,strong)NSArray *srcArray;

@end

@implementation DemosTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerCellWithNib:@"DemosTableViewCell"];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.srcArray = @[@"警告：不要调用table view的dequeueReusableCellWithIdentifier:方法，因为这会导致cell被创建了但是又未曾被tableView:cellForRowAtIndexPath:方法返回，会造成内存泄露！",
                      @"警告：不要调用table view的dequeueReusableCellWithIdentifier:方法，因为这会导致cell被创建了但是又未曾被tableView:cellForRowAtIndexPath:方法返回，会造成内存泄露！"];
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
    
    
    // 判断indexPath对应cell的重用标示符，
//    NSString *reuseIdentifier = @"DemosTableViewCell";
    
    // 从cell字典中取出重用标示符对应的cell。如果没有，就创建一个新的然后存储在字典里面。
    // 警告：不要调用table view的dequeueReusableCellWithIdentifier:方法，因为这会导致cell被创建了但是又未曾被tableView:cellForRowAtIndexPath:方法返回，会造成内存泄露！
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DemosTableViewCell"];
    [cell setNeedsUpdateConstraints];
    
    [cell updateConstraintsIfNeeded];
    
    
    
    CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    
    return height;
    // 用indexPath对应的数据内容来配置cell，例如：
    // cell.textLabel.text = someTextForThisCell;
    // ...
    
    // 确保cell的布局约束被设置好了，因为它可能刚刚才被创建好。
    // 使用下面两行代码，前提是假设你已经在cell的updateConstraints方法中设置好了约束：
//    [cell setNeedsUpdateConstraints];
//    [cell updateConstraintsIfNeeded];
    
    // 将cell的宽度设置为和tableView的宽度一样宽。
    // 这点很重要。
    // 如果cell的高度取决于table view的宽度（例如，多行的UILabel通过单词换行等方式），
    // 那么这使得对于不同宽度的table view，我们都可以基于其宽度而得到cell的正确高度。
    // 但是，我们不需要在-[tableView:cellForRowAtIndexPath]方法中做相同的处理，
    // 因为，cell被用到table view中时，这是自动完成的。
    // 也要注意，一些情况下，cell的最终宽度可能不等于table view的宽度。
    // 例如当table view的右边显示了section index的时候，必须要减去这个宽度。
//    cell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), CGRectGetHeight(cell.bounds));
    
    // 触发cell的布局过程，会基于布局约束计算所有视图的frame。
    // （注意，你必须要在cell的-[layoutSubviews]方法中给多行的UILabel设置好preferredMaxLayoutWidth值；
    // 或者在下面2行代码前手动设置！）
//    [cell setNeedsLayout];
//    [cell layoutIfNeeded];
    
    // 得到cell的contentView需要的真实高度
//    CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
//    
//    // 要为cell的分割线加上额外的1pt高度。因为分隔线是被加在cell底边和contentView底边之间的。
//    height += 1.0f;
//    
//    return height;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DemosTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DemosTableViewCell" forIndexPath:indexPath];
    NSString *title = _srcArray[indexPath.row];
    cell.msgLabel.text = title;
    
    [cell updateConstraintsIfNeeded];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
