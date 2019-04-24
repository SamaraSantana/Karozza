<?php 
   require_once( 'fpdf.php' );

   $nome  = @$_POST['nome']; // Sim, a supressão é perfeitamente válida neste contexto
   $horas = @$_POST['horas']; // pois os parâmetros serão checados logo em seguida.
   $data  = @$_POST['data'];
   // Aqui você processa os parâmetros desejados, isto é só um exemplo.
   // Utilizei as variáveis do <form>, mas aqui você pode pegar o que
   // precisar de algum DB, ou mesmo misturar as técnicas.
   if( empty( $nome  ) ) $nome = "Anônimo da Silva";
   if( empty( $horas ) ) $horas = 24;
   if( empty( $data  ) ) $data = "17 de agosto de 2014";

   // e finalmente, geramos o PDF:
   $pdf = new FPDF();

   $pdf->AddPage();
   $pdf->SetFont('Arial','B', 14);
   $pdf->SetXY( 10, 20 );
   $pdf->Cell( 190, 0, 'DECLARAÇÃO', 0, 0, 'C');

   $pdf->SetFont('Arial','', 12);
   $pdf->SetXY( 10, 30 );
   $pdf->MultiCell( 190, 6,
      "  Eu, $nome, declaro que adquiri de Alaor Ivan Souza ".
      "um pacote de créditos para acesso à internet com duração ".
      "de $horas horas, iniciando-se em $data.\n".
      "  Declaro ainda que estas informações provavelmente são ".
      "inverídicas e sem sentido, pois isto aqui é um mero teste."
   );
   $pdf->Output();
?>