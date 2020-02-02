<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 *
 * Model Pegawai_model
 *
 * This Model for ...
 * 
 * @package		CodeIgniter
 * @category	Model
 * @author    Setiawan Jodi <jodisetiawan@fisip-untirta.ac.id>
 * @link      https://github.com/setdjod/myci-extension/
 * @param     ...
 * @return    ...
 *
 */

class Pegawai_model extends CI_Model {

  // ------------------------------------------------------------------------

  // ------------------------------------------------------------------------


  // ------------------------------------------------------------------------
  public function getLogin($post)
  {
    $this->db->select('*');
    $this->db->from('pegawai'); 
    $this->db->where('username', $post['username']);
    $this->db->where('password', $post['password']);
    $query = $this->db->get();
    return $query;
  }

  public function getPegawai($id = null){
    $this->db->from('pegawai');
        if($id != null) {
            $this->db->where('idPegawai', $id);
        }
        $query = $this->db->get();
        return $query;
  }

  public function addPegawai($post)
    {
        $params['namaPegawai'] = $post['namaPegawai'];
        $params['username'] = $post['username'];
        $params['password'] = $post['password'];
        $params['status'] = $post['status'];
        $this->db->insert('pegawai', $params);
    }

    public function editPegawai($post)
    {
        $params['namaPegawai'] = $post['namaPegawai'];
        $params['username'] = $post['username'];
        if(!empty($post['password'])) {
            $params['password'] = ($post['password']);
        }
        $params['status'] = $post['status'];
        $this->db->where('idPegawai', $post['idPegawai']);
        $this->db->update('pegawai', $params);
    }

    public function deletePegawai($id)
	{
		$this->db->where('idPegawai', $id);
		$this->db->delete('pegawai');
	}
  // ------------------------------------------------------------------------

}

/* End of file Pegawai_model.php */
/* Location: ./application/models/Pegawai_model.php */