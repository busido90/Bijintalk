//
//  OAuthReqViewController.h
//  DialogueSample
//
//  Created by docomo on 2015/01/27.
//
//

#import <UIKit/UIKit.h>

@interface OAuthReqViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *clientid;
@property (weak, nonatomic) IBOutlet UITextField *secret;
@property (weak, nonatomic) IBOutlet UITextField *scope;
@property (weak, nonatomic) IBOutlet UITextField *redirectUri;
@property (weak, nonatomic) IBOutlet UITextField *accessToken;
@property (weak, nonatomic) IBOutlet UITextField *refreshToken;

@property (weak, nonatomic) IBOutlet UIButton *refreshBtn;

@property(nonatomic,strong) UITapGestureRecognizer *singleTap;

@end