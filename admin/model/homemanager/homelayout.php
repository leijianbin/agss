<?php
class ModelHomemanagerHomelayout extends Model {
	public function addHomelayout($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "homepage_layout SET position = '" . $this->db->escape($data['position']) . "', layout = '" . $this->db->escape($data['layout']) . "', name = '" . $this->db->escape($data['name']) . "', name_en = '" . $this->db->escape($data['name_en']) . "'");
		
//		$Homelayout_id = $this->db->getLastId();
		$this->cache->delete('Homelayout');
	}
	
	public function editHomelayout($Homelayout_id, $data) {
		
		
		$this->db->query("UPDATE " . DB_PREFIX . "homepage_layout SET position = '" . $this->db->escape($data['position']) . "', layout = '" . $this->db->escape($data['layout']) . "', name = '" . $this->db->escape($data['name']) . "',name_en = '" . $this->db->escape($data['name_en']) ."' WHERE id = ".(int)$Homelayout_id."");

		
		$this->cache->delete('Homelayout');
	}
	
	public function deleteHomelayout($id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "homepage_layout WHERE id = '" . (int)$id . "'");
		
		$this->cache->delete('Homelayout');
	}
	
	public function getHomelayout($id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "homepage_layout WHERE id = '" . (int)$id . "'");
				
		return $query->row;
	}
	
	public function getHomelayoutByLayout($layout = 'homepage') {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "homepage_layout WHERE layout = '" . $layout . "'");
				
		return $query->rows;
	}
	
	
	public function getHomelayouts($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "homepage_layout "; 
		if ($data) {

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
				if (!isset($data['start']) || $data['start'] < 0) {
					$data['start'] = 0;
				}				

				if (!isset($data['limit']) || $data['limit'] < 1) {
					$data['limit'] = 20;
				}	
			
				$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
			}	
			
		}
		$query = $this->db->query($sql);
		return $query->rows;
	}
	
	public function getTotalHomelayouts($data = array()) {
		$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "homepage_layout";

		$query = $this->db->query($sql);
		
		return $query->row['total'];
	}
	
}
?>