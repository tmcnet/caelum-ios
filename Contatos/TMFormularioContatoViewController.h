//
//  TMFormularioContatoViewController.h
//  Contatos
//
//  Created by ios4311 on 25/03/14.
//  Copyright (c) 2014 thiagomelo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMFormularioContatoViewController : UIViewController

- (IBAction)pegaDadosDoForm:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *nome;
@property (weak, nonatomic) IBOutlet UITextField *telefone;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *endereco;
@property (weak, nonatomic) IBOutlet UITextField *site;

- (IBAction)proximoCampo:(UITextField *)campoAtual;

@property (strong, atomic) NSMutableArray * contatos;

@end
