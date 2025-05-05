package br.com.motix.services;

import br.com.motix.models.Motorcycle;
import br.com.motix.models.User;

import java.util.List;
import java.util.UUID;

public interface UserService {

    //A ideia é que a api seja usada por funcionarios logo eles nao devem poder fazer alteracoes em nenhum usuario
    //O usuarios ja estara criado quando o funcionario for utilizar o app que consumira a api
    //Logo apenas GETs foram criados para a autenticacao durante o login e tambem para a exibicao posteriormente

    List<User> findAll();

    User findById(UUID id);

    User findByRm(String rm);

    User findByName(String name);

}
