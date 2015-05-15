//
//  AlarmViewController.m
//  002_BijinJSQMessageView
//
//  Created by 永山 大志 on 2015/05/12.
//  Copyright (c) 2015年 永山 大志. All rights reserved.
//

#import "AlarmViewController.h"

@interface AlarmViewController ()

@end

@implementation AlarmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.AlarmTableView.dataSource = self;
    self.AlarmTableView.delegate = self;
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc]
                                  initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                  target:self
                                  action:@selector(showPicker)];
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:addButton, self.editButtonItem, nil ];
    
    _isVisibleFlag = NO;
}

- (void)insertNewObject:(id)sender {
    
    [self showPicker];
    
    
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.AlarmTableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

-(void) showPicker{
    
    if (_isVisibleFlag) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3];
        self.AlarmTimeDatePicker.frame = CGRectMake(0, self.view.bounds.size.height, self.AlarmTimeDatePicker.bounds.size.width, self.AlarmTimeDatePicker.bounds.size.height);
        
        [UIView commitAnimations];
        
        _isVisibleFlag = NO;
        
    } else {
        //アニメーションを開始する合図のメソッド
        [UIView beginAnimations:nil context:nil];
        //アニメーションの動く時間を決めている キーボードの再生時間は0.3
        [UIView setAnimationDuration:0.3];
        //変わった後の場所を指定 キーボードの高さは250?
        self.AlarmTimeDatePicker.frame = CGRectMake(0, self.view.bounds.size.height- self.AlarmTimeDatePicker.bounds.size.height, self.AlarmTimeDatePicker.bounds.size.width, self.AlarmTimeDatePicker.bounds.size.height);
        //実際に動かしている
        [UIView commitAnimations];
        
        //フラグをYESにする
        _isVisibleFlag = YES;
    }
    
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

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
