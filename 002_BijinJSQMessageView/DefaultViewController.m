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
    
    //ステータスバーのサイズ
    float statusHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    
    float navigationBar = self.navigationController.navigationBar.bounds.size.height;
    //ピクチャーのサイズ ※幅の余白は一律10とする
    float picture_size = (self.view.bounds.size.width - 40) / 3;
    //heightの余白
    float height_margin = (statusHeight + navigationBar + (self.view.bounds.size.width / 3 - 10) * 3 ) / 4;
    
    
    //タップを有効化する。
    _User1ImageView.userInteractionEnabled = YES;
    _User1ImageView.frame = CGRectMake(10, statusHeight + navigationBar + height_margin, picture_size, picture_size);
    
    //タップを有効化する。
    _User2ImageView.userInteractionEnabled = YES;
    _User2ImageView.frame = CGRectMake(10 * 2 + picture_size, statusHeight + navigationBar + height_margin, picture_size, picture_size);

    
    //タップを有効化する。
    _User3ImageView.userInteractionEnabled = YES;
    _User3ImageView.frame = CGRectMake(10 * 3 + picture_size * 2, statusHeight + navigationBar + height_margin, picture_size, picture_size);

    
    //タップを有効化する。
    _User4ImageView.userInteractionEnabled = YES;
    _User4ImageView.frame = CGRectMake(10, statusHeight + navigationBar + height_margin * 2 + picture_size, picture_size, picture_size);
    
    //タップを有効化する。
    _User5ImageView.userInteractionEnabled = YES;
    _User5ImageView.frame = CGRectMake(10 * 2 + picture_size, statusHeight + navigationBar + height_margin * 2 + picture_size, picture_size, picture_size);
    
    //タップを有効化する。
    _User6ImageView.userInteractionEnabled = YES;
    _User6ImageView.frame = CGRectMake(10 * 3 + picture_size * 2, statusHeight + navigationBar + height_margin * 2 + picture_size, picture_size, picture_size);
    
    //タップを有効化する。
    _User7ImageView.userInteractionEnabled = YES;
    _User7ImageView.frame = CGRectMake(10, statusHeight + navigationBar + height_margin * 3 + picture_size * 2, picture_size, picture_size);
    
    //タップを有効化する。
    _User8ImageView.userInteractionEnabled = YES;
    _User8ImageView.frame = CGRectMake(10 * 2 + picture_size, statusHeight + navigationBar + height_margin * 3 + picture_size * 2, picture_size, picture_size);
    
    //タップを有効化する。
    _User9ImageView.userInteractionEnabled = YES;
    _User9ImageView.frame = CGRectMake(10 * 3 + picture_size * 2, statusHeight + navigationBar + height_margin * 3 + picture_size * 2, picture_size, picture_size);
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch = [touches anyObject];
    if (touch.view.tag == 1) {
        ViewController *parent = [self.navigationController.viewControllers objectAtIndex:0];
        parent.backgroundImageView.image = [UIImage imageNamed:@"Model1_default.jpg"];
        parent.icon = [UIImage imageNamed:@"Model1_icon.jpeg"];
        [parent viewDidLoad];
        [[self navigationController] popToViewController:parent animated:YES];
    } else if (touch.view.tag == 2) {
        ViewController *parent = [self.navigationController.viewControllers objectAtIndex:0];
        parent.backgroundImageView.image = [UIImage imageNamed:@"Model2_default.jpg"];
        parent.icon = [UIImage imageNamed:@"Model2_icon.jpeg"];
        [parent viewDidLoad];
        [[self navigationController] popToViewController:parent animated:YES];
    } else if (touch.view.tag == 3) {
        ViewController *parent = [self.navigationController.viewControllers objectAtIndex:0];
        parent.backgroundImageView.image = [UIImage imageNamed:@"Model3_default.jpg"];
        parent.icon = [UIImage imageNamed:@"Model3_icon.jpeg"];
        [parent viewDidLoad];
        [[self navigationController] popToViewController:parent animated:YES];
    } else if (touch.view.tag == 4) {
        ViewController *parent = [self.navigationController.viewControllers objectAtIndex:0];
        parent.backgroundImageView.image = [UIImage imageNamed:@"Model4_default.jpg"];
        parent.icon = [UIImage imageNamed:@"Model4_icon.jpeg"];
        [parent viewDidLoad];
        [[self navigationController] popToViewController:parent animated:YES];
    } else if (touch.view.tag == 5) {
        ViewController *parent = [self.navigationController.viewControllers objectAtIndex:0];
        parent.backgroundImageView.image = [UIImage imageNamed:@"Model5_default.jpg"];
        parent.icon = [UIImage imageNamed:@"Model5_icon.jpeg"];
        [parent viewDidLoad];
        [[self navigationController] popToViewController:parent animated:YES];
    } else if (touch.view.tag == 6) {
        ViewController *parent = [self.navigationController.viewControllers objectAtIndex:0];
        parent.backgroundImageView.image = [UIImage imageNamed:@"Model6_default.jpg"];
        parent.icon = [UIImage imageNamed:@"Model6_icon.jpeg"];
        [parent viewDidLoad];
        [[self navigationController] popToViewController:parent animated:YES];
    } else if (touch.view.tag == 7) {
        ViewController *parent = [self.navigationController.viewControllers objectAtIndex:0];
        parent.backgroundImageView.image = [UIImage imageNamed:@"Model7_default.jpg"];
        parent.icon = [UIImage imageNamed:@"Model7_icon.jpeg"];
        [parent viewDidLoad];
        [[self navigationController] popToViewController:parent animated:YES];
    } else if (touch.view.tag == 8) {
        ViewController *parent = [self.navigationController.viewControllers objectAtIndex:0];
        parent.backgroundImageView.image = [UIImage imageNamed:@"Model8_default.jpg"];
        parent.icon = [UIImage imageNamed:@"Model8_icon.jpeg"];
        [parent viewDidLoad];
        [[self navigationController] popToViewController:parent animated:YES];
    } else if (touch.view.tag == 9) {
        ViewController *parent = [self.navigationController.viewControllers objectAtIndex:0];
        parent.backgroundImageView.image = [UIImage imageNamed:@"Model9_default.jpg"];
        parent.icon = [UIImage imageNamed:@"Model9_icon.jpeg"];
        [parent viewDidLoad];
        [[self navigationController] popToViewController:parent animated:YES];
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
