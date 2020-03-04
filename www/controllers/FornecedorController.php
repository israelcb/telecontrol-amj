<?php

namespace controllers;

require_once 'library/core/Controller.php';
require_once 'models/Fornecedor.php';
use library\core\Controller;
use models\Fornecedor;

class FornecedorController extends Controller {

    public function cadastroAction(): void {

        $params = $this->getApp()->getParams();
        $cnpj = preg_replace('/[\/\.-]/', '', filter_var($params['cnpj'] ?? ''));
        $razao_social = filter_var($params['razao_social'] ?? '');
        $nome_fantasia = filter_var($params['fantasia'] ?? '');

        $erros = [];

        if (empty($cnpj)) array_push($erros, 'cnpj_nao_informado');
        if (empty($razao_social)) array_push($erros, 'razao_social_nao_informada');
        if (empty($nome_fantasia)) array_push($erros, 'nome_fantasia_nao_informado');

        if (count($erros) === 0 && !preg_match('/^[0-9]{12,14}$/', $cnpj)) array_push($erros, 'cnpj_invalido');

        $resposta = [];

        if (count($erros) > 0) {

            http_response_code(400);
            $resposta = array('erros' => $erros);
        }

        else {

            try {

                $model = new Fornecedor();
                $model->insert($cnpj, $razao_social, $nome_fantasia);
            }
            catch (\PDOException $e) {

                if ($e->getCode() == 23505) {

                    http_response_code(409);
                    $resposta = array('erros' => ['cnpj_existente']);
                }
                else {

                    http_response_code(500);
                    $resposta = array('erros' => ['erro_interno']);
                }
            }
            finally {

                if (empty($resposta)) {

                    http_response_code(201);
                    $resposta = array('mensagem' => 'sucesso');
                }
            }
        }

        header('Content-Type', 'application/json');
        echo json_encode($resposta);
        exit;
    }
}