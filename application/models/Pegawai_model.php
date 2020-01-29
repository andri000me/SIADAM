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

  // ------------------------------------------------------------------------

}

/* End of file Pegawai_model.php */
/* Location: ./application/models/Pegawai_model.php */