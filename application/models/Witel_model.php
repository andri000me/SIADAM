<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 *
 * Model Witel_model
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

class Witel_model extends CI_Model {

  // ------------------------------------------------------------------------

  public function getDataWitel($id = null){
    $this->db->from('witel');
        if($id != null) {
            $this->db->where('idWitel', $id);
        }
        $query = $this->db->get();
        return $query;
  }

  public function addDataWitel($post)
    {
        $params['idWitel'] = html_escape($post['idWitel']);
        $params['namaWitel'] = html_escape($post['namaWitel']);
        $params['keterangan'] = html_escape($post['keterangan']);
        $this->db->insert('witel', $params);
    }

    public function editDataWitel($post)
    {
        $params['namaWitel'] = html_escape($post['namaWitel']);
        $params['keterangan'] = html_escape($post['keterangan']);
        $this->db->where('idWitel', $post['idWitel']);
        $this->db->update('witel', $params);
    }

    public function deleteDataWitel($id)
	{
		$this->db->where('idWitel', $id);
		$this->db->delete('witel');
	}

  // ------------------------------------------------------------------------

}

/* End of file Witel_model.php */
/* Location: ./application/models/Witel_model.php */