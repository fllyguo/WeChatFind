//
//  ManageFindViewController.m
//  WeChatFind
//
//  Created by flyrees on 2018/2/26.
//  Copyright © 2018年 flyrees. All rights reserved.
//

#import "ManageFindViewController.h"
#import "FindTableViewCell.h"

@interface ManageFindViewController ()<UITableViewDelegate,UITableViewDataSource,selectCloseDelegate>
@property (nonatomic, strong)UITableView *manageTab;
@property (nonatomic, strong)UIView *headerV;

@end

@implementation ManageFindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"管理发现页";
    [self.view addSubview:self.manageTab];
}
- (UITableView *)manageTab {
    if (!_manageTab) {
        _manageTab = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _manageTab.translatesAutoresizingMaskIntoConstraints = NO;
        _manageTab.backgroundColor = [UIColor colorWithWhite:0 alpha:0.05];
        _manageTab.separatorStyle = UITableViewCellSelectionStyleNone;
        _manageTab.tableHeaderView = self.headerV;
        _manageTab.delegate = self;
        _manageTab.dataSource = self;
        _manageTab.rowHeight = 50;
    }
    return _manageTab;
}
#pragma mark --- tableView delegate
- (UIView *)headerV {
    if (!_headerV) {
        _headerV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 30)];
        UILabel *headerL = [[UILabel alloc] initWithFrame:_headerV.bounds];
        headerL.backgroundColor = [UIColor clearColor];
        headerL.text = @"打开/关闭发现页的入口";
        headerL.textAlignment = NSTextAlignmentCenter;
        headerL.font = [UIFont systemFontOfSize:15.];
        headerL.textColor = [UIColor blackColor];
        [_headerV addSubview:headerL];
    }
    return _headerV;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.manageArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary *dic = self.manageArray[section];
    NSArray *arr = [dic objectForKey:@"include"];
    return arr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FindTableViewCell *manageCell = [tableView dequeueReusableCellWithIdentifier:@"manageId"];
    if (!manageCell) {
        manageCell = [[FindTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"manageId"];
    }
    manageCell.arrow = @"2";
    NSDictionary *dic = self.manageArray[indexPath.section];
    NSArray *arr = [dic objectForKey:@"include"];
    manageCell.infoDic = arr[indexPath.row];
    manageCell.delegate = self;
    return manageCell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
- (void)selectCloseSwitch:(UISwitch *)switchSender {
    NSString *idStr = [NSString stringWithFormat:@"%ld",switchSender.tag];
    if (switchSender.isOn == YES) {
        for (int i = 0; i < self.manageArray.count; i++) {
            NSDictionary *dic = self.manageArray[i];
            NSMutableArray *arr = dic[@"include"];
            for (int j = 0; j < arr.count; j++) {
                if ([arr[j][@"findId"] isEqualToString:idStr]) {
                    arr[j][@"findId"] = [idStr substringToIndex:idStr.length - 3];
                }
            }
        }
        //关闭菜单，返回发现页关闭发现页入口
        if ([self.delegate respondsToSelector:@selector(updateFindArray:)]) {
            [self.delegate updateFindArray:self.manageArray];
        }
    }else{
        for (int i = 0; i < self.manageArray.count; i++) {
            NSDictionary *dic = self.manageArray[i];
            NSMutableArray *arr = dic[@"include"];
            for (int j = 0; j < arr.count; j++) {
                if ([arr[j][@"findId"] isEqualToString:idStr]) {
                    arr[j][@"findId"] = [NSString stringWithFormat:@"%@888",idStr];
                }
            }
        }
        //关闭菜单，返回发现页关闭发现页入口
        if ([self.delegate respondsToSelector:@selector(updateFindArray:)]) {
            [self.delegate updateFindArray:self.manageArray];
        }
    }
    [_manageTab reloadData];
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
