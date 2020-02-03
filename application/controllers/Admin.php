<?php
defined('BASEPATH') or exit('No direct script access allowed');
// Don't forget include/define REST_Controller path

/**
 *
 * Controller Admin
 *
 * This controller for ...
 *
 * @package   CodeIgniter
 * @category  Controller CI
 * @author    Setiawan Jodi <jodisetiawan@fisip-untirta.ac.id>
 * @author    Raul Guerrero <r.g.c@me.com>
 * @link      https://github.com/setdjod/myci-extension/
 * @param     ...
 * @return    ...
 *
 */

class Admin extends CI_Controller
{
    
  function __construct()
	{
		parent::__construct();
		check_not_login();
		//check admin buat fungsi_helper
		check_admin();
    $this->load->model('Pegawai_model');
	$this->load->model('Regional_model');
	$this->load->model('STO_model');
		$this->load->library('form_validation');
  }

  // Halaman Awal Admin
  public function index()
  {
    check_not_login();
    $this->template->load('template/template_Admin', 'dashboard_home');
  }

  // Menu Pegawai 
	public function getPegawai()
	{
		$data['row'] = $this->Pegawai_model->getDataPegawai();
		$this->template->load('template/template_Admin', 'pegawai/pegawai_data', $data);
	}

	public function addPegawai()
	{
		$this->form_validation->set_rules('namaPegawai', 'Nama', 'required');
		$this->form_validation->set_rules('username', 'Username', 'required|is_unique[pegawai.username]');
		$this->form_validation->set_rules('password', 'Password', 'required|min_length[5]');
		$this->form_validation->set_rules('passconf', 'Konfirmasi Password', 'required|matches[password]',
			array('matches' => '%s tidak sesuai dengan password')
		);
		$this->form_validation->set_rules('status', 'Status', 'required');

		$this->form_validation->set_message('required', '%s masih kosong, silahkan isi');
		$this->form_validation->set_message('min_length', '{field} minimal 5 karakter');
		$this->form_validation->set_message('is_unique', '{field} sudah dipakai, silahkan ganti');

		$this->form_validation->set_error_delimiters('<span class="help-block">', '</span>');

		if ($this->form_validation->run() == FALSE) {
			$this->template->load('template/template_Admin', 'pegawai/pegawai_form_add');
		} else {
			$post = $this->input->post(null, TRUE);
			$this->Pegawai_model->addDataPegawai($post);
			if($this->db->affected_rows() > 0) {
				echo "<script>alert('Data berhasil disimpan');</script>";
			}
			echo "<script>window.location='".site_url('Admin/getPegawai')."';</script>";
		}
	}

	public function editPegawai($id)
	{
		$this->form_validation->set_rules('namaPegawai', 'Nama', 'required');
		$this->form_validation->set_rules('username', 'Username', 'required|callback_username_check');
		if($this->input->post('password')) {
			$this->form_validation->set_rules('password', 'Password', 'min_length[5]');
			$this->form_validation->set_rules('passconf', 'Konfirmasi Password', 'matches[password]',
				array('matches' => '%s tidak sesuai dengan password')
			);
		}
		if($this->input->post('passconf')) {
			$this->form_validation->set_rules('passconf', 'Konfirmasi Password', 'matches[password]',
				array('matches' => '%s tidak sesuai dengan password')
			);
		}
		$this->form_validation->set_rules('status', 'Status', 'required');

		$this->form_validation->set_message('required', '%s masih kosong, silahkan isi');
		$this->form_validation->set_message('min_length', '{field} minimal 5 karakter');
		$this->form_validation->set_message('is_unique', '{field} sudah dipakai, silahkan ganti');

		$this->form_validation->set_error_delimiters('<span class="help-block">', '</span>');

		if ($this->form_validation->run() == FALSE) {
			$query = $this->pegawai_model->getDataPegawai($id);
			if($query->num_rows() > 0) { 
				$data['row'] = $query->row();
        $this->template->load('template/template_Admin', 'pegawai/pegawai_form_edit', $data);
			} else {
				echo "<script>alert('Data tidak ditemukan');";
				echo "window.location='".site_url('Admin/getPegawai')."';</script>";
			}
		} else {
			$post = $this->input->post(null, TRUE);
			$this->Pegawai_model->editDataPegawai($post);
			if($this->db->affected_rows() > 0) {
				echo "<script>alert('Data berhasil disimpan');</script>";
			}
			echo "<script>window.location='".site_url('Admin/getPegawai')."';</script>";
		}
	}
	function username_check() {
		$post = $this->input->post(null, TRUE);
		$query = $this->db->query("SELECT * FROM pegawai WHERE username = '$post[username]' AND idPegawai != '$post[idPegawai]'");
		if($query->num_rows() > 0) {
			$this->form_validation->set_message('username_check', '{field} ini sudah dipakai, silahkan ganti');
			return FALSE;
		} else {
			return TRUE;
		}
	}

