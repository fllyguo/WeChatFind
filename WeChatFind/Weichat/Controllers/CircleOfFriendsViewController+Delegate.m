//
//  CircleOfFriendsViewController+Delegate.m
//  WeChatFind
//
//  Created by flyrees on 2018/3/19.
//  Copyright © 2018年 flyrees. All rights reserved.
//

#import "CircleOfFriendsViewController+Delegate.h"

@implementation CircleOfFriendsViewController (Delegate)

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.layoutArr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CircleOfFriendLayout *layout = self.layoutArr[indexPath.row];
    return layout.height;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CircleOfFriendTableViewCell *circleCell = [tableView dequeueReusableCellWithIdentifier:@"circleId"];
    if (!circleCell) {
        circleCell = [[CircleOfFriendTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"circleId"];
    }
    
    circleCell.layout = self.layoutArr[indexPath.row];
    circleCell.delegate = self;
    return circleCell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [JRMenuView dismissAllJRMenu];
}
#pragma mark - ScollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [JRMenuView dismissAllJRMenu];//收回JRMenuView
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    
}
#pragma mark - NewDynamiceCellDelegate
-(void)DynamicsCell:(CircleOfFriendTableViewCell *)cell didClickUser:(NSString *)userId
{
    NSLog(@"点击了用户");
}
-(void)DidClickMoreLessInDynamicsCell:(CircleOfFriendTableViewCell *)cell
{
    NSIndexPath * indexPath = [self.circleOfFriendTab indexPathForCell:cell];
    CircleOfFriendLayout * layout = self.layoutArr[indexPath.row];
    layout.model.isOpening = !layout.model.isOpening;
    [layout resetLayout];
    CGRect cellRect = [self.circleOfFriendTab rectForRowAtIndexPath:indexPath];
    
    [self.circleOfFriendTab reloadData];
    
    if (cellRect.origin.y < self.circleOfFriendTab.contentOffset.y + 64) {
        [self.circleOfFriendTab scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:NO];
    }
}
-(void)DidClickGrayViewInDynamicsCell:(CircleOfFriendTableViewCell *)cell
{
    NSLog(@"点击了灰色区域");
}
-(void)DidClickThunmbInDynamicsCell:(CircleOfFriendTableViewCell *)cell
{
    NSIndexPath * indexPath = [self.circleOfFriendTab indexPathForCell:cell];
    CircleOfFriendLayout * layout = self.layoutArr[indexPath.row];
    CircleOfFriendModel * model = layout.model;
    
    NSMutableDictionary * dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"12345678910",@"userid",@"Andy",@"nick", nil];
    NSMutableArray * newThumbArr = [NSMutableArray arrayWithArray:model.optthumb];
    [newThumbArr addObject:dic];
    model.optthumb = [newThumbArr copy];
    [layout resetLayout];
    [self.circleOfFriendTab reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}
-(void)DidClickCancelThunmbInDynamicsCell:(CircleOfFriendTableViewCell *)cell
{
    NSIndexPath * indexPath = [self.circleOfFriendTab indexPathForCell:cell];
    CircleOfFriendLayout * layout = self.layoutArr[indexPath.row];
    CircleOfFriendModel * model = layout.model;
    
    NSMutableArray * newThumbArr = [NSMutableArray arrayWithArray:model.optthumb];
    WS(weakSelf);
    [newThumbArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSDictionary * thumbDic = obj;
        if ([thumbDic[@"userid"] isEqualToString:@"12345678910"]) {
            [newThumbArr removeObject:obj];
            model.optthumb = [newThumbArr copy];
            [layout resetLayout];
            [weakSelf.circleOfFriendTab reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            *stop = YES;
        }
    }];
}
-(void)DidClickCommentInDynamicsCell:(CircleOfFriendTableViewCell *)cell
{
    
}
-(void)DidClickSpreadInDynamicsCell:(CircleOfFriendTableViewCell *)cell
{
    NSLog(@"点击了推广");
}
- (void)DidClickDeleteInDynamicsCell:(CircleOfFriendTableViewCell *)cell
{
    WS(weakSelf);
    [UIAlertView bk_showAlertViewWithTitle:nil message:@"是否确定删除朋友圈" cancelButtonTitle:@"取消" otherButtonTitles:@[@"确定"] handler:^(UIAlertView *alertView, NSInteger buttonIndex) {
        if (buttonIndex == 1) {
            NSIndexPath * indexPath = [self.circleOfFriendTab indexPathForCell:cell];
            [SVProgressHUD showSuccessWithStatus:@"删除成功!"];
            [weakSelf.circleOfFriendTab beginUpdates];
            [weakSelf.layoutArr removeObjectAtIndex:indexPath.row];
            [weakSelf.circleOfFriendTab deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            [weakSelf.circleOfFriendTab endUpdates];
        }
    }];
}
-(void)DynamicsCell:(CircleOfFriendTableViewCell *)cell didClickUrl:(NSString *)url PhoneNum:(NSString *)phoneNum
{
    if (url) {
        if ([url rangeOfString:@"wemall"].length != 0 || [url rangeOfString:@"t.cn"].length != 0) {
            if (![url hasPrefix:@"http://"]) {
                url = [NSString stringWithFormat:@"http://%@",url];
            }
            NSLog(@"点击了链接:%@",url);
        }else{
            [SVProgressHUD showErrorWithStatus:@"暂不支持打开外部链接"];
        }
    }
    if (phoneNum) {
        NSLog(@"点击了电话:%@",phoneNum);
    }
}
- (void)DidClickChatInDynamicsCell:(CircleOfFriendTableViewCell *)cell {
    NSLog(@"1");
}


- (void)DidClickShareInDynamicsCell:(CircleOfFriendTableViewCell *)cell {
    NSLog(@"1");
}


- (void)DynamicsCell:(CircleOfFriendTableViewCell *)cell didClickComment:(CircleOfFriendCommentItemModel *)commentModel {
    NSLog(@"1");
}


@end
