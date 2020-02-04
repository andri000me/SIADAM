<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 *
 * Model ODP_model
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

class ODP_model extends CI_Model {

  // ------------------------------------------------------------------------
  public function getDataODP($id = null){
    $this->db->from('rekap_data_odp');
        if($id != null) {
            $this->db->where('idODP', $id);
        }
        $query = $this->db->get();
        return $query;
  }

  public function addDataODP($post)
    {
        $params['idNOSS'] = html_escape($post['idNOSS']);
        $params['indexODP'] = html_escape($post['indexODP']);
        $params['idODP'] = html_escape($post['idODP']);
        $params['ftp'] = html_escape($post['ftp']);
        $params['latitude'] = html_escape($post['latitude']);
        $params['longitude'] = html_escape($post['longitude']);
        $params['clusterName'] = html_escape($post['clusterName']);
        $params['clusterStatus'] = html_escape($post['clusterStatus']);
        $params['avai'] = html_escape($post['avai']);
        $params['used'] = html_escape($post['used']);
        $params['rsv'] = html_escape($post['rsv']);
        $params['rsk'] = html_escape($post['rsk']);
        $params['total'] = html_escape($post['total']);
        $params['idRegional'] = html_escape($post['idRegional']);
        $params['idWitel'] = html_escape($post['idWitel']);
        $params['idDatel'] = html_escape($post['idDatel']);
        $params['idSTO'] = html_escape($post['idSTO']);
        $params['infoODP'] = html_escape($post['infoODP']);
        $params['updateDate'] = html_escape($post['updateDate']);
        $this->db->insert('rekap_data_odp', $params);
    }

    public function editDataODP($post)
    {
        $params['idNOSS'] = html_escape($post['idNOSS']);
        $params['indexODP'] = html_escape($post['indexODP']);
        $params['ftp'] = html_escape($post['ftp']);
        $params['latitude'] = html_escape($post['latitude']);
        $params['longitude'] = html_escape($post['longitude']);
        $params['clusterName'] = html_escape($post['clusterName']);
        $params['clusterStatus'] = html_escape($post['clusterStatus']);
        $params['avai'] = html_escape($post['avai']);
        $params['used'] = html_escape($post['used']);
        $params['rsv'] = html_escape($post['rsv']);
        $params['rsk'] = html_escape($post['rsk']);
        $params['total'] = html_escape($post['total']);
        $params['idRegional'] = html_escape($post['idRegional']);
        $params['idWitel'] = html_escape($post['idWitel']);
        $params['idDatel'] = html_escape($post['idDatel']);
        $params['idSTO'] = html_escape($post['idSTO']);
        $params['infoODP'] = html_escape($post['infoODP']);
        $params['updateDate'] = html_escape($post['updateDate']);
        $this->db->where('idODP', $post['idODP']);
        $this->db->update('rekap_data_odp', $params);
    }

    public function deleteDataODP($id)
	{
		$this->db->where('idODP', $id);
		$this->db->delete('rekap_data_odp');
  }
  
  

  // ------------------------------------------------------------------------

}

/* End of file ODP_model.php */
/* Location: ./application/models/ODP_model.php */