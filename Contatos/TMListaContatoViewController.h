//
//  TMListaContatoViewController.h
//  Contatos
//
//  Created by ios4311 on 27/03/14.
//  Copyright (c) 2014 thiagomelo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMContato.h"
#import "TMFormularioContatoViewControllerDelegate.h"
#import <MessageUI/MessageUI.h>

@interface TMListaContatoViewController : UITableViewController <TMFormularioContatoViewControllerDelegate, UIActionSheetDelegate, MFMailComposeViewControllerDelegate>

@property (weak, atomic) NSMutableArray * contatos;
@property (assign, atomic) NSInteger linhaSelecionada;
@property (weak, nonatomic) NSManagedObjectContext *managedObjectContext;

- (void) contatoAdicionado:(TMContato *) contato;

@end
