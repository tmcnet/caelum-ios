//
//  TMAppDelegate.m
//  Contatos
//
//  Created by ios4311 on 25/03/14.
//  Copyright (c) 2014 thiagomelo. All rights reserved.
//

#import "TMAppDelegate.h"
#import "TMFormularioContatoViewController.h"
#import "TMListaContatoViewController.h"

@implementation TMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSArray * docDirs = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * docDir = docDirs[0];
    self.nomeArquivo = [NSString stringWithFormat:@"%@/Contatos", docDir];
    
    self.contatos = [NSKeyedUnarchiver unarchiveObjectWithFile:self.nomeArquivo];
    
    if(!self.contatos){
        self.contatos = [[NSMutableArray alloc] init];
    }
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
//    TMFormularioContatoViewController  *form = [[TMFormularioContatoViewController alloc]init];
    
    TMListaContatoViewController *listaContato = [[TMListaContatoViewController alloc] init];
    listaContato.contatos = self.contatos;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:listaContato];
    UITabBarController *tabs = [[UITabBarController alloc] init];
    TMContatosNoMapaViewController *mapa = [[TMContatosNoMapaViewController alloc] init];
    tabs.viewControllers = @[nav, mapa];
    self.window.rootViewController = tabs;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    
    [NSKeyedArchiver archiveRootObject:self.contatos toFile:self.nomeArquivo];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
