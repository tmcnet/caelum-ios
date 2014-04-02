//
//  TMListaContatoViewController.m
//  Contatos
//
//  Created by ios4311 on 27/03/14.
//  Copyright (c) 2014 thiagomelo. All rights reserved.
//

#import "TMListaContatoViewController.h"
#import "TMFormularioContatoViewController.h"
#import "TMContato.h"

@interface TMListaContatoViewController ()
{
    TMContato *contatoSelecionado;
}
@end

@implementation TMListaContatoViewController

- (id)init {
    self = [super init];
    
    if (self) {
        self.linhaSelecionada = -1;
        self.navigationItem.title = @"Contatos";
        UIBarButtonItem * btn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(exibeForm:)];
        self.navigationItem.rightBarButtonItem = btn;
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
    }
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - Cíclos de Vida da View

- (void)viewDidLoad
{
    [super viewDidLoad];
    UILongPressGestureRecognizer *gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(exibeMaisAcoes:)];
    
    [self.tableView addGestureRecognizer:gesture];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (self.linhaSelecionada >= 0) {
        
        NSIndexPath * indexPath = [NSIndexPath indexPathForRow
                                   :self.linhaSelecionada inSection:0];
        [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
        
        [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionNone animated:YES];
        
        self.linhaSelecionada = -1;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Mensagens criadas

- (void)exibeForm: (id)sender
{
    TMFormularioContatoViewController *form = [[TMFormularioContatoViewController alloc] init];
    form.delegate = self;
    [self.navigationController pushViewController:form animated:YES];
}

- (void)contatoAdicionado:(TMContato *)contato
{
    [self.contatos addObject:contato];
    self.linhaSelecionada = [self.contatos indexOfObject:contato];
}

- (void)contatoAlterado:(TMContato *)contato
{
    NSLog(@"Contato alterado: @%", contato.nome);
    self.linhaSelecionada = [self.contatos indexOfObject:contato];
}

- (void)exibeMaisAcoes:(UIGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateBegan) {
        CGPoint ponto = [gesture locationInView:self.tableView];
        
        NSIndexPath * ip = [self.tableView indexPathForRowAtPoint:ponto];
        contatoSelecionado = self.contatos[ip.row];
        UIActionSheet * actionSheet = [[UIActionSheet alloc] initWithTitle:contatoSelecionado.nome delegate:self cancelButtonTitle:@"Cancela" destructiveButtonTitle:nil otherButtonTitles:@"Ligar", @"Enviar Email", @"Exibir no Mapa", @"Abrir Site", nil];
        [actionSheet showInView:self.view];
    }
}

- (void)ligar
{
    UIDevice * device = [UIDevice currentDevice];
    if([device.model isEqualToString:@"iPhone"]){
        NSString * strURL = [NSString stringWithFormat:@"tel:%@", contatoSelecionado.telefone];
        [self abrirAplicativoComURL: strURL];
    } else {
        [[[UIAlertView alloc] initWithTitle:@"Pobre" message:@"Compre um iPhone" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }
    
}

- (void)enviarEmail
{
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController * mail = [[MFMailComposeViewController alloc] init];
        
        [mail setToRecipients:@[contatoSelecionado.email]];
        [mail setSubject:@"Contatos IP-67"];
        
        mail.mailComposeDelegate = self;
        
        [self presentViewController:mail animated:YES completion:nil];
    }
}

- (void)mostrarMapa
{
    NSString * strURL = [[NSString stringWithFormat:@"http://maps.google.com/maps?q=%@", contatoSelecionado.endereco] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [self abrirAplicativoComURL:strURL];
}

- (void)abrirSite
{
    [self abrirAplicativoComURL:contatoSelecionado.site];
}

- (void)abrirAplicativoComURL:(NSString *) strURL
{
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:strURL]];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    return [self.contatos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"Cell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    TMContato * contato = self.contatos[indexPath.row];
    cell.textLabel.text = contato.nome;
    
    return cell;
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [self.contatos removeObjectAtIndex:indexPath.row];
        
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    TMContato * contato = self.contatos[fromIndexPath.row];
    [self.contatos removeObjectAtIndex:fromIndexPath.row];
    [self.contatos insertObject:contato atIndex:toIndexPath.row];

}


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TMContato * contato = self.contatos[indexPath.row];
    TMFormularioContatoViewController * form = [[TMFormularioContatoViewController alloc] initWithContato: contato];
    form.delegate = self;
    
    [self.navigationController pushViewController:form animated:YES];
}

#pragma mark - ActionSheet delegate

- (void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            [self ligar];
            break;
        case 1:
            [self enviarEmail];
            break;
        case 2:
            [self mostrarMapa];
            break;
        case 3:
            [self abrirSite];
            break;
        default:
            break;
    }
}

#pragma mark - MailComposeViewController delegate

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
