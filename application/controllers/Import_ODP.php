<?php 
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Import_ODP extends CI_Controller {
  private $filename = "import_data"; // Kita tentukan nama filenya
  
  public function __construct(){
    parent::__construct();
    
    $this->load->model('ODP_model');
  }
  
  public function index(){
    $data['rekap_data_odp'] = $this->ODP_model->view();
    $this->load->view('view', $data);
  }
  
  public function form(){
    $data = array(); // Buat variabel $data sebagai array
    
    if(isset($_POST['preview'])){ // Jika user menekan tombol Preview pada form
      // lakukan upload file dengan memanggil function upload yang ada di SiswaModel.php
      $upload = $this->ODP_model->upload_file($this->filename);
      
      if($upload['result'] == "success"){ // Jika proses upload sukses
        // Load plugin PHPExcel nya
        include APPPATH.'libraries/PHPExcel/PHPExcel.php';
        
        $excelreader = new PHPExcel_Reader_Excel2007();
        $loadexcel = $excelreader->load('excel/'.$this->filename.'.xlsx'); // Load file yang tadi diupload ke folder excel
        $sheet = $loadexcel->getActiveSheet()->toArray(null, true, true ,true);
        
        // Masukan variabel $sheet ke dalam array data yang nantinya akan di kirim ke file form.php
        // Variabel $sheet tersebut berisi data-data yang sudah diinput di dalam excel yang sudha di upload sebelumnya
        $data['sheet'] = $sheet; 
      }else{ // Jika proses upload gagal
        $data['upload_error'] = $upload['error']; // Ambil pesan error uploadnya untuk dikirim ke file form dan ditampilkan
      }
    }
    
    $this->load->view('form', $data);
  }
  
  public function import(){
    // Load plugin PHPExcel nya
    include APPPATH.'libraries/PHPExcel/PHPExcel.php';
    
    $excelreader = new PHPExcel_Reader_Excel2007();
    $loadexcel = $excelreader->load('excel/'.$this->filename.'.xlsx'); // Load file yang telah diupload ke folder excel
    $sheet = $loadexcel->getActiveSheet()->toArray(null, true, true ,true);
    
    // Buat sebuah variabel array untuk menampung array data yg akan kita insert ke database
    $data = array();
    
    $numrow = 1;
    foreach($sheet as $row){
      // Cek $numrow apakah lebih dari 1
      // Artinya karena baris pertama adalah nama-nama kolom
      // Jadi dilewat saja, tidak usah diimport
      if($numrow > 1){
            // Kita push (add) array data ke variabel data
            array_push($data, array(
                'idNOSS'            =>  $row['A'],
                'indexODP'          =>  $row['B'],
                'idODP'             =>  $row['C'],
                'ftp'               =>  $row['D'],
                'latitude'          =>  $row['E'],
                'longitude'         =>  $row['F'],
                'clusterName'       =>  $row['G'],
                'clusterStatus'     =>  $row['H'],
                'avai'              =>  $row['I'],
                'used'              =>  $row['J'],
                'rsv'               =>  $row['K'],
                'rsk'               =>  $row['L'],
                'total'             =>  $row['M'],
                'idRegional'        =>  $row['N'],
                'idWitel'           =>  $row['O'],
                'idDatel'           =>  $row['P'],
                'idSTO'             =>  $row['Q'],
                'infoODP'           =>  $row['R'],
                'updateDate'        =>  $row['S']
            ));
        }
      
      
      $numrow++; // Tambah 1 setiap kali looping
    }
    // Panggil fungsi insert_multiple yg telah kita buat sebelumnya di model
    $this->Import_ODP_model->insert_multiple($data);
    
    redirect("Import_ODP"); // Redirect ke halaman awal (ke controller siswa fungsi index)
  }
}

?>