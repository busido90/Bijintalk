//
//  DefaultViewController.m
//  002_BijinJSQMessageView
//
//  Created by 永山 大志 on 2015/05/12.
//  Copyright (c) 2015年 永山 大志. All rights reserved.
//

#import "DefaultViewController.h"

@interface DefaultViewController ()

@end

@implementation DefaultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *tapView1 = [[UIImageView alloc]init];
    //タップを有効化する。
    tapView1.userInteractionEnabled = YES;
    //タグを設定する。
    tapView1.tag = 1;
    
    UIImageView *tapView2 = [[UIImageView alloc]init];
    //タップを有効化する。
    tapView2.userInteractionEnabled = YES;
    //タグを設定する。
    tapView2.tag = 2;
    
    UIImageView *tapView3 = [[UIImageView alloc]init];
    //タップを有効化する。
    tapView3.userInteractionEnabled = YES;
    //タグを設定する。
    tapView3.tag = 1;
    
    UIImageView *tapView4 = [[UIImageView alloc]init];
    //タップを有効化する。
    tapView4.userInteractionEnabled = YES;
    //タグを設定する。
    tapView4.tag = 4;
    
    UIImageView *tapView5 = [[UIImageView alloc]init];
    //タップを有効化する。
    tapView5.userInteractionEnabled = YES;
    //タグを設定する。
    tapView5.tag = 5;
    
    UIImageView *tapView6 = [[UIImageView alloc]init];
    //タップを有効化する。
    tapView6.userInteractionEnabled = YES;
    //タグを設定する。
    tapView6.tag = 6;
    
    UIImageView *tapView7 = [[UIImageView alloc]init];
    //タップを有効化する。
    tapView7.userInteractionEnabled = YES;
    //タグを設定する。
    tapView7.tag = 7;
    
    UIImageView *tapView8 = [[UIImageView alloc]init];
    //タップを有効化する。
    tapView8.userInteractionEnabled = YES;
    //タグを設定する。
    tapView8.tag = 8;
    
    UIImageView *tapView9 = [[UIImageView alloc]init];
    //タップを有効化する。
    tapView9.userInteractionEnabled = YES;
    //タグを設定する。
    tapView9.tag = 9;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch = [touches anyObject];
    switch (touch.view.tag) {
        case 1:
            // 1のタグがタップされた場合の処理を記述
            break;
        case 2:
            // 2のタグがタップされた場合の処理を記述
            break;
        case 3:
            // 3のタグがタップされた場合の処理を記述
            break;
        default:
            break;
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
