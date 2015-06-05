//
//  SettingViewController.m
//  002_BijinJSQMessageView
//
//  Created by 永山 大志 on 2015/05/12.
//  Copyright (c) 2015年 永山 大志. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.SettingTableView.dataSource = self;
    self.SettingTableView.delegate = self;
    
    NSDictionary *cell0 = @{@"title":@"会話相手を変える"};
//    NSDictionary *cell1 = @{@"title":@"カスタム"};
//    NSDictionary *cell2 = @{@"title":@"連絡を定期的的にもらう"};
    
    NSDictionary *section1 = @{@"header":@"会話相手変更", @"data":@[cell0]};
//    NSDictionary *section1 = @{@"header":@"会話相手変更", @"data":@[cell0, cell1]};
//    NSDictionary *section2 = @{@"header":@"コール", @"data":@[cell2]};
    
//    tableDataList = @[section1, section2];
    tableDataList = @[section1];

    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return tableDataList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary *theSection = tableDataList[section];
    NSArray *theData = theSection[@"data"];
    return theData.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSDictionary *theSection = tableDataList[section];
    return theSection[@"header"];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //再利用している(２回目以降で使用)
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell == nil) {
        //見た目をセット
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    NSDictionary *theSection = tableDataList[indexPath.section];
    
    NSArray *theData = theSection[@"data"];
    
    NSDictionary *theCell = theData[indexPath.row];
    
    cell.textLabel.text = theCell[@"title"];
    
    NSLog(@"%ld%ld", (long)indexPath.section, (long)indexPath.row);
    
    return cell;
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([[segue identifier] isEqualToString:@"DefaultViewController"]) {
//        NSIndexPath *indexPath = [self.SettingTableView indexPathForSelectedRow];
////        NSDictionary *theSection = tableDataList[indexPath.section];
////        NSArray *theData = theSection[@"data"];
////        NSDictionary *theCell = theData[indexPath.row];
//        
//    }
//}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        DefaultViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"DefaultViewController"];
        [[self navigationController] pushViewController:dvc animated:YES];

    } else if (indexPath.section == 0 && indexPath.row == 1) {
    } else if (indexPath.section == 1 && indexPath.row == 0) {
//        DefaultViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"AlarmViewController"];
//        [[self navigationController] pushViewController:dvc animated:YES];
    } else {
        
    }
    
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
