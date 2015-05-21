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

//@synthesize AlarmTimeDatePicker, AlarmTableView, dataTime;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    self.AlarmTableView.dataSource = self;
    self.AlarmTableView.delegate = self;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc]
                                  initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                  target:self
                                  action:@selector(showPicker)];
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:addButton, self.editButtonItem, nil ];
    
    [self createActionSheet];
    
    [self createAlarmTimeDatePicker];
    
    [self createControlToolBar];
    
//    [self setDatatime];
    
    _isVisibleFlag = NO;
    
    //背面に
    [self.view sendSubviewToBack:self.AlarmTableView];
    
    //UserDefaultsから取り出し
    _UserDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [_UserDefaults objectForKey:@"datatime"];
    _objects = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
}

- (void)setAlarm {

    // アプリに登録されている全ての通知を削除
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    
    for (NSString *str in _objects) {
    //文字変換
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm"];
    //タイムゾーンの指定 
    [formatter setTimeZone:[NSTimeZone systemTimeZone]];
    
    NSDate *date = [formatter dateFromString:str];
    
    // インスタンス生成
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    // 通知をする（設定は秒単位）
    notification.fireDate = date;
    // タイムゾーンの設定
    notification.timeZone = [NSTimeZone defaultTimeZone];
    // 通知時に表示させるメッセージ内容
    notification.alertBody = @"メッセージが届いています";
    // 通知に鳴る音の設定
    notification.soundName = UILocalNotificationDefaultSoundName;
    
    // 通知の登録
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    
    // NSLog
    NSLog(@"%d", 1);
    }
}


//- (void)setDatatime{
//    NSDateFormatter *inputDateFormatter = [[NSDateFormatter alloc] init];
//    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ja_JP"];
//    [inputDateFormatter setLocale:locale];
//    [inputDateFormatter setCalendar:[[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian]];
//    [inputDateFormatter setDateFormat:@"H:mm"];
//    NSString *inputDateStr = @"9:00";
//    NSDate *inputDate = [inputDateFormatter dateFromString:inputDateStr];
//    [self setDatatime:inputDate];
//}

- (void)createActionSheet{
    [self.basicSheet setBackgroundColor:[UIColor colorWithWhite:1 alpha:1]];
}

- (void)createAlarmTimeDatePicker{
    [self.AlarmTimeDatePicker setDatePickerMode:UIDatePickerModeTime];
}

- (void)createControlToolBar{
    
//    _controlToolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, _basicSheet.bounds.size.width, 44)];
    [self.controlToolBar setBarStyle:UIBarStyleBlack];
    [self.controlToolBar sizeToFit];
    
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *setButton_1 = [[UIBarButtonItem alloc] initWithTitle:@"設定" style:UIBarButtonItemStyleDone target:self action:@selector(dismissSet)];
    UIBarButtonItem *canselButton = [[UIBarButtonItem alloc] initWithTitle:@"キャンセル" style:UIBarButtonItemStyleDone target:self action:@selector(canselSet)];
    [self.controlToolBar setItems:[NSArray arrayWithObjects:spacer, setButton_1, canselButton, nil] animated:NO];
    
//    [_basicSheet addSubview:_controlToolBar];
    
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
 
    if (self.editing){
        [self.AlarmTableView setEditing:YES animated:YES];
    } else {
        [self.AlarmTableView setEditing:NO animated:YES];
    }
    
    
}

-(void) dismissSet{
    _isVisibleFlag = YES;
    [self showPicker];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"HH:mm";
    self.dataTimeString = [formatter stringFromDate:self.AlarmTimeDatePicker.date];
//    NSLog(@"%@", self.AlarmTimeDatePicker.date);
    self.dateTime = self.AlarmTimeDatePicker.date;
    
    [self insertNewObject];
}

-(void) canselSet{
    _isVisibleFlag = YES;
    [self showPicker];
}

-(void) showPicker {
    
//    [self.view addSubview:self.basicSheet];
    
    if (_isVisibleFlag) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3];
        self.basicSheet.frame = CGRectMake(0, self.view.bounds.size.height, self.AlarmTimeDatePicker.bounds.size.width, self.AlarmTimeDatePicker.bounds.size.height + 44);
        
        [UIView commitAnimations];
        
        _isVisibleFlag = NO;
        
    } else {
        //アニメーションを開始する合図のメソッド
        [UIView beginAnimations:nil context:nil];
        //アニメーションの動く時間を決めている キーボードの再生時間は0.3
        [UIView setAnimationDuration:0.3];
        //変わった後の場所を指定 キーボードの高さは250?
        self.basicSheet.frame = CGRectMake(0, self.view.bounds.size.height - self.AlarmTimeDatePicker.bounds.size.height - 44, self.AlarmTimeDatePicker.bounds.size.width, self.AlarmTimeDatePicker.bounds.size.height + 44);
        //実際に動かしている
        [UIView commitAnimations];
//        NSLog(@"%d", 1);
        //フラグをYESにする
        _isVisibleFlag = YES;
    }
    
}

- (void)insertNewObject {
    
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    
    //_objectsに保存
    [_objects insertObject:self.dataTimeString atIndex:0];
//    NSLog(@"%@", _objects);
    
    //UserDefaultsに保存
    NSData *objectData = [NSKeyedArchiver archivedDataWithRootObject:_objects];
//    NSLog(@"%@", objectData);
    [_UserDefaults setObject:objectData forKey:@"datatime"];
//    NSLog(@"%@", [_UserDefaults objectForKey:@"datatime"]);
    
    //リロード・アニメーション
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.AlarmTableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//    [self.AlarmTableView reloadData];
    
    
    //通知の設定
    [self setAlarm];
//
//    //文字変換
//    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateFormat:@"HH:mm"];
//    //タイムゾーンの指定
//    [formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
//    
//    NSDate *date = [formatter dateFromString:self.dataTimeString];
//    
//    // インスタンス生成
//    UILocalNotification *notification = [[UILocalNotification alloc] init];
//    // 通知をする（設定は秒単位）
//    notification.fireDate = date;
//    // タイムゾーンの設定
//    notification.timeZone = [NSTimeZone defaultTimeZone];
//    // 通知時に表示させるメッセージ内容
//    notification.alertBody = @"メッセージが届いています";
//    // 通知に鳴る音の設定
//    notification.soundName = UILocalNotificationDefaultSoundName;
//    
//    // 通知の登録
//    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    NSDate *object = _objects[indexPath.row];
    
    cell.textLabel.text = [object description];
    cell.textLabel.font = [UIFont systemFontOfSize:40];
    return cell;
}

//- (BOOL) tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
//    return YES;
//}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
//        NSLog(@"%@", indexPath);
        [self.AlarmTableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
    }
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
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
