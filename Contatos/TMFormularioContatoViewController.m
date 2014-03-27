//
//  TMFormularioContatoViewController.m
//  Contatos
//
//  Created by ios4311 on 25/03/14.
//  Copyright (c) 2014 thiagomelo. All rights reserved.
//

#import "TMFormularioContatoViewController.h"
#import "TMContato.h"

@interface TMFormularioContatoViewController ()

@end

@implementation TMFormularioContatoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id) init
{
    self = [super init];
    
    if(self){
        self.contatos = [[NSMutableArray alloc] init];
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

- (IBAction)pegaDadosDoForm:(id)sender
{
 /*
    -- INSERINDO OBJETOS AO DICTIONARY PELO CONSTRUTOR --
  
    NSDictionary *contatos = [[NSDictionary alloc] initWithObjectsAndKeys:self.nome.text, self.telefone.text, self.email.text, self.endereco.text, self.site.text, nil];
  */
    
   /*
    -- INSERINDO OBJETOS NO DICTIONARY pelo setObject --
    
    NSMutableDictionary *contatos = [[NSMutableDictionary alloc] init];
    
    [contatos setObject:self.nome.text forKey:@"nome"];
    [contatos setObject:self.telefone.text forKey:@"telefone"];
    [contatos setObject:self.email.text forKey:@"email"];
    [contatos setObject:self.endereco.text forKey:@"endereco"];
    [contatos setObject:self.site.text forKey:@"site"];
    
     NSLog(@"Contato adicionado: %@", contatos);
    */
    
    // CRIADO UM NOVO CONTATO DO TIPO TMContato
    TMContato *contato = [[TMContato alloc] init];
    contato.nome = self.nome.text;
    contato.telefone = self.telefone.text;
    contato.email = self.email.text;
    contato.endereco = self.endereco.text;
    contato.site = self.site.text;
    
    [self.view endEditing:YES];
    
    [self.contatos addObject:contato];
    
     NSLog(@"Contato: %@", self.contatos.description);
}


//MENSAGEM QUE VERIFICA PROXIMO CAMPO COM FOCO
- (IBAction)proximoCampo:(UITextField *)campoAtual
{
    NSInteger proximaTag = campoAtual.tag + 1;
    UIResponder * proximoCampo = [self.view viewWithTag:proximaTag];
    
    if(proximoCampo) {
        [proximoCampo becomeFirstResponder];
    } else {
        [campoAtual resignFirstResponder];
    }
}
@end
