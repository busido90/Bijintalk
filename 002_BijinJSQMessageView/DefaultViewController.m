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
    
    //タップを有効化する。
    _User1ImageView.userInteractionEnabled = YES;
    
    //タップを有効化する。
    _User2ImageView.userInteractionEnabled = YES;
    
    //タップを有効化する。
    _User3ImageView.userInteractionEnabled = YES;
    
    //タップを有効化する。
    _User4ImageView.userInteractionEnabled = YES;
    
    //タップを有効化する。
    _User5ImageView.userInteractionEnabled = YES;
    
    //タップを有効化する。
    _User6ImageView.userInteractionEnabled = YES;
    
    //タップを有効化する。
    _User7ImageView.userInteractionEnabled = YES;
    
    //タップを有効化する。
    _User8ImageView.userInteractionEnabled = YES;
    
    //タップを有効化する。
    _User9ImageView.userInteractionEnabled = YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch = [touches anyObject];
    if (touch.view.tag == 1) {
        ViewController *parent = [self.navigationController.viewControllers objectAtIndex:0];
        parent.backgroundImage = [UIImage imageNamed:@"User1.jpeg"];
        parent.icon = [UIImage imageNamed:@"User1icon.jpeg"];
        [parent viewDidLoad];
        [[self navigationController] popToViewController:parent animated:YES];
    } else if (touch.view.tag == 2) {
        ViewController *parent = [self.navigationController.viewControllers objectAtIndex:0];
        parent.backgroundImage = [UIImage imageNamed:@"User2.jpeg"];
        parent.icon = [UIImage imageNamed:@"User2icon.jpeg"];
        [parent viewDidLoad];
        [[self navigationController] popToViewController:parent animated:YES];
    } else if (touch.view.tag == 3) {
        ViewController *parent = [self.navigationController.viewControllers objectAtIndex:0];
        parent.backgroundImage = [UIImage imageNamed:@"User3.jpg"];
        parent.icon = [UIImage imageNamed:@"User3icon.jpeg"];
        [parent viewDidLoad];
        [[self navigationController] popToViewController:parent animated:YES];
    } else if (touch.view.tag == 4) {
        ViewController *parent = [self.navigationController.viewControllers objectAtIndex:0];
        parent.backgroundImage = [UIImage imageNamed:@"User4.jpg"];
        parent.icon = [UIImage imageNamed:@"User4icon.jpeg"];
        [parent viewDidLoad];
        [[self navigationController] popToViewController:parent animated:YES];
    } else if (touch.view.tag == 5) {
        ViewController *parent = [self.navigationController.viewControllers objectAtIndex:0];
        parent.backgroundImage = [UIImage imageNamed:@"User5.jpg"];
        parent.icon = [UIImage imageNamed:@"User5icon.jpeg"];
        [parent viewDidLoad];
        [[self navigationController] popToViewController:parent animated:YES];
    } else if (touch.view.tag == 6) {
        ViewController *parent = [self.navigationController.viewControllers objectAtIndex:0];
        parent.backgroundImage = [UIImage imageNamed:@"User6.jpg"];
        parent.icon = [UIImage imageNamed:@"User6icon.jpeg"];
        [parent viewDidLoad];
        [[self navigationController] popToViewController:parent animated:YES];
    } else if (touch.view.tag == 7) {
        ViewController *parent = [self.navigationController.viewControllers objectAtIndex:0];
        parent.backgroundImage = [UIImage imageNamed:@"User7.jpg"];
        parent.icon = [UIImage imageNamed:@"User7icon.jpeg"];
        [parent viewDidLoad];
        [[self navigationController] popToViewController:parent animated:YES];
    } else if (touch.view.tag == 8) {
        ViewController *parent = [self.navigationController.viewControllers objectAtIndex:0];
        parent.backgroundImage = [UIImage imageNamed:@"User8.jpg"];
        parent.icon = [UIImage imageNamed:@"User8icon.jpeg"];
        [parent viewDidLoad];
        [[self navigationController] popToViewController:parent animated:YES];
    } else if (touch.view.tag == 9) {
        ViewController *parent = [self.navigationController.viewControllers objectAtIndex:0];
        parent.backgroundImage = [UIImage imageNamed:@"User9.jpg"];
        parent.icon = [UIImage imageNamed:@"User9icon.jpeg"];
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
