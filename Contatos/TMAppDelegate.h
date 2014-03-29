//
//  TMAppDelegate.h
//  Contatos
//
//  Created by ios4311 on 25/03/14.
//  Copyright (c) 2014 thiagomelo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, atomic) NSMutableArray *contatos;
@property (strong, atomic) NSString *nomeArquivo;

@end
