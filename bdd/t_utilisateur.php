<?php
class t_utilisateur{
  private $_pdo;

  public function __construct (PDO $pdo){
    $this -> _pdo = $pdo;
  }

  public function checkLogin($ligne){
    $requete = $this->_pdo->prepare('SELECT
                                        mail_utilisateur as mail_utilisateur,
                                        mdp_utilisateur as mdp_utilisateur
                                        FROM t_utilisateur');
  $bRequeteValide = $requete -> execute();

  if ($bRequeteValide){
    $resultats = $requete -> fetchAll(PDO::FETCH_ASSOC);
  }else{
    $resultats = null;
  }

  echo json_encode($resultats);
  }
}
