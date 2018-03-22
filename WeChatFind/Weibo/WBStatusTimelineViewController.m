//
//  WBStatusTimelineViewController.m
//  WeChatFind
//
//  Created by flyrees on 2018/3/21.
//  Copyright © 2018年 flyrees. All rights reserved.
//

#import "WBStatusTimelineViewController.h"
#import "WBStatusTimelineTableViewCell.h"
#import "WBStatusModel.h"
#import "WBStatusLayout.h"

@interface WBStatusTimelineViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *wbTableView;
@property (nonatomic, strong)NSMutableArray *wbLayoutArr;

@end

@implementation WBStatusTimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.wbTableView];
    [self getInfoData];
}
- (void)getInfoData {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *jsonData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"weibo_0" ofType:@"json"]];
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
        for (NSDictionary *dic in dict[@"statuses"]) {
            // 数据
            WBStatusModel *model = [[WBStatusModel alloc] init];
            [model setValuesForKeysWithDictionary:dic];
            // 布局
            WBStatusLayout *layout = [[WBStatusLayout alloc] initWithStatusModel:model];
            [self.wbLayoutArr addObject:layout];
            
            [self.wbTableView reloadData];
        }
    });
}
- (UITableView *)wbTableView {
    if (!_wbTableView) {
        _wbTableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
        _wbTableView.backgroundColor = [UIColor whiteColor];
        _wbTableView.delegate = self;
        _wbTableView.dataSource = self;
    }
    return _wbTableView;
}
#pragma mark --- tableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.wbLayoutArr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    WBStatusLayout *layout = self.wbLayoutArr[indexPath.row];
    return layout.height;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellId = @"cellId";
    WBStatusTimelineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[WBStatusTimelineTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    if (indexPath.row % 2 == 0) {
        cell.backgroundColor = [UIColor brownColor];
    }else{
        cell.backgroundColor = [UIColor purpleColor];
    }
    [cell setLayout:self.wbLayoutArr[indexPath.row]];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (NSMutableArray *)wbLayoutArr {
    if (!_wbLayoutArr) {
        _wbLayoutArr = [NSMutableArray array];
    }
    return _wbLayoutArr;
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