	public function deletePegawai()
	{
		$id = $this->input->post('idPegawai');
		$this->Pegawai_model->deleteDataPegawai($id);

		if($this->db->affected_rows() > 0) {
			echo "<script>alert('Data berhasil dihapus');</script>";
		}
		echo "<script>window.location='".site_url('Admin/getPegawai')."';</script>";
  }
  // End Menu Pegawai
  
  // Menu STO : STO_checknya belum fix

  public function getSTO()
	{
		$data['row'] = $this->STO_model->getDataSTO();
		$this->template->load('template/template_Admin', 'sto/sto_data', $data);
	}

	public function addSTO()
	{
		$this->form_validation->set_rules('idSTO', 'ID STO', 'required');
		$this->form_validation->set_rules('namaSTO', 'Nama STO', 'required');
		$this->form_validation->set_rules('keterangan', 'Keterangan');

		$this->form_validation->set_message('required', '%s masih kosong, silahkan isi');
		$this->form_validation->set_message('min_length', '{field} minimal 5 karakter');
		$this->form_validation->set_message('is_unique', '{field} sudah dipakai, silahkan ganti');

		$this->form_validation->set_error_delimiters('<span class="help-block">', '</span>');

		if ($this->form_validation->run() == FALSE) {
			$this->template->load('template/template_Admin', 'sto/sto_form_add');
		} else {
			$post = $this->input->post(null, TRUE);
			$this->STO_model->addDataSTO($post);
			if($this->db->affected_rows() > 0) {
				echo "<script>alert('Data berhasil disimpan');</script>";
			}
			echo "<script>window.location='".site_url('Admin/getSTO')."';</script>";
		}
	}

	public function editSTO($id)
	{
		
		$this->form_validation->set_rules('idSTO', 'ID STO', 'required');
		$this->form_validation->set_rules('namaSTO', 'Nama STO', 'required');
		$this->form_validation->set_rules('keterangan', 'Keterangan');

		$this->form_validation->set_message('required', '%s masih kosong, silahkan isi');
		$this->form_validation->set_message('min_length', '{field} minimal 5 karakter');
		$this->form_validation->set_message('is_unique', '{field} sudah dipakai, silahkan ganti');

		$this->form_validation->set_error_delimiters('<span class="help-block">', '</span>');

		if ($this->form_validation->run() == FALSE) {
			$query = $this->STO_model->getDataSTO($id);
			if($query->num_rows() > 0) { 
				$data['row'] = $query->row();
        $this->template->load('template/template_Admin', 'sto/sto_form_edit', $data);
			} else {
				echo "<script>alert('Data tidak ditemukan');";
				echo "window.location='".site_url('Admin/getSTO')."';</script>";
			}
		} else {
			$post = $this->input->post(null, TRUE);
			$this->STO_model->editDataSTO($post);
			if($this->db->affected_rows() > 0) {
				echo "<script>alert('Data berhasil disimpan');</script>";
			}
			echo "<script>window.location='".site_url('Admin/getSTO')."';</script>";
		}
	}
	// function STO_check() {
	// 	$post = $this->input->post(null, TRUE);
	// 	$query = $this->db->query("SELECT * FROM sto WHERE idSTO = '$post[idSTO]' AND namaSTO != '$post[namaSTO]'");
	// 	if($query->num_rows() > 0) {
	// 		$this->form_validation->set_message('STO_check', '{field} ini sudah dipakai, silahkan ganti');
	// 		return FALSE;
	// 	} else {
	// 		return TRUE;
	// 	}
	// }

	public function deleteSTO()
	{
		$id = $this->input->post('idSTO');
		$this->STO_model->deleteDataSTO($id);

		if($this->db->affected_rows() > 0) {
			echo "<script>alert('Data berhasil dihapus');</script>";
		}
		echo "<script>window.location='".site_url('Admin/getSTO')."';</script>";
  }

