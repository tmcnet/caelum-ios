//
//  TMContato.m
//  Contatos
//
//  Created by ios4311 on 26/03/14.
//  Copyright (c) 2014 thiagomelo. All rights reserved.
//

#import "TMContato.h"

@implementation TMContato
@dynamic nome, telefone, endereco, email, site, latitude, longitude, imagem;

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

- (void) encodeWithCoder: (NSCoder *) aCoder
{
    [aCoder encodeObject:self.nome forKey:@"nome"];
    [aCoder encodeObject:self.telefone forKey:@"telefone"];
    [aCoder encodeObject:self.email forKey:@"email"];
    [aCoder encodeObject:self.endereco forKey:@"endereco"];
    [aCoder encodeObject:self.site forKey:@"site"];
    [aCoder encodeObject:self.imagem forKey:@"imagem"];
    [aCoder encodeObject:self.latitude forKey:@"latitude"];
    [aCoder encodeObject:self.longitude forKey:@"longitude"];
}

- (id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if(self) {
        self.nome = [aDecoder decodeObjectForKey:@"nome"];
        self.telefone = [aDecoder decodeObjectForKey:@"telefone"];
        self.email = [aDecoder decodeObjectForKey:@"email"];
        self.endereco = [aDecoder decodeObjectForKey:@"endereco"];
        self.site = [aDecoder decodeObjectForKey:@"site"];
        self.imagem = [aDecoder decodeObjectForKey:@"imagem"];
        self.latitude = [aDecoder decodeObjectForKey:@"latitude"];
        self.longitude = [aDecoder decodeObjectForKey:@"longitude"];
    }
    return self;
}

- (CLLocationCoordinate2D) coordinate
{
   return CLLocationCoordinate2DMake([self.latitude doubleValue], [self.longitude doubleValue]);
}

- (NSString *) title
{
    return self.nome;
}

- (NSString *) subtitle
{
    return self.email;
}

@end
