//
//  DescriptionViewController.m
//  002_BijinJSQMessageView
//
//  Created by 永山 大志 on 2015/06/08.
//  Copyright (c) 2015年 永山 大志. All rights reserved.
//

#import "DescriptionViewController.h"

@interface DescriptionViewController ()

@end

@implementation DescriptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //mainscreen
    CGRect screen = [[UIScreen mainScreen] bounds];
    self.view.bounds = screen;
    
    DescriptionTextView = [[UITextView alloc] init];
    DescriptionTextView.frame = CGRectMake(0, self.navigationController.navigationBar.bounds.size.height +20, self.view.bounds.size.width, self.view.bounds.size.height - self.navigationController.navigationBar.bounds.size.height);
    DescriptionTextView.text = @"Bijin Talk は自動応答生成でユーザにリプライを返してくれる雑談対話アプリケーションです。美男・美女・美動物たちがあなたに変身してれます！Docomoの雑談対話APIを使用しています。ユーザの名前を認識する機能は今後搭載予定です。現状はただの雑談をお楽しみください。";
    [DescriptionTextView setFont:[UIFont systemFontOfSize:18]];
    [self.view addSubview:DescriptionTextView];
    
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
