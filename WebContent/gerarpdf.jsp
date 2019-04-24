<?php 
   require_once( 'fpdf.php' );

   $nome  = @$_POST['nome']; // Sim, a supress�o � perfeitamente v�lida neste contexto
   $horas = @$_POST['horas']; // pois os par�metros ser�o checados logo em seguida.
   $data  = @$_POST['data'];
   // Aqui voc� processa os par�metros desejados, isto � s� um exemplo.
   // Utilizei as vari�veis do <form>, mas aqui voc� pode pegar o que
   // precisar de algum DB, ou mesmo misturar as t�cnicas.
   if( empty( $nome  ) ) $nome = "An�nimo da Silva";
   if( empty( $horas ) ) $horas = 24;
   if( empty( $data  ) ) $data = "17 de agosto de 2014";

   // e finalmente, geramos o PDF:
   $pdf = new FPDF();

   $pdf->AddPage();
   $pdf->SetFont('Arial','B', 14);
   $pdf->SetXY( 10, 20 );
   $pdf->Cell( 190, 0, 'DECLARA��O', 0, 0, 'C');

   $pdf->SetFont('Arial','', 12);
   $pdf->SetXY( 10, 30 );
   $pdf->MultiCell( 190, 6,
      "  Eu, $nome, declaro que adquiri de Alaor Ivan Souza ".
      "um pacote de cr�ditos para acesso � internet com dura��o ".
      "de $horas horas, iniciando-se em $data.\n".
      "  Declaro ainda que estas informa��es provavelmente s�o ".
      "inver�dicas e sem sentido, pois isto aqui � um mero teste."
   );
   $pdf->Output();
?>