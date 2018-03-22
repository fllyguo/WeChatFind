//
//  ViewController.m
//  WeChatFind
//
//  Created by flyrees on 2018/2/26.
//  Copyright © 2018年 flyrees. All rights reserved.
//

#import "ViewController.h"
#import "ManageFindViewController.h"
#import "FindTableViewCell.h"
#import "FSCustomButton.h"
#import "CircleOfFriendsViewController.h"
#import "WBStatusTimelineViewController.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,updateFindDelegate>
@property (nonatomic, strong)UITableView *findTab;
@property (nonatomic, strong)FSCustomButton *fsBut;

@property (nonatomic, strong)NSMutableArray *findInfoArray;//最初始数据
@property (nonatomic, strong)NSMutableArray *atInfoArr;//重新更新数据
@property (nonatomic, strong)NSMutableArray *dataArr;//当前页展示使用

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"发现";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"管理发现页" style:UIBarButtonItemStylePlain target:self action:@selector(manageClick:)];
    [self.view addSubview:self.findTab];
    [self.view addSubview:self.fsBut];
    
    [self findInfo];
}
- (FSCustomButton *)fsBut {
    if (!_fsBut) {
        _fsBut = [[FSCustomButton alloc] initWithFrame:CGRectMake(0, 0, 70, 20)];
        [_fsBut setCenter:CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height - 70)];
        _fsBut.buttonImagePosition = FSCustomButtonImagePositionRight;
        [_fsBut setTitle:@"前往设置" forState:UIControlStateNormal];
        [_fsBut setImage:[UIImage imageNamed:@"go"] forState:UIControlStateNormal];
        _fsBut.titleLabel.font = [UIFont systemFontOfSize:14.];
        [_fsBut setTitleColor:[UIColor colorWithWhite:0 alpha:0.5] forState:UIControlStateNormal];
        [_fsBut addTarget:self action:@selector(fsAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _fsBut;
}
/**
 * tableView
 */
- (UITableView *)findTab {
    if (!_findTab) {
        _findTab = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _findTab.separatorStyle = UITableViewCellSelectionStyleNone;
        _findTab.delegate = self;
        _findTab.dataSource = self;
    }
    return _findTab;
}
/**
 * tableView delegate
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (_dataArr.count == 0) {
        _fsBut.hidden = NO;
    }else{
        _fsBut.hidden = YES;
    }
    return _dataArr.count;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerV = [[UIView alloc] init];
    headerV.backgroundColor = [UIColor colorWithWhite:0 alpha:0.05];
    return headerV;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary *dic = _dataArr[section];
    NSArray *arr = [dic objectForKey:@"include"];
    return arr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FindTableViewCell *findCell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if (!findCell) {
        findCell = [[FindTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
    }
    findCell.arrow = @"1";
    NSDictionary *dic = _dataArr[indexPath.section];
    NSArray *arr = [dic objectForKey:@"include"];
    findCell.infoDic = arr[indexPath.row];
    return findCell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary *dic = _dataArr[indexPath.section];
    NSArray *arr = dic[@"include"];
    NSDictionary *dict = arr[indexPath.row];
    if ([dict[@"findId"] isEqualToString:@"1"]) {
        CircleOfFriendsViewController *circleVc = [[CircleOfFriendsViewController alloc] init];
        circleVc.title = @"朋友圈";
        [self.navigationController pushViewController:circleVc animated:YES];
    }else if ([dict[@"findId"] isEqualToString:@"11"]){
        WBStatusTimelineViewController *wbVc = [[WBStatusTimelineViewController alloc] init];
        wbVc.title = @"微博";
        [self.navigationController pushViewController:wbVc animated:YES];
    }
}
- (void)findInfo {
    NSMutableDictionary *dic0 = [NSMutableDictionary dictionary];
    [dic0 setObject:@"Weibo" forKey:@"icon"];
    [dic0 setObject:@"微博" forKey:@"title"];
    [dic0 setObject:@"11" forKey:@"findId"];
    
    NSMutableDictionary *dic1 = [NSMutableDictionary dictionary];
    [dic1 setObject:@"ff_IconShowAlbum" forKey:@"icon"];
    [dic1 setObject:@"朋友圈" forKey:@"title"];
    [dic1 setObject:@"1" forKey:@"findId"];
    
    NSMutableDictionary *dic2 = [NSMutableDictionary dictionary];
    [dic2 setObject:@"ff_IconQRCode" forKey:@"icon"];
    [dic2 setObject:@"扫一扫" forKey:@"title"];
    [dic2 setObject:@"2" forKey:@"findId"];
    
    NSMutableDictionary *dic3 = [NSMutableDictionary dictionary];
    [dic3 setObject:@"ff_IconShake" forKey:@"icon"];
    [dic3 setObject:@"摇一摇" forKey:@"title"];
    [dic3 setObject:@"3" forKey:@"findId"];
    
    NSMutableDictionary *dic4 = [NSMutableDictionary dictionary];
    [dic4 setObject:@"MoreMyAlbum" forKey:@"icon"];
    [dic4 setObject:@"看一看" forKey:@"title"];
    [dic4 setObject:@"4" forKey:@"findId"];
    
    NSMutableDictionary *dic5 = [NSMutableDictionary dictionary];
    [dic5 setObject:@"MoreMyBankCard" forKey:@"icon"];
    [dic5 setObject:@"搜一搜" forKey:@"title"];
    [dic5 setObject:@"5" forKey:@"findId"];
    
    NSMutableDictionary *dic6 = [NSMutableDictionary dictionary];
    [dic6 setObject:@"ff_IconLocationService" forKey:@"icon"];
    [dic6 setObject:@"附近的人" forKey:@"title"];
    [dic6 setObject:@"6" forKey:@"findId"];
    
    NSMutableDictionary *dic7 = [NSMutableDictionary dictionary];
    [dic7 setObject:@"MoreMyFavorites" forKey:@"icon"];
    [dic7 setObject:@"漂流瓶" forKey:@"title"];
    [dic7 setObject:@"7" forKey:@"findId"];
    
    NSMutableDictionary *dic8 = [NSMutableDictionary dictionary];
    [dic8 setObject:@"ff_IconShoppingBag" forKey:@"icon"];
    [dic8 setObject:@"购物" forKey:@"title"];
    [dic8 setObject:@"8" forKey:@"findId"];
    
    NSMutableDictionary *dic9 = [NSMutableDictionary dictionary];
    [dic9 setObject:@"MoreGame" forKey:@"icon"];
    [dic9 setObject:@"游戏" forKey:@"title"];
    [dic9 setObject:@"9" forKey:@"findId"];
    
    NSMutableDictionary *dic10 = [NSMutableDictionary dictionary];
    [dic10 setObject:@"MoreSetting" forKey:@"icon"];
    [dic10 setObject:@"小程序" forKey:@"title"];
    [dic10 setObject:@"10" forKey:@"findId"];
    
    _findInfoArray = [NSMutableArray arrayWithObjects:
//                     @{@"section":@"G", @"include":[NSMutableArray arrayWithObjects:dic0, nil]},
                     @{@"section":@"A", @"include":[NSMutableArray arrayWithObjects:dic1, nil]},
                     @{@"section":@"B", @"include":[NSMutableArray arrayWithObjects:dic2, dic3, nil]},
                     @{@"section":@"C", @"include":[NSMutableArray arrayWithObjects:dic4, nil]},
                     @{@"section":@"D", @"include":[NSMutableArray arrayWithObjects:dic5, dic6, dic7, nil]},
                     @{@"section":@"E", @"include":[NSMutableArray arrayWithObjects:dic8, dic9, nil]},
                     @{@"section":@"F", @"include":[NSMutableArray arrayWithObjects:dic10, nil]},
                      nil];
    self.dataArr = [_findInfoArray copy];
}
/**
 * 发现页管理
 */
- (void)manageClick:(UIBarButtonItem *)item {
    [self pushManage];
}
/**
 * 前往设置
 */
- (void)fsAction {
    [self pushManage];
}
- (void)pushManage {
    ManageFindViewController *manageVc = [[ManageFindViewController alloc] init];
    manageVc.manageArray = self.findInfoArray;
    manageVc.delegate = self;
    [self.navigationController pushViewController:manageVc animated:YES];
}
- (void)updateFindArray:(NSMutableArray *)dataArray {
    
    if (self.atInfoArr.count != 0) {
        [self.atInfoArr removeAllObjects];
    }
    
    for (int i = 0; i < dataArray.count; i++) {
        NSMutableDictionary *inDic = [NSMutableDictionary dictionary];
        NSDictionary *dic = dataArray[i];
        NSMutableArray *array = [NSMutableArray array];
        NSMutableArray *arr = dic[@"include"];
        for (int j = 0; j < arr.count; j++) {
            NSString *idStr = arr[j][@"findId"];
            if (idStr.length <= 2) {
                [array addObject:arr[j]];
            }
            if (array.count != 0) {
                [inDic setObject:array forKey:@"include"];
                [inDic setObject:@"" forKey:@"section"];
            }
        }
        if (inDic.count != 0) {
            [self.atInfoArr addObject:inDic];
        }
    }
    
    self.dataArr = [self.atInfoArr copy];
    [self.findTab reloadData];
    NSLog(@"===%ld", self.dataArr.count);
}
- (NSMutableArray *)atInfoArr {
    if (!_atInfoArr) {
        _atInfoArr = [NSMutableArray array];
    }
    return _atInfoArr;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
