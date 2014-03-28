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
        self.navigationItem.title = @"Cadastro";
        UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithTitle:@"Adiciona" style:UIBarButtonItemStylePlain target:self action:@selector(criarContato)];
        self.navigationItem.rightBarButtonItem = btn;
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

- (void)criarContato
{
    TMContato * contato = [self pegaDadosDoFormulario];
    [self.contatos addObject:contato];
    
    NSLog(@"Contato: %@", self.contatos.description);
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (TMContato *)pegaDadosDoFormulario
{
    
    // CRIADO UM NOVO CONTATO DO TIPO TMContato
    
    TMContato *contato = [[TMContato alloc] init];
    
    contato.nome = self.nome.text;
    contato.telefone = self.telefone.text;
    contato.email = self.email.text;
    contato.endereco = self.endereco.text;
    contato.site = self.site.text;
    
    [self.view endEditing:YES];
    
    return contato;
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
