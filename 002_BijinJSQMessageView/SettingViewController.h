//
//  SettingViewController.h
//  002_BijinJSQMessageView
//
//  Created by 永山 大志 on 2015/05/12.
//  Copyright (c) 2015年 永山 大志. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DefaultViewController.h"
#import "PictureViewController.h"
#import "AlarmViewController.h"
#import "DescriptionViewController.h"


@interface SettingViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    NSArray *tableDataList;
}

@property (weak, nonatomic) IBOutlet UITableView *SettingTableView;
@end
