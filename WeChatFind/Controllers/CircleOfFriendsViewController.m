//
//  CircleOfFriendsViewController.m
//  WeChatFind
//
//  Created by flyrees on 2018/3/16.
//  Copyright © 2018年 flyrees. All rights reserved.
//

#import "CircleOfFriendsViewController.h"
#import "CircleOfFriendsViewController+Delegate.h"
#import "CircleOfFriendHeaderView.h"

@interface CircleOfFriendsViewController ()
@property (nonatomic, strong)CircleOfFriendHeaderView *headerView;

@end

@implementation CircleOfFriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.circleOfFriendTab];
    [self gainData];
}
- (void)gainData {
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"moment0" ofType:@"plist"];
    NSArray *dataArray = [NSArray arrayWithContentsOfFile:plistPath];
    
    [self.layoutArr removeAllObjects];
    for (id dict in dataArray) {
        CircleOfFriendModel *model = [CircleOfFriendModel modelWithDictionary:dict];
        CircleOfFriendLayout *layout = [[CircleOfFriendLayout alloc] initWithModel:model];
        [self.layoutArr addObject:layout];
    }
    [self.circleOfFriendTab reloadData];
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [JRMenuView dismissAllJRMenu];
}
- (UITableView *)circleOfFriendTab {
    if (!_circleOfFriendTab) {
        _circleOfFriendTab = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
        _circleOfFriendTab.backgroundColor = [UIColor whiteColor];
        _circleOfFriendTab.dataSource = self;
        _circleOfFriendTab.delegate = self;
        _circleOfFriendTab.tableHeaderView = self.headerView;
        _circleOfFriendTab.separatorStyle = UITableViewCellSelectionStyleNone;
    }
    return _circleOfFriendTab;
}
- (CircleOfFriendHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[CircleOfFriendHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 300)];
        [_headerView.iconImg setImage:[UIImage imageNamed:@"pia"]];
        [_headerView.backGroundImg setImage:[UIImage imageNamed:@"mew_baseline"]];
        _headerView.nicknameL.text = @"我叫Flyrees";
    }
    return _headerView;
}
- (NSMutableArray *)layoutArr {
    if (!_layoutArr) {
        _layoutArr = [NSMutableArray array];
    }
    return _layoutArr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
