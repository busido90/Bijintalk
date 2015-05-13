//
//  ConfigViewController.m
//  002_BijinJSQMessageView
//
//  Created by 永山 大志 on 2015/05/11.
//  Copyright (c) 2015年 永山 大志. All rights reserved.
//

#import "ConfigViewController.h"

@interface ConfigViewController ()

@end

@implementation ConfigViewController

@synthesize ConfigScrollView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // Create a UIImage to hold Info.png
    UIImage *image1 = [UIImage imageNamed:@"BijoChange.jpeg"];
    UIImage *image2 = [UIImage imageNamed:@"BijoPicture.jpeg"];
    UIImage *image3 = [UIImage imageNamed:@"BijoConfig.jpeg"];
    
    NSArray *images = [[NSArray alloc] initWithObjects:image1,image2,image3,nil];
    
    ConfigScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,0,self.view.bounds.size.height-200, self.view.bounds.size.width)];
    
    ConfigScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,0,1024,768)];
    
    ConfigScrollView.pagingEnabled = YES;
    
    [ConfigScrollView setIndicatorStyle:UIScrollViewIndicatorStyleWhite];
    
    int numberOfViews = 3;
    for (int i = 0; i < numberOfViews; i++) {
        CGFloat yOrigin = i * 159;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,yOrigin,319,159)];
        [imageView setImage:[images objectAtIndex:i]];
        [ConfigScrollView addSubview:imageView];
    }
    
    ConfigScrollView.contentSize = CGSizeMake(numberOfViews * 319, 159);
    
    [self.view addSubview:ConfigScrollView];

}

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    
//    ConfigScrollView *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
//    
//    
//    [[self navigationController] pushViewController:dvc animated:YES];
//    
//}

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
