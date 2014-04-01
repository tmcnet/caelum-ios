//
//  TMFormularioContatoViewControllerDelegate.h
//  Contatos
//
//  Created by ios4311 on 31/03/14.
//  Copyright (c) 2014 thiagomelo. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TMFormularioContatoViewControllerDelegate <NSObject>

- (void) contatoAdicionado:(TMContato *)contato;
- (void) contatoAlterado:(TMContato *)contato;

@end
