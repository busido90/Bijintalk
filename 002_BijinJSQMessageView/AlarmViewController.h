//
//  AlarmViewController.h
//  002_BijinJSQMessageView
//
//  Created by 永山 大志 on 2015/05/12.
//  Copyright (c) 2015年 永山 大志. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlarmViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    NSMutableArray *_objects;
    BOOL _isVisibleFlag;
}

@property (weak, nonatomic) IBOutlet UITableView *AlarmTableView;
@property (weak, nonatomic) IBOutlet UIView *basicSheet;
@property (weak, nonatomic) IBOutlet UIToolbar *controlToolBar;
@property (weak, nonatomic) IBOutlet UIDatePicker *AlarmTimeDatePicker;
@property (strong, nonatomic) NSString *dataTime;

-(void) showPicker;



@end