  // End Menu STO

  // Menu Regional
  public function getRegional()
	{
		$data['row'] = $this->Regional_model->getDataRegional();
    $this->template->load('template/template_Admin', 'regional/regional_data', $data);
	}

	public function addRegional()
	{
		$this->form_validation->set_rules('namaPegawai', 'Nama', 'required');
		$this->form_validation->set_rules('username', 'Username', 'required|is_unique[pegawai.username]');
		$this->form_validation->set_rules('password', 'Password', 'required|min_length[5]');
		$this->form_validation->set_rules('passconf', 'Konfirmasi Password', 'required|matches[password]',
			array('matches' => '%s tidak sesuai dengan password')
		);
		$this->form_validation->set_rules('status', 'Status', 'required');

		$this->form_validation->set_message('required', '%s masih kosong, silahkan isi');
		$this->form_validation->set_message('min_length', '{field} minimal 5 karakter');
		$this->form_validation->set_message('is_unique', '{field} sudah dipakai, silahkan ganti');

		$this->form_validation->set_error_delimiters('<span class="help-block">', '</span>');

		if ($this->form_validation->run() == FALSE) {
			$this->template->load('template/template_Admin', 'regional/regional_form_add');
		} else {
			$post = $this->input->post(null, TRUE);
			$this->pegawai_model->addDataPegawai($post);
			if($this->db->affected_rows() > 0) {
				echo "<script>alert('Data berhasil disimpan');</script>";
			}
			echo "<script>window.location='".site_url('Admin/getPegawai')."';</script>";
		}
	}

	public function editRegional($id)
	{
		$this->form_validation->set_rules('namaPegawai', 'Nama', 'required');
		$this->form_validation->set_rules('username', 'Username', 'required|callback_username_check');
		if($this->input->post('password')) {
			$this->form_validation->set_rules('password', 'Password', 'min_length[5]');
			$this->form_validation->set_rules('passconf', 'Konfirmasi Password', 'matches[password]',
				array('matches' => '%s tidak sesuai dengan password')
			);
		}
		if($this->input->post('passconf')) {
			$this->form_validation->set_rules('passconf', 'Konfirmasi Password', 'matches[password]',
				array('matches' => '%s tidak sesuai dengan password')
			);
		}
		$this->form_validation->set_rules('status', 'Status', 'required');

		$this->form_validation->set_message('required', '%s masih kosong, silahkan isi');
		$this->form_validation->set_message('min_length', '{field} minimal 5 karakter');
		$this->form_validation->set_message('is_unique', '{field} sudah dipakai, silahkan ganti');

		$this->form_validation->set_error_delimiters('<span class="help-block">', '</span>');

		if ($this->form_validation->run() == FALSE) {
			$query = $this->Regional_model->getDataRegional($id);
			if($query->num_rows() > 0) { 
				$data['row'] = $query->row();
        $this->template->load('template/template_Admin', 'regional/regional_form_edit', $data);
        
			} else {
				echo "<script>alert('Data tidak ditemukan');";
				echo "window.location='".site_url('Admin/getRegional')."';</script>";
			}
		} else {
			$post = $this->input->post(null, TRUE);
			$this->pegawai_model->editDataPegawai($post);
			if($this->db->affected_rows() > 0) {
				echo "<script>alert('Data berhasil disimpan');</script>";
			}
			echo "<script>window.location='".site_url('Admin/getRegional')."';</script>";
		}
	}
	function regional_check() {
		$post = $this->input->post(null, TRUE);
		$query = $this->db->query("SELECT * FROM pegawai WHERE username = '$post[username]' AND idPegawai != '$post[idPegawai]'");
		if($query->num_rows() > 0) {
			$this->form_validation->set_message('username_check', '{field} ini sudah dipakai, silahkan ganti');
			return FALSE;
		} else {
			return TRUE;
		}
	}

	public function deleteRegional()
	{
		$id = $this->input->post('idPegawai');
		$this->pegawai_model->deleteDataPegawai($id);

		if($this->db->affected_rows() > 0) {
			echo "<script>alert('Data berhasil dihapus');</script>";
		}
		echo "<script>window.location='".site_url('Admin/getPegawai')."';</script>";
  }
  // End Menu Regional

}


/* End of file Admin.php */
/* Location: ./application/controllers/Admin.php */