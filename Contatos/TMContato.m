//
//  TMContato.m
//  Contatos
//
//  Created by ios4311 on 26/03/14.
//  Copyright (c) 2014 thiagomelo. All rights reserved.
//

#import "TMContato.h"

@implementation TMContato

//NAO PRECISA, COMPILADOR GERA A PARTIR DA VERSAO 4.4 
// @synthesize nome = _nome;

/*
 -- EXEMPLO DE GETTER E SETTER FEITO NA MAO (SEM USO DO @PROPERTY)
- (void) setNome : (NSString *) nome
{
    _nome = nome;
}

- (NSString *) nome
{
    return _nome;
}
 */

- (NSString *) description
{
    return [NSString stringWithFormat: @"%@ <%@>", self.nome, self.email];
}

@end
