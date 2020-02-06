<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Excel_import extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('excel_import_model');
		$this->load->library('excel');
	}

	function import()
	{
		$this->load->view('excel_import');
	}
	
	function fetch()
	{
		$data = $this->excel_import_model->select();
		$output = '
		<h3 align="center">Total Data - '.$data->num_rows().'</h3>
		<table class="table table-striped table-bordered">
            <tr>
				<th>ID NOSS</th>
				<th>index ODP</th>
				<th>ID ODP</th>
				<th>FTP</th>
                <th>Latitude</th>
                <th>Longitude</th>
                <th>Cluster Name</th>
                <th>Cluster Status</th>
                <th>Available</th>
                <th>Used</th>
                <th>RSV</th>
                <th>RSK</th>
                <th>Total</th>
                <th>ID Regional</th>
                <th>ID Witel</th>
                <th>ID Datel</th>
                <th>ID STO</th>
                <th>Info ODP</th>
                <th>Update Date</th>
                <th>Actions</th>
			</tr>
		';
		foreach($data->result() as $row)
		{
			$output .= '
			<tr>
				<td>'.$row->idNOSS.'</td>
				<td>'.$row->indexODP.'</td>
				<td>'.$row->idODP.'</td>
				<td>'.$row->ftp.'</td>
                <td>'.$row->latitude.'</td>
                <td>'.$row->longitude.'</td>
				<td>'.$row->clusterName.'</td>
				<td>'.$row->clusterStatus.'</td>
				<td>'.$row->avai.'</td>
                <td>'.$row->used.'</td>
                <td>'.$row->rsv.'</td>
				<td>'.$row->rsk.'</td>
				<td>'.$row->total.'</td>
				<td>'.$row->idRegional.'</td>
                <td>'.$row->idWitel.'</td>
                <td>'.$row->idDatel.'</td>
				<td>'.$row->idSTO.'</td>
				<td>'.$row->infoODP.'</td>
				<td>'.$row->updateDate.'</td>
			</tr>
			';
		}
		$output .= '</table>';
		echo $output;
	}

	function import()
	{
		if(isset($_FILES["file"]["name"]))
		{
			$path = $_FILES["file"]["tmp_name"];
			$object = PHPExcel_IOFactory::load($path);
			foreach($object->getWorksheetIterator() as $worksheet)
			{
				$highestRow = $worksheet->getHighestRow();
				$highestColumn = $worksheet->getHighestColumn();
				for($row=2; $row<=$highestRow; $row++)
				{
					$idNOSS = $worksheet->getCellByColumnAndRow(0, $row)->getValue();
					$indexODP = $worksheet->getCellByColumnAndRow(1, $row)->getValue();
					$idODP = $worksheet->getCellByColumnAndRow(2, $row)->getValue();
					$ftp = $worksheet->getCellByColumnAndRow(3, $row)->getValue();
                    $latitude = $worksheet->getCellByColumnAndRow(4, $row)->getValue();
                    $longitude = $worksheet->getCellByColumnAndRow(5, $row)->getValue();
                    $clusterName = $worksheet->getCellByColumnAndRow(6, $row)->getValue();
                    $clusterStatus = $worksheet->getCellByColumnAndRow(7, $row)->getValue();
                    $avai = $worksheet->getCellByColumnAndRow(8, $row)->getValue();
                    $used = $worksheet->getCellByColumnAndRow(9, $row)->getValue();
                    $rsv = $worksheet->getCellByColumnAndRow(10, $row)->getValue();
                    $rsk = $worksheet->getCellByColumnAndRow(11, $row)->getValue();
                    $total = $worksheet->getCellByColumnAndRow(12, $row)->getValue();
                    $idRegional = $worksheet->getCellByColumnAndRow(13, $row)->getValue();
                    $idWitel = $worksheet->getCellByColumnAndRow(14, $row)->getValue();
                    $idDatel = $worksheet->getCellByColumnAndRow(15, $row)->getValue();
                    $idSTO = $worksheet->getCellByColumnAndRow(16, $row)->getValue();
                    $infoODP = $worksheet->getCellByColumnAndRow(17, $row)->getValue();
                    $updateDate = $worksheet->getCellByColumnAndRow(18, $row)->getValue();
					$data[] = array(
                        'idNOSS'            =>  $idNOSS,
                        'indexODP'          =>  $indexODP,
                        'idODP'             =>  $idODP,
                        'ftp'               =>  $ftp,
                        'latitude'          =>  $latitude,
                        'longitude'         =>  $longitude,
                        'clusterName'       =>  $clusterName,
                        'clusterStatus'     =>  $clusterStatus,
                        'avai'              =>  $avai,
                        'used'              =>  $used,
                        'rsv'               =>  $rsv,
                        'rsk'               =>  $rsk,
                        'total'             =>  $total,
                        'idRegional'        =>  $idRegional,
                        'idWitel'           =>  $idWitel,
                        'idDatel'           =>  $idDatel,
                        'idSTO'             =>  $idSTO,
                        'infoODP'           =>  $infoODP,
                        'updateDate'        =>  $updateDate
					);
				}
			}
			$this->excel_import_model->insert($data);
			echo 'Data Imported successfully';
		}	
	}
}

?>