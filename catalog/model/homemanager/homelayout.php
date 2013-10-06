<?php
class ModelHomemanagerHomelayout extends Model {
	
	public function getHomelayout($id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "homepage_layout WHERE id = '" . (int)$id . "'");
				
		return $query->row;
	}
	
	public function getHomelayoutByLayout($layout = 'homepage') {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "homepage_layout WHERE layout = '" . $layout . "'");
				
		return $query->rows;
	}
	
	
	public function getHomelayouts($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM " . DB_PREFIX . "homepage_layout "; 

			$sort_data = array(
				'position',
				'name',
				'name_en',
				'layout',
			);	
			
			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];	
			} else {
				$sql .= " ORDER BY name";	
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
	
	public function getTotalHomelayouts($data = array()) {
		$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "homepage_layout";

		$query = $this->db->query($sql);
		
		return $query->row['total'];
	}
	
}
?>