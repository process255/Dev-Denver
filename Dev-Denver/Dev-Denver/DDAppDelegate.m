#import "DDAppDelegate.h"

@implementation DDAppDelegate

@synthesize window = _window;

// run through some common components and make them look nifty
- (void)customizeChrome {    
    
    // customize nav bar background
    UIImage *navBarImage = [UIImage imageNamed:@"navbar.png"];    
    [[UINavigationBar appearance] setBackgroundImage:navBarImage 
                                       forBarMetrics:UIBarMetricsDefault];
    
    // customize nav bar back button
    UIImage *backButton = [[UIImage imageNamed:@"back-button.png"] 
                           resizableImageWithCapInsets:UIEdgeInsetsMake(0, 14, 0, 4)];    
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButton 
                                                      forState:UIControlStateNormal 
                                                    barMetrics:UIBarMetricsDefault];
    
    // customize tab bar background
    UIImage* tabBarBackground = [UIImage imageNamed:@"tabbar.png"];
    [[UITabBar appearance] setBackgroundImage:tabBarBackground];
    
    // customize tab bar selection item image
    [[UITabBar appearance] setSelectionIndicatorImage:[UIImage imageNamed:@"tabbar-item.png"]];
    
    // customize tab bar item label colors
    // Normal
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       [UIColor colorWithRed:23.0/255.0 green:55.0/255.0 blue:55.0/255.0 alpha:1.0], UITextAttributeTextColor, 
                                                       [UIColor colorWithRed:52.0/255.0 green:132.0/255.0 blue:147.0/255.0 alpha:1.0], UITextAttributeTextShadowColor,
                                                       [NSValue valueWithUIOffset:UIOffsetMake(0, 1)], UITextAttributeTextShadowOffset, nil] 
                                             forState:UIControlStateNormal];
    
    // Selected
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       [UIColor whiteColor], UITextAttributeTextColor,
                                                       [NSValue valueWithUIOffset:UIOffsetMake(0, 0)], UITextAttributeTextShadowOffset, nil] 
                                             forState:UIControlStateSelected];
    
    // grab a reference to the tab bar controller so we can set the images and prevent them
    // from being tinted, this is sort of a lame hack
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    
    // grab a reference to the first view controller inside the tab bar controller
    UINavigationController *navigationController = [[tabBarController viewControllers] objectAtIndex:0];
	
    // setup the speakers tab icon 
    UIImage* speakersIconNormal = [UIImage imageNamed:@"speakers-tab-bar-item.png"];
    UIImage* speakersIconSelected = [UIImage imageNamed:@"speakers-tab-bar-selected-item.png"];
    UITabBarItem *speakersItem = [[UITabBarItem alloc] initWithTitle:@"Speakers" image:speakersIconNormal tag:0];
    [speakersItem setFinishedSelectedImage:speakersIconSelected withFinishedUnselectedImage:speakersIconNormal];    
    [navigationController setTabBarItem:speakersItem];
    
    // setup the sponsors tab icon
    UIImage* sponsorsIconNormal = [UIImage imageNamed:@"sponsors-tab-bar-item.png"];
    UIImage* sponsorsIconSelected = [UIImage imageNamed:@"sponsors-tab-bar-selected-item.png"];
    UITabBarItem *sponsorsItem = [[UITabBarItem alloc] initWithTitle:@"Sponsors" image:sponsorsIconNormal tag:1];
    [sponsorsItem setFinishedSelectedImage:sponsorsIconSelected withFinishedUnselectedImage:sponsorsIconNormal];
    
    UIViewController* sponsorsController = [[tabBarController viewControllers] objectAtIndex:1];
    [sponsorsController setTabBarItem:sponsorsItem];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // set the status bar to black
    [application setStatusBarStyle:UIStatusBarStyleBlackOpaque];
    
    [self customizeChrome];
    
    return YES;
}

@end
