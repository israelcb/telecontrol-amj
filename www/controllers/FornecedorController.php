<?php

namespace controllers;

require_once 'library/core/Controller.php';
require_once 'library/Formatadores.php';
require_once 'library/Validadores.php';
require_once 'library/Respostas.php';
require_once 'models/Fornecedor.php';

use library\core\Controller;
use library\Formatadores;
use library\Respostas;
use library\Validadores;
use models\Fornecedor;

class FornecedorController extends Controller {

    public function cadastroAction(): void {

        [ $cnpj, $razao_social, $nome_fantasia ] = $this->_tratarFormularioFornecedor();

        try { (new Fornecedor())->insert($cnpj, $razao_social, $nome_fantasia); }
        catch (\PDOException $e) { $this->getErrorHandler()->setError($e)->onUniqueViolation(Respostas::Conflito); }
    }

    public function exclusaoAction(): void {

        [ $id_fornecedor ] = $this->_tratarConsultaFornecedor();

        try { (new Fornecedor())->delete($id_fornecedor); }
        catch (\PDOException $e) { $this->getErrorHandler()->setError($e)->onForeignKeyViolation(Respostas::Conflito); }
    }

    public function atualizacaoAction(): void {

        [ $id_fornecedor ] = $this->_tratarConsultaFornecedor();
        [ $cnpj, $razao_social, $nome_fantasia ] = $this->_tratarFormularioFornecedor();

        try { (new Fornecedor())->update($id_fornecedor, $cnpj, $razao_social, $nome_fantasia); }
        catch (\PDOException $e) { $this->getErrorHandler()->setError($e)->onUniqueViolation(Respostas::Conflito); }
    }

    private function _tratarFormularioFornecedor(
        $cnpj = 'cnpj',
        $razao_social = 'razao_social',
        $nome_fantasia = 'fantasia'
    ): array {

        $this->getParams()
        ->get($cnpj)
            ->formatar(Formatadores::LimparCNPJ)
            ->validar(Validadores::CampoVazio, 'cnpj_nao_informado')
            ->validar(Validadores::CNPJNumerico, 'cnpj_invalido')

        ->get($razao_social)
            ->validar(Validadores::CampoVazio, 'razao_social_nao_informada')
            
        ->get($nome_fantasia)
            ->validar(Validadores::CampoVazio, 'nome_fantasia_nao_informado')
        ;

        return [ $cnpj, $razao_social, $nome_fantasia ];
    }

    private function _tratarConsultaFornecedor(
        $id_fornecedor = 'fornecedor'
    ): array {

        $this->getParams()
        ->get($id_fornecedor)
            ->validar(Validadores::CampoNumerico, 'identificacao_fornecedor_invalida')
        ;

        return [ $id_fornecedor ];
    }
}