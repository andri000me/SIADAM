<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 *
 * Model Datel_model
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

class Datel_model extends CI_Model {

  // ------------------------------------------------------------------------

  public function getDataDatel($id = null){
    $this->db->from('datel');
        if($id != null) {
            $this->db->where('idDatel', $id);
        }
        $query = $this->db->get();
        return $query;
  }

  public function addDataDatel($post)
    {
        $params['idDatel'] = html_escape($post['idDatel']);
        $params['namaDatel'] = html_escape($post['namaDatel']);
        $params['keterangan'] = html_escape($post['keterangan']);
        $this->db->insert('datel', $params);
    }

    public function editDataDatel($post)
    {
        $params['namaDatel'] = html_escape($post['namaDatel']);
        $params['keterangan'] = html_escape($post['keterangan']);
        $this->db->where('idDatel', $post['idDatel']);
        $this->db->update('datel', $params);
    }

    public function deleteDataDatel($id)
	{
		$this->db->where('idDatel', $id);
		$this->db->delete('datel');
	}

  // ------------------------------------------------------------------------

}

/* End of file Datel_model.php */
/* Location: ./application/models/Datel_model.php */