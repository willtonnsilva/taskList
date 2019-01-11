package br.com.supero.controllers;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Resource;
import br.com.supero.models.Tarefa;

@Resource
public class TarefaController {

	@Get("/")
	public void index(Tarefa tarefa){
		System.out.println("teste");
	}
}
