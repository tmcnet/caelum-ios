//
//  TMContatosNoMapaViewController.m
//  Contatos
//
//  Created by ios4311 on 01/04/14.
//  Copyright (c) 2014 thiagomelo. All rights reserved.
//

#import "TMContatosNoMapaViewController.h"

@interface TMContatosNoMapaViewController ()

@end

@implementation TMContatosNoMapaViewController


- (id)init
{
    self = [super init];
    if (self) {
        UIImage * img = [UIImage imageNamed:@"Mapa-Contatos"];
        UITabBarItem * tabBar = [[UITabBarItem alloc] initWithTitle:@"Mapa" image:img tag:2];
        self.tabBarItem = tabBar;
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
