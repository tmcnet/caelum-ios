//
//  TMFormularioContatoViewController.h
//  Contatos
//
//  Created by ios4311 on 25/03/14.
//  Copyright (c) 2014 thiagomelo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMContato.h"
#import "TMFormularioContatoViewControllerDelegate.h"

@interface TMFormularioContatoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nome;
@property (weak, nonatomic) IBOutlet UITextField *telefone;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *endereco;
@property (weak, nonatomic) IBOutlet UITextField *site;
@property (strong, atomic) TMContato *contato;
@property (weak, atomic) id<TMFormularioContatoViewControllerDelegate>
delegate;

- (IBAction)proximoCampo:(UITextField *)campoAtual;
- (id) initWithContato: (TMContato *)contato;

@end
