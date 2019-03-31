# DHMoreApps

## Description

DHMoreApps is an iOS library created to present a view controller inside your application to show your developer page of apps. It is very similar to the App Store visual.

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

Just #import the DHMoreApps.h header, and call the one of the methods described below to present the view controller.

```objective-c
#import <DHMoreApps/DHMoreApps.h>

...

- (IBAction)buttonPressed:(id)sender {

    DHMoreApps *moreAppsManager = [DHMoreApps sharedManager];

    [moreAppsManager presentMoreAppsInViewController:self
                                         developerId:@"916400739" // You can find your developer id in your iTunes link of your apps: https://itunes.apple.com/tz/developer/ho-van-dai/id916400739?mt=8
                                     descriptionType:DHDescriptionTypeScreenshots
                                          completion:nil];

    /* 
    // OR
    [moreAppsManager presentMoreAppsInViewController:self
                                              appIds:@[@"app_id_1", @"app_id_2", ...] // The ids of the apps you want to show
                                     descriptionType:DHDescriptionTypeText
                                          completion:nil];
    */

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
}
```

## Requirements

This library requires iOS 7 and ARC.

## Installation

DHMoreApps is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "DHMoreApps"
```

Or, simply copy all the files into your project.

## Author

DHs, dahasolutions@gmail.com

## License

DHMoreApps is available under the MIT license. See the LICENSE file for more info.
