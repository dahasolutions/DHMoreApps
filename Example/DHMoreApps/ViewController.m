//
//  DHViewController.m
//  DHMoreApps
//

#import "ViewController.h"
#import <DHMoreApps/DHMoreApps.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)buttonPressed:(id)sender {
    
    DHMoreApps *moreAppsManager = [DHMoreApps sharedManager];
    moreAppsManager.closeButtonTitle = @"Hủy";
    
    moreAppsManager.showActionButton = NO;
    moreAppsManager.showPrice = NO;
    moreAppsManager.title = NSLocalizedString(@"More apps", nil);
    
    moreAppsManager.willDismissBlock = ^{
        NSLog(@"will dismiss more apps view controller");
    };
    
    moreAppsManager.didDismissBlock = ^{
        NSLog(@"did dismiss more apps view controller");
    };
    
    moreAppsManager.didSelectAppBlock = ^(NSString *appId){
        NSLog(@"did select app id: %@", appId);
    };
    [moreAppsManager presentMoreAppsInViewController:self
                                         developerId:@"916400739"
                                     descriptionType:DHDescriptionTypeScreenshots
                                          completion:nil];
}

@end
