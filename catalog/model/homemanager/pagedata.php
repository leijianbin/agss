<?php
class ModelHomemanagerPagedata extends Model {
	
	public function getPagedata($id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "sitepage_pagedata WHERE id = '" . (int)$id . "'");
				
		return $query->row;
	}
	
	
	
	public function getPagedatas($data = array()) {
		if ($data) {
			$title = $this->config->get('config_language_id') == '3'?'title,summary,':'title_en as title,summary_en as summary,';
			$sql = "SELECT ".$title."image,titlelink,price_origin,price_now,quantity,contact FROM " . DB_PREFIX . "sitepage_pagedata"; 

			$sort_data = array(
				'pcode',
				'title',
				'signdate',
				'order_num',
			);	
			
			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];	
			} else {
				$sql .= " ORDER BY order_num";	
			}
			
			if (isset($data['order']) && ($data['order'] == 'DESC')) {
				$sql .= " DESC";
			} else {
				$sql .= " ASC";
			}
		
			if (isset($data['start']) || isset($data['limit'])) {
				if ($data['start'] < 0) {
					$data['start'] = 0;
				}				

				if ($data['limit'] < 1) {
					$data['limit'] = 20;
				}	
			
				$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
			}	
			
			$query = $this->db->query($sql);
			return $query->rows;
		}
	}
	
	public function getPagedatasByPcode($pcode,$limit=6) {
		    $title = $this->config->get('config_language_id') == '3'?'title,summary,':'title_en as title,summary_en as summary,';
		    $sql = "SELECT ".$title."image,titlelink,price_origin,price_now,quantity,contact FROM " . DB_PREFIX . "sitepage_pagedata WHERE pcode =".$this->db->escape($pcode). ' ORDER BY order_num asc LIMIT '.$limit; 
			
			$query = $this->db->query($sql);
			return $query->rows;
	}
	
	public function getTotalPagedatas($data = array()) {
		$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "sitepage_pagedata";

		$query = $this->db->query($sql);
		
		return $query->row['total'];
	}
	
}
?>