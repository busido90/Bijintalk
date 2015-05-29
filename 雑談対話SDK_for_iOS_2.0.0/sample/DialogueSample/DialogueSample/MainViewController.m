//
//  MainViewController.h
//  CharacterRecognitionSample
//  (c) 2014 NTT DOCOMO, INC. All Rights Reserved.
//

#import "MainViewController.h"
#import "AuthApiKey.h"

@interface MainViewController ()

@end

// APIKEY
NSString * const APIKEY = @"";

@implementation MainViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // APIKEY の設定
    [AuthApiKey initializeAuth:APIKEY];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end