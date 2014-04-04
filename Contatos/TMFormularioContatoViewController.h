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
#import <CoreLocation/CoreLocation.h>

@interface TMFormularioContatoViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nome;
@property (weak, nonatomic) IBOutlet UITextField *telefone;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *endereco;
@property (weak, nonatomic) IBOutlet UITextField *site;
@property (weak, nonatomic) IBOutlet UIButton *botaoFoto;
@property (strong, atomic) TMContato *contato;
@property (weak, nonatomic) IBOutlet UITextField *latitude;
@property (weak, nonatomic) IBOutlet UITextField *longitude;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *rodinha;
@property (weak, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (weak, atomic) id<TMFormularioContatoViewControllerDelegate>
delegate;

- (IBAction)proximoCampo:(UITextField *)campoAtual;
- (IBAction)selecionaFoto:(id)sender;
- (IBAction)buscarCoordenadas:(id)sender;

- (id) initWithContato: (TMContato *)contato;

@end
