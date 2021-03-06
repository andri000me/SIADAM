<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 *
 * Model STO_model
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

class STO_model extends CI_Model {

  // ------------------------------------------------------------------------
  public function getDataSTO($id = null){
    $this->db->from('sto');
        if($id != null) {
            $this->db->where('idSTO', $id);
        }
        $query = $this->db->get();
        return $query;
  }
  

  public function addDataSTO($post)
    {
        $params['kodeSTO'] = html_escape(strtoupper($post['kodeSTO']));
        $params['namaSTO'] = html_escape($post['namaSTO']);
        $params['keterangan'] = html_escape($post['keterangan']);
        $params['idDatel']= html_escape($post['datel']);
        $this->db->insert('sto', $params);
    }

    public function editDataSTO($post)
    {
      $this->db->select('kodeSTO');
      $this->db->from('sto');
      $this->db->where('kodeSTO', $post['kodeSTO']);
      $query = $this->db->get();
      if(($post['kodeSTO']) != $query ) {
        $params['kodeSTO'] = html_escape(strtoupper($post['kodeSTO']));
      }
      $params['namaSTO'] = html_escape($post['namaSTO']);
      $params['keterangan'] = html_escape($post['keterangan']);
      // $params['idDatel']= html_escape($post['datel']);
        $this->db->where('idSTO', $post['idSTO']);
        $this->db->update('sto', $params);
    }

    public function deleteDataSTO($id)
	{
		$this->db->where('idSTO', $id);
		$this->db->delete('sto');
	}

  // ------------------------------------------------------------------------

}

/* End of file STO_model.php */
/* Location: ./application/models/STO_model.php */