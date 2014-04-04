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

- (id)initWithContato:(TMContato *)contato
{
    self = [super init];
    if(self) {
        self.contato = contato;
        self.navigationItem.title = @"Editar Contato";
        UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithTitle:@"Alterar" style:UIBarButtonItemStylePlain target:self action:@selector(alterarContato)];
        self.navigationItem.rightBarButtonItem = btn;

    }
    return self;
}

- (id) init
{
    self = [super init];
    
    if(self){
        self.navigationItem.title = @"Cadastro";
        UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithTitle:@"Adicionar" style:UIBarButtonItemStylePlain target:self action:@selector(criarContato)];
        self.navigationItem.rightBarButtonItem = btn;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if(self.contato) {
        self.nome.text = self.contato.nome;
        self.telefone.text = self.contato.telefone;
        self.email.text = self.contato.email;
        self.endereco.text = self.contato.endereco;
        self.site.text = self.contato.site;
        self.latitude.text = [self.contato.latitude stringValue];
        self.longitude.text = [self.contato.longitude stringValue];
        
        if(self.contato.imagem) {
            [self.botaoFoto setImage:self.contato.imagem forState:UIControlStateNormal];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)criarContato
{
    TMContato * contato = [self pegaDadosDoFormulario];
    
    [self.delegate contatoAdicionado:contato];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)alterarContato
{
    TMContato * contato = [self pegaDadosDoFormulario];
    
    if ([self.delegate respondsToSelector:@selector(contatoAlterado:)]) {
         [self.delegate contatoAlterado:contato];
    }
   
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (TMContato *)pegaDadosDoFormulario
{
    if(!self.contato) {
        self.contato = [NSEntityDescription insertNewObjectForEntityForName:@"Contato" inManagedObjectContext:self.managedObjectContext];
    }
    // CRIADO UM NOVO CONTATO DO TIPO TMContato
    
    self.contato.nome = self.nome.text;
    self.contato.telefone = self.telefone.text;
    self.contato.email = self.email.text;
    self.contato.endereco = self.endereco.text;
    self.contato.site = self.site.text;
    self.contato.latitude = [NSNumber numberWithDouble:[self.latitude.text doubleValue]];
    self.contato.longitude = [NSNumber numberWithDouble:[self.longitude.text doubleValue]];
    
    if(self.botaoFoto.imageView.image) {
        self.contato.imagem = self.botaoFoto.imageView.image;
    }
    
    [self.view endEditing:YES];
    
    return self.contato;
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

- (IBAction)selecionaFoto:(id)sender
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        //NO FINAL DA APOSTILA TEM COMO IMPLEMENTAR A CAMERA
    } else {
        UIImagePickerController * picker = [[UIImagePickerController alloc]init];
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.allowsEditing = YES;
        picker.delegate = self;
        
        [self presentViewController:picker animated:YES completion:nil];
    }
}

- (IBAction)buscarCoordenadas:(id)sender {
    [self.rodinha startAnimating];
    CLGeocoder *geoCoder = [[CLGeocoder alloc] init];
    [geoCoder geocodeAddressString:self.endereco.text completionHandler:^(NSArray *resultados, NSError *erro)
    {
        if (!erro && [resultados count] > 0) {
            CLPlacemark * resultado = resultados[0];
            CLLocationCoordinate2D coordenada = resultado.location.coordinate;
            self.latitude.text = [NSString stringWithFormat:@"%f", coordenada.latitude];
            self.longitude.text = [NSString stringWithFormat:@"%f", coordenada.longitude];
        }
        [self.rodinha stopAnimating];
    }];
}

#pragma mark - UIPickerController delegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *imagem = info[UIImagePickerControllerEditedImage];
    [self.botaoFoto setImage:imagem forState:UIControlStateNormal];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
