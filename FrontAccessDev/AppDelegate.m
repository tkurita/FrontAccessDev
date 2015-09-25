//
//  AppDelegate.m
//  FrontAccessDev
//
//  Created by 栗田 哲郎 on 2015/09/24.
//  Copyright (c) 2015年 tkurita. All rights reserved.
//

#import "AppDelegate.h"
#import "TXFrontAccess.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    //NSString *bundleid = @"com.apple.dt.Xcode";
    NSString *bundleid = @"org.gnu.Emacs";
    TXFrontAccess *front_access = [TXFrontAccess frontAccessWithBundleIdentifier:bundleid];
    NSLog(@"is current application %d", [front_access isCurrentApplication]);    
    NSURL *url = [front_access documentURL];
    if (url) {
        NSLog(@"URL : %@", url);
    } else {
        [NSApp presentError:[front_access error]];
    }


}

- (void)applicationWillTerminate:(NSNotification *)aNotification
{
    TXFrontAccess *front_access = [TXFrontAccess frontAccessForFrontmostApp];
    NSLog(@"is current application %d", [front_access isCurrentApplication]);
    NSURL *url = [front_access documentURL];
    if (url) {
        NSLog(@"URL : %@", url);
    } else {
        [NSApp presentError:[front_access error]];
    }
}

@end
