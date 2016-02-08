//
//  AppDelegate.m
//  MechtaApp
//
//  Created by Artem Demidovich on 2/5/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initDesignScheme];
    
    return YES;
}


-(void) initDesignScheme {
    
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    
    [[UINavigationBar appearance] setBarTintColor: [Constants SYSTEM_COLOR_PURPLE]];
    [UINavigationBar appearance].tintColor = [Constants SYSTEM_COLOR_WHITE];
    [[UINavigationBar appearance] setTranslucent:NO];
    [UIButton appearance].layer.cornerRadius = 2.0f;
    
    
    [[UINavigationBar appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [Constants SYSTEM_COLOR_WHITE], NSForegroundColorAttributeName,
      //[UIFont fontWithName:@"Gill Sans" size:17.0], NSFontAttributeName,
      nil]];
    
    [[UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil] setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[Constants SYSTEM_COLOR_WHITE],
       //NSFontAttributeName: [UIFont fontWithName:@"Gill Sans" size:17.0]
       } forState:UIControlStateNormal];
    
    
    [UITabBar appearance].barTintColor = [Constants SYSTEM_COLOR_PURPLE];
    [UITabBar appearance].tintColor = [UIColor   whiteColor];
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor whiteColor],
        [UIFont fontWithName:@"Gill Sans" size:8.0]: NSFontAttributeName } forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor whiteColor], [UIFont fontWithName:@"Gill Sans" size:8.0]: NSFontAttributeName }
                                             forState:UIControlStateSelected];
    
    
    
    //[[UISearchBar appearance] setBarTintColor: [Constants SYSTEM_COLOR_PURPLE]];
    //[[UIBarButtonItem appearanceWhenContainedIn: [UISearchBar class], nil] setTintColor:[UIColor whiteColor]];
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
